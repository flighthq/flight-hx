import { createHash } from 'node:crypto';
import { readFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import type { UpstreamInventory } from '../model/inventory.ts';

import { excludedPackageDirectories } from './exclusions.ts';
import { analyzeUpstream, sourcePathToHaxePackage, sourcePathToImplementationModule } from './inventory.ts';
import { upstreamTypeScriptProgram } from './program.ts';

// Target-conditional class emission is default-off. Every enabled schema is an
// explicit canonical identity so an upstream declaration cannot enter silently.
export const cppStructInitTypedStructIds: readonly string[] = [
  '@flighthq/types:interface#Camera2D',
  '@flighthq/types:interface#ParticleEmitterState',
];

const cppStructInitTypedStructIdSet = new Set(cppStructInitTypedStructIds);

interface ReviewedTypedStructDirectAddition {
  declarationFingerprint: string;
  id: string;
  purpose: string;
}

// Checker-discovered rows enter audit-only. Moving one to direct emission is a
// separate, reviewable decision locked to its declaration fingerprint; this
// list must not be folded into the historical migration baseline.
export const reviewedTypedStructDirectAdditions: readonly ReviewedTypedStructDirectAddition[] = [
  {
    declarationFingerprint: 'sha256:6de1c57a64f9d839dba96b69bcdd8cae0ca18580cc13f425ae6cb9ec9f68c4b8',
    id: '@flighthq/types:interface#BitmapRegion',
    purpose: 'reviewed escape-free bitmap region',
  },
];

const reviewedTypedStructDirectAdditionsById = new Map(
  reviewedTypedStructDirectAdditions.map((addition) => [addition.id, addition]),
);

export interface TypedStructCandidate {
  declarationKind?: TypedStructDeclarationKind;
  emission: 'audit-only' | 'direct';
  name: string;
  packageName: string;
  purpose: string;
  source: string;
}

export type TypedStructDeclarationKind = 'interface' | 'type';

export type TypedStructMigrationStatus = 'kind-changed' | 'new' | 'preserved' | 'relocated' | 'renamed';

export interface TypedStructMigrationIdentity {
  baselineId: string | null;
  status: TypedStructMigrationStatus;
}

export interface ResolvedTypedStructCandidate extends TypedStructCandidate {
  configuredDeclarationKind: TypedStructDeclarationKind;
  configuredName: string;
  configuredPackageName: string;
  configuredSource: string;
  declarationKind: TypedStructDeclarationKind;
  definingPackageName: string;
  migration: TypedStructMigrationIdentity;
  sourceResolution: 'exact' | 'relocated';
}

export interface TypedStructMigrationAudit {
  baselineUpstreamCommit: string;
  removed: Array<{
    baselineId: string;
    successorIds: string[];
  }>;
  sourceReportSha256: string;
  summary: {
    baseline: number;
    kindChanged: number;
    newAuditOnly: number;
    preserved: number;
    relocated: number;
    removed: number;
    renamed: number;
  };
}

export interface TypedStructDiscoveryAudit {
  candidates: ResolvedTypedStructCandidate[];
  migration: TypedStructMigrationAudit;
}

export interface TypedStructIdentityIssue {
  actualKinds: TypedStructDeclarationKind[];
  alternatives: Array<{
    declarationKind: TypedStructDeclarationKind;
    publicPackageName: string;
    source: string;
  }>;
  candidate: TypedStructCandidate;
  declarationKind: TypedStructDeclarationKind;
  kind: 'ambiguous' | 'kind-changed' | 'missing';
  sources: string[];
}

export interface TypedStructIdentityResolutionAudit {
  issues: TypedStructIdentityIssue[];
  matched: ResolvedTypedStructCandidate[];
  summary: {
    ambiguous: number;
    exact: number;
    kindChanged: number;
    matched: number;
    missing: number;
    relocated: number;
    requested: number;
  };
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
  schemaHaxeType: string;
  schemaId: string;
  schemaName: string;
}

export interface TypedStructConstructionBinding {
  fieldNames: string[];
  schemaHaxeType: string;
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
    | 'unknown-member'
    | 'width-sensitive';
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
  definingPackageName: string;
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
  migration: TypedStructMigrationIdentity;
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
  sourceProvenance: {
    configuredDeclarationKind: TypedStructDeclarationKind;
    configuredName: string;
    configuredPackageName: string;
    configuredSource: string;
    resolution: 'exact' | 'relocated';
  };
}

export interface TypedStructAudit {
  candidates: TypedStructSchemaAudit[];
  migration: TypedStructMigrationAudit;
  schemaVersion: 5;
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
  excludedPackageDirectories: ReadonlySet<string>;
  report: TypedStructAudit;
  resolve(type: ts.Type): TypedStructResolution;
  resolveDirect(type: ts.Type): TypedStructResolution;
  resolveCppStructInitConstruction(type: ts.Type): TypedStructConstructionBinding | undefined;
  resolveField(type: ts.Type, member: string, property?: ts.Symbol): TypedStructFieldBinding | undefined;
}

export function typedStructStableId(
  packageName: string,
  declarationKind: TypedStructDeclarationKind,
  name: string,
): string {
  return `${packageName}:${declarationKind}#${name}`;
}

interface TypedStructMigrationBaselineCandidate {
  declarationKind: TypedStructDeclarationKind;
  emission: 'audit-only' | 'direct';
  name: string;
  packageName: string;
  purpose: string;
  source: string;
}

interface TypedStructMigrationBaseline {
  baselineUpstreamCommit: string;
  candidates: TypedStructMigrationBaselineCandidate[];
  schemaVersion: 1;
  sourceReportSha256: string;
}

const typedStructMigrationBaselinePath = 'tools/generator/baselines/typed-structs-v3.json';

const approvedTypedStructRenames = new Map<string, string>([
  ['@flighthq/scene-formats:interface#GltfScene', '@flighthq/types:interface#GltfScene3D'],
  ['@flighthq/scene-resources:interface#LoadSceneOptions', '@flighthq/types:interface#LoadScene3DResourcesOptions'],
  [
    '@flighthq/scene-resources:interface#ResolveSceneResourcesOptions',
    '@flighthq/types:interface#UpdateScene3DResourceStreamingOptions',
  ],
  [
    '@flighthq/scene-resources:interface#SceneMaterialTextureRegistry',
    '@flighthq/types:interface#Scene3DMaterialTextureRegistry',
  ],
  ['@flighthq/scene-resources:interface#SceneResourceEvent', '@flighthq/types:interface#Scene3DResourceEvent'],
  ['@flighthq/scene-resources:interface#SceneResourceInFlight', '@flighthq/types:interface#Scene3DResourceInFlight'],
  ['@flighthq/scene-resources:interface#SceneResourceResolver', '@flighthq/types:interface#Scene3DResourceResolver'],
  [
    '@flighthq/scene-resources:interface#SceneResourceResolverOptions',
    '@flighthq/types:interface#Scene3DResourceResolverOptions',
  ],
  [
    '@flighthq/scene-resources:interface#SceneResourceRevealOptions',
    '@flighthq/types:interface#Scene3DResourceRevealOptions',
  ],
  ['@flighthq/scene-resources:interface#SceneResourceSignals', '@flighthq/types:interface#Scene3DResourceSignals'],
  ['@flighthq/shape-formats:interface#ShapeBitmapReference', '@flighthq/types:interface#ShapeTextureReference'],
  ['@flighthq/types:interface#Camera', '@flighthq/types:interface#Camera3D'],
  ['@flighthq/types:interface#ColorTransform', '@flighthq/types:interface#ColorScaleBias'],
  ['@flighthq/types:interface#EmbeddedSceneResourceRef', '@flighthq/types:interface#EmbeddedImageResourceReference'],
  ['@flighthq/types:interface#ExternalSceneResourceRef', '@flighthq/types:interface#ExternalImageResourceReference'],
  ['@flighthq/types:interface#ImageResourceCompressed', '@flighthq/types:interface#CompressedImageData'],
  ['@flighthq/types:interface#ParticleEmitter', '@flighthq/types:interface#ParticleEmitter2D'],
  ['@flighthq/types:interface#ParticleEmitterRuntime', '@flighthq/types:interface#ParticleEmitter2DRuntime'],
  ['@flighthq/types:interface#Scene', '@flighthq/types:interface#Scene3D'],
  ['@flighthq/types:interface#SceneAnimationTarget', '@flighthq/types:interface#Scene3DAnimationTarget'],
  ['@flighthq/types:interface#SceneNodeTraits', '@flighthq/types:interface#Node3DTraits'],
  ['@flighthq/types:interface#Surface', '@flighthq/types:interface#Bitmap'],
  ['@flighthq/types:type#SceneRuntime', '@flighthq/types:type#Scene3DRuntime'],
]);

const approvedTypedStructKindChanges = new Map<string, string>([
  ['@flighthq/types:interface#CubeTexture', '@flighthq/types:type#CubeTexture'],
  ['@flighthq/types:interface#Texture', '@flighthq/types:type#Texture'],
]);

const approvedTypedStructReplacementRemovals = new Map<string, string[]>([
  [
    '@flighthq/types:interface#ImageResource',
    [
      '@flighthq/types:interface#Bitmap',
      '@flighthq/types:interface#CompressedImage',
      '@flighthq/types:interface#Image',
    ],
  ],
  [
    '@flighthq/types:interface#Tileset',
    ['@flighthq/types:interface#TiledTileset', '@flighthq/types:interface#TilemapData'],
  ],
  [
    '@flighthq/types:interface#VideoTexture',
    ['@flighthq/types:interface#Image', '@flighthq/types:interface#VideoResource', '@flighthq/types:type#Texture'],
  ],
]);

export function discoverTypedStructUniverse(
  workspaceDirectory: string,
  program: ts.Program,
  inventory: UpstreamInventory = analyzeUpstream(workspaceDirectory),
): TypedStructDiscoveryAudit {
  const declarations = typedStructDeclarationIdentities(workspaceDirectory, program, inventory).filter(
    (declaration) =>
      declaration.publicPackageName === declaration.definingPackageName &&
      !isExcludedTypedStructPackage(declaration.publicPackageName, inventory),
  );
  const candidatesById = new Map<string, ResolvedTypedStructCandidate>();
  for (const declaration of declarations) {
    const id = typedStructStableId(declaration.publicPackageName, declaration.declarationKind, declaration.name);
    const existing = candidatesById.get(id);
    if (existing && existing.source !== declaration.source) {
      throw new Error(
        `Ambiguous checker-derived typed-struct identity ${id}: ${existing.source}, ${declaration.source}`,
      );
    }
    candidatesById.set(id, {
      configuredDeclarationKind: declaration.declarationKind,
      configuredName: declaration.name,
      configuredPackageName: declaration.publicPackageName,
      configuredSource: declaration.source,
      declarationKind: declaration.declarationKind,
      definingPackageName: declaration.definingPackageName,
      emission: 'audit-only',
      migration: { baselineId: null, status: 'new' },
      name: declaration.name,
      packageName: declaration.publicPackageName,
      purpose: 'checker-discovered public declaration',
      source: declaration.source,
      sourceResolution: 'exact',
    });
  }

  const baseline = readTypedStructMigrationBaseline(workspaceDirectory);
  const claimedCurrentIds = new Map<string, string>();
  const consumedExceptionalBaselineIds = new Set<string>();
  for (const entry of baseline.candidates) {
    const baselineId = typedStructStableId(entry.packageName, entry.declarationKind, entry.name);
    const removalSuccessors = approvedTypedStructReplacementRemovals.get(baselineId);
    if (removalSuccessors) {
      consumedExceptionalBaselineIds.add(baselineId);
      continue;
    }
    const renamedId = approvedTypedStructRenames.get(baselineId);
    const kindChangedId = approvedTypedStructKindChanges.get(baselineId);
    const approvedId = renamedId ?? kindChangedId;
    if (approvedId) consumedExceptionalBaselineIds.add(baselineId);
    const current = approvedId
      ? candidatesById.get(approvedId)
      : resolveMigratedTypedStructCandidate(entry, candidatesById);
    if (!current) {
      throw new Error(
        `Approved typed-struct migration target is missing: ${baselineId} -> ${approvedId ?? '(same-name public owner)'}`,
      );
    }
    const currentId = typedStructStableId(current.packageName, current.declarationKind, current.name);
    const previouslyClaimed = claimedCurrentIds.get(currentId);
    if (previouslyClaimed) {
      throw new Error(
        `Typed-struct migration target ${currentId} is claimed by both ${previouslyClaimed} and ${baselineId}`,
      );
    }
    claimedCurrentIds.set(currentId, baselineId);
    const status: TypedStructMigrationStatus = kindChangedId
      ? 'kind-changed'
      : renamedId
        ? 'renamed'
        : current.packageName === entry.packageName && current.source === entry.source
          ? 'preserved'
          : 'relocated';
    candidatesById.set(currentId, {
      ...current,
      configuredDeclarationKind: entry.declarationKind,
      configuredName: entry.name,
      configuredPackageName: entry.packageName,
      configuredSource: entry.source,
      emission: entry.emission,
      migration: { baselineId, status },
      purpose: entry.purpose,
      sourceResolution: status === 'preserved' ? 'exact' : 'relocated',
    });
  }

  for (const addition of reviewedTypedStructDirectAdditions) {
    const current = candidatesById.get(addition.id);
    if (!current) throw new Error(`Reviewed typed-struct direct addition is missing: ${addition.id}`);
    if (current.migration.status !== 'new' || current.migration.baselineId !== null) {
      throw new Error(`Reviewed typed-struct direct addition is no longer checker-new: ${addition.id}`);
    }
    candidatesById.set(addition.id, {
      ...current,
      emission: 'direct',
      purpose: addition.purpose,
    });
  }

  validateTypedStructMigrationApprovals(baseline, consumedExceptionalBaselineIds, candidatesById);
  const candidates = [...candidatesById.values()].sort(compareResolvedTypedStructCandidates);
  const removed = [...approvedTypedStructReplacementRemovals]
    .map(([baselineId, successorIds]) => {
      for (const successorId of successorIds) {
        if (!candidatesById.has(successorId)) {
          throw new Error(`Approved typed-struct replacement successor is missing: ${baselineId} -> ${successorId}`);
        }
      }
      return { baselineId, successorIds: successorIds.slice().sort() };
    })
    .sort((left, right) => left.baselineId.localeCompare(right.baselineId));
  const countStatus = (status: TypedStructMigrationStatus): number =>
    candidates.filter((candidate) => candidate.migration.status === status).length;
  const newCandidates = candidates.filter((candidate) => candidate.migration.status === 'new');
  const unreviewedDirectCandidates = newCandidates.filter(
    (candidate) =>
      candidate.emission === 'direct' &&
      !reviewedTypedStructDirectAdditionsById.has(
        typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
      ),
  );
  if (unreviewedDirectCandidates.length > 0) {
    throw new Error(
      `Checker-discovered typed-struct rows require direct-emission review: ${unreviewedDirectCandidates
        .map((candidate) => typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name))
        .sort()
        .join(', ')}`,
    );
  }

  return {
    candidates,
    migration: {
      baselineUpstreamCommit: baseline.baselineUpstreamCommit,
      removed,
      sourceReportSha256: baseline.sourceReportSha256,
      summary: {
        baseline: baseline.candidates.length,
        kindChanged: countStatus('kind-changed'),
        newAuditOnly: newCandidates.filter((candidate) => candidate.emission === 'audit-only').length,
        preserved: countStatus('preserved'),
        relocated: countStatus('relocated'),
        removed: removed.length,
        renamed: countStatus('renamed'),
      },
    },
  };
}

function resolveMigratedTypedStructCandidate(
  baseline: TypedStructMigrationBaselineCandidate,
  candidatesById: ReadonlyMap<string, ResolvedTypedStructCandidate>,
): ResolvedTypedStructCandidate | undefined {
  const stableId = typedStructStableId(baseline.packageName, baseline.declarationKind, baseline.name);
  const exact = candidatesById.get(stableId);
  if (exact) return exact;
  const alternatives = [...candidatesById.values()].filter(
    (candidate) => candidate.name === baseline.name && candidate.declarationKind === baseline.declarationKind,
  );
  if (alternatives.length === 1) return alternatives[0];
  if (alternatives.length === 0) return undefined;
  throw new Error(
    `Ambiguous typed-struct migration for ${stableId}: ${alternatives
      .map((candidate) => typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name))
      .sort()
      .join(', ')}`,
  );
}

function readTypedStructMigrationBaseline(workspaceDirectory: string): TypedStructMigrationBaseline {
  const file = path.join(workspaceDirectory, typedStructMigrationBaselinePath);
  const baseline = JSON.parse(readFileSync(file, 'utf8')) as Partial<TypedStructMigrationBaseline>;
  if (
    baseline.schemaVersion !== 1 ||
    typeof baseline.baselineUpstreamCommit !== 'string' ||
    typeof baseline.sourceReportSha256 !== 'string' ||
    !Array.isArray(baseline.candidates)
  ) {
    throw new Error(`Invalid typed-struct migration baseline: ${typedStructMigrationBaselinePath}`);
  }
  const candidates = baseline.candidates as TypedStructMigrationBaselineCandidate[];
  const ids = candidates.map((candidate) =>
    typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
  );
  if (new Set(ids).size !== candidates.length) {
    throw new Error('Typed-struct migration baseline contains duplicate stable identities');
  }
  return { ...baseline, candidates } as TypedStructMigrationBaseline;
}

function validateTypedStructMigrationApprovals(
  baseline: TypedStructMigrationBaseline,
  consumedExceptionalBaselineIds: ReadonlySet<string>,
  candidatesById: ReadonlyMap<string, ResolvedTypedStructCandidate>,
): void {
  const baselineIds = new Set(
    baseline.candidates.map((candidate) =>
      typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
    ),
  );
  const exceptionalIds = [
    ...approvedTypedStructRenames.keys(),
    ...approvedTypedStructKindChanges.keys(),
    ...approvedTypedStructReplacementRemovals.keys(),
  ];
  const staleApprovals = exceptionalIds.filter((id) => !baselineIds.has(id) || !consumedExceptionalBaselineIds.has(id));
  if (staleApprovals.length > 0) {
    throw new Error(`Stale typed-struct migration approvals: ${staleApprovals.sort().join(', ')}`);
  }
  const missingTargets = [...approvedTypedStructRenames.values(), ...approvedTypedStructKindChanges.values()].filter(
    (id) => !candidatesById.has(id),
  );
  if (missingTargets.length > 0) {
    throw new Error(`Missing typed-struct migration targets: ${missingTargets.sort().join(', ')}`);
  }
}

function compareResolvedTypedStructCandidates(
  left: ResolvedTypedStructCandidate,
  right: ResolvedTypedStructCandidate,
): number {
  return (
    left.packageName.localeCompare(right.packageName) ||
    left.name.localeCompare(right.name) ||
    left.declarationKind.localeCompare(right.declarationKind) ||
    left.source.localeCompare(right.source)
  );
}

function isExcludedTypedStructPackage(packageName: string, inventory: UpstreamInventory): boolean {
  return inventory.packages.some((item) => item.name === packageName && item.exclusion !== null);
}

function migrationAuditForCustomCandidates(
  candidates: readonly { migration: TypedStructMigrationIdentity }[],
  upstreamCommit: string,
): TypedStructMigrationAudit {
  const countStatus = (status: TypedStructMigrationStatus): number =>
    candidates.filter((candidate) => candidate.migration.status === status).length;
  return {
    baselineUpstreamCommit: upstreamCommit,
    removed: [],
    sourceReportSha256: 'custom-candidates',
    summary: {
      baseline: candidates.filter((candidate) => candidate.migration.baselineId !== null).length,
      kindChanged: countStatus('kind-changed'),
      newAuditOnly: countStatus('new'),
      preserved: countStatus('preserved'),
      relocated: countStatus('relocated'),
      removed: 0,
      renamed: countStatus('renamed'),
    },
  };
}

export function resolveTypedStructCandidateIdentities(
  workspaceDirectory: string,
  program: ts.Program,
  candidates: readonly TypedStructCandidate[],
  inventory?: UpstreamInventory,
): TypedStructIdentityResolutionAudit {
  const declarations = typedStructDeclarationIdentities(workspaceDirectory, program, inventory);
  const matched: ResolvedTypedStructCandidate[] = [];
  const issues: TypedStructIdentityIssue[] = [];

  for (const candidate of candidates) {
    const namedDeclarations = declarations.filter((declaration) => declaration.name === candidate.name);
    const declarationKind = configuredTypedStructDeclarationKind(candidate);
    const availableKinds = new Set(namedDeclarations.map((declaration) => declaration.declarationKind));
    const compatibleDeclarations = namedDeclarations.filter(
      (declaration) => declaration.declarationKind === declarationKind,
    );
    const packageDeclarations = compatibleDeclarations.filter(
      (declaration) => declaration.publicPackageName === candidate.packageName,
    );
    const exactPackageDeclarations = packageDeclarations.filter(
      (declaration) => declaration.source === candidate.source,
    );
    const exactSourceDeclarations = compatibleDeclarations.filter(
      (declaration) => declaration.source === candidate.source,
    );
    const owningPackageDeclarations = compatibleDeclarations.filter(
      (declaration) => declaration.publicPackageName === declaration.definingPackageName,
    );
    const resolved =
      packageDeclarations.length === 1
        ? packageDeclarations[0]
        : exactPackageDeclarations.length === 1
          ? exactPackageDeclarations[0]
          : owningPackageDeclarations.length === 1
            ? owningPackageDeclarations[0]
            : exactSourceDeclarations.length === 1
              ? exactSourceDeclarations[0]
              : compatibleDeclarations.length === 1
                ? compatibleDeclarations[0]
                : undefined;
    if (!resolved) {
      issues.push({
        actualKinds: [...availableKinds].sort(),
        alternatives: typedStructIdentityAlternatives(
          compatibleDeclarations.length === 0 ? namedDeclarations : compatibleDeclarations,
        ),
        candidate,
        declarationKind,
        kind:
          compatibleDeclarations.length === 0
            ? namedDeclarations.length === 0
              ? 'missing'
              : 'kind-changed'
            : 'ambiguous',
        sources: [
          ...new Set(
            (compatibleDeclarations.length === 0 ? namedDeclarations : compatibleDeclarations).map(
              (declaration) => declaration.source,
            ),
          ),
        ].sort(),
      });
      continue;
    }
    matched.push({
      ...candidate,
      configuredDeclarationKind: declarationKind,
      configuredName: candidate.name,
      configuredPackageName: candidate.packageName,
      configuredSource: candidate.source,
      declarationKind,
      definingPackageName: resolved.definingPackageName,
      packageName: resolved.publicPackageName,
      source: resolved.source,
      migration: {
        baselineId: typedStructStableId(candidate.packageName, declarationKind, candidate.name),
        status:
          resolved.publicPackageName === candidate.packageName && resolved.source === candidate.source
            ? 'preserved'
            : 'relocated',
      },
      sourceResolution:
        resolved.publicPackageName === candidate.packageName && resolved.source === candidate.source
          ? 'exact'
          : 'relocated',
    });
  }

  issues.sort(
    (left, right) =>
      left.candidate.packageName.localeCompare(right.candidate.packageName) ||
      left.candidate.name.localeCompare(right.candidate.name) ||
      left.declarationKind.localeCompare(right.declarationKind) ||
      left.candidate.source.localeCompare(right.candidate.source),
  );
  return {
    issues,
    matched,
    summary: {
      ambiguous: issues.filter((issue) => issue.kind === 'ambiguous').length,
      exact: matched.filter((candidate) => candidate.sourceResolution === 'exact').length,
      kindChanged: issues.filter((issue) => issue.kind === 'kind-changed').length,
      matched: matched.length,
      missing: issues.filter((issue) => issue.kind === 'missing').length,
      relocated: matched.filter((candidate) => candidate.sourceResolution === 'relocated').length,
      requested: candidates.length,
    },
  };
}

interface TypedStructDeclarationIdentity {
  declarationKind: TypedStructDeclarationKind;
  definingPackageName: string;
  name: string;
  publicPackageName: string;
  source: string;
}

const typedStructDeclarationIdentityCache = new WeakMap<ts.Program, TypedStructDeclarationIdentity[]>();

function typedStructDeclarationIdentities(
  workspaceDirectory: string,
  program: ts.Program,
  inventory?: UpstreamInventory,
): TypedStructDeclarationIdentity[] {
  const cached = typedStructDeclarationIdentityCache.get(program);
  if (cached) return cached;
  const declarationsByIdentity = new Map<string, TypedStructDeclarationIdentity>();
  for (const packageInventory of (inventory ?? analyzeUpstream(workspaceDirectory)).packages) {
    for (const lane of packageInventory.exportLanes) {
      for (const record of lane.exports) {
        if (record.kind !== 'interface' && record.kind !== 'type') continue;
        const identity = `${packageInventory.name}:${record.kind}#${record.name}:${record.source}`;
        declarationsByIdentity.set(identity, {
          declarationKind: record.kind,
          definingPackageName: packageNameFromSource(record.source),
          name: record.name,
          publicPackageName: packageInventory.name,
          source: record.source,
        });
      }
    }
  }
  const declarations = [...declarationsByIdentity.values()].sort(
    (left, right) =>
      left.name.localeCompare(right.name) ||
      left.declarationKind.localeCompare(right.declarationKind) ||
      left.publicPackageName.localeCompare(right.publicPackageName) ||
      left.definingPackageName.localeCompare(right.definingPackageName) ||
      left.source.localeCompare(right.source),
  );
  typedStructDeclarationIdentityCache.set(program, declarations);
  return declarations;
}

function configuredTypedStructDeclarationKind(candidate: TypedStructCandidate): TypedStructDeclarationKind {
  return candidate.declarationKind ?? 'interface';
}

function typedStructIdentityAlternatives(
  declarations: readonly TypedStructDeclarationIdentity[],
): TypedStructIdentityIssue['alternatives'] {
  const alternatives = new Map<string, TypedStructIdentityIssue['alternatives'][number]>();
  for (const declaration of declarations) {
    const alternative = {
      declarationKind: declaration.declarationKind,
      publicPackageName: declaration.publicPackageName,
      source: declaration.source,
    };
    alternatives.set(
      `${alternative.publicPackageName}:${alternative.declarationKind}:${alternative.source}`,
      alternative,
    );
  }
  return [...alternatives.values()].sort(
    (left, right) =>
      left.publicPackageName.localeCompare(right.publicPackageName) ||
      left.declarationKind.localeCompare(right.declarationKind) ||
      left.source.localeCompare(right.source),
  );
}

function packageNameFromSource(source: string): string {
  const directoryName = /^upstream\/packages\/([^/]+)\//u.exec(source)?.[1];
  if (!directoryName) throw new Error(`Cannot derive defining package from typed-struct source: ${source}`);
  return `@flighthq/${directoryName}`;
}

function formatTypedStructIdentityIssues(issues: readonly TypedStructIdentityIssue[]): string {
  return `Typed-struct stable declaration identities need review:\n${issues
    .map((issue) => {
      const identity = `${issue.candidate.packageName}:${issue.declarationKind}#${issue.candidate.name}`;
      const available =
        issue.alternatives.length === 0
          ? 'no public export with that name'
          : `available ${issue.alternatives
              .map(
                (alternative) =>
                  `${alternative.publicPackageName}:${alternative.declarationKind}#${issue.candidate.name} at ${alternative.source}`,
              )
              .join(', ')}`;
      return `- ${identity} (configured ${issue.candidate.source}): ${issue.kind}; ${available}`;
    })
    .join('\n')}`;
}

interface InternalSchema {
  audit: TypedStructSchemaAudit;
  fields: ReadonlyMap<
    string,
    {
      audit: TypedStructField;
      declarations: ReadonlySet<ts.Declaration>;
    }
  >;
  symbol: ts.Symbol;
}

interface AnalyzableTypedStructCandidate extends TypedStructCandidate {
  configuredDeclarationKind: TypedStructDeclarationKind;
  configuredName: string;
  configuredPackageName: string;
  configuredSource: string;
  definingPackageName: string;
  migration: TypedStructMigrationIdentity;
  sourceResolution: 'exact' | 'relocated';
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
  candidates?: readonly TypedStructCandidate[],
  programAndChecker = upstreamTypeScriptProgram(workspaceDirectory),
  inventory?: UpstreamInventory,
): TypedStructRegistry {
  const activeInventory = inventory ?? analyzeUpstream(workspaceDirectory);
  const discovery = candidates
    ? undefined
    : discoverTypedStructUniverse(workspaceDirectory, programAndChecker.program, activeInventory);
  const identities = candidates
    ? resolveTypedStructCandidateIdentities(workspaceDirectory, programAndChecker.program, candidates, activeInventory)
    : undefined;
  if (identities && identities.issues.length > 0) {
    throw new Error(formatTypedStructIdentityIssues(identities.issues));
  }
  const resolvedCandidates = discovery?.candidates ?? identities?.matched ?? [];
  const migration = discovery?.migration ?? migrationAuditForCustomCandidates(resolvedCandidates, upstreamCommit);
  const excludedDirectories = excludedPackageDirectories(activeInventory);
  const cacheKey = `${upstreamCommit}|excluded=${[...excludedDirectories].sort().join(',')}|${resolvedCandidates
    .map(
      (candidate) =>
        `${typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name)}:${candidate.source}:${candidate.emission}:${candidate.migration.status}`,
    )
    .join('|')}`;
  const cached = registryCache.get(programAndChecker.program)?.get(cacheKey);
  if (cached) return cached;

  const registry = createTypedStructRegistry(
    workspaceDirectory,
    upstreamCommit,
    candidates ?? resolvedCandidates,
    programAndChecker.program,
    programAndChecker.checker,
    resolvedCandidates,
    migration,
    excludedDirectories,
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
  resolvedCandidates?: readonly ResolvedTypedStructCandidate[],
  migration?: TypedStructMigrationAudit,
  excludedDirectories: ReadonlySet<string> = new Set(),
): TypedStructRegistry {
  const analyzableCandidates: readonly AnalyzableTypedStructCandidate[] =
    resolvedCandidates ??
    candidates.map((candidate) => ({
      ...candidate,
      configuredDeclarationKind: configuredTypedStructDeclarationKind(candidate),
      configuredName: candidate.name,
      configuredPackageName: candidate.packageName,
      configuredSource: candidate.source,
      definingPackageName: packageNameFromSource(candidate.source),
      migration: {
        baselineId: typedStructStableId(
          candidate.packageName,
          configuredTypedStructDeclarationKind(candidate),
          candidate.name,
        ),
        status: 'preserved' as const,
      },
      sourceResolution: 'exact',
    }));
  const schemas = analyzableCandidates.map((candidate) =>
    analyzeCandidate(candidate, workspaceDirectory, program, checker),
  );
  const createResolver = (resolverSchemas: readonly InternalSchema[]) => {
    const bySymbol = new Map(resolverSchemas.map((schema) => [canonicalSymbol(schema.symbol, checker), schema]));
    return (type: ts.Type): TypedStructResolution =>
      resolveType(type, checker, bySymbol, new Set<ts.Type>(), new Set<ts.Symbol>());
  };
  const directSchemas = schemas.filter((schema) => schema.audit.emission.mode === 'direct');
  const auditOnlySchemas = schemas.filter((schema) => schema.audit.emission.mode === 'audit-only');
  const resolve = createResolver(schemas);
  const resolveDirect = createResolver(directSchemas);
  const resolveOwnedField = (
    resolverSchemas: readonly InternalSchema[],
    resolver: (type: ts.Type) => TypedStructResolution,
    type: ts.Type,
    member: string,
    property = checker.getPropertyOfType(type, member),
  ):
    | {
        field: TypedStructField;
        schema: InternalSchema;
      }
    | undefined => {
    const resolution = resolver(type);
    if (resolution.kind !== 'matched') return undefined;
    const schema = resolverSchemas.find((candidate) => candidate.audit.id === resolution.schemas[0]?.id);
    const field = schema?.fields.get(member);
    if (!schema || !field || !property || !isCandidateFieldDeclaration(property, field.declarations)) {
      return undefined;
    }
    return { field: field.audit, schema };
  };

  for (const resolverSchemas of [directSchemas, auditOnlySchemas]) {
    const resolver = createResolver(resolverSchemas);
    auditUses(
      workspaceDirectory,
      program,
      checker,
      resolverSchemas,
      resolver,
      (type, member, property) => resolveOwnedField(resolverSchemas, resolver, type, member, property),
      excludedDirectories,
    );
  }
  for (const schema of schemas) {
    if (schema.audit.escapes.some((escape) => escape.reason === 'instanceof')) {
      addReason(schema.audit, 'instanceof-use');
    }
    schema.audit.eligible = schema.audit.reasons.length === 0;
    const accesses = sum(Object.values(schema.audit.accesses), (count) => count);
    schema.audit.emission.directAccesses =
      schema.audit.eligible && schema.audit.emission.mode === 'direct' ? accesses : 0;
    schema.audit.emission.pendingAccesses =
      schema.audit.eligible && schema.audit.emission.mode === 'audit-only' ? accesses : 0;
    schema.audit.emission.reflectiveSurvivors =
      schema.audit.eligible && schema.audit.emission.mode === 'direct' ? reflectiveSurvivors(schema.audit.escapes) : [];
    schema.audit.escapes.sort(compareEscapes);
    schema.audit.memberEscapes.sort(
      (left, right) =>
        left.member.localeCompare(right.member) ||
        left.reason.localeCompare(right.reason) ||
        left.source.localeCompare(right.source),
    );
  }

  validateReviewedTypedStructDirectAdditions(schemas);

  const report: TypedStructAudit = {
    candidates: schemas.map((schema) => schema.audit),
    migration: migration ?? migrationAuditForCustomCandidates(analyzableCandidates, upstreamCommit),
    schemaVersion: 5,
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
    excludedPackageDirectories: excludedDirectories,
    report,
    resolve,
    resolveDirect,
    resolveCppStructInitConstruction(type) {
      const resolution = resolveDirect(type);
      const schema = resolution.kind === 'matched' ? resolution.schemas[0] : undefined;
      if (
        resolution.schemas.length !== 1 ||
        !schema ||
        !schema.eligible ||
        schema.emission.mode !== 'direct' ||
        !cppStructInitTypedStructIdSet.has(schema.id)
      ) {
        return undefined;
      }
      return {
        fieldNames: schema.fields.map((field) => field.name),
        schemaHaxeType: typedStructHaxeType(schema),
        schemaId: schema.id,
        schemaName: schema.name,
      };
    },
    resolveField(type, member, property) {
      const owned = resolveOwnedField(directSchemas, resolveDirect, type, member, property);
      if (
        !owned ||
        !owned.schema.audit.eligible ||
        owned.schema.audit.emission.mode !== 'direct' ||
        owned.field.receiverSensitive
      ) {
        return undefined;
      }
      return {
        field: owned.field,
        schemaHaxeType: typedStructHaxeType(owned.schema.audit),
        schemaId: owned.schema.audit.id,
        schemaName: owned.schema.audit.name,
      };
    },
  };
}

function validateReviewedTypedStructDirectAdditions(schemas: readonly InternalSchema[]): void {
  const schemasById = new Map(schemas.map((schema) => [schema.audit.id, schema.audit]));
  for (const addition of reviewedTypedStructDirectAdditions) {
    const schema = schemasById.get(addition.id);
    if (!schema) continue;
    if (schema.declarationFingerprint !== addition.declarationFingerprint) {
      throw new Error(
        `Reviewed typed-struct direct addition fingerprint drift for ${addition.id}: expected ${addition.declarationFingerprint}, received ${schema.declarationFingerprint}`,
      );
    }
    if (!schema.eligible || schema.emission.mode !== 'direct' || schema.escapes.length > 0) {
      throw new Error(`Reviewed typed-struct direct addition is no longer eligible and escape-free: ${addition.id}`);
    }
  }
}

function typedStructHaxeType(schema: TypedStructSchemaAudit): string {
  const moduleName = sourcePathToImplementationModule(schema.source);
  const modulePath = `${sourcePathToHaxePackage(schema.definingPackageName, schema.source)}.${moduleName}`;
  return moduleName === schema.name ? modulePath : `${modulePath}.${schema.name}`;
}

function analyzeCandidate(
  candidate: AnalyzableTypedStructCandidate,
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
  const declarationKind = ts.isInterfaceDeclaration(declaration) ? 'interface' : 'type';
  if (candidate.declarationKind && candidate.declarationKind !== declarationKind) {
    throw new Error(
      `Typed-struct declaration kind drift for ${candidate.packageName}#${candidate.name}: expected ${candidate.declarationKind}, received ${declarationKind}`,
    );
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
  const internalFields = new Map<
    string,
    {
      audit: TypedStructField;
      declarations: ReadonlySet<ts.Declaration>;
    }
  >();
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
    internalFields.set(field.name, {
      audit: field,
      declarations: new Set(propertyDeclarations),
    });
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
    declarationKind,
    definingPackageName: candidate.definingPackageName,
    eligible: false,
    emission: {
      directAccesses: 0,
      mode: candidate.emission,
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    },
    escapes: [],
    fields,
    id: typedStructStableId(candidate.packageName, declarationKind, candidate.name),
    memberEscapes,
    migration: candidate.migration,
    name: candidate.name,
    packageName: candidate.packageName,
    purpose: candidate.purpose,
    reasons,
    source: candidate.source,
    sourceProvenance: {
      configuredDeclarationKind: candidate.configuredDeclarationKind,
      configuredName: candidate.configuredName,
      configuredPackageName: candidate.configuredPackageName,
      configuredSource: candidate.configuredSource,
      resolution: candidate.sourceResolution,
    },
  };
  return { audit, fields: internalFields, symbol };
}

function auditUses(
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
  schemas: InternalSchema[],
  resolve: (type: ts.Type) => TypedStructResolution,
  resolveOwnedField: (
    type: ts.Type,
    member: string,
    property?: ts.Symbol,
  ) =>
    | {
        field: TypedStructField;
        schema: InternalSchema;
      }
    | undefined,
  excludedDirectories: ReadonlySet<string>,
): void {
  const byId = new Map(schemas.map((schema) => [schema.audit.id, schema]));
  const visit = (node: ts.Node): void => {
    if (ts.isPropertyAccessExpression(node)) {
      const receiverType = checker.getTypeAtLocation(node.expression);
      const resolution = resolve(receiverType);
      if (resolution.kind === 'incompatible') {
        for (const audit of resolution.schemas) {
          addEscape(
            audit,
            node,
            workspaceDirectory,
            receiverType.isUnion() ? 'incompatible-union' : 'width-sensitive',
            node.name.text,
          );
        }
      } else if (resolution.kind === 'matched') {
        const audit = resolution.schemas[0]!;
        if (isPresenceSensitiveMember(node)) {
          addEscape(audit, node, workspaceDirectory, 'presence-sensitive', node.name.text);
        } else {
          const owned = resolveOwnedField(
            checker.getTypeAtLocation(node.expression),
            node.name.text,
            checker.getSymbolAtLocation(node.name),
          );
          if (!owned || owned.schema !== byId.get(audit.id)) {
            addEscape(audit, node, workspaceDirectory, 'unknown-member', node.name.text);
          } else if (owned.field.receiverSensitive && isCalledProperty(node)) {
            addEscape(audit, node, workspaceDirectory, 'receiver-sensitive-method', node.name.text);
          } else {
            audit.accesses[propertyAccessMode(node)] += 1;
          }
        }
      }
    } else if (ts.isBindingElement(node) && ts.isObjectBindingPattern(node.parent)) {
      const member = objectBindingMemberName(node);
      const receiverType = checker.getTypeAtLocation(node.parent);
      const resolution = resolve(receiverType);
      if (member && resolution.kind === 'matched') {
        const audit = resolution.schemas[0]!;
        const property = checker.getPropertyOfType(checker.getNonNullableType(receiverType), member);
        const owned = resolveOwnedField(receiverType, member, property);
        if (!owned || owned.schema !== byId.get(audit.id)) {
          addEscape(audit, node, workspaceDirectory, 'unknown-member', member);
        } else {
          audit.accesses.reads += 1;
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

  for (const source of program
    .getSourceFiles()
    .filter((item) => isProductionUpstreamSource(item, excludedDirectories))) {
    visit(source);
  }
}

function objectBindingMemberName(node: ts.BindingElement): string | undefined {
  const name = node.propertyName ?? (ts.isIdentifier(node.name) ? node.name : undefined);
  if (name && (ts.isIdentifier(name) || ts.isStringLiteral(name) || ts.isNumericLiteral(name))) return name.text;
  return undefined;
}

function isCandidateFieldDeclaration(property: ts.Symbol, declarations: ReadonlySet<ts.Declaration>): boolean {
  const propertyDeclarations = property.declarations ?? [];
  return propertyDeclarations.length > 0 && propertyDeclarations.every((declaration) => declarations.has(declaration));
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

function isProductionUpstreamSource(source: ts.SourceFile, excludedDirectories: ReadonlySet<string>): boolean {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\/src\//u.exec(normalized)?.[1];
  return (
    packageDirectory !== undefined &&
    !excludedDirectories.has(packageDirectory) &&
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

function reflectiveSurvivors(
  escapes: readonly TypedStructEscape[],
): TypedStructSchemaAudit['emission']['reflectiveSurvivors'] {
  const accessesByReason = new Map<string, number>();
  for (const escape of escapes) {
    accessesByReason.set(escape.reason, (accessesByReason.get(escape.reason) ?? 0) + 1);
  }
  return [...accessesByReason]
    .map(([reason, accesses]) => ({ accesses, reason }))
    .sort((left, right) => left.reason.localeCompare(right.reason));
}

function sum<T>(items: readonly T[], select: (item: T) => number): number {
  return items.reduce((total, item) => total + select(item), 0);
}
