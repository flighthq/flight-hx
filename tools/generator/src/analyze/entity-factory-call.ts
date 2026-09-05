import { createHash } from 'node:crypto';
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

const entityFactoryCallsByObject = new WeakMap<
  ts.TypeChecker,
  WeakMap<ts.SourceFile, WeakMap<ts.ObjectLiteralExpression, ts.CallExpression | false>>
>();

// True when `node` calls the named export of the upstream entity construction module
// (upstream/packages/entity/src/entity.ts). Flight's entity construction vocabulary lives entirely in
// that one module: historically `createEntity`, and after the allocate/initialize/finish migration
// `allocateEntity` and `finishEntity`.
function isFlightEntityModuleCall(node: ts.CallExpression, checker: ts.TypeChecker, exportName: string): boolean {
  let symbol = checker.getSymbolAtLocation(node.expression);
  if (symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0) symbol = checker.getAliasedSymbol(symbol);
  if (symbol?.getName() !== exportName) return false;
  const declaration = symbol.valueDeclaration ?? symbol.declarations?.[0];
  const source = declaration?.getSourceFile().fileName.split(path.sep).join('/');
  return source?.endsWith('/upstream/packages/entity/src/entity.ts') === true;
}

// `allocateEntity<T>()` is the current entity construction site: it names the target schema T through
// its type argument and returns an empty EntityConstruction<T> that the caller fills field-by-field
// (inline or via an `initialize<Name>` helper) before `finishEntity` casts it back to T. It is treated
// as an entity construction whose destination is that type argument.
export function isFlightAllocateEntityCall(node: ts.CallExpression, checker: ts.TypeChecker): boolean {
  return isFlightEntityModuleCall(node, checker, 'allocateEntity');
}

// `finishEntity(out)` closes an EntityConstruction, casting it back to the entity type. It carries no
// construction shape of its own; the value it wraps is already the fully-built entity.
export function isFlightFinishEntityCall(node: ts.CallExpression, checker: ts.TypeChecker): boolean {
  return isFlightEntityModuleCall(node, checker, 'finishEntity');
}

export function isFlightCreateEntityCall(node: ts.CallExpression, checker: ts.TypeChecker): boolean {
  return isFlightEntityModuleCall(node, checker, 'createEntity');
}

export function createEntityCallForObjectLiteral(
  node: ts.ObjectLiteralExpression,
  checker: ts.TypeChecker,
): ts.CallExpression | undefined {
  let current: ts.Expression = node;
  while (isTransparentExpressionParent(current.parent, current)) current = current.parent;
  const parent = current.parent;
  const direct =
    ts.isCallExpression(parent) && parent.arguments.length === 1 && parent.arguments[0] === current
      ? isFlightCreateEntityCall(parent, checker)
        ? parent
        : undefined
      : undefined;
  if (direct) return direct;
  const forwarded =
    ts.isCallExpression(parent) && parent.arguments.includes(current as ts.Expression)
      ? forwardedCreateEntityCall(parent, parent.arguments.indexOf(current as ts.Expression), checker)
      : undefined;
  if (forwarded) return forwarded;
  const indexed = entityFactoryCallByObject(node.getSourceFile(), checker).get(node);
  return indexed || undefined;
}

function entityFactoryCallByObject(
  source: ts.SourceFile,
  checker: ts.TypeChecker,
): WeakMap<ts.ObjectLiteralExpression, ts.CallExpression | false> {
  let bySource = entityFactoryCallsByObject.get(checker);
  if (!bySource) {
    bySource = new WeakMap();
    entityFactoryCallsByObject.set(checker, bySource);
  }
  const cached = bySource.get(source);
  if (cached) return cached;
  const calls = new WeakMap<ts.ObjectLiteralExpression, ts.CallExpression | false>();
  const visit = (candidate: ts.Node): void => {
    if (
      ts.isCallExpression(candidate) &&
      ts.isIdentifier(candidate.expression) &&
      candidate.expression.text === 'createEntity' &&
      isFlightCreateEntityCall(candidate, checker)
    ) {
      const object = entityFactoryObjectLiteral(candidate, checker);
      if (object) {
        calls.set(object, calls.has(object) ? false : candidate);
      }
    }
    if (ts.isCallExpression(candidate)) {
      candidate.arguments.forEach((argument, index) => {
        const forwarded = forwardedCreateEntityCall(candidate, index, checker);
        if (!forwarded) return;
        const object = objectLiteralArgument(argument, checker);
        if (object) calls.set(object, calls.has(object) ? false : forwarded);
      });
    }
    ts.forEachChild(candidate, visit);
  };
  visit(source);
  bySource.set(source, calls);
  return calls;
}

function objectLiteralArgument(
  expression: ts.Expression,
  checker: ts.TypeChecker,
): ts.ObjectLiteralExpression | undefined {
  const argument = unwrapEntityFactoryExpression(expression);
  if (ts.isObjectLiteralExpression(argument)) return argument;
  if (!ts.isIdentifier(argument)) return undefined;
  const declaration = checker.getSymbolAtLocation(argument)?.valueDeclaration;
  if (!isEffectivelyFinalVariableDeclaration(declaration) || !declaration.initializer) return undefined;
  const initializer = unwrapEntityFactoryExpression(declaration.initializer);
  return ts.isObjectLiteralExpression(initializer) ? initializer : undefined;
}

export function entityFactoryForwardedParameter(
  call: ts.CallExpression,
  checker: ts.TypeChecker,
): ts.ParameterDeclaration | undefined {
  if (call.arguments.length !== 1 || !ts.isIdentifier(unwrapEntityFactoryExpression(call.arguments[0]!))) {
    return undefined;
  }
  const argument = unwrapEntityFactoryExpression(call.arguments[0]!);
  const declaration = checker.getSymbolAtLocation(argument)?.valueDeclaration;
  return declaration && ts.isParameter(declaration) ? declaration : undefined;
}

export function forwardedCreateEntityCall(
  call: ts.CallExpression,
  argumentIndex: number,
  checker: ts.TypeChecker,
): ts.CallExpression | undefined {
  let symbol = checker.getSymbolAtLocation(call.expression);
  if (symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0) symbol = checker.getAliasedSymbol(symbol);
  const declaration = symbol?.valueDeclaration ?? symbol?.declarations?.[0];
  if (!declaration || !ts.isFunctionDeclaration(declaration) || !declaration.body) return undefined;
  const parameter = declaration.parameters[argumentIndex];
  if (!parameter || !ts.isIdentifier(parameter.name)) return undefined;
  const parameterSymbol = checker.getSymbolAtLocation(parameter.name);
  const matches: ts.CallExpression[] = [];
  const visit = (node: ts.Node): void => {
    if (ts.isCallExpression(node) && isFlightCreateEntityCall(node, checker)) {
      const forwarded = entityFactoryForwardedParameter(node, checker);
      const forwardedSymbol =
        forwarded && ts.isIdentifier(forwarded.name) ? checker.getSymbolAtLocation(forwarded.name) : undefined;
      if (forwardedSymbol === parameterSymbol) matches.push(node);
    }
    ts.forEachChild(node, visit);
  };
  visit(declaration.body);
  return matches.length === 1 ? matches[0] : undefined;
}

export function entityFactoryObjectLiteral(
  call: ts.CallExpression,
  checker?: ts.TypeChecker,
): ts.ObjectLiteralExpression | undefined {
  if (call.arguments.length !== 1) return undefined;
  const argument = unwrapEntityFactoryExpression(call.arguments[0]!);
  if (ts.isObjectLiteralExpression(argument)) return argument;
  if (!checker || !ts.isIdentifier(argument)) return undefined;
  const declaration = checker.getSymbolAtLocation(argument)?.valueDeclaration;
  if (!isEffectivelyFinalVariableDeclaration(declaration) || !declaration.initializer) return undefined;
  const initializer = unwrapEntityFactoryExpression(declaration.initializer);
  return ts.isObjectLiteralExpression(initializer) ? initializer : undefined;
}

function unwrapEntityFactoryExpression(expression: ts.Expression): ts.Expression {
  let current = expression;
  while (
    ts.isParenthesizedExpression(current) ||
    ts.isAsExpression(current) ||
    ts.isTypeAssertionExpression(current) ||
    ts.isSatisfiesExpression(current) ||
    ts.isNonNullExpression(current)
  ) {
    current = current.expression;
  }
  return current;
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

/**
 * Give a source `Symbol()` allocation a stable, collision-resistant field name on
 * native targets. JavaScript continues to use the actual Symbol value; native
 * object access already lowers through string-keyed reflection.
 */
export function nativeUniqueSymbolKeyForCall(node: ts.CallExpression): string | undefined {
  if (!ts.isIdentifier(node.expression) || node.expression.text !== 'Symbol') return undefined;
  const source = node.getSourceFile();
  const normalized = source.fileName.split(path.sep).join('/');
  const upstream = normalized.lastIndexOf('/upstream/');
  const identity = upstream >= 0 ? normalized.slice(upstream + 1) : normalized;
  const position = source.getLineAndCharacterOfPosition(node.getStart(source));
  const digest = createHash('sha256')
    .update(`${identity}:${String(position.line + 1)}:${String(position.character + 1)}`)
    .digest('hex')
    .slice(0, 20);
  return `__symbol__${digest}`;
}

export function nativeUniqueSymbolKeyForExpression(node: ts.Expression, checker: ts.TypeChecker): string | undefined {
  let symbol = checker.getSymbolAtLocation(node);
  const seen = new Set<ts.Symbol>();
  while (symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0 && !seen.has(symbol)) {
    seen.add(symbol);
    symbol = checker.getAliasedSymbol(symbol);
  }
  const declaration = symbol?.valueDeclaration ?? symbol?.declarations?.[0];
  if (!isEffectivelyFinalVariableDeclaration(declaration) || !declaration.initializer) return undefined;
  const initializer = unwrapEntityFactoryExpression(declaration.initializer);
  return ts.isCallExpression(initializer) ? nativeUniqueSymbolKeyForCall(initializer) : undefined;
}

function isEffectivelyFinalVariableDeclaration(node: ts.Node | undefined): node is ts.VariableDeclaration {
  return Boolean(
    node &&
    ts.isVariableDeclaration(node) &&
    ts.isVariableDeclarationList(node.parent) &&
    (node.parent.flags & ts.NodeFlags.Const) !== 0,
  );
}

export function entityFactoryResolvedObjectFields(
  node: ts.ObjectLiteralExpression,
  checker: ts.TypeChecker,
): string[] | undefined {
  const fields: string[] = [];
  for (const property of node.properties) {
    if (ts.isSpreadAssignment(property)) continue;
    if (!('name' in property) || property.name === undefined) return undefined;
    if (ts.isComputedPropertyName(property.name)) {
      const nativeName = nativeUniqueSymbolKeyForExpression(property.name.expression, checker);
      if (!nativeName) return undefined;
      fields.push(nativeName);
      continue;
    }
    const name = staticPropertyName(property.name);
    if (name === undefined) return undefined;
    fields.push(name);
  }
  return fields;
}

export function entityFactoryExpandedObjectFields(
  node: ts.ObjectLiteralExpression,
  checker: ts.TypeChecker,
): string[] | undefined {
  if (
    node.properties.some(
      (property) =>
        ts.isSpreadAssignment(property) &&
        spreadMayContainUnknownProperties(checker.getTypeAtLocation(property.expression), checker),
    )
  ) {
    return undefined;
  }
  const type = checker.getTypeAtLocation(node);
  if (type.isUnion()) return undefined;
  if (checker.getIndexTypeOfType(type, ts.IndexKind.String)) return undefined;
  return checker
    .getPropertiesOfType(type)
    .map((property) => {
      const computed = property.declarations
        ?.map((declaration) => (declaration as ts.NamedDeclaration).name)
        .find((name): name is ts.ComputedPropertyName => name !== undefined && ts.isComputedPropertyName(name));
      return computed
        ? (nativeUniqueSymbolKeyForExpression(computed.expression, checker) ?? property.getName())
        : property.getName();
    })
    .filter((name) => !name.startsWith('__@EntityRuntimeKey@'));
}

function spreadMayContainUnknownProperties(type: ts.Type, checker: ts.TypeChecker, seen = new Set<ts.Type>()): boolean {
  if (seen.has(type)) return false;
  seen.add(type);
  if ((type.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.TypeParameter)) !== 0) return true;
  if (type.isUnionOrIntersection()) {
    return type.types.some((item) => spreadMayContainUnknownProperties(item, checker, seen));
  }
  return Boolean(
    checker.getIndexTypeOfType(type, ts.IndexKind.String) ?? checker.getIndexTypeOfType(type, ts.IndexKind.Number),
  );
}

export function entityFactorySyntheticClassName(node: ts.Node): string {
  const source = node.getSourceFile();
  const position = source.getLineAndCharacterOfPosition(node.getStart(source));
  return `EntityShapeL${String(position.line + 1)}C${String(position.character + 1)}`;
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
