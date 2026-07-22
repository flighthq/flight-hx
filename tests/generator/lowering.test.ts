import { execFileSync } from 'node:child_process';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { emitHaxeModule } from '../../generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../generator/src/lower/typescript.ts';

describe('TypeScript lowering and Haxe emission', () => {
  it('normalizes pure functions into deterministic executable Haxe', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/math/src/sample.ts',
      `
        export const EPSILON = 1e-6;
        export function clamp(value: number, min: number, max: number): number {
          return value < min ? min : value > max ? max : value;
        }
        export function normalize(value: number, epsilon: number = EPSILON): number {
          if (Math.abs(value) < epsilon) return 0;
          let result = value;
          for (let i = 0; i < 2; i++) result /= 2;
          return result;
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/math', '/workspace');

    expect(lowered.diagnostics).toEqual([]);
    const module = {
      declarations: lowered.declarations,
      imports: [],
      name: 'MathFixture',
      packageName: '@flighthq/math',
    };
    const output = emitHaxeModule(module);
    expect(output).toBe(emitHaxeModule(module));
    expect(output).toContain('class MathFixture');
    expect(output).toContain('static function clamp');
    expect(output).toContain('FlightRuntime.select');
  });

  it('compiles and runs the generated module through Haxe', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/math/src/sample.ts',
      `
        export function clamp(value: number, min: number, max: number): number {
          return value < min ? min : value > max ? max : value;
        }
        export function quarter(value: number): number {
          let result = value;
          for (let i = 0; i < 2; i++) result /= 2;
          return result;
        }
        export function sumOdd(limit: number): number {
          let result = 0;
          for (let i = 0; i < limit; i++) {
            if (i % 2 === 0) continue;
            result += i;
          }
          return result;
        }
        export function withCleanup(fn: () => number, cleanup: () => void): number {
          try { return fn(); } finally { cleanup(); }
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/math', '/workspace');
    const fixtureDirectory = path.resolve('build/haxe-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(
      path.join(packageDirectory, 'MathFixture.hx'),
      emitHaxeModule({
        declarations: lowered.declarations,
        imports: [],
        name: 'MathFixture',
        packageName: '@flighthq/math',
      }),
    );
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.MathFixture.*;
        class Main {
          static function main() {
            if (clamp(12, 0, 10) != 10) throw 'clamp failed';
            if (quarter(8) != 2) throw 'quarter failed';
            if (sumOdd(6) != 9) throw 'for continue failed';
            var cleaned = 0;
            if (withCleanup(function() return 7, function() cleaned++) != 7 || cleaned != 1) {
              throw 'finally return failed';
            }
            try withCleanup(function() { throw 'expected'; }, function() cleaned++) catch (_:Dynamic) {}
            if (cleaned != 2) throw 'finally throw failed';
          }
        }
      `,
    );

    expect(lowered.diagnostics).toEqual([]);
    expect(() =>
      execFileSync('node', ['tooling/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'Main', '--interp'], {
        cwd: path.resolve('.'),
        stdio: 'pipe',
      }),
    ).not.toThrow();
  });

  it('compiles structural interfaces and aliases as Haxe typedefs', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/types/src/Vector2.ts',
      `
        export interface Entity { id: number; }
        export interface Vector2Like { x: number; y: number; label?: string; }
        export interface Vector2 extends Entity { x: number; y: number; }
        export type Callback<T> = (value: T) => void;
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/types', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypesFixture',
      packageName: '@flighthq/types',
    });
    const fixtureDirectory = path.resolve('build/haxe-type-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'TypesFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.TypesFixture.Callback;
        import flight.TypesFixture.Vector2;
        import flight.TypesFixture.Vector2Like;
        class Main {
          static function main() {
            final value:Vector2 = { id: 1, x: 2, y: 3 };
            final like:Vector2Like = { x: value.x, y: value.y };
            final callback:Callback<Float> = function(value) return;
            callback(like.x);
          }
        }
      `,
    );

    expect(lowered.diagnostics).toEqual([]);
    expect(() =>
      execFileSync('node', ['tooling/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'Main', '--interp'], {
        cwd: path.resolve('.'),
        stdio: 'pipe',
      }),
    ).not.toThrow();
  });

  it('lowers for-of control flow without diagnostics', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/math/src/sample.ts',
      'export function unsupported(values: number[]): number { for (const value of values) return value; return 0; }',
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/math', '/workspace');

    expect(lowered.diagnostics).toEqual([]);
    expect(lowered.declarations).toHaveLength(1);
    expect(lowered.declarations[0]).toMatchObject({ kind: 'function', name: 'unsupported' });
  });

  it('preserves typeof locals, void side effects, nested async functions, and async iteration', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function exercise(value: unknown, task: () => void, values: AsyncIterable<number>) {
          void task();
          async function nested(): Promise<string> { return typeof value; }
          for await (const item of values) void item;
          return nested();
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ExampleFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('FlightRuntime.voidValue(FlightRuntime.callValue(task');
    expect(output).toContain('FlightRuntime.typeofValue(value)');
    expect(output).toContain('FlightAsync.make(function():flight.internal.FlightPromise<String>');
    expect(output).toContain('FlightRuntime.asyncIterator(values)');
  });

  it('preserves computed object keys as runtime values', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/entity/src/sample.ts',
      `
        const RuntimeKey = Symbol.for('Runtime');
        export function createRuntime() {
          return { [RuntimeKey]: { alive: true }, plain: 1 };
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/entity', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'EntityFixture',
      packageName: '@flighthq/entity',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('FlightRuntime.objectFromPairs([{ key: RuntimeKey');
    expect(output).not.toContain('__RuntimeKey');
  });

  it('preserves JavaScript property names that are Haxe keywords', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/host/src/sample.ts',
      `export function ignoreFailure(task: Promise<void>) { task.catch(() => undefined); }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/host', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'HostFixture',
      packageName: '@flighthq/host',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("FlightRuntime.callProperty(task, 'catch'");
    expect(output).not.toContain('.catchError(');
  });

  it('preserves method receivers for spread calls', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function append(target: number[], values: number[]) { target.push(...values); }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'SpreadFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("FlightRuntime.callProperty(target, 'push', FlightRuntime.concatArrays");
  });

  it('propagates optional chains through properties and element access', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function read(value: any, key: string) { value?.nested.call(); value?.slice(1).trim(); return value?.nested?.[key]; }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'OptionalFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("FlightRuntime.callOptionalProperty(FlightRuntime.optionalField(value, 'nested'), 'call'");
    expect(output).toContain("FlightRuntime.callOptionalProperty(value, 'slice'");
    expect(output).toContain("FlightRuntime.optionalIndex(FlightRuntime.optionalField(value, 'nested'), key)");
  });

  it('deletes the owning object property instead of its evaluated value', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function remove(value: any, key: string) { delete value[key]; delete value.fixed; }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'DeleteFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('FlightRuntime.deleteIndex(value, key)');
    expect(output).toContain("FlightRuntime.deleteField(value, 'fixed')");
  });

  it('applies destructuring defaults only to undefined values', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function read(value: any) { const { mode = 'default' } = value; return mode; }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'DestructureFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("FlightRuntime.defaultUndefined(FlightRuntime.field(__destructure0, 'mode')");
  });

  it('erases TypeScript this parameters from runtime function arity', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export const handler = function (this: HTMLElement, event: string) { return this.id + event; };`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ThisParameterFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function(event:String)');
    expect(output).not.toContain('this_:');
  });

  it('distinguishes strict and loose equality', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function compare(a: any, b: any) { return [a === b, a == b]; }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'EqualityFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('FlightRuntime.strictEquals(a, b)');
    expect(output).toContain('FlightRuntime.looseEquals(a, b)');
  });

  it('preserves Haxe keyword property names in JavaScript objects', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function make() { return { operator: 'source-over', default: true }; }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'KeywordObjectFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("{ key: 'operator'");
    expect(output).toContain("{ key: 'default'");
    expect(output).not.toContain('operator_:');
  });

  it('orders flattened static initializers after the module values they reference', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export const entries = [renderer]; export const renderer = { submit() {} };`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'StaticOrderFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output.indexOf('static final renderer')).toBeLessThan(output.indexOf('static final entries'));
  });

  it('preserves the supplied argument count for Array.fill calls', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function apply(value: any[]) { value.fill(1); value.fill(2, 3); }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'FillArityFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('FlightRuntime.fill(value, 1.0, 0, null, 1)');
    expect(output).toContain('FlightRuntime.fill(value, 2.0, 3.0, null, 2)');
  });

  it('preserves negative-zero normalization and fractional sort comparators', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function normalize(value: number) { return -value + 0; }
       export function order(values: any[]) { return values.sort((a, b) => b.weight - a.weight); }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'NumericSemanticsFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('FlightRuntime.normalizeZero(-value)');
    expect(output).toContain("return (FlightRuntime.field(b, 'weight') - FlightRuntime.field(a, 'weight'))");
    expect(output).not.toContain('return Std.int(');
  });

  it('emits oversized private helpers as direct calls for hxcpp portability', () => {
    const parameters = Array.from({ length: 27 }, (_, index) => `p${index}: number`).join(', ');
    const arguments_ = Array.from({ length: 27 }, (_, index) => String(index)).join(', ');
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `function oversized(${parameters}) { return p0 + p26; }
       export function invoke() { return oversized(${arguments_}); }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CppArityFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('private static function oversized(__flightArguments:Array<Dynamic>)');
    expect(output).toContain('CppArityFixture.oversized(cast ([');
    expect(output).not.toContain('FlightRuntime.callValue(CppArityFixture.oversized');
  });
});
