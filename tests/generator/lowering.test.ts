import { execFileSync } from 'node:child_process';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { padContextualObjectFunctionParameters } from '../../tools/generator/src/emit/core.ts';
import {
  emitHaxeModule,
  resetStaticLoweringEmissionCounts,
  staticLoweringEmissionCounts,
} from '../../tools/generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';

function typedSource(fileName: string, text: string): { checker: ts.TypeChecker; source: ts.SourceFile } {
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts', 'lib.dom.d.ts'],
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const source = ts.createSourceFile(fileName, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const getSourceFile = host.getSourceFile.bind(host);
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === fileName ? source : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([fileName], options, host);
  const programSource = program.getSourceFile(fileName);
  if (!programSource) throw new Error(`Fixture program is missing ${fileName}`);
  return { checker: program.getTypeChecker(), source: programSource };
}

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
    expect(output).not.toContain('@:expose');
    expect(output).toContain('static function clamp');
    expect(output).toContain('_Runtime.select');
  });

  it('leaves JavaScript exposure to target-specific build configuration', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/service.ts',
      `
        export class Service {
          value: number;
          constructor(value: number) {
            this.value = value;
          }
        }
        export function createService(value: number): Service {
          return new Service(value);
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');

    expect(lowered.diagnostics).toEqual([]);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'Service',
      packageName: '@flighthq/example',
    });
    expect(output).toContain('class Service');
    expect(output).not.toContain('@:expose');
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
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
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
        import flighthq.MathFixture.*;
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
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
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
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'TypesFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flighthq.TypesFixture.Callback;
        import flighthq.TypesFixture.Vector2;
        import flighthq.TypesFixture.Vector2Like;
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
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
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
    expect(output).toContain('_Runtime.voidValue(_Runtime.callValue(task');
    expect(output).toContain('_Runtime.typeofValue(value)');
    expect(output).toContain('function():flighthq._internal._Promise<String>');
    expect(output).toContain('_Async.protect(function():Dynamic');
    expect(output).toContain('_Runtime.asyncIterator(values)');
  });

  it('lowers straight-line awaits to ordered flatMap continuations', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function combine(first: Promise<number>, second: Promise<number>): Promise<number> {
          const left = await first;
          const right = await second;
          return left + right;
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
    expect(output).not.toContain('_Async.make');
    expect(output).not.toContain('_Async.awaitValue');
    expect(output).toContain('_Async.protect(function():Dynamic');
    expect(output).toContain('_Async.flatMap(first, function(__awaitValue');
    expect(output).toContain('_Async.flatMap(second, function(__awaitValue');
    expect(output).toContain('_Async.resolve((left + right))');

    const fixtureDirectory = path.resolve('build/haxe-async-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'ExampleFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flighthq.ExampleFixture.combine;
        import flighthq._internal._Async;
        class Main {
          static function main() {
            var result = 0;
            combine(_Async.resolve(4), _Async.resolve(5)).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 9) throw 'flatMap await lowering failed';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
    ).not.toThrow();
  });

  it('wraps async functions without awaits as rejected-or-resolved promises', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function constant(): Promise<number> {
          return 7;
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

    expect(output).not.toContain('_Async.make');
    expect(output).toContain('_Async.protect(function():Dynamic');
    expect(output).toContain('_Async.resolve(7.0)');
  });

  it('propagates returns through awaited conditional branches', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function choose(flag: boolean, pending: Promise<number>): Promise<number> {
          if (flag) {
            const value = await pending;
            return value + 1;
          }
          return 2;
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
      name: 'AsyncBranchFixture',
      packageName: '@flighthq/example',
    });

    expect(output).not.toContain('_Async.make');
    expect(output).not.toContain('_Async.awaitValue');
    expect(output).toContain('_Async.finishFlow');
    expect(output).toContain('_Async.flowReturn');

    const fixtureDirectory = path.resolve('build/haxe-async-branch-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncBranchFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flighthq.AsyncBranchFixture.choose;
        import flighthq._internal._Async;
        class Main {
          static function main() {
            var selected = 0;
            choose(true, _Async.resolve(4)).then(function(value) {
              selected = Std.int(value);
              return value;
            });
            if (selected != 5) throw 'awaited true branch failed';
            choose(false, _Async.resolve(9)).then(function(value) {
              selected = Std.int(value);
              return value;
            });
            if (selected != 2) throw 'synchronous false branch failed';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
    ).not.toThrow();
  });

  it('preserves rejection recovery and finally overrides across awaits', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function recoverValue(pending: Promise<number>, cleanup: () => void): Promise<number> {
          try {
            return await pending;
          } catch (error) {
            return 6;
          } finally {
            cleanup();
          }
        }
        export async function overrideValue(pending: Promise<number>): Promise<number> {
          try {
            return await pending;
          } finally {
            return 8;
          }
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
      name: 'AsyncTryFixture',
      packageName: '@flighthq/example',
    });

    expect(output).not.toContain('_Async.make');
    expect(output).not.toContain('_Async.awaitValue');
    expect(output).toContain('_Async.recover');
    expect(output).toContain('_Async.finalizeFlow');

    const fixtureDirectory = path.resolve('build/haxe-async-try-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncTryFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flighthq.AsyncTryFixture.overrideValue;
        import flighthq.AsyncTryFixture.recoverValue;
        import flighthq._internal._Async;
        class Main {
          static function main() {
            var result = 0;
            var cleanups = 0;
            recoverValue(_Async.reject('expected'), function() cleanups++).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 6 || cleanups != 1) throw 'async catch/finally failed';
            overrideValue(_Async.resolve(4)).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 8) throw 'async finally return override failed';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
    ).not.toThrow();
  });

  it('lowers awaited for-of bodies with break and continue through a flow trampoline', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function sumSelected(
          values: number[],
          load: (value: number) => Promise<number>,
        ): Promise<number> {
          let total = 0;
          for (const value of values) {
            if (value === 2) continue;
            total += await load(value);
            if (total > 4) break;
          }
          return total;
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
      name: 'AsyncLoopFixture',
      packageName: '@flighthq/example',
    });

    expect(output).not.toContain('_Async.make');
    expect(output).not.toContain('_Async.awaitValue');
    expect(output).toContain('_Async.repeatFlow');
    expect(output).toContain('_Async.flowContinue');
    expect(output).toContain('_Async.flowBreak');

    const fixtureDirectory = path.resolve('build/haxe-async-loop-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncLoopFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flighthq.AsyncLoopFixture.sumSelected;
        import flighthq._internal._Async;
        class Main {
          static function main() {
            var result = 0;
            sumSelected([1, 2, 3, 4], function(value) return _Async.resolve(value)).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 8) throw 'async for-of control flow failed';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
    ).not.toThrow();
  });

  it('lowers awaited while and for loops without recursive portable stack growth', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function count(load: (value: number) => Promise<number>): Promise<number> {
          let total = 0;
          while (total < 3) total += await load(1);
          for (let index = 0; index < 2; index++) total += await load(1);
          return total;
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
      name: 'AsyncNumericLoopFixture',
      packageName: '@flighthq/example',
    });

    expect(output).not.toContain('_Async.make');
    expect(output.match(/_Async\.repeatFlow/gu)).toHaveLength(2);
    expect(output).toContain('_Async.continueIteration');

    const fixtureDirectory = path.resolve('build/haxe-async-numeric-loop-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncNumericLoopFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flighthq.AsyncNumericLoopFixture.count;
        import flighthq._internal._Async;
        class Main {
          static function main() {
            var result = 0;
            count(function(value) return _Async.resolve(value)).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 5) throw 'async while/for lowering failed';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        {
          cwd: path.resolve('.'),
          stdio: 'pipe',
        },
      ),
    ).not.toThrow();
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
    expect(output).toContain('_Runtime.objectFromPairs([{ key: RuntimeKey');
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
    expect(output).toContain('flighthq._internal._Async.recover(task');
    expect(output).not.toContain("_Runtime.callProperty(task, 'catch'");
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
    expect(output).toContain("_Runtime.callProperty(target, 'push', _Runtime.concatArrays");
  });

  it('uses packed arrays for dynamically called variadic function values', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/signals/src/sample.ts',
      `
        type Emitter = { emit: (...args: any[]) => void };
        export function makeDispatch(slot: (value: number) => void) {
          return (...args: any[]) => slot(...args);
        }
        export function emit(emitter: Emitter, ...args: any[]) {
          emitter.emit(...args);
        }
        export function forward(emitter: Emitter, ...args: any[]) {
          emit(emitter, ...args);
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/signals', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'VariadicValueFixture',
      packageName: '@flighthq/signals',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function(args:Array<Dynamic>)');
    expect(output).not.toContain('function(...args:Dynamic)');
    expect(output).toContain('_Runtime.apply(slot, _Runtime.concatArrays([_Runtime.toArray(args)]))');
    expect(output).toContain(
      "_Runtime.callProperty(emitter, 'emit', cast ([_Runtime.toArray(args)] : Array<Dynamic>))",
    );
    expect(output).toContain(
      '_Runtime.callHaxeRestValue(emit, _Runtime.concatArrays([[emitter], _Runtime.toArray(args)]), 1)',
    );
  });

  it('routes WebGL2 context access through its maintained internal binding', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-gl/src/sample.ts',
      `
        export function draw(gl: WebGL2RenderingContext, buffer: WebGLBuffer) {
          gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
          const alias = gl;
          alias.drawArrays(gl.TRIANGLES, 0, 3);
          gl.bufferData(gl.ARRAY_BUFFER, 64, gl.STATIC_DRAW);
          gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, null);
          gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 1, 1, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
        }
        export const configure = (gl: any) => gl.clear(gl.COLOR_BUFFER_BIT);
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-gl', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'WebGlFixture',
      packageName: '@flighthq/render-gl',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      'flighthq._internal.backend.WebGl2Backend.bindBuffer(gl, flighthq._internal.backend.WebGl2Backend.ARRAY_BUFFER, buffer)',
    );
    expect(output).toContain(
      'flighthq._internal.backend.WebGl2Backend.drawArrays(alias, flighthq._internal.backend.WebGl2Backend.TRIANGLES, 0.0, 3.0)',
    );
    expect(output).toContain('flighthq._internal.backend.WebGl2Backend.bufferData(');
    expect(output).not.toContain('WebGl2Backend.bufferDataSize(');
    expect(output).toContain('flighthq._internal.backend.WebGl2Backend.texImage2DSource(');
    expect(output).toContain('flighthq._internal.backend.WebGl2Backend.texImage2D(');
    expect(output).toContain(
      'flighthq._internal.backend.WebGl2Backend.clear(gl, flighthq._internal.backend.WebGl2Backend.COLOR_BUFFER_BIT)',
    );
    expect(output).not.toContain('WebGl2Backend.call(');
    expect(output).not.toContain('WebGl2Backend.field(');
    expect(output).not.toContain("_Runtime.callProperty(gl, 'bindBuffer'");
  });

  it('fails generation for WebGL2 members absent from the typed endpoint inventory', () => {
    const emit = (body: string) => {
      const source = ts.createSourceFile(
        '/workspace/upstream/packages/render-gl/src/sample.ts',
        `export function use(gl: WebGL2RenderingContext) { ${body} }`,
        ts.ScriptTarget.Latest,
        true,
        ts.ScriptKind.TS,
      );
      const lowered = lowerTypeScriptSource(source, '@flighthq/render-gl', '/workspace');
      expect(lowered.diagnostics).toEqual([]);
      return () =>
        emitHaxeModule({
          declarations: lowered.declarations,
          imports: [],
          name: 'WebGlInventoryFixture',
          packageName: '@flighthq/render-gl',
        });
    };

    expect(emit('gl.futureMethod();')).toThrow('WebGL2 method is not in the typed backend inventory: futureMethod');
    expect(emit('return gl.FUTURE_CONSTANT;')).toThrow(
      'WebGL2 constant is not in the typed backend inventory: FUTURE_CONSTANT',
    );
    expect(emit('gl.clear(...[gl.COLOR_BUFFER_BIT]);')).toThrow(
      'WebGL2 spread call has no typed backend endpoint: clear',
    );
    expect(emit("const name = 'ARRAY_BUFFER'; return gl[name];")).toThrow(
      'WebGL2 computed property access is not a recognized closed string-literal constant union',
    );
  });

  it('lowers computed WebGL2 constants to an exhaustive typed constant switch', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-gl/src/sample.ts',
      `
        export function read(
          gl: WebGL2RenderingContext,
          realization: { src: string; equation?: string },
        ) {
          gl.blendEquation(gl[realization.equation ?? 'FUNC_ADD']);
          return gl[realization.src];
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-gl', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'WebGlComputedConstantFixture',
      packageName: '@flighthq/render-gl',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      "(switch (_Runtime.coalesce(_Runtime.field(realization, 'equation'), function():Dynamic return cast 'FUNC_ADD')) { case 'FUNC_ADD':",
    );
    expect(output).toContain("case 'MIN': flighthq._internal.backend.WebGl2Backend.MIN;");
    expect(output).toContain(
      "default: throw 'WebGL2 computed constant is outside the closed GlBlendEquation domain: upstream/packages/render-gl/src/sample.ts';",
    );
    expect(output).toContain("(switch (_Runtime.field(realization, 'src')) { case 'DST_COLOR':");
    expect(output).toContain(
      "default: throw 'WebGL2 computed constant is outside the closed GlBlendFactor domain: upstream/packages/render-gl/src/sample.ts';",
    );
    expect(output).not.toContain("case 'ACTIVE_UNIFORMS':");
    expect(output).not.toContain('_Runtime.getIndex(gl,');
  });

  it('routes Canvas 2D context access through its maintained internal binding', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/render-canvas/src/sample.ts',
      `
        interface Command { draw(context: CanvasRenderingContext2D): void }
        export const command: Command = {
          draw(ctx) {
            ctx.fillStyle = '#fff';
            ctx.lineCap = 'round';
            ctx.lineJoin = 'bevel';
            ctx.miterLimit = 4;
            ctx.beginPath();
            ctx.quadraticCurveTo(1, 2, 3, 4);
            ctx.bezierCurveTo(1, 2, 3, 4, 5, 6);
            ctx.ellipse(5, 5, 2, 3, 0, 0, Math.PI * 2);
            if (typeof ctx.roundRect === 'function') ctx.roundRect(0, 0, 10, 10, 2);
            ctx.closePath();
            ctx.fillRect(0, 0, 10, 10);
          },
        };
        export const runner = (ctx: any) => ctx.source;
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-canvas', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CanvasFixture',
      packageName: '@flighthq/render-canvas',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.setField(ctx, 'fillStyle'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.setField(ctx, 'lineCap'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'quadraticCurveTo'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'bezierCurveTo'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'ellipse'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'roundRect'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'closePath'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'fillRect'");
    expect(output).not.toContain("_Runtime.callProperty(ctx, 'quadraticCurveTo'");
    expect(output).not.toContain("Canvas2dBackend.field(ctx, 'roundRect')");
    expect(output).not.toContain("_Runtime.callProperty(ctx, 'fillRect'");
    expect(output).toContain("_Runtime.field(ctx, 'source')");
    expect(output).not.toContain("Canvas2dBackend.field(ctx, 'source')");
  });

  it('fails generation for Canvas 2D members absent from the typed endpoint inventory', () => {
    const emit = (body: string) => {
      const { checker, source } = typedSource(
        '/workspace/upstream/packages/render-canvas/src/sample.ts',
        `export function use(ctx: CanvasRenderingContext2D) { ${body} }`,
      );
      const lowered = lowerTypeScriptSource(source, '@flighthq/render-canvas', '/workspace', checker);
      expect(lowered.diagnostics).toEqual([]);
      return () =>
        emitHaxeModule({
          declarations: lowered.declarations,
          imports: [],
          name: 'CanvasInventoryFixture',
          packageName: '@flighthq/render-canvas',
        });
    };

    expect(emit('ctx.arcTo(0, 0, 1, 1, 2);')).toThrow('Canvas2D method is not in the typed backend inventory: arcTo');
    expect(emit('return ctx.direction;')).toThrow('Canvas2D field is not in the typed backend inventory: direction');
    expect(emit("ctx.direction = 'rtl';")).toThrow(
      'Canvas2D property is not in the typed backend inventory: direction',
    );
  });

  it('lowers typed collection receivers to maintained wrapper calls', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/entity/src/collections.ts',
      `
        type AliasMap = Map<string, number>;
        export function collections(
          map: AliasMap,
          readonlyMap: ReadonlyMap<string, number>,
          wrappedMap: Readonly<Map<string, number>>,
          maybeMap: Map<string, number> | undefined,
          set: Set<string>,
          weakMap: WeakMap<object, number>,
          weakSet: WeakSet<object>,
          key: object,
          dynamic: any,
        ) {
          map.set('one', 1);
          map.get('one');
          map.has('one');
          map.delete('one');
          map.forEach((value) => value);
          readonlyMap.entries();
          wrappedMap.get('one');
          maybeMap?.get('one');
          set.add('one');
          set.delete('one');
          set.values();
          weakMap.set(key, 1);
          weakMap.delete(key);
          weakSet.add(key);
          weakSet.has(key);
          dynamic.get('one');
          return map.size + set.size;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/entity', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CollectionFixture',
      packageName: '@flighthq/entity',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('(cast map : flighthq._internal._Map).set(');
    expect(output).toContain('(cast map : flighthq._internal._Map).delete_(');
    expect(output).toContain('(cast readonlyMap : flighthq._internal._Map).entries(');
    expect(output).toContain('(cast wrappedMap : flighthq._internal._Map).get(');
    expect(output).toContain('(cast set : flighthq._internal._Set).add(');
    expect(output).toContain('(cast weakMap : flighthq._internal._WeakMap).set(');
    expect(output).toContain('(cast weakSet : flighthq._internal._WeakSet).has(');
    expect(output).toContain('(cast map : flighthq._internal._Map).size');
    expect(output).toContain('__collection');
    expect(output).not.toContain("_Runtime.callProperty(map, 'get'");
    expect(output).not.toContain("_Runtime.field(map, 'size')");
    expect(output).toContain("_Runtime.callProperty(dynamic_, 'get'");
  });

  it('emits direct calls for generated class receivers and retains internal-class fallbacks', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/internalClass.ts',
      `
        class Counter {
          private value = 0;
          bump(delta: number): void {
            this.add(delta);
          }
          private add(delta: number): void {
            this.value += delta;
          }
        }
        export function advance(counter: Counter, maybe: Counter | undefined, dynamic: any): void {
          counter.bump(1);
          maybe?.bump(2);
          counter.bump(...([4] as [number]));
          dynamic.bump(3);
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'InternalClassFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('@:keep\nclass Counter');
    expect(output).toContain('(cast this : Counter).add(delta)');
    expect(output).toContain('(cast counter : Counter).bump(1.0)');
    expect(output).toContain('(cast __generatedClass');
    expect(output).toContain(': Counter).bump(2.0)');
    expect(output).toContain("_Runtime.callProperty(counter, 'bump', _Runtime.concatArrays");
    expect(output).toContain("_Runtime.callProperty(dynamic_, 'bump'");
    expect(output).not.toContain("_Runtime.callProperty(counter, 'bump', cast ([1.0]");
  });

  it('routes typed canvas-element operations separately from the Canvas 2D context', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-gl/src/sample.ts',
      `
        export function attach(canvas: HTMLCanvasElement, listener: EventListener) {
          const gl = canvas.getContext('webgl2', { alpha: true });
          canvas.width = canvas.width + 1;
          canvas.height = 480;
          canvas.addEventListener('click', listener);
          canvas.removeEventListener('click', listener);
          canvas.getBoundingClientRect();
          canvas.toDataURL('image/png');
          return gl;
        }
        export function encode(offscreen: OffscreenCanvas) {
          return offscreen.convertToBlob({ type: 'image/png' });
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-gl', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CanvasElementFixture',
      packageName: '@flighthq/render-gl',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("CanvasElementBackend.call(canvas, 'getContext'");
    expect(output).toContain("CanvasElementBackend.field(canvas, 'width')");
    expect(output).toContain("CanvasElementBackend.setField(canvas, 'width'");
    expect(output).toContain("CanvasElementBackend.setField(canvas, 'height'");
    expect(output).toContain("CanvasElementBackend.call(canvas, 'addEventListener'");
    expect(output).toContain("CanvasElementBackend.call(canvas, 'removeEventListener'");
    expect(output).toContain("CanvasElementBackend.call(canvas, 'getBoundingClientRect'");
    expect(output).toContain("CanvasElementBackend.call(canvas, 'toDataURL'");
    expect(output).toContain("CanvasElementBackend.call(offscreen, 'convertToBlob'");
    expect(output).not.toContain("Canvas2dBackend.call(canvas, 'getContext'");
    expect(output).not.toContain("_Runtime.callProperty(canvas, 'getContext'");
  });

  it('routes DOM roots and their aliases through bounded typed backends', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/application/src/sample.ts',
      `
        export function roots() {
          const win = window as Window & { getScreenDetails(): Promise<unknown> };
          const doc = document;
          const nav = navigator as Navigator & { getBattery(): Promise<unknown> };
          const values = [window, document, navigator];
          const hasScreen = 'screen' in win;
          const hasBody = 'body' in doc;
          const hasShare = 'share' in navigator;
          window.addEventListener('resize', () => {});
          const media = window.matchMedia('(dark)');
          const details = win.getScreenDetails();
          document.title = 'Flight';
          const canvas = document.createElement('canvas');
          const focused = document.hasFocus();
          const pads = navigator.getGamepads();
          const language = navigator.language;
          const battery = nav.getBattery();
          return { values, hasScreen, hasBody, hasShare, media, details, canvas, focused, pads, language, battery };
        }
        export function local(
          window: Record<string, unknown>,
          document: { title: string },
          navigator: Record<string, unknown>,
        ) {
          return [window, document.title, navigator, 'local' in window, 'local' in document, 'local' in navigator];
        }
        export function availability() {
          return typeof window !== 'undefined' && typeof document !== 'undefined' && typeof navigator !== 'undefined';
        }
        export function shadowed(navigator: Record<string, unknown>) {
          const localNavigator = navigator;
          return ['share' in localNavigator, localNavigator.share];
        }
        export function mutableAlias() {
          let mutableNavigator = navigator;
          mutableNavigator = {};
          return 'share' in mutableNavigator;
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/application', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'DomRootsFixture',
      packageName: '@flighthq/application',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('DomWindowBackend.value()');
    expect(output).toContain('DomDocumentBackend.value()');
    expect(output).toContain('DomNavigatorBackend.value()');
    expect(output).toContain("DomWindowBackend.hasField(win, 'screen')");
    expect(output).toContain("DomDocumentBackend.hasField(doc, 'body')");
    expect(output).toContain(
      "DomNavigatorBackend.hasField(flighthq._internal.backend.DomNavigatorBackend.value(), 'share')",
    );
    expect(output).toContain(
      "DomWindowBackend.call(flighthq._internal.backend.DomWindowBackend.value(), 'addEventListener'",
    );
    expect(output).toContain("DomWindowBackend.call(flighthq._internal.backend.DomWindowBackend.value(), 'matchMedia'");
    expect(output).toContain("DomWindowBackend.call(win, 'getScreenDetails'");
    expect(output).toContain(
      "DomDocumentBackend.setField(flighthq._internal.backend.DomDocumentBackend.value(), 'title', 'Flight')",
    );
    expect(output).toContain(
      "DomDocumentBackend.call(flighthq._internal.backend.DomDocumentBackend.value(), 'createElement'",
    );
    expect(output).toContain(
      "DomDocumentBackend.call(flighthq._internal.backend.DomDocumentBackend.value(), 'hasFocus'",
    );
    expect(output).toContain(
      "DomNavigatorBackend.call(flighthq._internal.backend.DomNavigatorBackend.value(), 'getGamepads'",
    );
    expect(output).toContain(
      "DomNavigatorBackend.field(flighthq._internal.backend.DomNavigatorBackend.value(), 'language')",
    );
    expect(output).toContain("DomNavigatorBackend.call(nav, 'getBattery'");
    expect(output).toContain("_Runtime.field(document, 'title')");
    expect(output).toContain("_Runtime.hasField(window, 'local')");
    expect(output).toContain("_Runtime.hasField(document, 'local')");
    expect(output).toContain("_Runtime.hasField(navigator, 'local')");
    expect(output).toContain("_Runtime.typeofGlobal('window')");
    expect(output).toContain("_Runtime.typeofGlobal('document')");
    expect(output).toContain("_Runtime.typeofGlobal('navigator')");
    expect(output).toContain("_Runtime.hasField(localNavigator, 'share')");
    expect(output).toContain("_Runtime.field(localNavigator, 'share')");
    expect(output).toContain("_Runtime.hasField(mutableNavigator, 'share')");
    expect(output).not.toContain("_Runtime.globalValue('window')");
    expect(output).not.toContain("_Runtime.globalValue('document')");
    expect(output).not.toContain("_Runtime.globalValue('navigator')");
    expect(output).not.toContain("DomDocumentBackend.field(document, 'title')");
    expect(output).not.toContain('DomWindowBackend.hasField(window');
    expect(output).not.toContain('DomDocumentBackend.hasField(document');
    expect(output).not.toContain('DomNavigatorBackend.hasField(navigator');
    expect(output).not.toContain('DomNavigatorBackend.hasField(localNavigator');
    expect(output).not.toContain('DomNavigatorBackend.hasField(mutableNavigator');
    expect(output).not.toContain("DomNavigatorBackend.field(localNavigator, 'share')");
  });

  it('routes global Object operations through named portable bindings', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function merge(target: any, source: any) {
          Object.assign(target, source);
          return Object.keys(target).length + Object.entries(target).length;
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
      name: 'ObjectFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('flighthq._internal.DynamicObject.assign(target, source)');
    expect(output).toContain('flighthq._internal.DynamicObject.keys(target)');
    expect(output).toContain('flighthq._internal.DynamicObject.entries(target)');
    expect(output).not.toContain("globalValue', cast (['Object']");
    expect(output).not.toContain('Reflect.fields');
  });

  it('routes WebGPU constants through their target-independent backend without capturing locals', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-wgpu/src/sample.ts',
      `
        export const usage = GPUBufferUsage.COPY_DST | GPUTextureUsage.RENDER_ATTACHMENT;
        export const visibility = GPUShaderStage.VERTEX | GPUShaderStage.FRAGMENT;
        export const color = GPUColorWrite.ALL;
        export const mode = GPUMapMode.READ;
        export function local(GPUBufferUsage: { COPY_DST: number }) {
          return GPUBufferUsage.COPY_DST;
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-wgpu', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'WebGpuConstantsFixture',
      packageName: '@flighthq/render-wgpu',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("WebGpuConstantsBackend.value('GPUBufferUsage', 'COPY_DST')");
    expect(output).toContain("WebGpuConstantsBackend.value('GPUTextureUsage', 'RENDER_ATTACHMENT')");
    expect(output).toContain("WebGpuConstantsBackend.value('GPUShaderStage', 'VERTEX')");
    expect(output).toContain("WebGpuConstantsBackend.value('GPUColorWrite', 'ALL')");
    expect(output).toContain("WebGpuConstantsBackend.value('GPUMapMode', 'READ')");
    expect(output).toContain('return cast GPUBufferUsage.COPY_DST');
    expect(output.match(/WebGpuConstantsBackend\.value\('GPUBufferUsage', 'COPY_DST'\)/gu)).toHaveLength(1);
  });

  it('routes WebGPU device, queue, and canvas-context operations through typed backends', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-wgpu/src/sample.ts',
      `
        export function render(device: GPUDevice, context: GPUCanvasContext, adapter: GPUAdapter) {
          const queue = device.queue;
          const buffer = device.createBuffer({ size: 4, usage: GPUBufferUsage.COPY_DST });
          queue.writeBuffer(buffer, 0, new Uint8Array([1, 2, 3, 4]));
          context.configure({ device, format: 'rgba8unorm' });
          const texture = context.getCurrentTexture();
          device.queue.submit([]);
          return {
            buffer,
            texture,
            alignment: device.limits.minUniformBufferOffsetAlignment,
            textureSize: device.limits.maxTextureDimension2D,
            groups: adapter.limits.maxBindGroups,
          };
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-wgpu', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'WebGpuFixture',
      packageName: '@flighthq/render-wgpu',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("WebGpuDeviceBackend.field(device, 'queue')");
    expect(output).toContain("WebGpuDeviceBackend.call(device, 'createBuffer'");
    expect(output).toContain("WebGpuQueueBackend.call(queue, 'writeBuffer'");
    expect(output).toContain(
      "WebGpuQueueBackend.call(flighthq._internal.backend.WebGpuDeviceBackend.field(device, 'queue'), 'submit'",
    );
    expect(output).toContain("WebGpuCanvasContextBackend.call(context, 'configure'");
    expect(output).toContain("WebGpuCanvasContextBackend.call(context, 'getCurrentTexture'");
    expect(output).toContain("WebGpuDeviceBackend.field(device, 'limits')");
    expect(output).toContain(
      "WebGpuLimitsBackend.field(flighthq._internal.backend.WebGpuDeviceBackend.field(device, 'limits'), 'minUniformBufferOffsetAlignment')",
    );
    expect(output).toContain(
      "WebGpuLimitsBackend.field(flighthq._internal.backend.WebGpuDeviceBackend.field(device, 'limits'), 'maxTextureDimension2D')",
    );
    expect(output).toContain("WebGpuLimitsBackend.field(_Runtime.field(adapter, 'limits'), 'maxBindGroups')");
    expect(output).not.toContain("_Runtime.callProperty(device, 'createBuffer'");
    expect(output).not.toContain("_Runtime.callProperty(queue, 'writeBuffer'");
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
    expect(output).toContain("_Runtime.callOptionalProperty(_Runtime.optionalField(value, 'nested'), 'call'");
    expect(output).toContain("_Runtime.callOptionalProperty(value, 'slice'");
    expect(output).toContain("_Runtime.optionalIndex(_Runtime.optionalField(value, 'nested'), key)");
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
    expect(output).toContain('_Runtime.deleteIndex(value, key)');
    expect(output).toContain("_Runtime.deleteField(value, 'fixed')");
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
    expect(output).toContain("_Runtime.defaultUndefined(_Runtime.field(__destructure0, 'mode')");
  });

  it('retains destructuring receiver facts without changing dynamic emission', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/destructuring.ts',
      `export function read(
         [parameter0, parameter1]: readonly [number, number],
         compatible: number[] | Float32Array,
         indices: Uint16Array | Uint32Array,
         nullable: number[] | null,
         heterogeneous: number[] | Uint8Array,
         arrayLike: ArrayLike<number>,
         wider: readonly [number, number] | ReadonlyArray<number> | Readonly<Float32Array>,
         dictionary: { readonly [key: number]: number },
         regexpResult: RegExpMatchArray,
         nested: readonly [readonly [number, number]],
       ) {
         const [float0, float1] = new Float32Array(2);
         const [compatible0] = compatible;
         const [nullable0] = nullable;
         const [heterogeneous0] = heterogeneous;
         const [arrayLike0] = arrayLike;
         const [wider0] = wider;
         const [dictionary0] = dictionary;
         const [regexp0] = regexpResult;
         const [[nested0, nested1]] = nested;
         let assigned0 = 0;
         let assigned1 = 0;
         [assigned0, assigned1] = indices;
         return [
           parameter0,
           parameter1,
           float0,
           float1,
           compatible0,
           nullable0,
           heterogeneous0,
           arrayLike0,
           wider0,
           dictionary0,
           regexp0,
           nested0,
           nested1,
           assigned0,
           assigned1,
         ];
       }`,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'DestructuringAuditFixture',
      packageName: '@flighthq/example',
    });
    const emission = staticLoweringEmissionCounts();
    const ir = JSON.stringify(lowered.declarations);

    expect(lowered.diagnostics).toEqual([]);
    expect(ir).toContain('"destructuringSource":{"receiver":"Float32Array","source":"declaration"}');
    expect(ir).toContain('"destructuringSource":{"receiver":"Uint16ArrayOrUint32Array","source":"assignment"}');
    expect(ir).toContain('"destructuringSource":{"escape":"regexp-result-array","source":"declaration"}');
    expect(emission.destructuringReads).toEqual({
      assignment: { eligible: 2, parked: 0 },
      declaration: { eligible: 7, parked: 6 },
      parameter: { eligible: 2, parked: 0 },
    });
    expect(emission.destructuringEscapes).toEqual({
      'regexp-result-array': { assignment: 0, declaration: 1, parameter: 0 },
      'unproven-receiver': { assignment: 0, declaration: 5, parameter: 0 },
    });
    expect(emission.destructuringReceivers.Array).toEqual({ assignment: 0, declaration: 4, parameter: 2 });
    expect(emission.destructuringReceivers.ArrayOrFloat32Array).toEqual({
      assignment: 0,
      declaration: 1,
      parameter: 0,
    });
    expect(emission.destructuringReceivers.Float32Array).toEqual({
      assignment: 0,
      declaration: 2,
      parameter: 0,
    });
    expect(emission.destructuringReceivers.Uint16ArrayOrUint32Array).toEqual({
      assignment: 2,
      declaration: 0,
      parameter: 0,
    });
    expect(output.match(/_Runtime\.getIndex\(/gu)).toHaveLength(17);
    expect(output).not.toContain('__flight_destructuring_index');
    expect(output).not.toContain('_StaticIndex.read');
  });

  it('emits direct Array reads for synthetic iteration bindings only', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function readPairs(values: Array<[number, string]>) {
         for (const [key, value] of values) void key + value;
       }
       export async function readAsyncPairs(values: AsyncIterable<[number, string]>) {
         for await (const [key, value] of values) void key + value;
       }
       export function readPair(value: [number, string]) {
         const [key, label] = value;
         return key + label;
       }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'IterationBindingFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output.match(/_StaticIndex\.readArray\(__iteration\d+,/gu)).toHaveLength(4);
    expect(output).not.toContain('_Runtime.getIndex(__iteration');
    expect(output.match(/_Runtime\.getIndex\(__destructure\d+,/gu)).toHaveLength(2);
    expect(staticLoweringEmissionCounts().syntheticArrayReads).toEqual({
      highArityArguments: 0,
      iterationBindings: 4,
    });
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
    expect(output).toContain('_Runtime.strictEquals(a, b)');
    expect(output).toContain('_Runtime.looseEquals(a, b)');
  });

  it('emits only checker-proven primitive and indexed operations directly', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        interface Float32Array {
          [index: number]: number;
        }

        export function inspect(
          flag: boolean,
          maybe: boolean | null,
          a: number,
          b: number,
          text: string,
          values: number[],
          floats: globalThis.Float32Array,
          mixed: globalThis.Float32Array | Uint8Array,
          shadowed: Float32Array,
        ) {
          if (flag) a += 1;
          if (maybe) b += 1;
          const numericOrder = a < b;
          const stringOrder = text < 'z';
          const value = floats[0];
          values[1] = a;
          floats[2] += b;
          const mixedValue = mixed[3];
          const shadowedValue = shadowed[4];
          const logical = flag && true;
          const mixedLogical = flag && text;
          const selected = flag ? a : b;
          const nullableSelected = maybe ? a : b;
          const negated = !flag;
          return {
            logical,
            mixedLogical,
            mixedValue,
            negated,
            nullableSelected,
            numericOrder,
            selected,
            shadowedValue,
            stringOrder,
            value,
          };
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'StaticFactsFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(lowered.staticFacts).toMatchObject({
      booleanConditionalTruthiness: 1,
      booleanExplicitTruthiness: 2,
      booleanLogicalExpressions: 1,
      booleanLogicalTruthiness: 2,
      indexedAccesses: { expressions: 3, reads: 2, writes: 2 },
      numericRelations: 1,
    });
    expect(staticLoweringEmissionCounts()).toEqual({
      booleanAndExpressions: 1,
      booleanConditionalExpressions: 1,
      booleanOrExpressions: 0,
      booleanTruthinessUses: 2,
      destructuringEscapes: {
        'regexp-result-array': { assignment: 0, declaration: 0, parameter: 0 },
        'unproven-receiver': { assignment: 0, declaration: 0, parameter: 0 },
      },
      destructuringReads: {
        assignment: { eligible: 0, parked: 0 },
        declaration: { eligible: 0, parked: 0 },
        parameter: { eligible: 0, parked: 0 },
      },
      destructuringReceivers: {
        Array: { assignment: 0, declaration: 0, parameter: 0 },
        ArrayOrFloat32Array: { assignment: 0, declaration: 0, parameter: 0 },
        Float32Array: { assignment: 0, declaration: 0, parameter: 0 },
        Float64Array: { assignment: 0, declaration: 0, parameter: 0 },
        Int16Array: { assignment: 0, declaration: 0, parameter: 0 },
        Int32Array: { assignment: 0, declaration: 0, parameter: 0 },
        Int8Array: { assignment: 0, declaration: 0, parameter: 0 },
        Uint16Array: { assignment: 0, declaration: 0, parameter: 0 },
        Uint16ArrayOrUint32Array: { assignment: 0, declaration: 0, parameter: 0 },
        Uint32Array: { assignment: 0, declaration: 0, parameter: 0 },
        Uint8Array: { assignment: 0, declaration: 0, parameter: 0 },
        Uint8ClampedArray: { assignment: 0, declaration: 0, parameter: 0 },
      },
      indexedAccesses: {
        reads: 2,
        writes: 2,
      },
      indexedReceivers: {
        Array: { reads: 0, writes: 1 },
        ArrayOrFloat32Array: { reads: 0, writes: 0 },
        Float32Array: { reads: 2, writes: 1 },
        Float64Array: { reads: 0, writes: 0 },
        Int16Array: { reads: 0, writes: 0 },
        Int32Array: { reads: 0, writes: 0 },
        Int8Array: { reads: 0, writes: 0 },
        Uint16Array: { reads: 0, writes: 0 },
        Uint16ArrayOrUint32Array: { reads: 0, writes: 0 },
        Uint32Array: { reads: 0, writes: 0 },
        Uint8Array: { reads: 0, writes: 0 },
        Uint8ClampedArray: { reads: 0, writes: 0 },
      },
      numericRelations: 1,
      syntheticArrayReads: {
        highArityArguments: 0,
        iterationBindings: 0,
      },
    });
    expect(lowered.staticFacts.indexedReceivers.Array).toEqual({ expressions: 1, reads: 0, writes: 1 });
    expect(lowered.staticFacts.indexedReceivers.Float32Array).toEqual({
      expressions: 2,
      reads: 2,
      writes: 1,
    });
    expect(lowered.staticFacts.indexedReceivers.Uint8Array).toEqual({ expressions: 0, reads: 0, writes: 0 });

    expect(output).toContain('if ((cast flag : Bool))');
    expect(output).toContain('!(cast flag : Bool)');
    expect(output).not.toContain('_Runtime.truthy(flag)');
    expect(output).toContain('_Runtime.truthy(maybe)');
    expect(output).toContain('((cast a : Float) < (cast b : Float))');
    expect(output).not.toContain("_Runtime.compare(a, b, '<')");
    expect(output).toContain("_Runtime.compare(text, 'z', '<')");
    expect(output).toContain('flighthq._internal._StaticIndex.readFloat32Array(floats, 0.0)');
    expect(output).toContain('flighthq._internal._StaticIndex.writeArray(values, 1.0, a)');
    expect(output).toMatch(
      /\(\{ var __indexedObject\d+:Dynamic = floats; var __indexedKey\d+:Dynamic = 2\.0; flighthq\._internal\._StaticIndex\.writeFloat32Array\(__indexedObject\d+, __indexedKey\d+, \(flighthq\._internal\._StaticIndex\.readFloat32Array\(__indexedObject\d+, __indexedKey\d+\) \+ b\)\); \}\)/u,
    );
    expect(output).toContain('_Runtime.getIndex(mixed, 3.0)');
    expect(output).toContain('_Runtime.getIndex(shadowed, 4.0)');
    expect(output).not.toContain('_Runtime.getIndex(floats,');
    expect(output).not.toContain('_Runtime.setIndex(values,');
    expect(output).toContain('((cast flag : Bool) && (cast true : Bool))');
    expect(output).toContain('_Runtime.andValue(flag, function():Dynamic return cast text)');
    expect(output.match(/_Runtime\.andValue\(flag/gu)).toHaveLength(1);
    expect(output).not.toContain('_Runtime.select(flag');
    expect(output).toContain('_Runtime.select(maybe');
  });

  it('emits all proven indexed families while retaining ambiguous receivers', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/indexed.ts',
      `
        export function families(
          array: number[],
          float32: Float32Array,
          float64: Float64Array,
          int16: Int16Array,
          int32: Int32Array,
          int8: Int8Array,
          uint16: Uint16Array,
          uint32: Uint32Array,
          uint8: Uint8Array,
          clamped: Uint8ClampedArray,
          key: number,
          value: number,
        ) {
          const reads = [
            array[key],
            float32[key],
            float64[key],
            int16[key],
            int32[key],
            int8[key],
            uint16[key],
            uint32[key],
            uint8[key],
            clamped[key],
          ];
          array[key] = value;
          float32[key] = value;
          float64[key] = value;
          int16[key] = value;
          int32[key] = value;
          int8[key] = value;
          uint16[key] = value;
          uint32[key] = value;
          uint8[key] = value;
          clamped[key] = value;
          return reads;
        }

        export function proofBoundaries<T extends Float32Array, U extends { readonly [key: number]: number }>(
          typed: T,
          structural: U,
          readonly: Readonly<Float32Array>,
          same: Float32Array | Readonly<Float32Array>,
          mixed: Float32Array | Uint8Array,
          key: number,
        ) {
          return [typed[key], structural[key], readonly[key], same[key], mixed[key]];
        }

        export function unconstrained<T>(value: T, key: number) {
          return (value as any)[key];
        }

        export function compound(receiver: () => number[], key: () => number, value: () => number) {
          return receiver()[key()] += value();
        }

        export function fractional(values: number[]) {
          return values[1.5];
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'IndexedFixture',
      packageName: '@flighthq/example',
    });
    const emission = staticLoweringEmissionCounts();

    expect(lowered.diagnostics).toEqual([]);
    expect(emission.indexedAccesses).toEqual({ reads: 15, writes: 11 });
    expect(emission.indexedReceivers.Array).toEqual({ reads: 3, writes: 2 });
    expect(emission.indexedReceivers.Float32Array).toEqual({ reads: 4, writes: 1 });
    for (const receiver of [
      'Float64Array',
      'Int16Array',
      'Int32Array',
      'Int8Array',
      'Uint16Array',
      'Uint32Array',
      'Uint8Array',
      'Uint8ClampedArray',
    ] as const) {
      expect(emission.indexedReceivers[receiver]).toEqual({ reads: 1, writes: 1 });
      expect(output).toContain(`_StaticIndex.read${receiver}(`);
      expect(output).toContain(`_StaticIndex.write${receiver}(`);
    }
    expect(output).toContain('_StaticIndex.readArray(values, 1.5)');
    expect(output).toContain('_StaticIndex.readFloat32Array(typed, key)');
    expect(output).toContain('_StaticIndex.readFloat32Array(readonly, key)');
    expect(output).toContain('_StaticIndex.readFloat32Array(same, key)');
    expect(output).toContain('_Runtime.getIndex(structural, key)');
    expect(output).toContain('_Runtime.getIndex(mixed, key)');
    expect(output).toContain('_Runtime.getIndex((cast value : Dynamic), key)');
    expect(output).toMatch(
      /\(\{ var (__indexedObject\d+):Dynamic = .*receiver.*; var (__indexedKey\d+):Dynamic = .*key.*; flighthq\._internal\._StaticIndex\.writeArray\(\1, \2, \(flighthq\._internal\._StaticIndex\.readArray\(\1, \2\) \+ .*value.*\)\); \}\)/u,
    );
  });

  it('emits only storage-compatible mixed indexed unions', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/mixed-indexed.ts',
      `export function mixed(
         values: number[] | Float32Array,
         readonlyValues: ReadonlyArray<number> | Readonly<Float32Array>,
         wider: readonly [number, number] | ReadonlyArray<number> | Readonly<Float32Array>,
         indices: Uint16Array | Uint32Array,
         incompatible: Float32Array | Uint8Array,
         heterogeneous: number[] | Uint8Array,
         key: number,
         value: number,
       ) {
         const valueRead = values[key];
         values[key] = value;
         values[key] += value;
         const readonlyRead = readonlyValues[key];
         const indexRead = indices[key];
         indices[key] = value;
         indices[key] += value;
         return [valueRead, readonlyRead, indexRead, wider[key], incompatible[key], heterogeneous[key]];
       }`,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'MixedIndexedFixture',
      packageName: '@flighthq/example',
    });
    const emission = staticLoweringEmissionCounts();

    expect(lowered.diagnostics).toEqual([]);
    expect(emission.indexedAccesses).toEqual({ reads: 4, writes: 2 });
    expect(emission.indexedReceivers.ArrayOrFloat32Array).toEqual({ reads: 3, writes: 2 });
    expect(emission.indexedReceivers.Uint16ArrayOrUint32Array).toEqual({ reads: 1, writes: 0 });
    expect(lowered.staticFacts.indexedAccessEscapes.widthSensitiveMixedWrites).toBe(2);
    expect(output).toContain('_StaticIndex.readArrayOrFloat32Array(values, key)');
    expect(output).toContain('_StaticIndex.writeArrayOrFloat32Array(values, key, value)');
    expect(output).toContain('_StaticIndex.readArrayOrFloat32Array(readonlyValues, key)');
    expect(output).toContain('_StaticIndex.readUint16ArrayOrUint32Array(indices, key)');
    expect(output).toContain('_Runtime.setIndex(indices, key, value)');
    expect(output).toContain('_Runtime.setIndex(indices, key, (_Runtime.getIndex(indices, key) + value))');
    expect(output).toContain('_Runtime.getIndex(wider, key)');
    expect(output).toContain('_Runtime.getIndex(incompatible, key)');
    expect(output).toContain('_Runtime.getIndex(heterogeneous, key)');
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
    expect(output).toContain('_Runtime.fill(value, 1.0, 0, null, 1)');
    expect(output).toContain('_Runtime.fill(value, 2.0, 3.0, null, 2)');
  });

  it('constructs portable typed-array wrappers directly', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export function createArrays() {
        return {
          floats: new Float32Array(4),
          doubles: new Float64Array([1, 2]),
          signed: new Int16Array([1, -2]),
          signedWords: new Int32Array([1, -2]),
          signedBytes: new Int8Array([127, 128]),
          unsigned: new Uint16Array([1, 2]),
          unsignedWords: new Uint32Array([1, 4294967295]),
          bytes: new Uint8Array([255, 256]),
          clamped: new Uint8ClampedArray([255, 256]),
        };
      }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedArrayFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('new flighthq._internal._Float32Array(4.0)');
    expect(output).toContain('new flighthq._internal._Float64Array(');
    expect(output).toContain('new flighthq._internal._Int16Array(');
    expect(output).toContain('new flighthq._internal._Int32Array(');
    expect(output).toContain('new flighthq._internal._Int8Array(');
    expect(output).toContain('new flighthq._internal._UInt16Array(');
    expect(output).toContain('new flighthq._internal._UInt32Array(');
    expect(output).toContain('new flighthq._internal._UInt8Array(');
    expect(output).toContain('new flighthq._internal._UInt8ClampedArray(');
    for (const name of [
      'Float32Array',
      'Float64Array',
      'Int16Array',
      'Int32Array',
      'Int8Array',
      'Uint16Array',
      'Uint32Array',
      'Uint8Array',
      'Uint8ClampedArray',
    ]) {
      expect(output).not.toContain(`_Runtime.construct(_Runtime.globalValue('${name}')`);
    }
  });

  it('keeps typed-array subarray calls on maintained wrapper receivers', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function views(floats: Float32Array, bytes: Uint8Array) {
          const data = floats;
          return [data.subarray(1, 3), bytes.subarray(2)];
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedArrayViewFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('(cast data : flighthq._internal._Float32Array).subarray(Std.int(1.0), Std.int(3.0))');
    expect(output).toContain('(cast bytes : flighthq._internal._UInt8Array).subarray(Std.int(2.0))');
    expect(output).not.toContain('data.subarray(');
    expect(output).not.toContain('bytes.subarray(');
  });

  it('lowers Number constants without nullable global namespace lookups', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export const limits = [
        Number.POSITIVE_INFINITY,
        Number.NEGATIVE_INFINITY,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER,
      ];`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'NumberConstantFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('HxMath.POSITIVE_INFINITY');
    expect(output).toContain('HxMath.NEGATIVE_INFINITY');
    expect(output).toContain('_Runtime.NUMBER_EPSILON');
    expect(output).toContain('_Runtime.MAX_SAFE_INTEGER');
    expect(output).not.toContain("_Runtime.globalValue('Number')");
  });

  it('uses JavaScript ToInt32 coercion for bitwise and shift operands', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function bits(value: number, output: number[]) {
          output[0] |= value;
          let result = value | 0;
          result >>>= 1;
          return ~Math.imul(result, 4042322175);
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
      name: 'BitwiseFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('_Runtime.toInt32(_Runtime.getIndex(output, 0.0))');
    // Literal operands that are exact Int32 values fold to plain integer
    // literals so const-enum inline initializers stay compile-time constants.
    expect(output).toContain('(_Runtime.toInt32(value) | 0)');
    expect(output).toContain('_Runtime.unsignedShiftRight(_Runtime.toInt32(result), 1)');
    expect(output).toContain(
      '~_Runtime.toInt32(_Runtime.imul(_Runtime.toInt32(result), _Runtime.toInt32(4042322175.0)))',
    );
    expect(output).not.toContain('_Runtime.toInt32(0.0)');
    expect(output).not.toContain('unsignedShiftRight(Std.int(');
  });

  it('uses float-safe JavaScript remainder semantics for number operands', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function remainder(value: number, divisor: number, values: number[], state: { value: number }) {
          const direct = value % divisor;
          value %= divisor;
          values[0] %= divisor;
          state.value %= divisor;
          return direct + value + values[0] + state.value;
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
      name: 'RemainderFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('direct = _Runtime.fmod(value, divisor)');
    expect(output).toContain('(value = cast (_Runtime.fmod(value, divisor) : Dynamic))');
    expect(output).toContain('_Runtime.setIndex(values, 0.0, _Runtime.fmod(_Runtime.getIndex(values, 0.0), divisor))');
    expect(output).toContain(
      "_Runtime.setField(state, 'value', _Runtime.fmod(_Runtime.field(state, 'value'), divisor))",
    );
    expect(output).not.toMatch(/\s%\s/u);
  });

  it('pads object-literal closures to their declared contextual method arity', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        interface BaseRenderer {
          finish(state: number, result: string): void;
        }
        interface Renderer extends BaseRenderer {
          bind(state: number, material: string | null): void;
          pack: (state: number, offset: number) => void;
        }
        export const renderer: Renderer = {
          finish(state: number) {},
          bind(state: number) {},
          pack: (state: number) => {},
        };
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    padContextualObjectFunctionParameters(lowered.declarations);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ContextualClosureFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('finish: function(state:Float, result:String)');
    expect(output).toContain('bind: function(state:Float, material:Null<String>)');
    expect(output).toContain('pack: function(state:Float, offset:Float)');
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
    expect(output).toContain('_Runtime.normalizeZero(-value)');
    expect(output).toContain("return (_Runtime.field(b, 'weight') - _Runtime.field(a, 'weight'))");
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
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CppArityFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('private static function oversized(__flightArguments:Array<Dynamic>)');
    expect(output).toContain('CppArityFixture.oversized(cast ([');
    expect(output.match(/_StaticIndex\.readArray\(__flightArguments,/gu)).toHaveLength(27);
    expect(output).not.toContain('_Runtime.getIndex(__flightArguments,');
    expect(output).not.toContain('_Runtime.callValue(CppArityFixture.oversized');
    expect(staticLoweringEmissionCounts().syntheticArrayReads).toEqual({
      highArityArguments: 27,
      iterationBindings: 0,
    });
  });
});
