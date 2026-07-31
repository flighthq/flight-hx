import path from 'node:path';
import ts from 'typescript';

import {
  createTypedStructRegistry,
  tranche6TypedStructCandidates,
  typedStructRegistry,
  type TypedStructCandidate,
} from '../../tools/generator/src/analyze/typed-structs.ts';
import { upstreamTypeScriptProgram } from '../../tools/generator/src/analyze/program.ts';
import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import { typedStructSummary } from '../../tools/generator/src/emit/reports.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';
import type { IrExpression, IrTypedStructBinding } from '../../tools/generator/src/model/ir.ts';

const fixtureCandidate: TypedStructCandidate = {
  emission: 'direct',
  name: 'Vector2',
  packageName: '@flighthq/types',
  purpose: 'fixture numeric leaf',
  source: 'upstream/packages/types/src/Vector2.ts',
};

describe('typed struct analysis', () => {
  it('audits tranche six without widening direct emission or enabling Rectangle', () => {
    const workspace = path.resolve('.');
    const programAndChecker = upstreamTypeScriptProgram(workspace);
    const report = typedStructRegistry(workspace, 'fixture', undefined, programAndChecker).report;
    const rectangle = report.candidates.find((candidate) => candidate.name === 'Rectangle');
    const color = report.candidates.find((candidate) => candidate.name === 'ColorTransform');
    const camera2D = report.candidates.find((candidate) => candidate.name === 'Camera2D');
    const transform2DRuntime = report.candidates.find((candidate) => candidate.name === 'HasTransform2DRuntime');
    const perspective = report.candidates.find((candidate) => candidate.name === 'PerspectiveProjection');
    const scene = report.candidates.find((candidate) => candidate.name === 'Scene');
    const asset = report.candidates.find((candidate) => candidate.name === 'AssetDescriptor');
    const host = report.candidates.find((candidate) => candidate.name === 'DeviceInfo');
    const serialization = report.candidates.find((candidate) => candidate.name === 'GltfDocument');
    const codec = report.candidates.find((candidate) => candidate.name === 'ParticleFormatCodec');
    const trancheSix = report.candidates.slice(-tranche6TypedStructCandidates.length);

    expect(report.summary).toMatchObject({
      auditOnlySchemas: 350,
      bindableAccesses: 10_263,
      candidates: 405,
      directAccesses: 3_271,
      directSchemas: 54,
      eligible: 404,
      escapes: 348,
      fields: 2_028,
      ineligible: 1,
      pendingAccesses: 6_992,
      reflectiveSurvivors: 152,
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
    expect(color?.eligible).toBe(true);
    expect(color?.purpose).toContain('RGBA');
    expect(report.summary.directAccesses).toBe(3_271);
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
    expect(transform2DRuntime?.emission).toEqual({
      directAccesses: 27,
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [
        { accesses: 41, reason: 'incompatible-union' },
        { accesses: 9, reason: 'unknown-member' },
      ],
    });
    expect(transform2DRuntime?.escapes).toHaveLength(50);
    expect(perspective?.emission).toEqual({
      directAccesses: 7,
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [{ accesses: 7, reason: 'incompatible-union' }],
    });
    expect(perspective?.escapes).toHaveLength(7);
    expect(perspective?.escapes.every((escape) => escape.reason === 'incompatible-union')).toBe(true);
    expect(tranche6TypedStructCandidates).toHaveLength(350);
    expect(new Set(tranche6TypedStructCandidates.map((candidate) => candidate.purpose))).toEqual(
      new Set(['broad asset document', 'broad host document', 'broad scene document', 'broad serialization document']),
    );
    expect(
      Object.fromEntries(
        ['scene', 'asset', 'host', 'serialization'].map((family) => [
          family,
          tranche6TypedStructCandidates.filter((candidate) => candidate.purpose === `broad ${family} document`).length,
        ]),
      ),
    ).toEqual({ asset: 76, host: 104, scene: 27, serialization: 143 });
    expect(trancheSix.every((candidate) => candidate.eligible && candidate.reasons.length === 0)).toBe(true);
    expect(trancheSix.every((candidate) => candidate.emission.mode === 'audit-only')).toBe(true);
    expect(new Set(tranche6TypedStructCandidates.map(candidateId)).size).toBe(tranche6TypedStructCandidates.length);
    expect(scene?.emission.pendingAccesses).toBe(14);
    expect(asset?.emission.pendingAccesses).toBe(10);
    expect(host?.emission.pendingAccesses).toBe(50);
    expect(serialization?.emission.pendingAccesses).toBe(25);
    expect(codec?.memberEscapes).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          member: 'parseToDocument',
          reason: 'receiver-sensitive-method',
          source: 'upstream/packages/particles-formats/src/formatRegistry.ts:23',
        }),
      ]),
    );
    expect(typedStructSummary(report)).toContain(
      '| `@flighthq/particles-formats:upstream/packages/particles-formats/src/formatRegistry.ts#ParticleFormatCodec` | `parseToDocument` | `receiver-sensitive-method` | `upstream/packages/particles-formats/src/formatRegistry.ts:23` |',
    );
    expect(
      tranche6TypedStructCandidates.some(
        (candidate) => candidate.name.endsWith('Backend') || candidate.source.includes('/host-'),
      ),
    ).toBe(false);
    expect(tranche6TypedStructCandidates.map((candidate) => candidate.name)).not.toEqual(
      expect.arrayContaining([
        'AcceleratorParseError',
        'CubeTextureLike',
        'EntityWithoutRuntime',
        'MeshGeometryGlData',
        'MeshGeometryRuntime',
        'MeshGeometryWgpuData',
        'ParticleDesignerRawDict',
      ]),
    );
  });

  it('keeps eligible audit-only schemas reflective until review enables them', () => {
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
    expect(output).toContain("_Runtime.field(value, 'x')");
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
    expect(output).toContain('_Runtime.callValue(value.callback');
    expect(output).toContain("_Runtime.callProperty(value, 'method'");
    expect(output).toContain('final __typedStruct0 = _Runtime.callValue(factory');
    expect(output).toContain('__typedStruct0 == null ? _Runtime.UNDEFINED : __typedStruct0.optional');
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
      new Set(['@flighthq/types:upstream/packages/types/src/Vector2.ts#Vector2']),
    );
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
    expect(output).toContain("_Runtime.field(value, 'sibling')");
    expect(output).toContain("_Runtime.field(value, 'collision')");
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

  it('keeps computed, incompatible-union, and presence-sensitive accesses dynamic', () => {
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
    expect(output).toContain("_Runtime.field(value, 'x')");
    expect(output).toContain("_Runtime.hasField(value, 'x')");
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

function candidateId(candidate: TypedStructCandidate): string {
  return `${candidate.packageName}:${candidate.source}#${candidate.name}`;
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
