import path from 'node:path';
import ts from 'typescript';

import { upstreamTypeScriptProgram, type UpstreamTypeScriptProgram } from './program.ts';
import type { TypedStructClassFeasibilityAudit, TypedStructClassFeasibilitySchema } from './typed-struct-classes.ts';
import type { TypedStructRegistry, TypedStructSchemaAudit } from './typed-structs.ts';

export type TypedStructProvenanceTransferKind =
  | 'anonymous-container-transfer'
  | 'cross-schema-container-transfer'
  | 'dynamic-container-transfer';

export interface TypedStructProvenanceSite {
  column: number;
  kind: TypedStructProvenanceTransferKind | 'json-parse-root';
  line: number;
  relatedSchemaIds?: string[] | undefined;
  source: string;
}

export interface TypedStructContainmentEdge {
  childSchemaId: string;
  fieldPath: string;
  parentSchemaId: string;
}

export interface TypedStructProvenancePath {
  path: string[];
  reasons?: string[] | undefined;
  rootSchemaId: string;
}

export interface TypedStructProvenanceSchema {
  bridgeExposure: {
    inputPaths: TypedStructProvenancePath[];
    outputPaths: TypedStructProvenancePath[];
  };
  containment: {
    children: TypedStructContainmentEdge[];
    parents: TypedStructContainmentEdge[];
  };
  directAccesses: number;
  fields: number;
  id: string;
  name: string;
  nominalIdentity: {
    blockerReasons: Array<'container-transfer' | 'normalization-provenance'>;
    closed: boolean;
  };
  normalizationProvenance: TypedStructProvenancePath[];
  source: string;
  transfers: TypedStructProvenanceSite[];
}

export interface TypedStructProvenanceAudit {
  containmentEdges: TypedStructContainmentEdge[];
  jsonParseRoots: Array<{
    schemaId: string;
    sites: TypedStructProvenanceSite[];
  }>;
  normalizationRoots: Array<{
    reasons: string[];
    schemaId: string;
  }>;
  schemaVersion: 1;
  schemas: TypedStructProvenanceSchema[];
  summary: {
    anonymousContainerTransferSchemas: number;
    bridgeInputExposedSchemas: number;
    bridgeOutputExposedSchemas: number;
    blockedSchemas: number;
    candidateSchemas: number;
    closedSchemas: number;
    combinedBlockedSchemas: number;
    containmentEdges: number;
    containerOnlyBlockedSchemas: number;
    containerTransferBlockedSchemas: number;
    crossSchemaContainerTransferSchemas: number;
    dynamicContainerTransferSchemas: number;
    jsonParseRoots: number;
    normalizationOnlyBlockedSchemas: number;
    normalizationProvenanceBlockedSchemas: number;
    normalizationRoots: number;
  };
  upstreamCommit: string;
}

interface SchemaType {
  audit: TypedStructSchemaAudit;
  type: ts.Type;
}

interface MutableTarget {
  audit: TypedStructClassFeasibilitySchema;
  sites: TypedStructProvenanceSite[];
  siteKeys: Set<string>;
}

/**
 * Audits whether the clean required-field class candidates are provenance closed.
 *
 * This is deliberately reporting-only. It expands the direct class-feasibility
 * census through declared containment, bridge signatures, JSON roots, and
 * container/generic transfers without changing typed-struct emission.
 */
export function auditTypedStructProvenance(
  workspaceDirectory: string,
  upstreamCommit: string,
  registry: TypedStructRegistry,
  classAudit: TypedStructClassFeasibilityAudit,
  { checker, program }: UpstreamTypeScriptProgram = upstreamTypeScriptProgram(workspaceDirectory),
): TypedStructProvenanceAudit {
  const eligible = registry.report.candidates.filter((candidate) => candidate.eligible);
  const schemaTypes = locateSchemaTypes(workspaceDirectory, eligible, program, checker);
  const eligibleIds = new Set(schemaTypes.map((item) => item.audit.id));
  const targets = classAudit.schemas
    .filter(isCleanRequiredSchema)
    .map((audit): MutableTarget => ({ audit, siteKeys: new Set(), sites: [] }))
    .sort((left, right) => left.audit.id.localeCompare(right.audit.id));
  const targetById = new Map(targets.map((target) => [target.audit.id, target]));

  const containmentEdges = collectContainmentEdges(schemaTypes, checker, registry, eligibleIds);
  const outgoing = groupEdges(containmentEdges, (edge) => edge.parentSchemaId);
  const incoming = groupEdges(containmentEdges, (edge) => edge.childSchemaId);
  const excludedDirectories = registry.excludedPackageDirectories;
  const jsonSites = collectJsonParseRoots(
    workspaceDirectory,
    program,
    checker,
    registry,
    eligibleIds,
    excludedDirectories,
  );
  collectContainerTransfers(workspaceDirectory, program, checker, registry, targetById, excludedDirectories);

  const normalizationRoots: Array<{ reasons: string[]; schemaId: string }> = classAudit.schemas
    .filter((schema) => schema.migration.normalizationReasons.length > 0)
    .map((schema) => ({
      reasons: schema.migration.normalizationReasons.slice().sort(),
      schemaId: schema.id,
    }));
  for (const schemaId of jsonSites.keys()) {
    const existing = normalizationRoots.find((root) => root.schemaId === schemaId);
    if (existing) {
      existing.reasons.push('json-parse-root');
      existing.reasons.sort();
    } else {
      normalizationRoots.push({ reasons: ['json-parse-root'], schemaId });
    }
  }
  normalizationRoots.sort((left, right) => left.schemaId.localeCompare(right.schemaId));

  const normalizationPaths = pathsFromRoots(
    normalizationRoots.map((root) => root.schemaId),
    outgoing,
  );
  const normalizationReasons = new Map(normalizationRoots.map((root) => [root.schemaId, root.reasons]));
  const bridgeInputPaths = pathsFromRoots(
    classAudit.schemas.filter((schema) => schema.bridge.inputSignatures > 0).map((schema) => schema.id),
    outgoing,
  );
  const bridgeOutputPaths = pathsFromRoots(
    classAudit.schemas.filter((schema) => schema.bridge.outputSignatures > 0).map((schema) => schema.id),
    outgoing,
  );

  const schemas = targets.map((target): TypedStructProvenanceSchema => {
    const normalizationProvenance = reportPaths(normalizationPaths.get(target.audit.id) ?? [], normalizationReasons);
    const inputPaths = reportPaths(bridgeInputPaths.get(target.audit.id) ?? []);
    const outputPaths = reportPaths(bridgeOutputPaths.get(target.audit.id) ?? []);
    const blockerReasons: TypedStructProvenanceSchema['nominalIdentity']['blockerReasons'] = [];
    if (target.sites.length > 0) blockerReasons.push('container-transfer');
    if (normalizationProvenance.length > 0) blockerReasons.push('normalization-provenance');
    return {
      bridgeExposure: { inputPaths, outputPaths },
      containment: {
        children: (outgoing.get(target.audit.id) ?? []).slice(),
        parents: (incoming.get(target.audit.id) ?? []).slice(),
      },
      directAccesses: target.audit.directAccesses,
      fields: target.audit.fields.total,
      id: target.audit.id,
      name: target.audit.name,
      nominalIdentity: { blockerReasons, closed: blockerReasons.length === 0 },
      normalizationProvenance,
      source: target.audit.source,
      transfers: target.sites.slice().sort(compareSites),
    };
  });

  const hasTransferKind = (schema: TypedStructProvenanceSchema, kind: TypedStructProvenanceTransferKind): boolean =>
    schema.transfers.some((site) => site.kind === kind);
  const containerBlocked = (schema: TypedStructProvenanceSchema): boolean => schema.transfers.length > 0;
  const provenanceBlocked = (schema: TypedStructProvenanceSchema): boolean => schema.normalizationProvenance.length > 0;
  return {
    containmentEdges,
    jsonParseRoots: [...jsonSites.entries()]
      .sort(([left], [right]) => left.localeCompare(right))
      .map(([schemaId, sites]) => ({ schemaId, sites: sites.slice().sort(compareSites) })),
    normalizationRoots,
    schemaVersion: 1,
    schemas,
    summary: {
      anonymousContainerTransferSchemas: schemas.filter((schema) =>
        hasTransferKind(schema, 'anonymous-container-transfer'),
      ).length,
      bridgeInputExposedSchemas: schemas.filter((schema) => schema.bridgeExposure.inputPaths.length > 0).length,
      bridgeOutputExposedSchemas: schemas.filter((schema) => schema.bridgeExposure.outputPaths.length > 0).length,
      blockedSchemas: schemas.filter((schema) => !schema.nominalIdentity.closed).length,
      candidateSchemas: schemas.length,
      closedSchemas: schemas.filter((schema) => schema.nominalIdentity.closed).length,
      combinedBlockedSchemas: schemas.filter((schema) => containerBlocked(schema) && provenanceBlocked(schema)).length,
      containmentEdges: containmentEdges.length,
      containerOnlyBlockedSchemas: schemas.filter((schema) => containerBlocked(schema) && !provenanceBlocked(schema))
        .length,
      containerTransferBlockedSchemas: schemas.filter(containerBlocked).length,
      crossSchemaContainerTransferSchemas: schemas.filter((schema) =>
        hasTransferKind(schema, 'cross-schema-container-transfer'),
      ).length,
      dynamicContainerTransferSchemas: schemas.filter((schema) => hasTransferKind(schema, 'dynamic-container-transfer'))
        .length,
      jsonParseRoots: jsonSites.size,
      normalizationOnlyBlockedSchemas: schemas.filter(
        (schema) => !containerBlocked(schema) && provenanceBlocked(schema),
      ).length,
      normalizationProvenanceBlockedSchemas: schemas.filter(provenanceBlocked).length,
      normalizationRoots: normalizationRoots.length,
    },
    upstreamCommit,
  };
}

function isCleanRequiredSchema(schema: TypedStructClassFeasibilitySchema): boolean {
  return (
    schema.fields.optional === 0 &&
    schema.fields.requiredUndefined === 0 &&
    schema.migration.normalizationReasons.length === 0 &&
    schema.migration.observabilityReasons.length === 0
  );
}

function locateSchemaTypes(
  workspaceDirectory: string,
  candidates: readonly TypedStructSchemaAudit[],
  program: ts.Program,
  checker: ts.TypeChecker,
): SchemaType[] {
  return candidates.map((audit) => {
    const source = program.getSourceFile(path.resolve(workspaceDirectory, audit.source));
    const declaration = source?.statements.find(
      (statement) =>
        (ts.isInterfaceDeclaration(statement) || ts.isTypeAliasDeclaration(statement)) &&
        statement.name.text === audit.name,
    );
    if (!declaration || (!ts.isInterfaceDeclaration(declaration) && !ts.isTypeAliasDeclaration(declaration))) {
      throw new Error(`Typed-struct provenance declaration is missing: ${audit.id}`);
    }
    return { audit, type: checker.getTypeAtLocation(declaration.name) };
  });
}

function collectContainmentEdges(
  schemas: readonly SchemaType[],
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  eligibleIds: ReadonlySet<string>,
): TypedStructContainmentEdge[] {
  const edges = new Map<string, TypedStructContainmentEdge>();
  for (const schema of schemas) {
    for (const field of schema.audit.fields) {
      const property = checker.getPropertyOfType(schema.type, field.name);
      const declaration = property?.valueDeclaration ?? property?.declarations?.[0];
      if (!property || !declaration) continue;
      const fieldType = checker.getTypeOfSymbolAtLocation(property, declaration);
      collectNestedSchemas(fieldType, field.name, checker, registry, eligibleIds, new Set(), (child, fieldPath) => {
        if (child.id === schema.audit.id) return;
        const edge = { childSchemaId: child.id, fieldPath, parentSchemaId: schema.audit.id };
        edges.set(`${edge.parentSchemaId}|${edge.childSchemaId}|${edge.fieldPath}`, edge);
      });
    }
  }
  return [...edges.values()].sort(compareEdges);
}

function collectNestedSchemas(
  type: ts.Type,
  fieldPath: string,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  eligibleIds: ReadonlySet<string>,
  seen: Set<ts.Type>,
  add: (schema: TypedStructSchemaAudit, fieldPath: string) => void,
): void {
  if (seen.has(type)) return;
  seen.add(type);
  const resolution = registry.resolve(type);
  const matches = resolution.schemas.filter((schema) => eligibleIds.has(schema.id));
  if (matches.length > 0) {
    matches.forEach((schema) => add(schema, fieldPath));
    return;
  }
  if (type.isUnionOrIntersection()) {
    type.types.forEach((item) => collectNestedSchemas(item, fieldPath, checker, registry, eligibleIds, seen, add));
  }
  const typeArguments = nestedTypeArguments(type, checker);
  if (typeArguments.length > 0) {
    typeArguments.forEach((argument, index) =>
      collectNestedSchemas(
        argument,
        `${fieldPath}${containerSuffix(type, checker, index)}`,
        checker,
        registry,
        eligibleIds,
        seen,
        add,
      ),
    );
    return;
  }
  const symbolName = type.getSymbol()?.getName();
  if (
    (type.flags & ts.TypeFlags.Object) === 0 ||
    (symbolName !== undefined && symbolName !== '__type' && symbolName !== '__object')
  ) {
    return;
  }
  for (const property of checker.getPropertiesOfType(type)) {
    const declaration = property.valueDeclaration ?? property.declarations?.[0];
    if (!declaration) continue;
    collectNestedSchemas(
      checker.getTypeOfSymbolAtLocation(property, declaration),
      `${fieldPath}.${property.getName()}`,
      checker,
      registry,
      eligibleIds,
      seen,
      add,
    );
  }
}

function collectJsonParseRoots(
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  eligibleIds: ReadonlySet<string>,
  excludedDirectories: ReadonlySet<string>,
): Map<string, TypedStructProvenanceSite[]> {
  const roots = new Map<string, TypedStructProvenanceSite[]>();
  const keys = new Set<string>();
  const visit = (node: ts.Node): void => {
    if (ts.isCallExpression(node) && isStaticCall(node, 'JSON', 'parse')) {
      const targetType = transferTargetType(node, checker);
      for (const schema of schemasWithinType(targetType, checker, registry, eligibleIds)) {
        const site = sourceSite(workspaceDirectory, node, 'json-parse-root');
        const key = `${schema.id}|${site.source}|${site.line}|${site.column}`;
        if (keys.has(key)) continue;
        keys.add(key);
        const sites = roots.get(schema.id) ?? [];
        sites.push(site);
        roots.set(schema.id, sites);
      }
    }
    ts.forEachChild(node, visit);
  };
  for (const source of program.getSourceFiles()) {
    if (sourceScope(source, excludedDirectories) === 'production') visit(source);
  }
  return roots;
}

function collectContainerTransfers(
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  targets: ReadonlyMap<string, MutableTarget>,
  excludedDirectories: ReadonlySet<string>,
): void {
  const targetIds = new Set(targets.keys());
  const audit = (expression: ts.Expression, targetType: ts.Type | undefined): void => {
    if (!targetType || sourceScope(expression.getSourceFile(), excludedDirectories) !== 'production') return;
    const targetSchemas = schemasWithinType(targetType, checker, registry, targetIds, true);
    if (targetSchemas.length === 0 || canonicalContainerConstruction(expression, targetType, checker)) return;
    const sourceType = checker.getTypeAtLocation(expression);
    const sourceSchemas = schemasWithinType(sourceType, checker, registry, targetIds);
    const sourceIds = new Set(sourceSchemas.map((schema) => schema.id));
    for (const schema of targetSchemas) {
      if (sourceIds.has(schema.id)) continue;
      const target = targets.get(schema.id);
      if (!target) continue;
      const allSourceSchemas = schemasWithinType(sourceType, checker, registry);
      const related = allSourceSchemas.filter((item) => item.id !== schema.id).map((item) => item.id);
      const kind: TypedStructProvenanceTransferKind = isDynamicWithinType(sourceType, checker)
        ? 'dynamic-container-transfer'
        : related.length > 0
          ? 'cross-schema-container-transfer'
          : 'anonymous-container-transfer';
      recordTransfer(workspaceDirectory, target, expression, kind, related);
    }
  };
  const visit = (node: ts.Node): void => {
    if (ts.isVariableDeclaration(node) && node.initializer) {
      audit(node.initializer, checker.getTypeAtLocation(node.name));
    } else if (ts.isBinaryExpression(node) && node.operatorToken.kind === ts.SyntaxKind.EqualsToken) {
      audit(node.right, checker.getTypeAtLocation(node.left));
    } else if (ts.isReturnStatement(node) && node.expression) {
      audit(node.expression, enclosingReturnType(node, checker));
    } else if (ts.isArrowFunction(node) && !ts.isBlock(node.body)) {
      const signature = checker.getSignatureFromDeclaration(node);
      audit(node.body, signature ? checker.getReturnTypeOfSignature(signature) : undefined);
    } else if (ts.isPropertyAssignment(node)) {
      audit(node.initializer, checker.getContextualType(node.initializer));
    } else if (ts.isArrayLiteralExpression(node)) {
      node.elements.forEach((element) => {
        if (ts.isExpression(element)) audit(element, checker.getContextualType(element));
      });
    } else if (ts.isAsExpression(node) || ts.isTypeAssertionExpression(node) || ts.isSatisfiesExpression(node)) {
      audit(node.expression, checker.getTypeAtLocation(node));
    } else if (ts.isCallExpression(node)) {
      node.arguments.forEach((argument) => audit(argument, checker.getContextualType(argument)));
    }
    ts.forEachChild(node, visit);
  };
  for (const source of program.getSourceFiles()) {
    if (sourceScope(source, excludedDirectories) === 'production') visit(source);
  }
}

function schemasWithinType(
  type: ts.Type | undefined,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  includeIds?: ReadonlySet<string>,
  nestedOnly = false,
  seen = new Set<ts.Type>(),
  depth = 0,
): TypedStructSchemaAudit[] {
  if (!type || seen.has(type)) return [];
  seen.add(type);
  const schemas = new Map<string, TypedStructSchemaAudit>();
  if (!nestedOnly || depth > 0) {
    for (const schema of registry.resolve(type).schemas) {
      if (schema.eligible && (!includeIds || includeIds.has(schema.id))) schemas.set(schema.id, schema);
    }
  }
  const add = (nested: ts.Type, nextDepth: number): void => {
    for (const schema of schemasWithinType(nested, checker, registry, includeIds, nestedOnly, seen, nextDepth)) {
      schemas.set(schema.id, schema);
    }
  };
  if (type.isUnionOrIntersection()) type.types.forEach((nested) => add(nested, depth));
  const argumentDepth = depth + (isTransparentTypeWrapper(type) ? 0 : 1);
  nestedTypeArguments(type, checker).forEach((nested) => add(nested, argumentDepth));
  return [...schemas.values()].sort((left, right) => left.id.localeCompare(right.id));
}

function isTransparentTypeWrapper(type: ts.Type): boolean {
  const name = type.aliasSymbol?.getName() ?? type.getSymbol()?.getName();
  return name === 'EntityWithoutRuntime' || name === 'Readonly';
}

function nestedTypeArguments(type: ts.Type, checker: ts.TypeChecker): readonly ts.Type[] {
  if (type.aliasTypeArguments && type.aliasTypeArguments.length > 0) return type.aliasTypeArguments;
  if ((type.flags & ts.TypeFlags.Object) !== 0 && (type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference) {
    return checker.getTypeArguments(type as ts.TypeReference);
  }
  return [];
}

function containerSuffix(type: ts.Type, checker: ts.TypeChecker, index: number): string {
  if (checker.isArrayType(type) || checker.isTupleType(type)) return '[]';
  const name = type.aliasSymbol?.getName() ?? type.getSymbol()?.getName() ?? 'container';
  return `<${name}:${index}>`;
}

function canonicalContainerConstruction(
  expression: ts.Expression,
  targetType: ts.Type,
  checker: ts.TypeChecker,
): boolean {
  if (
    ts.isObjectLiteralExpression(expression) &&
    expression.properties.every(
      (property) =>
        !ts.isSpreadAssignment(property) &&
        (!('name' in property) || property.name === undefined || !ts.isComputedPropertyName(property.name)),
    )
  ) {
    return true;
  }
  if (!ts.isArrayLiteralExpression(expression) || !checker.isArrayType(targetType)) return false;
  const elementType = checker.getTypeArguments(targetType as ts.TypeReference)[0];
  return (
    elementType !== undefined &&
    expression.elements.every(
      (element) => ts.isExpression(element) && canonicalContainerConstruction(element, elementType, checker),
    )
  );
}

function isDynamicWithinType(type: ts.Type, checker: ts.TypeChecker, seen = new Set<ts.Type>()): boolean {
  if (seen.has(type)) return false;
  seen.add(type);
  if ((type.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown)) !== 0) return true;
  if (type.isUnionOrIntersection() && type.types.some((item) => isDynamicWithinType(item, checker, seen))) return true;
  return nestedTypeArguments(type, checker).some((item) => isDynamicWithinType(item, checker, seen));
}

function recordTransfer(
  workspaceDirectory: string,
  target: MutableTarget,
  expression: ts.Expression,
  kind: TypedStructProvenanceTransferKind,
  relatedSchemaIds: string[],
): void {
  const site = sourceSite(workspaceDirectory, expression, kind, relatedSchemaIds);
  const key = [site.kind, site.source, site.line, site.column, site.relatedSchemaIds?.join(',')].join('|');
  if (target.siteKeys.has(key)) return;
  target.siteKeys.add(key);
  target.sites.push(site);
}

function sourceSite(
  workspaceDirectory: string,
  node: ts.Node,
  kind: TypedStructProvenanceSite['kind'],
  relatedSchemaIds: string[] = [],
): TypedStructProvenanceSite {
  const source = node.getSourceFile();
  const position = source.getLineAndCharacterOfPosition(node.getStart(source));
  return {
    column: position.character + 1,
    kind,
    line: position.line + 1,
    ...(relatedSchemaIds.length > 0 ? { relatedSchemaIds: relatedSchemaIds.slice().sort() } : {}),
    source: path.relative(workspaceDirectory, source.fileName).split(path.sep).join('/'),
  };
}

function transferTargetType(expression: ts.Expression, checker: ts.TypeChecker): ts.Type | undefined {
  let current: ts.Expression = expression;
  while (
    ts.isParenthesizedExpression(current.parent) ||
    ts.isAsExpression(current.parent) ||
    ts.isTypeAssertionExpression(current.parent) ||
    ts.isSatisfiesExpression(current.parent)
  ) {
    current = current.parent;
    if (ts.isAsExpression(current) || ts.isTypeAssertionExpression(current) || ts.isSatisfiesExpression(current)) {
      return checker.getTypeAtLocation(current);
    }
  }
  const parent = current.parent;
  if (ts.isVariableDeclaration(parent) && parent.initializer === current) return checker.getTypeAtLocation(parent.name);
  if (ts.isBinaryExpression(parent) && parent.right === current) return checker.getTypeAtLocation(parent.left);
  if (ts.isReturnStatement(parent)) return enclosingReturnType(parent, checker);
  return checker.getContextualType(current);
}

function enclosingReturnType(node: ts.ReturnStatement, checker: ts.TypeChecker): ts.Type | undefined {
  const declaration = ts.findAncestor(node.parent, (ancestor): ancestor is ts.SignatureDeclaration =>
    ts.isFunctionLike(ancestor),
  );
  const signature = declaration ? checker.getSignatureFromDeclaration(declaration) : undefined;
  return signature ? checker.getReturnTypeOfSignature(signature) : undefined;
}

function pathsFromRoots(
  roots: readonly string[],
  outgoing: ReadonlyMap<string, TypedStructContainmentEdge[]>,
): Map<string, Array<{ path: string[]; rootSchemaId: string }>> {
  const result = new Map<string, Array<{ path: string[]; rootSchemaId: string }>>();
  for (const rootSchemaId of [...new Set(roots)].sort()) {
    const queue: Array<{ current: string; path: string[] }> = [{ current: rootSchemaId, path: [rootSchemaId] }];
    const visited = new Set<string>();
    while (queue.length > 0) {
      const item = queue.shift()!;
      if (visited.has(item.current)) continue;
      visited.add(item.current);
      const paths = result.get(item.current) ?? [];
      paths.push({ path: item.path, rootSchemaId });
      result.set(item.current, paths);
      for (const edge of outgoing.get(item.current) ?? []) {
        queue.push({ current: edge.childSchemaId, path: [...item.path, `${edge.fieldPath}:${edge.childSchemaId}`] });
      }
    }
  }
  return result;
}

function reportPaths(
  paths: readonly { path: string[]; rootSchemaId: string }[],
  reasons?: ReadonlyMap<string, string[]>,
): TypedStructProvenancePath[] {
  return paths
    .map((item) => ({
      path: item.path,
      ...(reasons?.get(item.rootSchemaId) ? { reasons: reasons.get(item.rootSchemaId)!.slice() } : {}),
      rootSchemaId: item.rootSchemaId,
    }))
    .sort(
      (left, right) =>
        left.rootSchemaId.localeCompare(right.rootSchemaId) || left.path.join('|').localeCompare(right.path.join('|')),
    );
}

function groupEdges(
  edges: readonly TypedStructContainmentEdge[],
  key: (edge: TypedStructContainmentEdge) => string,
): Map<string, TypedStructContainmentEdge[]> {
  const grouped = new Map<string, TypedStructContainmentEdge[]>();
  for (const edge of edges) {
    const values = grouped.get(key(edge)) ?? [];
    values.push(edge);
    grouped.set(key(edge), values);
  }
  return grouped;
}

function isStaticCall(node: ts.CallExpression, owner: string, member: string): boolean {
  return (
    ts.isPropertyAccessExpression(node.expression) &&
    ts.isIdentifier(node.expression.expression) &&
    node.expression.expression.text === owner &&
    node.expression.name.text === member
  );
}

function sourceScope(
  source: ts.SourceFile,
  excludedDirectories: ReadonlySet<string>,
): 'production' | 'test' | undefined {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\//u.exec(normalized)?.[1];
  if (!packageDirectory || excludedDirectories.has(packageDirectory) || normalized.endsWith('.d.ts')) {
    return undefined;
  }
  return /\.(?:test|spec)\.tsx?$/u.test(normalized) ? 'test' : /\/src\//u.test(normalized) ? 'production' : undefined;
}

function compareEdges(left: TypedStructContainmentEdge, right: TypedStructContainmentEdge): number {
  return (
    left.parentSchemaId.localeCompare(right.parentSchemaId) ||
    left.childSchemaId.localeCompare(right.childSchemaId) ||
    left.fieldPath.localeCompare(right.fieldPath)
  );
}

function compareSites(left: TypedStructProvenanceSite, right: TypedStructProvenanceSite): number {
  return (
    left.source.localeCompare(right.source) ||
    left.line - right.line ||
    left.column - right.column ||
    left.kind.localeCompare(right.kind) ||
    (left.relatedSchemaIds?.join(',') ?? '').localeCompare(right.relatedSchemaIds?.join(',') ?? '')
  );
}
