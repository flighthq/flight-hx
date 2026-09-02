import path from 'node:path';
import ts from 'typescript';

import { upstreamTypeScriptProgram, type UpstreamTypeScriptProgram } from './program.ts';
import type { TypedStructRegistry, TypedStructSchemaAudit } from './typed-structs.ts';
import {
  entityFactoryDestinationCandidates,
  entityFactoryExpandedObjectFields,
  entityFactoryObjectLiteral,
  entityFactoryObjectShape,
  entityFactorySyntheticClassName,
  isParameterizedEntityFactoryType,
  isFlightCreateEntityCall,
  type EntityFactoryDestinationRoute,
} from './entity-factory-call.ts';

export type EntityFactoryDestinationKind =
  | 'bare-entity'
  | 'exact-entity'
  | 'exact-non-entity'
  | 'generic-entity'
  | 'local-entity'
  | 'structural-entity'
  | 'unresolved';

export type EntityFactoryBlocker =
  | 'bare-entity-destination'
  | 'computed-construction'
  | 'field-set-mismatch'
  | 'generic-entity-destination'
  | 'non-object-construction'
  | 'omitted-construction'
  | 'parameterized-destination'
  | 'spread-construction'
  | 'structural-entity-destination'
  | 'unresolved-destination'
  | 'unsupported-object-member';

export type EntityFactoryNormalization =
  | 'field-order'
  | 'missing-field-initialization'
  | 'spread-projection'
  | 'synthetic-class';

export interface EntityFactoryClosureSite {
  argument: {
    fields: string[];
    kind: 'object' | 'omitted' | 'other';
  };
  blockers: EntityFactoryBlocker[];
  column: number;
  destination: {
    kind: EntityFactoryDestinationKind;
    route?: EntityFactoryDestinationRoute | undefined;
    schemaId?: string | undefined;
    schemaName?: string | undefined;
    type: string;
  };
  factory: {
    canonicalForSchema: boolean;
    name: string;
  };
  line: number;
  normalizations: EntityFactoryNormalization[];
  source: string;
  status: 'blocked' | 'not-entity' | 'ready';
}

export interface EntityFactoryClosureAudit {
  schemaVersion: 1;
  schemas: Array<{
    blockedCalls: number;
    factories: string[];
    readyCalls: number;
    schemaId: string;
    schemaName: string;
    sites: EntityFactoryClosureSite[];
  }>;
  sites: EntityFactoryClosureSite[];
  summary: {
    bareEntityCalls: number;
    blockedEntityCalls: number;
    calls: number;
    exactEntityCalls: number;
    exactEntitySchemas: number;
    exactNonEntityCalls: number;
    genericEntityCalls: number;
    localEntityCalls: number;
    normalizedFieldOrderCalls: number;
    normalizedMissingFieldCalls: number;
    normalizedSpreadProjectionCalls: number;
    readyEntityCalls: number;
    structuralEntityCalls: number;
    unresolvedCalls: number;
  };
  upstreamCommit: string;
}

export function auditEntityFactoryClosure(
  workspaceDirectory: string,
  upstreamCommit: string,
  registry: TypedStructRegistry,
  { checker, program }: UpstreamTypeScriptProgram = upstreamTypeScriptProgram(workspaceDirectory),
): EntityFactoryClosureAudit {
  const entityType = locateEntityType(workspaceDirectory, program, checker);
  const sites: EntityFactoryClosureSite[] = [];
  const visit = (node: ts.Node): void => {
    if (ts.isCallExpression(node) && isFlightCreateEntityCall(node, checker)) {
      sites.push(auditFactorySite(workspaceDirectory, node, checker, registry, entityType));
    }
    ts.forEachChild(node, visit);
  };
  for (const source of program.getSourceFiles()) {
    if (sourceScope(source, registry.excludedPackageDirectories) === 'production') visit(source);
  }
  sites.sort(compareSites);

  const schemaGroups = new Map<string, EntityFactoryClosureSite[]>();
  for (const site of sites) {
    const id = site.destination.kind === 'exact-entity' ? site.destination.schemaId : undefined;
    if (!id) continue;
    const group = schemaGroups.get(id) ?? [];
    group.push(site);
    schemaGroups.set(id, group);
  }
  const schemas = [...schemaGroups.entries()]
    .map(([schemaId, schemaSites]) => ({
      blockedCalls: schemaSites.filter((site) => site.status === 'blocked').length,
      factories: [...new Set(schemaSites.map((site) => site.factory.name))].sort(),
      readyCalls: schemaSites.filter((site) => site.status === 'ready').length,
      schemaId,
      schemaName: schemaSites[0]!.destination.schemaName!,
      sites: schemaSites,
    }))
    .sort((left, right) => left.schemaId.localeCompare(right.schemaId));
  const countKind = (kind: EntityFactoryDestinationKind): number =>
    sites.filter((site) => site.destination.kind === kind).length;
  return {
    schemaVersion: 1,
    schemas,
    sites,
    summary: {
      bareEntityCalls: countKind('bare-entity'),
      blockedEntityCalls: sites.filter((site) => site.status === 'blocked').length,
      calls: sites.length,
      exactEntityCalls: countKind('exact-entity'),
      exactEntitySchemas: schemas.length,
      exactNonEntityCalls: countKind('exact-non-entity'),
      genericEntityCalls: countKind('generic-entity'),
      localEntityCalls: countKind('local-entity'),
      normalizedFieldOrderCalls: sites.filter((site) => site.normalizations.includes('field-order')).length,
      normalizedMissingFieldCalls: sites.filter((site) => site.normalizations.includes('missing-field-initialization'))
        .length,
      normalizedSpreadProjectionCalls: sites.filter((site) => site.normalizations.includes('spread-projection')).length,
      readyEntityCalls: sites.filter((site) => site.status === 'ready').length,
      structuralEntityCalls: countKind('structural-entity'),
      unresolvedCalls: countKind('unresolved'),
    },
    upstreamCommit,
  };
}

function auditFactorySite(
  workspaceDirectory: string,
  call: ts.CallExpression,
  checker: ts.TypeChecker,
  registry: TypedStructRegistry,
  entityType: ts.Type,
): EntityFactoryClosureSite {
  const destinationCandidates = entityFactoryDestinationCandidates(call, checker);
  const resolved = destinationCandidates
    .map((candidate) => ({ ...candidate, schema: registry.resolveIdentity(candidate.type) }))
    .find((candidate) => candidate.schema !== undefined && candidate.schema.id !== '@flighthq/types:interface#Entity');
  const fallbackResolved = destinationCandidates
    .map((candidate) => ({ ...candidate, schema: registry.resolveIdentity(candidate.type) }))
    .find((candidate) => candidate.schema !== undefined);
  const exact = resolved ?? fallbackResolved;
  const destinationType = exact?.type ?? destinationCandidates[0]?.type;
  const schema = exact?.schema;
  const entityAssignable = destinationCandidates.some((candidate) =>
    checker.isTypeAssignableTo(candidate.type, entityType),
  );
  const genericEntity = destinationCandidates.some((candidate) =>
    typeContainsEntityTypeParameter(candidate.type, checker, entityType),
  );
  let destinationKind: EntityFactoryDestinationKind = schema
    ? schema.id === '@flighthq/types:interface#Entity'
      ? 'bare-entity'
      : checker.isTypeAssignableTo(exact!.type, entityType)
        ? 'exact-entity'
        : 'exact-non-entity'
    : genericEntity
      ? 'generic-entity'
      : entityAssignable
        ? 'structural-entity'
        : 'unresolved';
  const object = entityFactoryObjectLiteral(call);
  const shape = object ? entityFactoryObjectShape(object) : undefined;
  const expandedFields = object && shape?.hasSpread ? entityFactoryExpandedObjectFields(object, checker) : undefined;
  const constructionFields = object && shape ? (expandedFields ?? shape.fields) : undefined;
  const fieldsOutsideNamedSchema =
    schema !== undefined &&
    constructionFields?.some((field) => !schema.fields.some((schemaField) => schemaField.name === field));
  const localEntityConstruction =
    object !== undefined &&
    shape !== undefined &&
    constructionFields !== undefined &&
    !shape.hasComputed &&
    !shape.hasUnsupported &&
    (schema === undefined || (destinationKind === 'exact-entity' && fieldsOutsideNamedSchema === true)) &&
    destinationKind !== 'generic-entity';
  if (localEntityConstruction) destinationKind = 'local-entity';
  const blockers: EntityFactoryBlocker[] = [];
  const normalizations: EntityFactoryNormalization[] = [];
  if (destinationKind === 'bare-entity') blockers.push('bare-entity-destination');
  else if (destinationKind === 'generic-entity') blockers.push('generic-entity-destination');
  else if (destinationKind === 'structural-entity') blockers.push('structural-entity-destination');
  else if (destinationKind === 'unresolved') blockers.push('unresolved-destination');
  else if (destinationKind === 'local-entity') normalizations.push('synthetic-class');
  if (exact && isParameterizedEntityFactoryType(exact.type, checker)) blockers.push('parameterized-destination');
  let argument: EntityFactoryClosureSite['argument'];
  if (object && shape && constructionFields) {
    argument = { fields: shape.fields, kind: 'object' };
    if (shape.hasComputed) blockers.push('computed-construction');
    if (shape.hasUnsupported) blockers.push('unsupported-object-member');
    const exactSpreadProjection =
      shape.hasSpread &&
      !shape.hasComputed &&
      !shape.hasUnsupported &&
      ((destinationKind === 'exact-entity' &&
        schema !== undefined &&
        sameFieldSet(
          constructionFields,
          schema.fields.map((field) => field.name),
        )) ||
        destinationKind === 'local-entity');
    if (shape.hasSpread) {
      if (exactSpreadProjection) normalizations.push('spread-projection');
      else blockers.push('spread-construction');
    }
    if (schema && !localEntityConstruction) {
      addFieldFindings(constructionFields, schema, blockers, normalizations, !shape.hasSpread);
    }
  } else if (call.arguments.length === 0) {
    argument = { fields: [], kind: 'omitted' };
    blockers.push('omitted-construction');
  } else {
    argument = { fields: [], kind: 'other' };
    blockers.push('non-object-construction');
  }

  const source = call.getSourceFile();
  const position = source.getLineAndCharacterOfPosition(call.getStart(source));
  const factoryName = enclosingFactoryName(call);
  const status: EntityFactoryClosureSite['status'] =
    destinationKind === 'exact-non-entity'
      ? 'not-entity'
      : (destinationKind === 'exact-entity' || destinationKind === 'local-entity') && blockers.length === 0
        ? 'ready'
        : 'blocked';
  return {
    argument,
    blockers: [...new Set(blockers)].sort(),
    column: position.character + 1,
    destination: {
      kind: destinationKind,
      ...(exact ? { route: exact.route } : destinationCandidates[0] ? { route: destinationCandidates[0].route } : {}),
      ...(localEntityConstruction
        ? {
            schemaId: syntheticEntitySchemaId(workspaceDirectory, call),
            schemaName: entityFactorySyntheticClassName(call),
          }
        : schema
          ? { schemaId: schema.id, schemaName: schema.name }
          : {}),
      type: destinationType
        ? checker.typeToString(destinationType, undefined, ts.TypeFormatFlags.NoTruncation)
        : 'unknown',
    },
    factory: {
      canonicalForSchema: schema && !localEntityConstruction ? factoryName === `create${schema.name}` : false,
      name: factoryName,
    },
    line: position.line + 1,
    normalizations,
    source: path.relative(workspaceDirectory, source.fileName).split(path.sep).join('/'),
    status,
  };
}

function addFieldFindings(
  fields: readonly string[],
  schema: TypedStructSchemaAudit,
  blockers: EntityFactoryBlocker[],
  normalizations: EntityFactoryNormalization[],
  recordFieldOrder = true,
): void {
  const expected = schema.fields.map((field) => field.name);
  if (fields.some((field) => !expected.includes(field))) {
    blockers.push('field-set-mismatch');
    return;
  }
  if (expected.some((field) => !fields.includes(field))) {
    normalizations.push('missing-field-initialization');
    return;
  }
  if (recordFieldOrder && fields.some((field, index) => field !== expected[index])) {
    normalizations.push('field-order');
  }
}

function syntheticEntitySchemaId(workspaceDirectory: string, call: ts.CallExpression): string {
  const source = call.getSourceFile();
  const position = source.getLineAndCharacterOfPosition(call.getStart(source));
  const relativeSource = path.relative(workspaceDirectory, source.fileName);
  return `synthetic-entity:${relativeSource}:${String(position.line + 1)}:${String(position.character + 1)}`;
}

function sameFieldSet(actual: readonly string[], expected: readonly string[]): boolean {
  return (
    actual.length === expected.length &&
    actual.every((field) => expected.includes(field)) &&
    expected.every((field) => actual.includes(field))
  );
}

function locateEntityType(workspaceDirectory: string, program: ts.Program, checker: ts.TypeChecker): ts.Type {
  const source = program.getSourceFile(path.resolve(workspaceDirectory, 'upstream/packages/types/src/Entity.ts'));
  const declaration = source?.statements.find(
    (statement): statement is ts.InterfaceDeclaration =>
      ts.isInterfaceDeclaration(statement) && statement.name.text === 'Entity',
  );
  if (!declaration) throw new Error('Entity factory closure audit could not locate Entity');
  return checker.getTypeAtLocation(declaration.name);
}

function typeContainsEntityTypeParameter(
  type: ts.Type,
  checker: ts.TypeChecker,
  entityType: ts.Type,
  seen = new Set<ts.Type>(),
): boolean {
  if (seen.has(type)) return false;
  seen.add(type);
  if ((type.flags & ts.TypeFlags.TypeParameter) !== 0) {
    const constraint = checker.getBaseConstraintOfType(type);
    return constraint ? checker.isTypeAssignableTo(constraint, entityType) : false;
  }
  if (
    type.isUnionOrIntersection() &&
    type.types.some((item) => typeContainsEntityTypeParameter(item, checker, entityType, seen))
  ) {
    return true;
  }
  const arguments_ =
    type.aliasTypeArguments ??
    ((type.flags & ts.TypeFlags.Object) !== 0 && (type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference
      ? checker.getTypeArguments(type as ts.TypeReference)
      : []);
  return arguments_.some((item) => typeContainsEntityTypeParameter(item, checker, entityType, seen));
}

function enclosingFactoryName(node: ts.Node): string {
  const owner = ts.findAncestor(node.parent, (ancestor): ancestor is ts.FunctionLikeDeclaration =>
    ts.isFunctionLike(ancestor),
  );
  if (!owner) return '<module>';
  if ('name' in owner && owner.name) {
    if (ts.isIdentifier(owner.name) || ts.isStringLiteral(owner.name) || ts.isNumericLiteral(owner.name)) {
      return owner.name.text;
    }
  }
  const parent = owner.parent;
  if (ts.isVariableDeclaration(parent) && ts.isIdentifier(parent.name)) return parent.name.text;
  if (ts.isPropertyAssignment(parent) && !ts.isComputedPropertyName(parent.name)) {
    return ts.isIdentifier(parent.name) || ts.isStringLiteral(parent.name) || ts.isNumericLiteral(parent.name)
      ? parent.name.text
      : '<anonymous>';
  }
  return '<anonymous>';
}

function sourceScope(source: ts.SourceFile, excludedDirectories: ReadonlySet<string>): 'production' | undefined {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\//u.exec(normalized)?.[1];
  if (!packageDirectory || excludedDirectories.has(packageDirectory) || normalized.endsWith('.d.ts')) return undefined;
  return /\.(?:test|spec)\.tsx?$/u.test(normalized) || !/\/src\//u.test(normalized) ? undefined : 'production';
}

function compareSites(left: EntityFactoryClosureSite, right: EntityFactoryClosureSite): number {
  return left.source.localeCompare(right.source) || left.line - right.line || left.column - right.column;
}
