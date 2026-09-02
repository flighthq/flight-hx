import path from 'node:path';
import ts from 'typescript';

export type EntityFactoryDestinationRoute =
  | 'argument'
  | 'array-element'
  | 'assertion'
  | 'assignment'
  | 'contextual'
  | 'return'
  | 'returned-variable'
  | 'type-argument'
  | 'variable';

export interface EntityFactoryDestinationCandidate {
  route: EntityFactoryDestinationRoute;
  type: ts.Type;
}

export interface EntityFactoryObjectShape {
  fields: string[];
  hasComputed: boolean;
  hasSpread: boolean;
  hasUnsupported: boolean;
}

export function isFlightCreateEntityCall(node: ts.CallExpression, checker: ts.TypeChecker): boolean {
  let symbol = checker.getSymbolAtLocation(node.expression);
  if (symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0) symbol = checker.getAliasedSymbol(symbol);
  if (symbol?.getName() !== 'createEntity') return false;
  const declaration = symbol.valueDeclaration ?? symbol.declarations?.[0];
  const source = declaration?.getSourceFile().fileName.split(path.sep).join('/');
  return source?.endsWith('/upstream/packages/entity/src/entity.ts') === true;
}

export function createEntityCallForObjectLiteral(
  node: ts.ObjectLiteralExpression,
  checker: ts.TypeChecker,
): ts.CallExpression | undefined {
  let current: ts.Expression = node;
  while (isTransparentExpressionParent(current.parent, current)) current = current.parent;
  const parent = current.parent;
  return ts.isCallExpression(parent) && parent.arguments.length === 1 && parent.arguments[0] === current
    ? isFlightCreateEntityCall(parent, checker)
      ? parent
      : undefined
    : undefined;
}

export function entityFactoryObjectLiteral(call: ts.CallExpression): ts.ObjectLiteralExpression | undefined {
  if (call.arguments.length !== 1) return undefined;
  let argument = call.arguments[0];
  while (
    argument &&
    (ts.isParenthesizedExpression(argument) ||
      ts.isAsExpression(argument) ||
      ts.isTypeAssertionExpression(argument) ||
      ts.isSatisfiesExpression(argument) ||
      ts.isNonNullExpression(argument))
  ) {
    argument = argument.expression;
  }
  return argument && ts.isObjectLiteralExpression(argument) ? argument : undefined;
}

export function entityFactoryObjectShape(node: ts.ObjectLiteralExpression): EntityFactoryObjectShape {
  const fields: string[] = [];
  let hasComputed = false;
  let hasSpread = false;
  let hasUnsupported = false;
  for (const property of node.properties) {
    if (ts.isSpreadAssignment(property)) {
      hasSpread = true;
      continue;
    }
    if (!('name' in property) || property.name === undefined) {
      hasUnsupported = true;
      continue;
    }
    if (ts.isComputedPropertyName(property.name)) {
      hasComputed = true;
      continue;
    }
    const name = staticPropertyName(property.name);
    if (name === undefined) {
      hasUnsupported = true;
      continue;
    }
    fields.push(name);
  }
  return { fields, hasComputed, hasSpread, hasUnsupported };
}

export function entityFactoryExpandedObjectFields(
  node: ts.ObjectLiteralExpression,
  checker: ts.TypeChecker,
): string[] | undefined {
  const type = checker.getTypeAtLocation(node);
  if (type.isUnion()) return undefined;
  if (checker.getIndexTypeOfType(type, ts.IndexKind.String)) return undefined;
  return checker.getPropertiesOfType(type).map((property) => property.getName());
}

export function entityFactoryDestinationCandidates(
  call: ts.CallExpression,
  checker: ts.TypeChecker,
): EntityFactoryDestinationCandidate[] {
  const result: EntityFactoryDestinationCandidate[] = [];
  const seen = new Set<ts.Type>();
  const add = (type: ts.Type | undefined, route: EntityFactoryDestinationRoute): void => {
    if (!type || seen.has(type)) return;
    seen.add(type);
    result.push({ route, type });
  };

  add(checker.getContextualType(call), 'contextual');
  if (call.typeArguments?.length === 1) {
    add(checker.getTypeFromTypeNode(call.typeArguments[0]!), 'type-argument');
  }
  let current: ts.Expression = call;
  while (isTransparentExpressionParent(current.parent, current)) {
    current = current.parent;
    if (ts.isAsExpression(current) || ts.isTypeAssertionExpression(current) || ts.isSatisfiesExpression(current)) {
      add(checker.getTypeAtLocation(current), 'assertion');
    }
  }
  while (isObjectFreezeWrapper(current.parent, current)) {
    current = current.parent;
    add(checker.getContextualType(current), 'contextual');
    while (isTransparentExpressionParent(current.parent, current)) {
      current = current.parent;
      if (ts.isAsExpression(current) || ts.isTypeAssertionExpression(current) || ts.isSatisfiesExpression(current)) {
        add(checker.getTypeAtLocation(current), 'assertion');
      }
    }
  }

  const parent = current.parent;
  if (ts.isVariableDeclaration(parent) && parent.initializer === current) {
    add(checker.getTypeAtLocation(parent.name), 'variable');
    add(returnedVariableDestination(parent, checker), 'returned-variable');
  } else if (
    ts.isBinaryExpression(parent) &&
    parent.right === current &&
    parent.operatorToken.kind === ts.SyntaxKind.EqualsToken
  ) {
    add(checker.getTypeAtLocation(parent.left), 'assignment');
  } else if (ts.isReturnStatement(parent) && parent.expression === current) {
    add(enclosingReturnType(parent, checker), 'return');
  } else if (ts.isArrowFunction(parent) && parent.body === current) {
    const signature = checker.getSignatureFromDeclaration(parent);
    add(signature ? checker.getReturnTypeOfSignature(signature) : undefined, 'return');
  } else if (ts.isPropertyAssignment(parent) && parent.initializer === current) {
    add(checker.getContextualType(current), 'contextual');
  } else if (ts.isArrayLiteralExpression(parent)) {
    add(checker.getContextualType(current), 'array-element');
  } else if (ts.isCallExpression(parent) && parent.arguments.includes(current)) {
    add(checker.getContextualType(current), 'argument');
  }
  return result;
}

export function isParameterizedEntityFactoryType(type: ts.Type, checker: ts.TypeChecker): boolean {
  if (type.aliasTypeArguments && type.aliasTypeArguments.length > 0) return true;
  return (
    (type.flags & ts.TypeFlags.Object) !== 0 &&
    Boolean((type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference) &&
    checker.getTypeArguments(type as ts.TypeReference).length > 0
  );
}

function returnedVariableDestination(node: ts.VariableDeclaration, checker: ts.TypeChecker): ts.Type | undefined {
  if (!ts.isIdentifier(node.name)) return undefined;
  const symbol = checker.getSymbolAtLocation(node.name);
  const owner = ts.findAncestor(node.parent, (ancestor): ancestor is ts.FunctionLikeDeclaration =>
    ts.isFunctionLike(ancestor),
  );
  if (!symbol || !owner?.body || !ts.isBlock(owner.body)) return undefined;
  let returned = false;
  const visit = (current: ts.Node): void => {
    if (returned || (current !== owner && ts.isFunctionLike(current))) return;
    if (ts.isReturnStatement(current) && current.expression) {
      let expression = current.expression;
      while (
        ts.isParenthesizedExpression(expression) ||
        ts.isAsExpression(expression) ||
        ts.isTypeAssertionExpression(expression) ||
        ts.isSatisfiesExpression(expression) ||
        ts.isNonNullExpression(expression)
      ) {
        expression = expression.expression;
      }
      returned = ts.isIdentifier(expression) && checker.getSymbolAtLocation(expression) === symbol;
      return;
    }
    ts.forEachChild(current, visit);
  };
  visit(owner.body);
  if (!returned) return undefined;
  const signature = checker.getSignatureFromDeclaration(owner);
  return signature ? checker.getReturnTypeOfSignature(signature) : undefined;
}

function enclosingReturnType(node: ts.ReturnStatement, checker: ts.TypeChecker): ts.Type | undefined {
  const owner = ts.findAncestor(node.parent, (ancestor): ancestor is ts.SignatureDeclaration =>
    ts.isFunctionLike(ancestor),
  );
  const signature = owner ? checker.getSignatureFromDeclaration(owner) : undefined;
  return signature ? checker.getReturnTypeOfSignature(signature) : undefined;
}

function isTransparentExpressionParent(parent: ts.Node, child: ts.Expression): parent is ts.Expression {
  return (
    ((ts.isParenthesizedExpression(parent) ||
      ts.isAsExpression(parent) ||
      ts.isTypeAssertionExpression(parent) ||
      ts.isSatisfiesExpression(parent) ||
      ts.isNonNullExpression(parent)) &&
      parent.expression === child) ||
    (ts.isAwaitExpression(parent) && parent.expression === child)
  );
}

function isObjectFreezeWrapper(parent: ts.Node, child: ts.Expression): parent is ts.CallExpression {
  return (
    ts.isCallExpression(parent) &&
    parent.arguments.length === 1 &&
    parent.arguments[0] === child &&
    ts.isPropertyAccessExpression(parent.expression) &&
    ts.isIdentifier(parent.expression.expression) &&
    parent.expression.expression.text === 'Object' &&
    parent.expression.name.text === 'freeze'
  );
}

function staticPropertyName(name: ts.PropertyName): string | undefined {
  if (ts.isIdentifier(name) || ts.isStringLiteral(name) || ts.isNumericLiteral(name)) return name.text;
  return undefined;
}
