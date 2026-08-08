import { execFileSync } from 'node:child_process';
import { mkdirSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { auditTypedStructClassFeasibility } from '../../tools/generator/src/analyze/typed-struct-classes.ts';
import { auditTypedStructProvenance } from '../../tools/generator/src/analyze/typed-struct-provenance.ts';
import {
  cppStructInitTypedStructIds,
  createTypedStructRegistry,
  discoverTypedStructUniverse,
  typedStructRegistry,
  typedStructStableId,
  type TypedStructCandidate,
} from '../../tools/generator/src/analyze/typed-structs.ts';
import { upstreamTypeScriptProgram } from '../../tools/generator/src/analyze/program.ts';
import { validateCppStructInitProvenance } from '../../tools/generator/src/emit/core.ts';
import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import {
  typedStructClassFeasibilitySummary,
  typedStructProvenanceSummary,
  typedStructSummary,
} from '../../tools/generator/src/emit/reports.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';
import type { IrExpression, IrTypedStructBinding } from '../../tools/generator/src/model/ir.ts';

const fixtureCandidate: TypedStructCandidate = {
  emission: 'direct',
  name: 'Vector2',
  packageName: '@flighthq/types',
  purpose: 'fixture numeric leaf',
  source: 'upstream/packages/types/src/Vector2.ts',
};

describe('typed struct stable declaration identity', () => {
  it('locks the previous report through the approved migration dispositions', () => {
    const workspace = path.resolve('.');
    const { program } = upstreamTypeScriptProgram(workspace);
    const discovery = discoverTypedStructUniverse(workspace, program);
    const particleEmitterData = discovery.candidates.find((candidate) => candidate.name === 'ParticleEmitterData');

    expect(discovery.migration.summary).toEqual({
      baseline: 405,
      kindChanged: 2,
      newAuditOnly: 1_604,
      preserved: 231,
      relocated: 146,
      removed: 3,
      renamed: 23,
    });
    expect(discovery.migration).toMatchObject({
      baselineUpstreamCommit: '5d24729f7360475e28a105ae0caeeaa2e1328260',
      sourceReportSha256: '01780f464ad52d5b386fc4d707fbd00a7d1ccc1e1f15426fbc514c7c59f410a3',
    });
    expect(discovery.candidates).toHaveLength(2_006);
    expect(discovery.candidates.filter((candidate) => candidate.emission === 'direct')).toHaveLength(402);
    const relocated = discovery.candidates.filter((candidate) => candidate.migration.status === 'relocated');
    expect(relocated).toHaveLength(146);
    expect(
      relocated.every(
        (candidate) =>
          candidate.packageName === '@flighthq/types' && candidate.definingPackageName === '@flighthq/types',
      ),
    ).toBe(true);
    expect(
      new Set(
        discovery.candidates.map((candidate) =>
          typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
        ),
      ).size,
    ).toBe(discovery.candidates.length);
    expect(particleEmitterData).toMatchObject({
      configuredPackageName: '@flighthq/types',
      configuredSource: 'upstream/packages/types/src/ParticleEmitter.ts',
      declarationKind: 'interface',
      definingPackageName: '@flighthq/types',
      packageName: '@flighthq/types',
      source: 'upstream/packages/types/src/ParticleEmitter2D.ts',
      sourceResolution: 'relocated',
      migration: {
        baselineId: '@flighthq/types:interface#ParticleEmitterData',
        status: 'relocated',
      },
    });
    expect(
      particleEmitterData &&
        typedStructStableId(
          particleEmitterData.packageName,
          particleEmitterData.declarationKind,
          particleEmitterData.name,
        ),
    ).toBe('@flighthq/types:interface#ParticleEmitterData');
  });

  it('admits only new rows as audit-only and records reviewed replacements separately', () => {
    const workspace = path.resolve('.');
    const { program } = upstreamTypeScriptProgram(workspace);
    const discovery = discoverTypedStructUniverse(workspace, program);
    const byId = new Map(
      discovery.candidates.map((candidate) => [
        typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
        candidate,
      ]),
    );

    const newlyDiscovered = discovery.candidates.filter((candidate) => candidate.migration.status === 'new');
    expect(newlyDiscovered).toHaveLength(1_604);
    expect(newlyDiscovered.every((candidate) => candidate.emission === 'audit-only')).toBe(true);
    expect(byId.get('@flighthq/types:interface#ColorScaleBias')?.migration).toEqual({
      baselineId: '@flighthq/types:interface#ColorTransform',
      status: 'renamed',
    });
    expect(byId.get('@flighthq/types:interface#Bitmap')?.migration).toEqual({
      baselineId: '@flighthq/types:interface#Surface',
      status: 'renamed',
    });
    expect(byId.get('@flighthq/types:type#Texture')?.migration).toEqual({
      baselineId: '@flighthq/types:interface#Texture',
      status: 'kind-changed',
    });
    expect(discovery.migration.removed).toEqual([
      {
        baselineId: '@flighthq/types:interface#ImageResource',
        successorIds: [
          '@flighthq/types:interface#Bitmap',
          '@flighthq/types:interface#CompressedImage',
          '@flighthq/types:interface#Image',
        ],
      },
      {
        baselineId: '@flighthq/types:interface#Tileset',
        successorIds: ['@flighthq/types:interface#TiledTileset', '@flighthq/types:interface#TilemapData'],
      },
      {
        baselineId: '@flighthq/types:interface#VideoTexture',
        successorIds: [
          '@flighthq/types:interface#Image',
          '@flighthq/types:interface#VideoResource',
          '@flighthq/types:type#Texture',
        ],
      },
    ]);
    expect(byId.has('@flighthq/types:interface#ImageResource')).toBe(false);
    expect(byId.has('@flighthq/types:interface#Tileset')).toBe(false);
    expect(byId.has('@flighthq/types:interface#VideoTexture')).toBe(false);
  });
});

describe('typed struct analysis', () => {
  it('emits and constructs an allowlisted struct-init class only on the cpp branch', () => {
    const candidate: TypedStructCandidate = {
      emission: 'direct',
      name: 'Camera2D',
      packageName: '@flighthq/types',
      purpose: 'cpp class pilot fixture',
      source: 'upstream/packages/types/src/Camera2D.ts',
    };
    const result = lowerFixture(
      `
        export interface Camera2D {
          rotation: number;
          viewportHeight: number;
          viewportWidth: number;
          x: number;
          y: number;
          zoom: number;
        }
        export function createCamera2D(): Camera2D {
          return { rotation: 0, viewportHeight: 480, viewportWidth: 640, x: 12, y: 34, zoom: 2 };
        }
      `,
      candidate,
    );
    const declaration = result.lowered.declarations.find(
      (item) => item.kind === 'type' && item.name === candidate.name,
    );
    if (!declaration || declaration.kind !== 'type') throw new Error('Expected Camera2D fixture type');
    declaration.cppStructInitSchemaId = candidateId(candidate);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      haxePackage: 'flighthq.types',
      imports: [],
      name: 'CameraPilot',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('#if cpp\n@:structInit\nclass Camera2D {');
    expect(output).toContain(
      'public function new(rotation:Float, viewportHeight:Float, viewportWidth:Float, x:Float, y:Float, zoom:Float):Void',
    );
    expect(output).toContain('return { rotation: 0.0, viewportHeight: 480.0, viewportWidth: 640.0, x: 12.0');
    expect(output).not.toContain('return cast { rotation: 0.0');

    const fixtureDirectory = path.resolve('build/haxe-cpp-struct-init-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq', 'types');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output.replace('#if cpp', '#if (cpp || eval)'));
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        class Main {
          static function main() {
            final camera = flighthq.types.CameraPilot.createCamera2D();
            if (!Std.isOfType(camera, flighthq.types.CameraPilot.Camera2D)) throw 'not a class';
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
          }
        }
      `,
    );
    expect(() =>
      execFileSync('node', ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'Main', '--interp'], {
        cwd: path.resolve('.'),
        stdio: 'pipe',
      }),
    ).not.toThrow();

    writeFileSync(
      path.join(fixtureDirectory, 'JsMain.hx'),
      `
        class JsMain {
          static function main() {
            final camera = flighthq.types.CameraPilot.createCamera2D();
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
          }
        }
      `,
    );
    const candidateJavaScript = path.join(fixtureDirectory, 'candidate.cjs');
    const baselineJavaScript = path.join(fixtureDirectory, 'baseline.cjs');
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output);
    execFileSync(
      'node',
      ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'JsMain', '--js', candidateJavaScript],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output.replace('return {', 'return cast {'));
    execFileSync(
      'node',
      ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'JsMain', '--js', baselineJavaScript],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    expect(readFileSync(candidateJavaScript)).toEqual(readFileSync(baselineJavaScript));
  });

  it('censuses class migration flows and observability by canonical schema', () => {
    const audit = classAuditFixture(
      `
        export interface A { x: number; y?: number; }
        export interface B { x: number; y?: number; }
        declare const dynamicValue: any;
        const inferred = { x: 3 };
        const key = 'x' as const;
        const plain: A = { x: 1 };
        const spread: A = { ...plain };
        const computed: A = { [key]: 4 };
        const typedB: B = { x: 2 };
        const cross: A = typedB;
        const dynamicIngress: A = dynamicValue;
        const anonymous: A = inferred;
        const incompatibleUnion: A | { label: string } = { x: 9 };
        export function exercise(value: A): A {
          Object.keys(value);
          JSON.stringify(value);
          const copy = { ...value };
          const { x, ...rest } = value;
          return value;
        }
      `,
      `
        import type { A } from '../src/Vector2';
        declare function expect(value: unknown): { toStrictEqual(expected: unknown): void };
        declare const value: A;
        const fixture: A = { x: 1 };
        Object.keys(value);
        JSON.stringify(value);
        const copy = { ...value };
        const { x, ...rest } = value;
        value.constructor;
        expect(value).toStrictEqual({ x: 1 });
      `,
    );
    const a = audit.schemas.find((schema) => schema.name === 'A');
    const b = audit.schemas.find((schema) => schema.name === 'B');

    expect(a).toMatchObject({
      bridge: { inputSignatures: 1, outputSignatures: 1 },
      construction: {
        computedObjectLiterals: 1,
        objectLiterals: 3,
        objectLiteralsOmittingOptionalFields: 2,
        objectLiteralsWithSpread: 1,
        plainObjectLiterals: 1,
        testObjectLiterals: 1,
      },
      fields: { optional: 1, requiredUndefined: 0, total: 2 },
      migration: {
        mechanicallyCompatible: false,
        normalizationReasons: [
          'anonymous-structural-transfer',
          'cross-schema-transfer',
          'dynamic-ingress',
          'object-literal-computed',
          'object-literal-spread',
        ],
        observabilityReasons: [
          'enumeration',
          'json-serialization',
          'object-rest',
          'object-spread',
          'optional-omission',
          'prototype-observation',
          'strict-equality',
        ],
      },
      oracle: {
        enumerations: 1,
        jsonSerializations: 1,
        objectRests: 1,
        objectSpreads: 1,
        prototypeObservations: 1,
        strictEqualityAssertions: 1,
      },
      production: {
        anonymousStructuralTransfers: 1,
        crossSchemaTransfers: 1,
        dynamicIngresses: 1,
        enumerations: 1,
        jsonSerializations: 1,
        objectRests: 1,
        objectSpreads: 2,
      },
    });
    expect(b).toMatchObject({
      construction: {
        objectLiterals: 1,
        objectLiteralsOmittingOptionalFields: 1,
        plainObjectLiterals: 1,
      },
      migration: { mechanicallyCompatible: true, normalizationReasons: [] },
    });
    expect(a?.sites).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ kind: 'cross-schema-transfer', relatedSchemaIds: [b?.id] }),
        expect.objectContaining({ kind: 'prototype-observation', scope: 'test' }),
      ]),
    );
    expect(audit.summary).toMatchObject({
      anonymousStructuralTransfers: 1,
      bridgeInputSignatures: 1,
      bridgeOutputSignatures: 1,
      crossSchemaTransfers: 1,
      dynamicIngresses: 1,
      mechanicallyCompatibleSchemas: 1,
      normalizationRequiredSchemas: 1,
      objectLiterals: 4,
      objectLiteralsOmittingOptionalFields: 3,
      objectLiteralsWithComputedKeys: 1,
      objectLiteralsWithSpread: 1,
      oracleObservations: 6,
      schemas: 2,
      testObjectLiterals: 1,
    });
    expect(typedStructClassFeasibilitySummary(audit)).toContain('| Eligible canonical schemas | 2 |');
  });

  it('propagates normalization and bridge roots through containment and catches generic construction gaps', () => {
    const audit = provenanceAuditFixture(`
      export interface A { children: B[]; envelope: { child: B }; }
      export interface B { x: number; }
      export interface C { value: number; }
      declare const text: string;
      declare const records: Array<{ x: number }>;
      const parsed = JSON.parse(text) as A;
      const children: B[] = records.map((record) => ({ x: record.x }));
      const safe: C[] = [{ value: 1 }];
      export function consume(value: A): C { return safe[0]!; }
    `);
    const b = audit.schemas.find((schema) => schema.name === 'B');
    const c = audit.schemas.find((schema) => schema.name === 'C');

    expect(audit.summary).toMatchObject({
      blockedSchemas: 1,
      candidateSchemas: 2,
      closedSchemas: 1,
      combinedBlockedSchemas: 1,
      containerOnlyBlockedSchemas: 0,
      normalizationOnlyBlockedSchemas: 0,
    });
    expect(audit.jsonParseRoots).toEqual([
      expect.objectContaining({
        schemaId: expect.stringContaining('#A'),
        sites: [expect.objectContaining({ kind: 'json-parse-root' })],
      }),
    ]);
    expect(audit.containmentEdges).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ childSchemaId: expect.stringContaining('#B'), fieldPath: 'envelope.child' }),
      ]),
    );
    expect(b).toMatchObject({
      bridgeExposure: {
        inputPaths: [expect.objectContaining({ rootSchemaId: expect.stringContaining('#A') })],
      },
      nominalIdentity: {
        blockerReasons: ['container-transfer', 'normalization-provenance'],
        closed: false,
      },
      normalizationProvenance: [
        expect.objectContaining({
          path: [expect.stringContaining('#A'), expect.stringContaining('children[]:')],
          rootSchemaId: expect.stringContaining('#A'),
        }),
      ],
      transfers: [expect.objectContaining({ kind: 'anonymous-container-transfer' })],
    });
    expect(c).toMatchObject({
      nominalIdentity: { blockerReasons: [], closed: true },
      normalizationProvenance: [],
      transfers: [],
    });
    expect(typedStructProvenanceSummary(audit)).toContain('| Clean required-field candidates | 2 |');
  });

  it('re-proves the reviewed cpp controls against the complete checker-derived universe', () => {
    const workspace = path.resolve('.');
    const programAndChecker = upstreamTypeScriptProgram(workspace);
    const registry = typedStructRegistry(workspace, 'fixture', undefined, programAndChecker);
    const report = registry.report;
    const classAudit = auditTypedStructClassFeasibility(workspace, 'fixture', registry, programAndChecker);
    const provenance = auditTypedStructProvenance(workspace, 'fixture', registry, classAudit, programAndChecker);
    const provenanceById = new Map(provenance.schemas.map((schema) => [schema.id, schema]));
    const rectangle = report.candidates.find((candidate) => candidate.name === 'Rectangle');
    const color = report.candidates.find((candidate) => candidate.name === 'ColorScaleBias');
    const camera2D = report.candidates.find((candidate) => candidate.name === 'Camera2D');
    const particleEmitterData = report.candidates.find((candidate) => candidate.name === 'ParticleEmitterData');
    const particleEmitterState = report.candidates.find((candidate) => candidate.name === 'ParticleEmitterState');
    const codec = report.candidates.find((candidate) => candidate.name === 'ParticleFormatCodec');
    const menuItemTemplate = report.candidates.find((candidate) => candidate.name === 'MenuItemTemplate');
    const bitmap = report.candidates.find((candidate) => candidate.name === 'Bitmap');

    expect(cppStructInitTypedStructIds).toEqual([
      '@flighthq/types:interface#Camera2D',
      '@flighthq/types:interface#ParticleEmitterState',
    ]);
    expect(cppStructInitTypedStructIds.every((id) => provenanceById.get(id)?.nominalIdentity.closed === true)).toBe(
      true,
    );
    const particleEmitterDataId = '@flighthq/types:interface#ParticleEmitterData';
    expect(provenanceById.get(particleEmitterDataId)?.nominalIdentity.closed).toBe(false);
    expect(() => validateCppStructInitProvenance(cppStructInitTypedStructIds, provenance)).not.toThrow();
    expect(() => validateCppStructInitProvenance([particleEmitterDataId], provenance)).toThrow(
      `cpp @:structInit schemas are not provenance-closed: ${particleEmitterDataId}`,
    );
    expect(readFileSync('generated/flighthq/types/ParticleEmitter2D.hx', 'utf8')).toContain(
      'typedef ParticleEmitter2D = { var data:ParticleEmitterData;',
    );
    expect(readFileSync('generated/flighthq/types/ParticleEmitter3D.hx', 'utf8')).toContain(
      'typedef ParticleEmitter3D = { var data:ParticleEmitterData;',
    );
    expect(readFileSync('generated/flighthq/types/Node.hx', 'utf8')).toContain(
      'typedef NodeData = flighthq._internal._Object;',
    );

    expect(report.summary).toMatchObject({
      auditOnlySchemas: 1_604,
      bindableAccesses: 28_714,
      candidates: 2_006,
      directAccesses: 10_742,
      directSchemas: 397,
      eligible: 1_513,
      escapes: 10_973,
      fields: 23_912,
      ineligible: 493,
      pendingAccesses: 17_972,
      reflectiveSurvivors: 449,
    });
    expect(report.migration.summary).toEqual({
      baseline: 405,
      kindChanged: 2,
      newAuditOnly: 1_604,
      preserved: 231,
      relocated: 146,
      removed: 3,
      renamed: 23,
    });
    expect(classAudit.summary.schemas).toBe(1_513);
    expect(provenance.summary).toMatchObject({
      candidateSchemas: 730,
      closedSchemas: 548,
      containmentEdges: 1_776,
    });
    expect(rectangle?.eligible).toBe(false);
    expect(rectangle?.reasons).toContain('presence-sensitive-use');
    expect(rectangle?.escapes).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          reason: 'presence-sensitive',
          source: 'upstream/packages/interaction/src/hitTests.ts',
        }),
      ]),
    );
    expect(color?.eligible).toBe(false);
    expect(color?.reasons).toContain('presence-sensitive-use');
    expect(color?.migration).toEqual({
      baselineId: '@flighthq/types:interface#ColorTransform',
      status: 'renamed',
    });
    expect(report.summary.directAccesses).toBe(10_742);
    expect(rectangle?.emission).toEqual({
      directAccesses: 0,
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    });
    expect(camera2D?.emission).toEqual({
      directAccesses: 17,
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    });
    expect(particleEmitterData).toMatchObject({
      eligible: true,
      emission: { directAccesses: 411, mode: 'direct', pendingAccesses: 0 },
      escapes: [],
      fields: expect.arrayContaining([
        expect.objectContaining({ name: 'particleCount', optional: false, type: 'number' }),
        expect.objectContaining({ name: 'transforms', optional: false, type: 'Float32Array<ArrayBufferLike>' }),
      ]),
      reasons: [],
    });
    expect(particleEmitterState).toMatchObject({
      eligible: true,
      emission: { directAccesses: 236, mode: 'direct', pendingAccesses: 0 },
      escapes: [],
      fields: expect.arrayContaining([
        expect.objectContaining({ name: 'random', optional: false, type: 'RandomSource' }),
        expect.objectContaining({ name: 'velocities', optional: false, type: 'Float32Array<ArrayBufferLike>' }),
      ]),
      reasons: [],
    });
    expect(menuItemTemplate?.emission.reflectiveSurvivors).toEqual([{ accesses: 1, reason: 'dynamic-enumeration' }]);
    expect(bitmap).toMatchObject({
      emission: { mode: 'direct' },
      migration: { baselineId: '@flighthq/types:interface#Surface', status: 'renamed' },
    });
    expect(codec?.memberEscapes).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          member: 'parseToDocument',
          reason: 'receiver-sensitive-method',
          source: 'upstream/packages/types/src/ParticleFormatCodec.ts:12',
        }),
      ]),
    );
    expect(typedStructSummary(report)).toContain(
      '| `@flighthq/types:interface#ParticleFormatCodec` | `parseToDocument` | `receiver-sensitive-method` | `upstream/packages/types/src/ParticleFormatCodec.ts:12` |',
    );
  }, 180_000);

  it('preserves source typing for audit-only schemas without enabling registry bindings', () => {
    const result = lowerFixture(
      `
        export interface Vector2 { x: number; y: number; }
        export function read(value: Vector2): number { return value.x; }
      `,
      { ...fixtureCandidate, emission: 'audit-only' },
    );
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });
    const candidate = result.registry.report.candidates[0]!;

    expect(result.lowered.diagnostics).toEqual([]);
    expect(candidate.eligible).toBe(true);
    expect(candidate.emission).toEqual({
      directAccesses: 0,
      mode: 'audit-only',
      pendingAccesses: 1,
      reflectiveSurvivors: [],
    });
    expect(collectTypedStructBindings(result.lowered.declarations)).toEqual([]);
    expect(output).toContain('(cast value : Vector2).x');
  });

  it('preserves a partial options literal while reading its omitted field directly', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        maxDeltaTime?: number;
        targetFrameRate?: number;
      }
      export function readMaxDelta(options: Vector2): number | undefined {
        return options.maxDeltaTime;
      }
      export function readPartial(): number | undefined {
        return readMaxDelta({ targetFrameRate: 60 });
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations).map((binding) => binding.field.name)).toEqual([
      'maxDeltaTime',
    ]);
    expect(output).toContain('return cast options.maxDeltaTime;');
    expect(output).toContain('targetFrameRate: 60.0');
    expect(output).not.toContain("_Runtime.field(options, 'maxDeltaTime')");
    expect(output).not.toContain('maxDeltaTime: _Runtime.UNDEFINED');
  });

  it('lowers defensive nullish assignment on required primitive fields portably', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      export function initialize(value: Vector2): number {
        return value.x ??= 0;
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('final __nullishValue1:Null<Float>');
    expect(output).toContain(
      '__nullishValue1 == null ? (__nullishOwner0.x = (cast 0.0 : Float)) : (cast __nullishValue1 : Float)',
    );
    expect(output).not.toContain('value.x ??=');
    expect(output).not.toContain('Dynamic = cast __nullishOwner0.x');
  });

  it('writes result records directly inside a plain anonymous backend', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        hasKeyboard: boolean;
        hasMouse: boolean;
      }
      export interface Backend {
        getCapabilities(out: Vector2): Vector2;
      }
      export function createBackend(): Backend {
        return {
          getCapabilities(out) {
            out.hasKeyboard = false;
            out.hasMouse = false;
            return out;
          },
        };
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations).map((binding) => binding.field.name)).toEqual([
      'hasKeyboard',
      'hasMouse',
    ]);
    expect(output).toContain('(out.hasKeyboard = cast (false : Dynamic))');
    expect(output).toContain('(out.hasMouse = cast (false : Dynamic))');
    expect(output).not.toContain("_Runtime.setField(out, 'has");
  });

  it('emits bound fields directly while preserving optional and receiver-sensitive semantics', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        readonly x: number;
        y: number;
        optional?: number;
        requiredUndefined: number | undefined;
        callback: (value: number) => void;
        method(this: Vector2): void;
      }
      export function update(value: Vector2): number {
        value.y = value.x;
        value.y += 1;
        value.y++;
        value.callback(value.y);
        value.method();
        return value.optional ?? value.requiredUndefined ?? 0;
      }
      export function readOptional(factory: () => Vector2 | undefined): number | undefined {
        return factory()?.optional;
      }
    `);
    const bindings = collectTypedStructBindings(result.lowered.declarations);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(bindings.map((binding) => binding.field.name)).toEqual([
      'y',
      'x',
      'y',
      'y',
      'y',
      'callback',
      'optional',
      'requiredUndefined',
      'optional',
    ]);
    expect(bindings.find((binding) => binding.field.name === 'optional')?.field).toMatchObject({
      optional: true,
      requiredUndefined: false,
    });
    expect(bindings.find((binding) => binding.field.name === 'requiredUndefined')?.field).toMatchObject({
      optional: false,
      requiredUndefined: true,
    });
    expect(bindings.some((binding) => binding.field.name === 'method')).toBe(false);
    expect(output).toContain('(value.y = cast (value.x : Dynamic))');
    expect(output).toContain('(value.y += 1.0)');
    expect(output).toContain('value.y++');
    expect(output).toContain('(value.callback)((cast value.y : Float))');
    expect(output).toContain('(cast value : Vector2).method()');
    expect(output).toContain('final __typedStruct0 = (cast factory() : Null<Vector2>)');
    expect(output).toContain(
      '__typedStruct0 == null ? _Runtime.UNDEFINED : (cast __typedStruct0 : { @:optional var optional:Null<Float>; }).optional',
    );
    expect(output).not.toContain("_Runtime.field(value, '");
    expect(output).not.toContain("_Runtime.setField(value, '");
    expect(output).not.toContain("_Runtime.incrementField(value, '");
  });

  it('resolves aliases and Readonly wrappers to the canonical schema identity', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      export type Vector2Like = Readonly<Vector2>;
      export function read(value: Vector2Like): number { return value.x + value.y; }
    `);
    const bindings = collectTypedStructBindings(result.lowered.declarations);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(bindings.map((binding) => binding.field.name)).toEqual(['x', 'y']);
    expect(new Set(bindings.map((binding) => binding.schemaId))).toEqual(
      new Set(['@flighthq/types:interface#Vector2']),
    );
  });

  it('narrows indexed-access storage before reading a bound field directly', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      interface Container { values: readonly Vector2[]; optional?: Vector2; }
      export function readArray(value: Readonly<Container['values'][number]>): number { return value.x; }
      export function readOptional(value: NonNullable<Container['optional']>): number { return value.y; }
      export function readDirect(value: Vector2): number { return value.x; }
    `);
    const bindings = collectTypedStructBindings(result.lowered.declarations);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(bindings.map((binding) => binding.field.name)).toEqual(['x', 'y', 'x']);
    expect(output).toContain('(cast value : { var x:Float; }).x');
    expect(output).toContain('(cast value : { var y:Float; }).y');
    expect(output).toContain('return cast value.x;');
    expect(output).not.toContain('(cast value : Vector2).x');
  });

  it('casts a type-guard-narrowed receiver to its canonical struct before direct access', () => {
    const result = lowerFixture(`
      export interface SceneNode { enabled: boolean; }
      export interface Vector2 extends SceneNode { x: number; y: number; }
      export function isVector2(value: SceneNode): value is Vector2 { return 'x' in value; }
      export function read(value: SceneNode): number {
        return isVector2(value) ? value.x : 0;
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations)).toEqual([
      expect.objectContaining({
        receiverCast: expect.objectContaining({
          fields: [expect.objectContaining({ name: 'x', type: { kind: 'primitive', name: 'Float' } })],
          kind: 'anonymous',
        }),
      }),
    ]);
    expect(output).toContain('(cast value : { var x:Float; }).x');
    expect(output).not.toContain("_Runtime.field(value, 'x')");
  });

  it('binds intersection fields by declaration identity rather than matching their spelling', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        own: number;
        collision: number;
      }
      interface Sibling {
        sibling: number;
        collision: number;
      }
      export function read(value: Vector2 & Sibling): number {
        return value.own + value.sibling + value.collision;
      }
    `);
    const candidate = result.registry.report.candidates[0]!;
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations).map((binding) => binding.field.name)).toEqual([
      'own',
    ]);
    expect(candidate.accesses).toEqual({ calls: 0, reads: 1, writes: 0 });
    expect(candidate.escapes).toEqual([
      expect.objectContaining({ member: 'sibling', reason: 'unknown-member' }),
      expect.objectContaining({ member: 'collision', reason: 'unknown-member' }),
    ]);
    expect(output).toContain('value.own');
    expect(output).toContain('(cast value : { var sibling:Float; }).sibling');
    expect(output).toContain('(cast value : { var collision:Float; }).collision');
  });

  it('rejects unknown and readonly named writes before an emitter can trust them', () => {
    const unknown = lowerFixture(`
      export interface Vector2 { readonly x: number; y: number; }
      export function invalid(value: Vector2): number { return value.missing; }
    `);
    const readonly = lowerFixture(`
      export interface Vector2 { readonly x: number; y: number; }
      export function invalid(value: Vector2): void { value.x = 1; }
    `);

    expect(unknown.lowered.diagnostics).toEqual([
      expect.objectContaining({ message: 'Unsupported TypeScript unknown typed-struct field Vector2.missing' }),
    ]);
    expect(readonly.lowered.diagnostics).toEqual([
      expect.objectContaining({
        message: 'Unsupported TypeScript assignment to readonly typed-struct field Vector2.x',
      }),
    ]);
    expect(unknown.lowered.declarations.some((declaration) => declaration.name === 'invalid')).toBe(false);
    expect(readonly.lowered.declarations.some((declaration) => declaration.name === 'invalid')).toBe(false);
  });

  it('keeps computed and presence-sensitive accesses dynamic while typing a common union field', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      export interface Other { x: number; label: string; }
      export function computed(value: Vector2, key: 'x' | 'y'): number { return value[key]; }
      export function union(value: Vector2 | Other): number { return value.x; }
      export function present(value: Vector2): boolean { return 'x' in value; }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });
    const candidate = result.registry.report.candidates[0]!;

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations)).toEqual([]);
    expect(candidate.eligible).toBe(false);
    expect(candidate.reasons).toContain('presence-sensitive-use');
    expect(candidate.escapes.map((escape) => escape.reason)).toEqual(
      expect.arrayContaining(['computed-key', 'incompatible-union', 'presence-sensitive']),
    );
    expect(output).toContain('_Runtime.getIndex(value, key)');
    expect(output).toContain('(cast value : { var x:Float; }).x');
    expect(output).toContain("_Runtime.hasField(value, 'x')");
  });

  it('audits structurally wider intersections as width-sensitive', () => {
    const fixture = typedStructFixture(`
      export interface A { x: number; }
      export interface B { y: number; }
      export function read(value: A & B): number { return value.x + value.y; }
    `);
    const registry = createTypedStructRegistry(
      fixture.workspace,
      'fixture',
      [
        {
          emission: 'direct',
          name: 'A',
          packageName: '@flighthq/types',
          purpose: 'fixture width rule',
          source: fixture.source,
        },
        {
          emission: 'direct',
          name: 'B',
          packageName: '@flighthq/types',
          purpose: 'fixture width rule',
          source: fixture.source,
        },
      ],
      fixture.program,
      fixture.checker,
    );

    expect(registry.report.candidates).toHaveLength(2);
    expect(
      registry.report.candidates.every((candidate) =>
        candidate.escapes.every((escape) => escape.reason === 'width-sensitive'),
      ),
    ).toBe(true);
    expect(registry.report.candidates.map((candidate) => candidate.escapes.length)).toEqual([2, 2]);
  });
});

function lowerFixture(text: string, candidate: TypedStructCandidate = fixtureCandidate) {
  const workspace = '/workspace';
  const fileName = `${workspace}/${candidate.source}`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixture = ts.createSourceFile(fileName, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const getSourceFile = host.getSourceFile.bind(host);
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === fileName ? fixture : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([fileName], options, host);
  const source = program.getSourceFile(fileName);
  if (!source) throw new Error(`Fixture program is missing ${fileName}`);
  const checker = program.getTypeChecker();
  const registry = createTypedStructRegistry(workspace, 'fixture', [candidate], program, checker);
  return {
    lowered: lowerTypeScriptSource(source, '@flighthq/types', workspace, checker, registry),
    registry,
  };
}

function typedStructFixture(text: string) {
  const workspace = '/workspace';
  const source = 'upstream/packages/types/src/Vector2.ts';
  const fileName = `${workspace}/${source}`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixture = ts.createSourceFile(fileName, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const directoryExists = host.directoryExists?.bind(host);
  const fileExists = host.fileExists.bind(host);
  const getSourceFile = host.getSourceFile.bind(host);
  const readFile = host.readFile.bind(host);
  host.fileExists = (requested) => requested === fileName || fileExists(requested);
  host.directoryExists = (requested) => requested.startsWith(`${workspace}/`) || directoryExists?.(requested) === true;
  host.readFile = (requested) => (requested === fileName ? fixture.text : readFile(requested));
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === fileName ? fixture : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([fileName], options, host);
  const diagnostics = program.getSemanticDiagnostics();
  if (diagnostics.length > 0) {
    throw new Error(
      diagnostics.map((diagnostic) => ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n')).join('\n'),
    );
  }
  return { checker: program.getTypeChecker(), program, source, workspace };
}

function classAuditFixture(productionText: string, testText: string) {
  const workspace = '/workspace';
  const source = 'upstream/packages/types/src/Vector2.ts';
  const productionFile = `${workspace}/${source}`;
  const testFile = `${workspace}/upstream/packages/types/test/Vector2.test.ts`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    module: ts.ModuleKind.ESNext,
    moduleResolution: ts.ModuleResolutionKind.Bundler,
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixtures = new Map([
    [
      productionFile,
      ts.createSourceFile(productionFile, productionText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS),
    ],
    [testFile, ts.createSourceFile(testFile, testText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS)],
  ]);
  const host = ts.createCompilerHost(options);
  const directoryExists = host.directoryExists?.bind(host);
  const fileExists = host.fileExists.bind(host);
  const getSourceFile = host.getSourceFile.bind(host);
  const readFile = host.readFile.bind(host);
  host.fileExists = (requested) => fixtures.has(requested) || fileExists(requested);
  host.directoryExists = (requested) => requested.startsWith(`${workspace}/`) || directoryExists?.(requested) === true;
  host.readFile = (requested) => fixtures.get(requested)?.text ?? readFile(requested);
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    fixtures.get(requested) ?? getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([...fixtures.keys()], options, host);
  const diagnostics = program.getSemanticDiagnostics();
  if (diagnostics.length > 0) {
    throw new Error(
      diagnostics.map((diagnostic) => ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n')).join('\n'),
    );
  }
  const checker = program.getTypeChecker();
  const candidates: TypedStructCandidate[] = ['A', 'B'].map((name) => ({
    emission: 'direct',
    name,
    packageName: '@flighthq/types',
    purpose: 'class audit fixture',
    source,
  }));
  const registry = createTypedStructRegistry(workspace, 'fixture', candidates, program, checker);
  return auditTypedStructClassFeasibility(workspace, 'fixture', registry, { checker, program });
}

function provenanceAuditFixture(productionText: string) {
  const workspace = '/workspace';
  const source = 'upstream/packages/types/src/Vector2.ts';
  const productionFile = `${workspace}/${source}`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    module: ts.ModuleKind.ESNext,
    moduleResolution: ts.ModuleResolutionKind.Bundler,
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixture = ts.createSourceFile(productionFile, productionText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const directoryExists = host.directoryExists?.bind(host);
  const fileExists = host.fileExists.bind(host);
  const getSourceFile = host.getSourceFile.bind(host);
  const readFile = host.readFile.bind(host);
  host.fileExists = (requested) => requested === productionFile || fileExists(requested);
  host.directoryExists = (requested) => requested.startsWith(`${workspace}/`) || directoryExists?.(requested) === true;
  host.readFile = (requested) => (requested === productionFile ? fixture.text : readFile(requested));
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === productionFile
      ? fixture
      : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([productionFile], options, host);
  const diagnostics = program.getSemanticDiagnostics();
  if (diagnostics.length > 0) {
    throw new Error(
      diagnostics.map((diagnostic) => ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n')).join('\n'),
    );
  }
  const checker = program.getTypeChecker();
  const candidates: TypedStructCandidate[] = ['A', 'B', 'C'].map((name) => ({
    emission: 'direct',
    name,
    packageName: '@flighthq/types',
    purpose: 'provenance audit fixture',
    source,
  }));
  const programAndChecker = { checker, program };
  const registry = createTypedStructRegistry(workspace, 'fixture', candidates, program, checker);
  const classAudit = auditTypedStructClassFeasibility(workspace, 'fixture', registry, programAndChecker);
  return auditTypedStructProvenance(workspace, 'fixture', registry, classAudit, programAndChecker);
}

function candidateId(candidate: TypedStructCandidate): string {
  return typedStructStableId(candidate.packageName, 'interface', candidate.name);
}

function collectTypedStructBindings(value: unknown): IrTypedStructBinding[] {
  const bindings: IrTypedStructBinding[] = [];
  const visit = (current: unknown): void => {
    if (!current || typeof current !== 'object') return;
    if (Array.isArray(current)) {
      current.forEach(visit);
      return;
    }
    const record = current as Record<string, unknown>;
    if (record.kind === 'property' && record.typedStructBinding) {
      bindings.push(record.typedStructBinding as IrTypedStructBinding);
    }
    for (const [key, child] of Object.entries(record)) {
      if (key !== 'typedStructBinding') visit(child);
    }
  };
  visit(value as IrExpression);
  return bindings;
}
