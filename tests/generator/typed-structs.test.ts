import path from 'node:path';
import ts from 'typescript';

import {
  createTypedStructRegistry,
  typedStructRegistry,
  type TypedStructCandidate,
} from '../../tools/generator/src/analyze/typed-structs.ts';
import { upstreamTypeScriptProgram } from '../../tools/generator/src/analyze/program.ts';
import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';
import type { IrExpression, IrTypedStructBinding } from '../../tools/generator/src/model/ir.ts';

const fixtureCandidate: TypedStructCandidate = {
  name: 'Vector2',
  packageName: '@flighthq/types',
  purpose: 'fixture numeric leaf',
  source: 'upstream/packages/types/src/Vector2.ts',
};

describe('typed struct analysis', () => {
  it('audits the initial canonical allowlist without enabling Rectangle prematurely', () => {
    const workspace = path.resolve('.');
    const programAndChecker = upstreamTypeScriptProgram(workspace);
    const report = typedStructRegistry(workspace, 'fixture', undefined, programAndChecker).report;
    const rectangle = report.candidates.find((candidate) => candidate.name === 'Rectangle');
    const color = report.candidates.find((candidate) => candidate.name === 'ColorTransform');

    expect(report.summary.candidates).toBe(7);
    expect(report.summary.bindableAccesses).toBeGreaterThan(2_000);
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
  });

  it('binds safe named fields in the IR while preserving reflective emission', () => {
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
        value.callback(value.y);
        value.method();
        return value.optional ?? value.requiredUndefined ?? 0;
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
      'callback',
      'optional',
      'requiredUndefined',
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
    expect(output).toContain("_Runtime.field(value, 'x')");
    expect(output).toContain("_Runtime.setField(value, 'y'");
    expect(output).not.toContain('value.x');
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

function lowerFixture(text: string) {
  const workspace = '/workspace';
  const fileName = `${workspace}/${fixtureCandidate.source}`;
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
  const registry = createTypedStructRegistry(workspace, 'fixture', [fixtureCandidate], program, checker);
  return {
    lowered: lowerTypeScriptSource(source, '@flighthq/types', workspace, checker, registry),
    registry,
  };
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
