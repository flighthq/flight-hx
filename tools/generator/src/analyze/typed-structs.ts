import { createHash } from 'node:crypto';
import path from 'node:path';
import ts from 'typescript';

import { upstreamTypeScriptProgram } from './program.ts';

export interface TypedStructCandidate {
  emission: 'audit-only' | 'direct';
  name: string;
  packageName: string;
  purpose: string;
  source: string;
}

export interface TypedStructField {
  name: string;
  optional: boolean;
  readonly: boolean;
  receiverSensitive: boolean;
  requiredUndefined: boolean;
  type: string;
}

export interface TypedStructFieldBinding {
  field: TypedStructField;
  schemaId: string;
  schemaName: string;
}

export interface TypedStructEscape {
  column: number;
  member?: string | undefined;
  reason:
    | 'computed-key'
    | 'dynamic-enumeration'
    | 'incompatible-union'
    | 'instanceof'
    | 'presence-sensitive'
    | 'receiver-sensitive-method'
    | 'unknown-member';
  source: string;
  line: number;
}

export interface TypedStructMemberEscape {
  member: string;
  reason: 'computed-symbol-member' | 'receiver-sensitive-method';
  source: string;
}

export interface TypedStructSchemaAudit {
  accesses: {
    calls: number;
    reads: number;
    writes: number;
  };
  declarationFingerprint: string;
  declarationKind: 'interface' | 'type';
  eligible: boolean;
  emission: {
    directAccesses: number;
    mode: 'audit-only' | 'direct';
    pendingAccesses: number;
    reflectiveSurvivors: Array<{
      accesses: number;
      reason: string;
    }>;
  };
  escapes: TypedStructEscape[];
  fields: TypedStructField[];
  id: string;
  memberEscapes: TypedStructMemberEscape[];
  name: string;
  packageName: string;
  purpose: string;
  reasons: Array<
    | 'callable-schema'
    | 'constructable-schema'
    | 'declaration-merge'
    | 'index-signature'
    | 'instanceof-use'
    | 'presence-sensitive-use'
    | 'unsupported-shape'
  >;
  source: string;
}

export interface TypedStructAudit {
  candidates: TypedStructSchemaAudit[];
  schemaVersion: 3;
  summary: {
    auditOnlySchemas: number;
    bindableAccesses: number;
    candidates: number;
    directAccesses: number;
    directSchemas: number;
    eligible: number;
    escapes: number;
    fields: number;
    ineligible: number;
    pendingAccesses: number;
    reflectiveSurvivors: number;
  };
  upstreamCommit: string;
}

export interface TypedStructResolution {
  kind: 'incompatible' | 'matched' | 'none';
  schemas: TypedStructSchemaAudit[];
}

export interface TypedStructRegistry {
  report: TypedStructAudit;
  resolve(type: ts.Type): TypedStructResolution;
  resolveField(type: ts.Type, member: string): TypedStructFieldBinding | undefined;
}

const directTypedStructCandidates: readonly TypedStructCandidate[] = [
  {
    emission: 'direct',
    name: 'Vector2',
    packageName: '@flighthq/types',
    purpose: 'two-component numeric geometry leaf',
    source: 'upstream/packages/types/src/Vector2.ts',
  },
  {
    emission: 'direct',
    name: 'Vector3',
    packageName: '@flighthq/types',
    purpose: 'three-component numeric geometry leaf',
    source: 'upstream/packages/types/src/Vector3.ts',
  },
  {
    emission: 'direct',
    name: 'Quaternion',
    packageName: '@flighthq/types',
    purpose: 'four-component rotation leaf',
    source: 'upstream/packages/types/src/Quaternion.ts',
  },
  {
    emission: 'direct',
    name: 'Matrix3',
    packageName: '@flighthq/types',
    purpose: '3x3 matrix holder',
    source: 'upstream/packages/types/src/Matrix3.ts',
  },
  {
    emission: 'direct',
    name: 'Matrix4',
    packageName: '@flighthq/types',
    purpose: '4x4 matrix holder',
    source: 'upstream/packages/types/src/Matrix4.ts',
  },
  {
    emission: 'direct',
    name: 'Rectangle',
    packageName: '@flighthq/types',
    purpose: 'four-component rectangle leaf',
    source: 'upstream/packages/types/src/Rectangle.ts',
  },
  {
    emission: 'direct',
    name: 'ColorTransform',
    packageName: '@flighthq/types',
    purpose: 'render-hot RGBA multiplier and offset record',
    source: 'upstream/packages/types/src/ColorTransform.ts',
  },
];

export const tranche4TypedStructCandidates: readonly TypedStructCandidate[] = [
  {
    emission: 'audit-only',
    name: 'ApplicationLoopOptions',
    packageName: '@flighthq/types',
    purpose: 'application-loop option record',
    source: 'upstream/packages/types/src/ApplicationLoopOptions.ts',
  },
  {
    emission: 'audit-only',
    name: 'AudioBusOptions',
    packageName: '@flighthq/types',
    purpose: 'audio-bus option record',
    source: 'upstream/packages/types/src/AudioBus.ts',
  },
  {
    emission: 'audit-only',
    name: 'AudioPlayOptions',
    packageName: '@flighthq/types',
    purpose: 'audio-playback option record',
    source: 'upstream/packages/types/src/AudioResource.ts',
  },
  {
    emission: 'audit-only',
    name: 'BinPackOptions',
    packageName: '@flighthq/types',
    purpose: 'bin-packing option record',
    source: 'upstream/packages/types/src/BinPack.ts',
  },
  {
    emission: 'audit-only',
    name: 'BitmapTextOptions',
    packageName: '@flighthq/types',
    purpose: 'bitmap-text option record',
    source: 'upstream/packages/types/src/BitmapText.ts',
  },
  {
    emission: 'audit-only',
    name: 'DeviceCapabilities',
    packageName: '@flighthq/types',
    purpose: 'device capability result record',
    source: 'upstream/packages/types/src/DeviceCapabilities.ts',
  },
  {
    emission: 'audit-only',
    name: 'DeviceDisplayMetrics',
    packageName: '@flighthq/types',
    purpose: 'device display-metrics result record',
    source: 'upstream/packages/types/src/DeviceDisplayMetrics.ts',
  },
  {
    emission: 'audit-only',
    name: 'FileDialogHandle',
    packageName: '@flighthq/types',
    purpose: 'file-dialog result handle',
    source: 'upstream/packages/types/src/Dialog.ts',
  },
  {
    emission: 'audit-only',
    name: 'FilmicToneMapOptions',
    packageName: '@flighthq/types',
    purpose: 'filmic tone-map option record',
    source: 'upstream/packages/types/src/FilmicToneMapOptions.ts',
  },
  {
    emission: 'audit-only',
    name: 'FontMetrics',
    packageName: '@flighthq/types',
    purpose: 'font-metrics result record',
    source: 'upstream/packages/types/src/FontMetrics.ts',
  },
  {
    emission: 'audit-only',
    name: 'GlyphAtlasOptions',
    packageName: '@flighthq/types',
    purpose: 'glyph-atlas option record',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    emission: 'audit-only',
    name: 'GlyphMetrics',
    packageName: '@flighthq/types',
    purpose: 'glyph-metrics result record',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    emission: 'audit-only',
    name: 'GlyphRasterizeOptions',
    packageName: '@flighthq/types',
    purpose: 'glyph-rasterization option record',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    emission: 'audit-only',
    name: 'HapticsCapabilities',
    packageName: '@flighthq/types',
    purpose: 'haptics capability result record',
    source: 'upstream/packages/types/src/Haptics.ts',
  },
  {
    emission: 'audit-only',
    name: 'InputGamepadAxisData',
    packageName: '@flighthq/types',
    purpose: 'gamepad-axis input result record',
    source: 'upstream/packages/types/src/InputGamepadData.ts',
  },
  {
    emission: 'audit-only',
    name: 'InputGamepadButtonData',
    packageName: '@flighthq/types',
    purpose: 'gamepad-button input result record',
    source: 'upstream/packages/types/src/InputGamepadData.ts',
  },
  {
    emission: 'audit-only',
    name: 'InputGamepadConnectData',
    packageName: '@flighthq/types',
    purpose: 'gamepad-connection input result record',
    source: 'upstream/packages/types/src/InputGamepadData.ts',
  },
  {
    emission: 'audit-only',
    name: 'InputTextData',
    packageName: '@flighthq/types',
    purpose: 'text-input result record',
    source: 'upstream/packages/types/src/InputTextData.ts',
  },
  {
    emission: 'audit-only',
    name: 'InteractionPointerOptions',
    packageName: '@flighthq/types',
    purpose: 'interaction-pointer option record',
    source: 'upstream/packages/types/src/InteractionManager.ts',
  },
  {
    emission: 'audit-only',
    name: 'PathBooleanOptions',
    packageName: '@flighthq/types',
    purpose: 'path-boolean option record',
    source: 'upstream/packages/types/src/PathBooleanOptions.ts',
  },
  {
    emission: 'audit-only',
    name: 'PathOffsetOptions',
    packageName: '@flighthq/types',
    purpose: 'path-offset option record',
    source: 'upstream/packages/types/src/PathOffsetOptions.ts',
  },
  {
    emission: 'audit-only',
    name: 'RenderCacheRefreshOptions',
    packageName: '@flighthq/types',
    purpose: 'render-cache refresh option record',
    source: 'upstream/packages/types/src/RenderCacheRefreshOptions.ts',
  },
  {
    emission: 'audit-only',
    name: 'StatusBarInfo',
    packageName: '@flighthq/types',
    purpose: 'status-bar result record',
    source: 'upstream/packages/types/src/StatusBar.ts',
  },
  {
    emission: 'audit-only',
    name: 'TextMetrics',
    packageName: '@flighthq/types',
    purpose: 'text-metrics result record',
    source: 'upstream/packages/types/src/TextMetrics.ts',
  },
  {
    emission: 'audit-only',
    name: 'TrayBalloonOptions',
    packageName: '@flighthq/types',
    purpose: 'tray-balloon option record',
    source: 'upstream/packages/types/src/Tray.ts',
  },
  {
    emission: 'audit-only',
    name: 'VideoPlayOptions',
    packageName: '@flighthq/types',
    purpose: 'video-playback option record',
    source: 'upstream/packages/types/src/VideoResource.ts',
  },
  {
    emission: 'audit-only',
    name: 'VideoResourceLoadOptions',
    packageName: '@flighthq/types',
    purpose: 'video-resource load option record',
    source: 'upstream/packages/types/src/VideoResource.ts',
  },
  {
    emission: 'audit-only',
    name: 'SignalThrottleOptions',
    packageName: '@flighthq/signals',
    purpose: 'signal-throttle option record',
    source: 'upstream/packages/signals/src/throttle.ts',
  },
];

export const initialTypedStructCandidates: readonly TypedStructCandidate[] = [
  ...directTypedStructCandidates,
  ...tranche4TypedStructCandidates,
];

interface InternalSchema {
  audit: TypedStructSchemaAudit;
  fields: ReadonlyMap<string, TypedStructField>;
  symbol: ts.Symbol;
}

interface ReferencedSchemas {
  blockedMappedType: boolean;
  schemas: Set<InternalSchema>;
}

const registryCache = new WeakMap<ts.Program, Map<string, TypedStructRegistry>>();
const fingerprintPrinter = ts.createPrinter({ removeComments: true });

export function typedStructRegistry(
  workspaceDirectory: string,
  upstreamCommit: string,
  candidates: readonly TypedStructCandidate[] = initialTypedStructCandidates,
  programAndChecker = upstreamTypeScriptProgram(workspaceDirectory),
): TypedStructRegistry {
  const cacheKey = `${upstreamCommit}|${candidates
    .map((candidate) => `${candidate.packageName}:${candidate.source}#${candidate.name}:${candidate.emission}`)
    .join('|')}`;
  const cached = registryCache.get(programAndChecker.program)?.get(cacheKey);
  if (cached) return cached;

  const registry = createTypedStructRegistry(
    workspaceDirectory,
    upstreamCommit,
    candidates,
    programAndChecker.program,
    programAndChecker.checker,
  );
  const programCache = registryCache.get(programAndChecker.program) ?? new Map<string, TypedStructRegistry>();
  programCache.set(cacheKey, registry);
  registryCache.set(programAndChecker.program, programCache);
  return registry;
}

export function createTypedStructRegistry(
  workspaceDirectory: string,
  upstreamCommit: string,
  candidates: readonly TypedStructCandidate[],
  program: ts.Program,
  checker: ts.TypeChecker,
): TypedStructRegistry {
  const schemas = candidates.map((candidate) => analyzeCandidate(candidate, workspaceDirectory, program, checker));
  const bySymbol = new Map(schemas.map((schema) => [canonicalSymbol(schema.symbol, checker), schema]));
  const resolve = (type: ts.Type): TypedStructResolution =>
    resolveType(type, checker, bySymbol, new Set<ts.Type>(), new Set<ts.Symbol>());

  auditUses(workspaceDirectory, program, checker, schemas, resolve);
  for (const schema of schemas) {
    if (schema.audit.escapes.some((escape) => escape.reason === 'presence-sensitive')) {
      addReason(schema.audit, 'presence-sensitive-use');
    }
    if (schema.audit.escapes.some((escape) => escape.reason === 'instanceof')) {
      addReason(schema.audit, 'instanceof-use');
    }
    schema.audit.eligible = schema.audit.reasons.length === 0;
    const accesses = sum(Object.values(schema.audit.accesses), (count) => count);
    schema.audit.emission.directAccesses =
      schema.audit.eligible && schema.audit.emission.mode === 'direct' ? accesses : 0;
    schema.audit.emission.pendingAccesses =
      schema.audit.eligible && schema.audit.emission.mode === 'audit-only' ? accesses : 0;
    schema.audit.escapes.sort(compareEscapes);
    schema.audit.memberEscapes.sort(
      (left, right) =>
        left.member.localeCompare(right.member) ||
        left.reason.localeCompare(right.reason) ||
        left.source.localeCompare(right.source),
    );
  }

  const report: TypedStructAudit = {
    candidates: schemas.map((schema) => schema.audit),
    schemaVersion: 3,
    summary: {
      auditOnlySchemas: schemas.filter((schema) => schema.audit.emission.mode === 'audit-only').length,
      bindableAccesses: sum(schemas, (schema) =>
        schema.audit.eligible ? sum(Object.values(schema.audit.accesses), (count) => count) : 0,
      ),
      candidates: schemas.length,
      directAccesses: sum(schemas, (schema) => schema.audit.emission.directAccesses),
      directSchemas: schemas.filter((schema) => schema.audit.eligible && schema.audit.emission.mode === 'direct')
        .length,
      eligible: schemas.filter((schema) => schema.audit.eligible).length,
      escapes: sum(schemas, (schema) => schema.audit.escapes.length),
      fields: sum(schemas, (schema) => schema.audit.fields.length),
      ineligible: schemas.filter((schema) => !schema.audit.eligible).length,
      pendingAccesses: sum(schemas, (schema) => schema.audit.emission.pendingAccesses),
      reflectiveSurvivors: sum(schemas, (schema) =>
        sum(schema.audit.emission.reflectiveSurvivors, (survivor) => survivor.accesses),
      ),
    },
    upstreamCommit,
  };

  return {
    report,
    resolve,
    resolveField(type, member) {
      const resolution = resolve(type);
      if (resolution.kind !== 'matched') return undefined;
      const schema = schemas.find((candidate) => candidate.audit.id === resolution.schemas[0]?.id);
      const field = schema?.fields.get(member);
      if (!schema?.audit.eligible || schema.audit.emission.mode !== 'direct' || !field || field.receiverSensitive) {
        return undefined;
      }
      return { field, schemaId: schema.audit.id, schemaName: schema.audit.name };
    },
  };
}

function analyzeCandidate(
  candidate: TypedStructCandidate,
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
): InternalSchema {
  const absoluteSource = path.resolve(workspaceDirectory, candidate.source);
  const source = program.getSourceFile(absoluteSource);
  if (!source)
    throw new Error(`Typed-struct candidate source is missing from the TypeScript program: ${candidate.source}`);
  const declaration = source.statements.find(
    (statement) =>
      (ts.isInterfaceDeclaration(statement) || ts.isTypeAliasDeclaration(statement)) &&
      statement.name.text === candidate.name,
  );
  if (!declaration || (!ts.isInterfaceDeclaration(declaration) && !ts.isTypeAliasDeclaration(declaration))) {
    throw new Error(`Typed-struct candidate declaration is missing: ${candidate.source}#${candidate.name}`);
  }
  const symbol = checker.getSymbolAtLocation(declaration.name);
  if (!symbol) throw new Error(`Typed-struct candidate has no symbol: ${candidate.source}#${candidate.name}`);
  const type = checker.getTypeAtLocation(declaration.name);
  const reasons: TypedStructSchemaAudit['reasons'] = [];
  if (checker.isArrayType(type) || checker.isTupleType(type) || (type.flags & ts.TypeFlags.Object) === 0) {
    reasons.push('unsupported-shape');
  }
  if (checker.getIndexInfosOfType(type).length > 0) reasons.push('index-signature');
  if (checker.getSignaturesOfType(type, ts.SignatureKind.Call).length > 0) reasons.push('callable-schema');
  if (checker.getSignaturesOfType(type, ts.SignatureKind.Construct).length > 0) reasons.push('constructable-schema');
  const declarations = canonicalSymbol(symbol, checker).declarations?.filter(
    (item) => ts.isInterfaceDeclaration(item) || ts.isTypeAliasDeclaration(item),
  );
  if ((declarations?.length ?? 0) > 1) reasons.push('declaration-merge');

  const fields: TypedStructField[] = [];
  const memberEscapes: TypedStructMemberEscape[] = [];
  for (const property of checker.getPropertiesOfType(type)) {
    const propertyDeclarations = property.declarations ?? [];
    const computedDeclaration = propertyDeclarations.find(
      (item) => (ts.isPropertySignature(item) || ts.isMethodSignature(item)) && ts.isComputedPropertyName(item.name),
    );
    if (computedDeclaration || property.getName().startsWith('__@')) {
      const name =
        computedDeclaration &&
        (ts.isPropertySignature(computedDeclaration) || ts.isMethodSignature(computedDeclaration))
          ? computedDeclaration.name.getText(computedDeclaration.getSourceFile())
          : property.getName();
      memberEscapes.push({
        member: name,
        reason: 'computed-symbol-member',
        source: declarationLocation(propertyDeclarations[0] ?? declaration, workspaceDirectory),
      });
      continue;
    }
    const location = propertyDeclarations[0] ?? declaration;
    const propertyType = checker.getTypeOfSymbolAtLocation(property, location);
    const receiverSensitive = propertyDeclarations.some(isReceiverSensitiveMember);
    const field: TypedStructField = {
      name: property.getName(),
      optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
      readonly: propertyDeclarations.some(hasReadonlyModifier),
      receiverSensitive,
      requiredUndefined: (property.flags & ts.SymbolFlags.Optional) === 0 && typeIncludesUndefined(propertyType),
      type: checker.typeToString(
        propertyType,
        location,
        ts.TypeFormatFlags.NoTruncation | ts.TypeFormatFlags.UseAliasDefinedOutsideCurrentScope,
      ),
    };
    fields.push(field);
    if (receiverSensitive) {
      memberEscapes.push({
        member: field.name,
        reason: 'receiver-sensitive-method',
        source: declarationLocation(location, workspaceDirectory),
      });
    }
  }
  fields.sort((left, right) => left.name.localeCompare(right.name));

  const audit: TypedStructSchemaAudit = {
    accesses: { calls: 0, reads: 0, writes: 0 },
    declarationFingerprint: fingerprint(declaration, source),
    declarationKind: ts.isInterfaceDeclaration(declaration) ? 'interface' : 'type',
    eligible: false,
    emission: {
      directAccesses: 0,
      mode: candidate.emission,
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    },
    escapes: [],
    fields,
    id: `${candidate.packageName}:${candidate.source}#${candidate.name}`,
    memberEscapes,
    name: candidate.name,
    packageName: candidate.packageName,
    purpose: candidate.purpose,
    reasons,
    source: candidate.source,
  };
  return { audit, fields: new Map(fields.map((field) => [field.name, field])), symbol };
}

function auditUses(
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
  schemas: InternalSchema[],
  resolve: (type: ts.Type) => TypedStructResolution,
): void {
  const byId = new Map(schemas.map((schema) => [schema.audit.id, schema]));
  const visit = (node: ts.Node): void => {
    if (ts.isPropertyAccessExpression(node)) {
      const resolution = resolve(checker.getTypeAtLocation(node.expression));
      if (resolution.kind === 'incompatible') {
        for (const audit of resolution.schemas) {
          addEscape(audit, node, workspaceDirectory, 'incompatible-union', node.name.text);
        }
      } else if (resolution.kind === 'matched') {
        const audit = resolution.schemas[0]!;
        const schema = byId.get(audit.id)!;
        if (isPresenceSensitiveMember(node)) {
          addEscape(audit, node, workspaceDirectory, 'presence-sensitive', node.name.text);
        } else {
          const field = schema.fields.get(node.name.text);
          if (!field) {
            addEscape(audit, node, workspaceDirectory, 'unknown-member', node.name.text);
          } else if (field.receiverSensitive && isCalledProperty(node)) {
            addEscape(audit, node, workspaceDirectory, 'receiver-sensitive-method', node.name.text);
          } else {
            audit.accesses[propertyAccessMode(node)] += 1;
          }
        }
      }
    } else if (ts.isElementAccessExpression(node)) {
      addResolutionEscape(
        resolve(checker.getTypeAtLocation(node.expression)),
        node,
        workspaceDirectory,
        'computed-key',
      );
    } else if (ts.isBinaryExpression(node) && node.operatorToken.kind === ts.SyntaxKind.InKeyword) {
      addResolutionEscape(
        resolve(checker.getTypeAtLocation(node.right)),
        node,
        workspaceDirectory,
        'presence-sensitive',
      );
    } else if (ts.isBinaryExpression(node) && node.operatorToken.kind === ts.SyntaxKind.InstanceOfKeyword) {
      addResolutionEscape(resolve(checker.getTypeAtLocation(node.left)), node, workspaceDirectory, 'instanceof');
    } else if (ts.isCallExpression(node)) {
      const presenceArgument = presenceSensitiveCallArgument(node);
      if (presenceArgument) {
        addResolutionEscape(
          resolve(checker.getTypeAtLocation(presenceArgument)),
          node,
          workspaceDirectory,
          'presence-sensitive',
        );
      }
      const enumerationArgument = dynamicEnumerationCallArgument(node);
      if (enumerationArgument) {
        addResolutionEscape(
          resolve(checker.getTypeAtLocation(enumerationArgument)),
          node,
          workspaceDirectory,
          'dynamic-enumeration',
        );
      }
    } else if (ts.isSpreadAssignment(node) || ts.isSpreadElement(node)) {
      addResolutionEscape(
        resolve(checker.getTypeAtLocation(node.expression)),
        node,
        workspaceDirectory,
        'dynamic-enumeration',
      );
    }
    ts.forEachChild(node, visit);
  };

  for (const source of program.getSourceFiles().filter(isProductionUpstreamSource)) visit(source);
}

function resolveType(
  type: ts.Type,
  checker: ts.TypeChecker,
  bySymbol: ReadonlyMap<ts.Symbol, InternalSchema>,
  seenTypes: Set<ts.Type>,
  seenAliases: Set<ts.Symbol>,
): TypedStructResolution {
  if (isNullish(type)) return { kind: 'none', schemas: [] };
  if (type.isUnion()) {
    const members = type.types.filter((item) => !isNullish(item));
    const resolutions = members.map((item) =>
      resolveType(item, checker, bySymbol, new Set(seenTypes), new Set(seenAliases)),
    );
    const schemas = uniqueSchemas(resolutions.flatMap((item) => item.schemas));
    const matched =
      schemas.length === 1 &&
      resolutions.length > 0 &&
      resolutions.every(
        (item) => item.kind === 'matched' && item.schemas.length === 1 && item.schemas[0]?.id === schemas[0]?.id,
      );
    return { kind: matched ? 'matched' : schemas.length > 0 ? 'incompatible' : 'none', schemas };
  }

  const references = referencedSchemas(type, checker, bySymbol, seenTypes, seenAliases);
  const schemas = uniqueSchemas([...references.schemas].map((schema) => schema.audit));
  if (references.blockedMappedType || schemas.length > 1) {
    return { kind: schemas.length > 0 ? 'incompatible' : 'none', schemas };
  }
  return { kind: schemas.length === 1 ? 'matched' : 'none', schemas };
}

function referencedSchemas(
  type: ts.Type,
  checker: ts.TypeChecker,
  bySymbol: ReadonlyMap<ts.Symbol, InternalSchema>,
  seenTypes: Set<ts.Type>,
  seenAliases: Set<ts.Symbol>,
): ReferencedSchemas {
  if (seenTypes.has(type)) return { blockedMappedType: false, schemas: new Set() };
  seenTypes.add(type);
  const result: ReferencedSchemas = { blockedMappedType: false, schemas: new Set() };
  let transparentWrapper = false;
  const addSymbol = (symbol: ts.Symbol | undefined): void => {
    if (!symbol) return;
    const canonical = canonicalSymbol(symbol, checker);
    if (['EntityWithoutRuntime', 'Readonly'].includes(canonical.getName())) transparentWrapper = true;
    const schema = bySymbol.get(canonical);
    if (schema) result.schemas.add(schema);
    if (seenAliases.has(canonical)) return;
    seenAliases.add(canonical);
    if (['Omit', 'Partial', 'Pick', 'Record'].includes(canonical.getName())) {
      result.blockedMappedType = true;
    }
    for (const declaration of canonical.declarations ?? []) {
      if (!ts.isTypeAliasDeclaration(declaration)) continue;
      collectSchemasFromTypeNode(declaration.type, checker, bySymbol, result, seenAliases);
    }
  };
  addSymbol(type.aliasSymbol);
  addSymbol(type.getSymbol());
  if (transparentWrapper) {
    const arguments_ =
      type.aliasTypeArguments ??
      ((type.flags & ts.TypeFlags.Object) !== 0 && (type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference
        ? checker.getTypeArguments(type as ts.TypeReference)
        : []);
    for (const argument of arguments_) {
      mergeReferences(result, referencedSchemas(argument, checker, bySymbol, seenTypes, seenAliases));
    }
  }
  if (type.isIntersection()) {
    for (const member of type.types) {
      mergeReferences(result, referencedSchemas(member, checker, bySymbol, seenTypes, seenAliases));
    }
  }
  const constraint = checker.getBaseConstraintOfType(type);
  if (constraint && constraint !== type) {
    mergeReferences(result, referencedSchemas(constraint, checker, bySymbol, seenTypes, seenAliases));
  }
  return result;
}

function collectSchemasFromTypeNode(
  node: ts.TypeNode,
  checker: ts.TypeChecker,
  bySymbol: ReadonlyMap<ts.Symbol, InternalSchema>,
  result: ReferencedSchemas,
  seenAliases: Set<ts.Symbol>,
): void {
  if (ts.isParenthesizedTypeNode(node) || ts.isTypeOperatorNode(node)) {
    collectSchemasFromTypeNode(node.type, checker, bySymbol, result, seenAliases);
    return;
  }
  if (ts.isUnionTypeNode(node) || ts.isIntersectionTypeNode(node)) {
    for (const member of node.types) {
      collectSchemasFromTypeNode(member, checker, bySymbol, result, seenAliases);
    }
    return;
  }
  if (!ts.isTypeReferenceNode(node)) return;

  const symbol = checker.getSymbolAtLocation(node.typeName);
  if (!symbol) return;
  const canonical = canonicalSymbol(symbol, checker);
  const schema = bySymbol.get(canonical);
  if (schema) result.schemas.add(schema);
  if (['Omit', 'Partial', 'Pick', 'Record'].includes(canonical.getName())) {
    result.blockedMappedType = true;
    return;
  }
  if (['EntityWithoutRuntime', 'Readonly'].includes(canonical.getName())) {
    for (const argument of node.typeArguments ?? []) {
      collectSchemasFromTypeNode(argument, checker, bySymbol, result, seenAliases);
    }
    return;
  }
  if (seenAliases.has(canonical)) return;
  seenAliases.add(canonical);
  for (const declaration of canonical.declarations ?? []) {
    if (ts.isTypeAliasDeclaration(declaration)) {
      collectSchemasFromTypeNode(declaration.type, checker, bySymbol, result, seenAliases);
    }
  }
}

function mergeReferences(target: ReferencedSchemas, source: ReferencedSchemas): void {
  target.blockedMappedType ||= source.blockedMappedType;
  for (const schema of source.schemas) target.schemas.add(schema);
}

function canonicalSymbol(symbol: ts.Symbol, checker: ts.TypeChecker): ts.Symbol {
  return (symbol.flags & ts.SymbolFlags.Alias) !== 0 ? checker.getAliasedSymbol(symbol) : symbol;
}

function addResolutionEscape(
  resolution: TypedStructResolution,
  node: ts.Node,
  workspaceDirectory: string,
  reason: TypedStructEscape['reason'],
): void {
  for (const audit of resolution.schemas) addEscape(audit, node, workspaceDirectory, reason);
}

function addEscape(
  audit: TypedStructSchemaAudit,
  node: ts.Node,
  workspaceDirectory: string,
  reason: TypedStructEscape['reason'],
  member?: string,
): void {
  const sourceFile = node.getSourceFile();
  const position = sourceFile.getLineAndCharacterOfPosition(node.getStart(sourceFile));
  audit.escapes.push({
    column: position.character + 1,
    ...(member ? { member } : {}),
    reason,
    source: path.relative(workspaceDirectory, sourceFile.fileName).split(path.sep).join('/'),
    line: position.line + 1,
  });
}

function propertyAccessMode(node: ts.PropertyAccessExpression): keyof TypedStructSchemaAudit['accesses'] {
  if (isCalledProperty(node)) return 'calls';
  const parent = node.parent;
  if (
    (ts.isBinaryExpression(parent) &&
      parent.left === node &&
      parent.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
      parent.operatorToken.kind <= ts.SyntaxKind.LastAssignment) ||
    ((ts.isPrefixUnaryExpression(parent) || ts.isPostfixUnaryExpression(parent)) &&
      (parent.operator === ts.SyntaxKind.PlusPlusToken || parent.operator === ts.SyntaxKind.MinusMinusToken))
  ) {
    return 'writes';
  }
  return 'reads';
}

function isCalledProperty(node: ts.PropertyAccessExpression): boolean {
  return ts.isCallExpression(node.parent) && node.parent.expression === node;
}

function isPresenceSensitiveMember(node: ts.PropertyAccessExpression): boolean {
  return node.name.text === 'hasOwnProperty' && isCalledProperty(node);
}

function presenceSensitiveCallArgument(node: ts.CallExpression): ts.Expression | undefined {
  if (
    ts.isPropertyAccessExpression(node.expression) &&
    ts.isIdentifier(node.expression.expression) &&
    node.expression.expression.text === 'Object' &&
    ['hasOwn', 'getOwnPropertyDescriptor'].includes(node.expression.name.text)
  ) {
    return node.arguments[0];
  }
  if (
    ts.isPropertyAccessExpression(node.expression) &&
    node.expression.name.text === 'call' &&
    ts.isPropertyAccessExpression(node.expression.expression) &&
    node.expression.expression.name.text === 'hasOwnProperty'
  ) {
    return node.arguments[0];
  }
  return undefined;
}

function dynamicEnumerationCallArgument(node: ts.CallExpression): ts.Expression | undefined {
  if (
    ts.isPropertyAccessExpression(node.expression) &&
    ts.isIdentifier(node.expression.expression) &&
    node.expression.expression.text === 'Object' &&
    ['entries', 'keys', 'values'].includes(node.expression.name.text)
  ) {
    return node.arguments[0];
  }
  return undefined;
}

function isReceiverSensitiveMember(node: ts.Declaration): boolean {
  if (ts.isMethodSignature(node) || ts.isMethodDeclaration(node)) return true;
  if (!ts.isPropertySignature(node) || !node.type || !ts.isFunctionTypeNode(node.type)) return false;
  return node.type.parameters.some((parameter) => ts.isIdentifier(parameter.name) && parameter.name.text === 'this');
}

function hasReadonlyModifier(node: ts.Declaration): boolean {
  return (
    ts.canHaveModifiers(node) &&
    ts.getModifiers(node)?.some((modifier) => modifier.kind === ts.SyntaxKind.ReadonlyKeyword) === true
  );
}

function typeIncludesUndefined(type: ts.Type): boolean {
  return type.isUnion()
    ? type.types.some((member) => typeIncludesUndefined(member))
    : (type.flags & ts.TypeFlags.Undefined) !== 0;
}

function isNullish(type: ts.Type): boolean {
  return (type.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) !== 0;
}

function isProductionUpstreamSource(source: ts.SourceFile): boolean {
  const normalized = source.fileName.split(path.sep).join('/');
  return (
    normalized.includes('/upstream/packages/') &&
    normalized.includes('/src/') &&
    !/\.(?:test|spec)\.tsx?$/u.test(normalized) &&
    !normalized.endsWith('.d.ts')
  );
}

function declarationLocation(node: ts.Node, workspaceDirectory: string): string {
  const source = node.getSourceFile();
  const position = source.getLineAndCharacterOfPosition(node.getStart(source));
  return `${path.relative(workspaceDirectory, source.fileName).split(path.sep).join('/')}:${String(position.line + 1)}`;
}

function fingerprint(node: ts.Node, source: ts.SourceFile): string {
  const normalized = fingerprintPrinter.printNode(ts.EmitHint.Unspecified, node, source).replace(/\s+/gu, ' ').trim();
  return `sha256:${createHash('sha256').update(normalized).digest('hex')}`;
}

function addReason(audit: TypedStructSchemaAudit, reason: TypedStructSchemaAudit['reasons'][number]): void {
  if (!audit.reasons.includes(reason)) audit.reasons.push(reason);
  audit.reasons.sort();
}

function uniqueSchemas(schemas: TypedStructSchemaAudit[]): TypedStructSchemaAudit[] {
  return [...new Map(schemas.map((schema) => [schema.id, schema])).values()].sort((left, right) =>
    left.id.localeCompare(right.id),
  );
}

function compareEscapes(left: TypedStructEscape, right: TypedStructEscape): number {
  return (
    left.source.localeCompare(right.source) ||
    left.line - right.line ||
    left.column - right.column ||
    left.reason.localeCompare(right.reason) ||
    (left.member ?? '').localeCompare(right.member ?? '')
  );
}

function sum<T>(items: readonly T[], select: (item: T) => number): number {
  return items.reduce((total, item) => total + select(item), 0);
}
