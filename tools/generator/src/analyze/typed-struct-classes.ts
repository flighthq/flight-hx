import path from 'node:path';
import ts from 'typescript';

import { portConfig } from '../../port.config.ts';

import { upstreamTypeScriptProgram, type UpstreamTypeScriptProgram } from './program.ts';
import { typedStructRegistry, type TypedStructRegistry, type TypedStructSchemaAudit } from './typed-structs.ts';

export type TypedStructClassFeasibilityScope = 'production' | 'test';

export type TypedStructClassFeasibilitySiteKind =
  | 'anonymous-structural-transfer'
  | 'cross-schema-transfer'
  | 'dynamic-ingress'
  | 'enumeration'
  | 'json-serialization'
  | 'object-literal-computed'
  | 'object-literal-spread'
  | 'object-rest'
  | 'object-spread'
  | 'optional-omission'
  | 'prototype-observation'
  | 'strict-equality';

export interface TypedStructClassFeasibilitySite {
  column: number;
  kind: TypedStructClassFeasibilitySiteKind;
  line: number;
  relatedSchemaIds?: string[] | undefined;
  scope: TypedStructClassFeasibilityScope;
  source: string;
}

export interface TypedStructClassFeasibilitySchema {
  bridge: {
    inputSignatures: number;
    outputSignatures: number;
  };
  construction: {
    computedObjectLiterals: number;
    objectLiterals: number;
    objectLiteralsOmittingOptionalFields: number;
    objectLiteralsWithSpread: number;
    plainObjectLiterals: number;
    testObjectLiterals: number;
  };
  directAccesses: number;
  fields: {
    optional: number;
    requiredUndefined: number;
    total: number;
  };
  id: string;
  migration: {
    mechanicallyCompatible: boolean;
    normalizationReasons: Array<
      | 'anonymous-structural-transfer'
      | 'cross-schema-transfer'
      | 'dynamic-ingress'
      | 'object-literal-computed'
      | 'object-literal-spread'
    >;
    observabilityReasons: Array<
      | 'enumeration'
      | 'json-serialization'
      | 'object-rest'
      | 'object-spread'
      | 'optional-omission'
      | 'prototype-observation'
      | 'strict-equality'
    >;
  };
  name: string;
  oracle: {
    enumerations: number;
    jsonSerializations: number;
    objectRests: number;
    objectSpreads: number;
    prototypeObservations: number;
    strictEqualityAssertions: number;
  };
  production: {
    anonymousStructuralTransfers: number;
    crossSchemaTransfers: number;
    dynamicIngresses: number;
    enumerations: number;
    jsonSerializations: number;
    objectRests: number;
    objectSpreads: number;
  };
  sites: TypedStructClassFeasibilitySite[];
  source: string;
}

export interface TypedStructClassFeasibilityAudit {
  schemaVersion: 1;
  schemas: TypedStructClassFeasibilitySchema[];
  summary: {
    anonymousStructuralTransfers: number;
    bridgeInputSignatures: number;
    bridgeOutputSignatures: number;
    crossSchemaTransfers: number;
    directAccesses: number;
    dynamicIngresses: number;
    mechanicallyCompatibleSchemas: number;
    normalizationRequiredSchemas: number;
    objectLiterals: number;
    objectLiteralsOmittingOptionalFields: number;
    objectLiteralsWithComputedKeys: number;
    objectLiteralsWithSpread: number;
    observabilityReviewSchemas: number;
    optionalFields: number;
    oracleObservations: number;
    productionEnumerations: number;
    productionJsonSerializations: number;
    productionObjectRests: number;
    productionObjectSpreads: number;
    requiredUndefinedFields: number;
    schemas: number;
    testObjectLiterals: number;
  };
  upstreamCommit: string;
}

interface MutableSchema extends TypedStructClassFeasibilitySchema {
  optionalFieldNames: Set<string>;
  siteKeys: Set<string>;
}

export function auditTypedStructClassFeasibility(
  workspaceDirectory: string,
  upstreamCommit: string,
  registry: TypedStructRegistry = typedStructRegistry(workspaceDirectory, upstreamCommit),
  programAndChecker: UpstreamTypeScriptProgram = upstreamTypeScriptProgram(workspaceDirectory),
): TypedStructClassFeasibilityAudit {
  const { checker, program } = programAndChecker;
  const schemas = registry.report.candidates.filter((candidate) => candidate.eligible).map(emptySchema);
  const byId = new Map(schemas.map((schema) => [schema.id, schema]));
  const transferKeys = new Set<string>();

  const matchedSchemas = (type: ts.Type | undefined): MutableSchema[] => {
    if (!type) return [];
    const resolution = registry.resolve(type);
    return resolution.schemas.map((schema) => byId.get(schema.id)).filter((schema) => schema !== undefined);
  };
  const matchedSchema = (type: ts.Type | undefined): MutableSchema | undefined => {
    if (!type) return undefined;
    const resolution = registry.resolve(type);
    if (resolution.kind !== 'matched' || resolution.schemas.length !== 1) return undefined;
    return byId.get(resolution.schemas[0]!.id);
  };
  const record = (
    schema: MutableSchema,
    node: ts.Node,
    scope: TypedStructClassFeasibilityScope,
    kind: TypedStructClassFeasibilitySiteKind,
    relatedSchemaIds?: string[],
  ): boolean => {
    const source = node.getSourceFile();
    const position = source.getLineAndCharacterOfPosition(node.getStart(source));
    const location = path.relative(workspaceDirectory, source.fileName).split(path.sep).join('/');
    const normalizedRelated = relatedSchemaIds?.slice().sort();
    const key = [
      schema.id,
      kind,
      scope,
      location,
      position.line + 1,
      position.character + 1,
      normalizedRelated?.join(','),
    ].join('|');
    if (schema.siteKeys.has(key)) return false;
    schema.siteKeys.add(key);
    schema.sites.push({
      column: position.character + 1,
      kind,
      line: position.line + 1,
      ...(normalizedRelated && normalizedRelated.length > 0 ? { relatedSchemaIds: normalizedRelated } : {}),
      scope,
      source: location,
    });
    return true;
  };
  const auditTransfer = (expression: ts.Expression, targetType: ts.Type | undefined): void => {
    const scope = sourceScope(expression.getSourceFile());
    if (scope !== 'production' || !targetType) return;
    const target = matchedSchema(targetType);
    if (!target) return;
    const sourceType = checker.getTypeAtLocation(expression);
    const key = `${target.id}|${expression.getSourceFile().fileName}|${expression.pos}|${expression.end}|${checker.typeToString(targetType)}|${checker.typeToString(sourceType)}`;
    if (transferKeys.has(key)) return;
    transferKeys.add(key);
    const sources = matchedSchemas(sourceType);
    if (sources.some((source) => source.id === target.id) && sources.length === 1) return;
    if (sources.length > 0) {
      const related = sources.filter((source) => source.id !== target.id).map((source) => source.id);
      if (related.length > 0 && record(target, expression, scope, 'cross-schema-transfer', related)) {
        target.production.crossSchemaTransfers += 1;
      }
      return;
    }
    if (isNullish(sourceType)) return;
    if (isDynamic(sourceType)) {
      if (record(target, expression, scope, 'dynamic-ingress')) target.production.dynamicIngresses += 1;
      return;
    }
    if (!ts.isObjectLiteralExpression(expression)) {
      if (record(target, expression, scope, 'anonymous-structural-transfer')) {
        target.production.anonymousStructuralTransfers += 1;
      }
    }
  };

  const visit = (node: ts.Node): void => {
    const scope = sourceScope(node.getSourceFile());
    if (!scope) return;
    if (ts.isObjectLiteralExpression(node)) {
      const schema = matchedSchema(checker.getContextualType(node) ?? checker.getTypeAtLocation(node));
      if (schema) auditObjectLiteral(node, schema, scope, record);
    }
    if (ts.isSpreadAssignment(node)) {
      const schema = matchedSchema(checker.getTypeAtLocation(node.expression));
      if (schema && record(schema, node, scope, 'object-spread')) {
        if (scope === 'production') schema.production.objectSpreads += 1;
        else schema.oracle.objectSpreads += 1;
      }
    }
    if (ts.isBindingElement(node) && node.dotDotDotToken && ts.isObjectBindingPattern(node.parent)) {
      const schema = matchedSchema(checker.getTypeAtLocation(node.parent));
      if (schema && record(schema, node, scope, 'object-rest')) {
        if (scope === 'production') schema.production.objectRests += 1;
        else schema.oracle.objectRests += 1;
      }
    }
    if (ts.isCallExpression(node)) {
      auditCall(node, scope, checker, matchedSchema, record);
      auditCallTransfers(node, checker, auditTransfer);
    }
    if (scope === 'test' && ts.isPropertyAccessExpression(node) && node.name.text === 'constructor') {
      const schema = matchedSchema(checker.getTypeAtLocation(node.expression));
      if (schema && record(schema, node, scope, 'prototype-observation')) {
        schema.oracle.prototypeObservations += 1;
      }
    }
    if (ts.isBinaryExpression(node)) {
      if (node.operatorToken.kind === ts.SyntaxKind.EqualsToken) {
        auditTransfer(node.right, checker.getTypeAtLocation(node.left));
      }
      if (node.operatorToken.kind === ts.SyntaxKind.InstanceOfKeyword && scope === 'test') {
        const schema = matchedSchema(checker.getTypeAtLocation(node.left));
        if (schema && record(schema, node, scope, 'prototype-observation')) {
          schema.oracle.prototypeObservations += 1;
        }
      }
    }
    if (ts.isVariableDeclaration(node) && node.initializer) {
      auditTransfer(node.initializer, checker.getTypeAtLocation(node.name));
    }
    if (ts.isReturnStatement(node) && node.expression) {
      auditTransfer(node.expression, enclosingReturnType(node, checker));
    }
    if (ts.isArrowFunction(node) && !ts.isBlock(node.body)) {
      const signature = checker.getSignatureFromDeclaration(node);
      auditTransfer(node.body, signature ? checker.getReturnTypeOfSignature(signature) : undefined);
    }
    if (ts.isPropertyAssignment(node)) auditTransfer(node.initializer, checker.getContextualType(node.initializer));
    if (ts.isArrayLiteralExpression(node)) {
      for (const element of node.elements) {
        if (ts.isExpression(element)) auditTransfer(element, checker.getContextualType(element));
      }
    }
    if (ts.isAsExpression(node) || ts.isTypeAssertionExpression(node) || ts.isSatisfiesExpression(node)) {
      auditTransfer(node.expression, checker.getTypeAtLocation(node));
    }
    if (scope === 'production' && isExportedApiDeclaration(node)) {
      auditBridgeDeclaration(node, checker, registry, byId);
    }
    ts.forEachChild(node, visit);
  };

  for (const source of program.getSourceFiles()) {
    if (sourceScope(source)) visit(source);
  }
  for (const schema of schemas) finalizeSchema(schema);
  schemas.sort((left, right) => left.id.localeCompare(right.id));

  const reportSchemas = schemas.map(
    ({ optionalFieldNames: _optionalFieldNames, siteKeys: _siteKeys, ...schema }) => schema,
  );
  return {
    schemaVersion: 1,
    schemas: reportSchemas,
    summary: {
      anonymousStructuralTransfers: sum(schemas, (schema) => schema.production.anonymousStructuralTransfers),
      bridgeInputSignatures: sum(schemas, (schema) => schema.bridge.inputSignatures),
      bridgeOutputSignatures: sum(schemas, (schema) => schema.bridge.outputSignatures),
      crossSchemaTransfers: sum(schemas, (schema) => schema.production.crossSchemaTransfers),
      directAccesses: sum(schemas, (schema) => schema.directAccesses),
      dynamicIngresses: sum(schemas, (schema) => schema.production.dynamicIngresses),
      mechanicallyCompatibleSchemas: schemas.filter((schema) => schema.migration.mechanicallyCompatible).length,
      normalizationRequiredSchemas: schemas.filter((schema) => schema.migration.normalizationReasons.length > 0).length,
      objectLiterals: sum(schemas, (schema) => schema.construction.objectLiterals),
      objectLiteralsOmittingOptionalFields: sum(
        schemas,
        (schema) => schema.construction.objectLiteralsOmittingOptionalFields,
      ),
      objectLiteralsWithComputedKeys: sum(schemas, (schema) => schema.construction.computedObjectLiterals),
      objectLiteralsWithSpread: sum(schemas, (schema) => schema.construction.objectLiteralsWithSpread),
      observabilityReviewSchemas: schemas.filter((schema) => schema.migration.observabilityReasons.length > 0).length,
      optionalFields: sum(schemas, (schema) => schema.fields.optional),
      oracleObservations: sum(
        schemas,
        (schema) =>
          schema.oracle.enumerations +
          schema.oracle.jsonSerializations +
          schema.oracle.objectRests +
          schema.oracle.objectSpreads +
          schema.oracle.prototypeObservations +
          schema.oracle.strictEqualityAssertions,
      ),
      productionEnumerations: sum(schemas, (schema) => schema.production.enumerations),
      productionJsonSerializations: sum(schemas, (schema) => schema.production.jsonSerializations),
      productionObjectRests: sum(schemas, (schema) => schema.production.objectRests),
      productionObjectSpreads: sum(schemas, (schema) => schema.production.objectSpreads),
      requiredUndefinedFields: sum(schemas, (schema) => schema.fields.requiredUndefined),
      schemas: schemas.length,
      testObjectLiterals: sum(schemas, (schema) => schema.construction.testObjectLiterals),
    },
    upstreamCommit,
  };
}

function emptySchema(candidate: TypedStructSchemaAudit): MutableSchema {
  return {
    bridge: { inputSignatures: 0, outputSignatures: 0 },
    construction: {
      computedObjectLiterals: 0,
      objectLiterals: 0,
      objectLiteralsOmittingOptionalFields: 0,
      objectLiteralsWithSpread: 0,
      plainObjectLiterals: 0,
      testObjectLiterals: 0,
    },
    directAccesses: candidate.emission.directAccesses,
    fields: {
      optional: candidate.fields.filter((field) => field.optional).length,
      requiredUndefined: candidate.fields.filter((field) => field.requiredUndefined).length,
      total: candidate.fields.length,
    },
    id: candidate.id,
    migration: { mechanicallyCompatible: false, normalizationReasons: [], observabilityReasons: [] },
    name: candidate.name,
    optionalFieldNames: new Set(candidate.fields.filter((field) => field.optional).map((field) => field.name)),
    oracle: {
      enumerations: 0,
      jsonSerializations: 0,
      objectRests: 0,
      objectSpreads: 0,
      prototypeObservations: 0,
      strictEqualityAssertions: 0,
    },
    production: {
      anonymousStructuralTransfers: 0,
      crossSchemaTransfers: 0,
      dynamicIngresses: 0,
      enumerations: 0,
      jsonSerializations: 0,
      objectRests: 0,
      objectSpreads: 0,
    },
    siteKeys: new Set(),
    sites: [],
    source: candidate.source,
  };
}

function auditObjectLiteral(
  node: ts.ObjectLiteralExpression,
  schema: MutableSchema,
  scope: TypedStructClassFeasibilityScope,
  record: (
    schema: MutableSchema,
    node: ts.Node,
    scope: TypedStructClassFeasibilityScope,
    kind: TypedStructClassFeasibilitySiteKind,
  ) => boolean,
): void {
  if (scope === 'test') {
    schema.construction.testObjectLiterals += 1;
    return;
  }
  schema.construction.objectLiterals += 1;
  const spread = node.properties.some(ts.isSpreadAssignment);
  const computed = node.properties.some(
    (property) => 'name' in property && property.name !== undefined && ts.isComputedPropertyName(property.name),
  );
  if (!spread && !computed) schema.construction.plainObjectLiterals += 1;
  if (spread) {
    schema.construction.objectLiteralsWithSpread += 1;
    record(schema, node, scope, 'object-literal-spread');
  }
  if (computed) {
    schema.construction.computedObjectLiterals += 1;
    record(schema, node, scope, 'object-literal-computed');
  }
  const explicit = new Set(
    node.properties
      .filter((property) => !ts.isSpreadAssignment(property) && 'name' in property && property.name !== undefined)
      .map((property) => propertyName(property.name!))
      .filter((name) => name !== undefined),
  );
  if (!spread && schema.fields.optional > 0) {
    const omitted = node.properties.length === 0 || schemaHasOmittedOptionalField(schema, explicit);
    if (omitted) {
      schema.construction.objectLiteralsOmittingOptionalFields += 1;
      record(schema, node, scope, 'optional-omission');
    }
  }
}

function schemaHasOmittedOptionalField(schema: MutableSchema, explicit: ReadonlySet<string>): boolean {
  return [...schema.optionalFieldNames].some((field) => !explicit.has(field));
}

function propertyName(name: ts.PropertyName): string | undefined {
  if (ts.isIdentifier(name) || ts.isStringLiteral(name) || ts.isNumericLiteral(name)) return name.text;
  return undefined;
}

function auditCall(
  node: ts.CallExpression,
  scope: TypedStructClassFeasibilityScope,
  checker: ts.TypeChecker,
  matchedSchema: (type: ts.Type | undefined) => MutableSchema | undefined,
  record: (
    schema: MutableSchema,
    node: ts.Node,
    scope: TypedStructClassFeasibilityScope,
    kind: TypedStructClassFeasibilitySiteKind,
  ) => boolean,
): void {
  const staticCall = staticMemberCall(node);
  if (
    staticCall?.owner === 'Object' &&
    ['entries', 'getOwnPropertyNames', 'keys', 'values'].includes(staticCall.member)
  ) {
    const schema = matchedSchema(checker.getTypeAtLocation(node.arguments[0]!));
    if (schema && record(schema, node, scope, 'enumeration')) {
      if (scope === 'production') schema.production.enumerations += 1;
      else schema.oracle.enumerations += 1;
    }
  }
  if (staticCall?.owner === 'Reflect' && staticCall.member === 'ownKeys') {
    const schema = matchedSchema(checker.getTypeAtLocation(node.arguments[0]!));
    if (schema && record(schema, node, scope, 'enumeration')) {
      if (scope === 'production') schema.production.enumerations += 1;
      else schema.oracle.enumerations += 1;
    }
  }
  if (staticCall?.owner === 'Object' && staticCall.member === 'assign') {
    for (const argument of node.arguments.slice(1)) {
      const schema = matchedSchema(checker.getTypeAtLocation(argument));
      if (schema && record(schema, argument, scope, 'object-spread')) {
        if (scope === 'production') schema.production.objectSpreads += 1;
        else schema.oracle.objectSpreads += 1;
      }
    }
  }
  if (staticCall?.owner === 'JSON' && staticCall.member === 'stringify') {
    const schema = matchedSchema(checker.getTypeAtLocation(node.arguments[0]!));
    if (schema && record(schema, node, scope, 'json-serialization')) {
      if (scope === 'production') schema.production.jsonSerializations += 1;
      else schema.oracle.jsonSerializations += 1;
    }
  }
  if (
    scope === 'test' &&
    staticCall?.owner === 'Object' &&
    ['getOwnPropertyDescriptor', 'getOwnPropertyDescriptors', 'getPrototypeOf'].includes(staticCall.member)
  ) {
    const schema = matchedSchema(checker.getTypeAtLocation(node.arguments[0]!));
    if (schema && record(schema, node, scope, 'prototype-observation')) schema.oracle.prototypeObservations += 1;
  }
  if (scope === 'test' && ts.isPropertyAccessExpression(node.expression)) {
    const matcher = node.expression.name.text;
    if (['toBeInstanceOf', 'toStrictEqual'].includes(matcher)) {
      const expectCall = node.expression.expression;
      if (
        ts.isCallExpression(expectCall) &&
        ts.isIdentifier(expectCall.expression) &&
        expectCall.expression.text === 'expect' &&
        expectCall.arguments[0]
      ) {
        const schema = matchedSchema(checker.getTypeAtLocation(expectCall.arguments[0]));
        const kind = matcher === 'toStrictEqual' ? 'strict-equality' : 'prototype-observation';
        if (schema && record(schema, node, scope, kind)) {
          if (matcher === 'toStrictEqual') schema.oracle.strictEqualityAssertions += 1;
          else schema.oracle.prototypeObservations += 1;
        }
      }
    }
  }
}

function auditCallTransfers(
  node: ts.CallExpression,
  checker: ts.TypeChecker,
  auditTransfer: (expression: ts.Expression, targetType: ts.Type | undefined) => void,
): void {
  for (const argument of node.arguments) auditTransfer(argument, checker.getContextualType(argument));
}

function staticMemberCall(node: ts.CallExpression): { member: string; owner: string } | undefined {
  if (!ts.isPropertyAccessExpression(node.expression) || !ts.isIdentifier(node.expression.expression)) return undefined;
  return { member: node.expression.name.text, owner: node.expression.expression.text };
}

function enclosingReturnType(node: ts.ReturnStatement, checker: ts.TypeChecker): ts.Type | undefined {
  const declaration = ts.findAncestor(node.parent, (ancestor): ancestor is ts.SignatureDeclaration =>
    ts.isFunctionLike(ancestor),
  );
  const signature = declaration ? checker.getSignatureFromDeclaration(declaration) : undefined;
  return signature ? checker.getReturnTypeOfSignature(signature) : undefined;
}

function isExportedApiDeclaration(node: ts.Node): node is ts.FunctionDeclaration | ts.VariableStatement {
  return (
    (ts.isFunctionDeclaration(node) || ts.isVariableStatement(node)) &&
    ts.canHaveModifiers(node) &&
    ts.getModifiers(node)?.some((modifier) => modifier.kind === ts.SyntaxKind.ExportKeyword) === true
  );
}

function auditBridgeDeclaration(
  node: ts.FunctionDeclaration | ts.VariableStatement,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  byId: ReadonlyMap<string, MutableSchema>,
): void {
  const auditSignature = (signature: ts.Signature): void => {
    for (const parameter of signature.getParameters()) {
      const declaration = parameter.valueDeclaration ?? parameter.declarations?.[0] ?? node;
      for (const schema of schemasWithinType(
        checker.getTypeOfSymbolAtLocation(parameter, declaration),
        checker,
        registry,
      )) {
        const target = byId.get(schema.id);
        if (target) target.bridge.inputSignatures += 1;
      }
    }
    for (const schema of schemasWithinType(checker.getReturnTypeOfSignature(signature), checker, registry)) {
      const target = byId.get(schema.id);
      if (target) target.bridge.outputSignatures += 1;
    }
  };
  if (ts.isFunctionDeclaration(node)) {
    const signature = checker.getSignatureFromDeclaration(node);
    if (signature) auditSignature(signature);
    return;
  }
  for (const declaration of node.declarationList.declarations) {
    const type = checker.getTypeAtLocation(declaration.name);
    const signatures = checker.getSignaturesOfType(type, ts.SignatureKind.Call);
    if (signatures.length > 0) signatures.forEach(auditSignature);
    else {
      for (const schema of schemasWithinType(type, checker, registry)) {
        const target = byId.get(schema.id);
        if (target) target.bridge.outputSignatures += 1;
      }
    }
  }
}

function schemasWithinType(
  type: ts.Type,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  seen = new Set<ts.Type>(),
): TypedStructSchemaAudit[] {
  if (seen.has(type)) return [];
  seen.add(type);
  const resolution = registry.resolve(type);
  const schemas = new Map(resolution.schemas.filter((schema) => schema.eligible).map((schema) => [schema.id, schema]));
  const add = (nested: ts.Type): void => {
    for (const schema of schemasWithinType(nested, checker, registry, seen)) schemas.set(schema.id, schema);
  };
  if (type.isUnionOrIntersection()) type.types.forEach(add);
  for (const argument of type.aliasTypeArguments ?? []) add(argument);
  if ((type.flags & ts.TypeFlags.Object) !== 0 && (type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference) {
    checker.getTypeArguments(type as ts.TypeReference).forEach(add);
  }
  return [...schemas.values()].sort((left, right) => left.id.localeCompare(right.id));
}

function finalizeSchema(schema: MutableSchema): void {
  const normalization = schema.migration.normalizationReasons;
  if (schema.production.anonymousStructuralTransfers > 0) normalization.push('anonymous-structural-transfer');
  if (schema.production.crossSchemaTransfers > 0) normalization.push('cross-schema-transfer');
  if (schema.production.dynamicIngresses > 0) normalization.push('dynamic-ingress');
  if (schema.construction.computedObjectLiterals > 0) normalization.push('object-literal-computed');
  if (schema.construction.objectLiteralsWithSpread > 0) normalization.push('object-literal-spread');
  const observability = schema.migration.observabilityReasons;
  if (schema.production.enumerations + schema.oracle.enumerations > 0) observability.push('enumeration');
  if (schema.production.jsonSerializations + schema.oracle.jsonSerializations > 0) {
    observability.push('json-serialization');
  }
  if (schema.production.objectRests + schema.oracle.objectRests > 0) observability.push('object-rest');
  if (schema.production.objectSpreads + schema.oracle.objectSpreads > 0) observability.push('object-spread');
  if (schema.construction.objectLiteralsOmittingOptionalFields > 0) observability.push('optional-omission');
  if (schema.oracle.prototypeObservations > 0) observability.push('prototype-observation');
  if (schema.oracle.strictEqualityAssertions > 0) observability.push('strict-equality');
  schema.migration.mechanicallyCompatible = normalization.length === 0;
  schema.sites.sort(compareSites);
}

function sourceScope(source: ts.SourceFile): TypedStructClassFeasibilityScope | undefined {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\//u.exec(normalized)?.[1];
  if (!packageDirectory || packageDirectory in portConfig.excludedPackages || normalized.endsWith('.d.ts')) {
    return undefined;
  }
  return /\.(?:test|spec)\.tsx?$/u.test(normalized) ? 'test' : /\/src\//u.test(normalized) ? 'production' : undefined;
}

function isDynamic(type: ts.Type): boolean {
  return (type.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown)) !== 0;
}

function isNullish(type: ts.Type): boolean {
  return type.isUnion()
    ? type.types.every(isNullish)
    : (type.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) !== 0;
}

function compareSites(left: TypedStructClassFeasibilitySite, right: TypedStructClassFeasibilitySite): number {
  return (
    left.source.localeCompare(right.source) ||
    left.line - right.line ||
    left.column - right.column ||
    left.kind.localeCompare(right.kind) ||
    (left.relatedSchemaIds?.join(',') ?? '').localeCompare(right.relatedSchemaIds?.join(',') ?? '')
  );
}

function sum<T>(items: readonly T[], select: (item: T) => number): number {
  return items.reduce((total, item) => total + select(item), 0);
}
