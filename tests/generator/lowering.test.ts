import { execFileSync } from 'node:child_process';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { createHostTypeAudit } from '../../tools/generator/src/analyze/host-types.ts';
import {
  inlineParameterDefaultConstants,
  padContextualObjectFunctionParameters,
} from '../../tools/generator/src/emit/core.ts';
import {
  emitHaxeModule,
  emitType,
  resetStaticLoweringEmissionCounts,
  staticLoweringEmissionCounts,
} from '../../tools/generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';

function typedSource(
  fileName: string,
  text: string,
  additionalSources: Readonly<Record<string, string>> = {},
): { checker: ts.TypeChecker; program: ts.Program; source: ts.SourceFile } {
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts', 'lib.dom.d.ts'],
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const virtualSources = new Map(
    Object.entries({ [fileName]: text, ...additionalSources }).map(([name, contents]) => [
      name,
      ts.createSourceFile(name, contents, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS),
    ]),
  );
  const host = ts.createCompilerHost(options);
  const getSourceFile = host.getSourceFile.bind(host);
  const fileExists = host.fileExists.bind(host);
  const readFile = host.readFile.bind(host);
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    virtualSources.get(requested) ?? getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  host.fileExists = (requested) => virtualSources.has(requested) || fileExists(requested);
  host.readFile = (requested) => virtualSources.get(requested)?.text ?? readFile(requested);
  const program = ts.createProgram([...virtualSources.keys()], options, host);
  const programSource = program.getSourceFile(fileName);
  if (!programSource) throw new Error(`Fixture program is missing ${fileName}`);
  return { checker: program.getTypeChecker(), program, source: programSource };
}

describe('TypeScript lowering and Haxe emission', () => {
  it('orders static fields used through eagerly called helpers before their consumers', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/sample/src/pipeline.ts',
      `
        export function buildPipeline(): string {
          return renderer;
        }
        export const pipeline = buildPipeline();
        export const renderer = 'ready';
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/sample', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'PipelineFixture',
      packageName: '@flighthq/sample',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output.indexOf('static final renderer')).toBeLessThan(output.indexOf('static final pipeline'));
  });

  it('flattens nested anonymous inheritance before Haxe type emission', () => {
    const output = emitType({
      extends: [
        {
          extends: [{ arguments: [], kind: 'named', name: 'Host' }],
          fields: [
            {
              name: 'app',
              optional: false,
              type: { name: 'String', kind: 'primitive' },
            },
          ],
          kind: 'anonymous',
        },
        { arguments: [], kind: 'named', name: 'HasNotificationAction' },
        { arguments: [], kind: 'named', name: 'HasNotificationReply' },
      ],
      fields: [],
      kind: 'anonymous',
    });

    expect(output).toBe('{ >Host, >HasNotificationAction, >HasNotificationReply, var app:String; }');
    expect(output).not.toContain('>{');
  });

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

  it('inlines parameter defaults without cloning top-level const aliases', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/aliases.ts',
      `
        export const DEFAULT_VALUE = 3;
        export const renderer = { value: 1 };
        export const rendererAlias = renderer;
        export function withDefault(value: number = DEFAULT_VALUE): number { return value; }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    inlineParameterDefaultConstants(lowered.declarations);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'Aliases',
      packageName: '@flighthq/example',
    });

    expect(output).toContain('public static final rendererAlias = renderer;');
    expect(output).toContain('public static function withDefault(value:Float = 3.0):Float');
  });

  it('preserves checker-known declarations, expressions, unions, collections, and direct calls', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/typedIntermediate.ts',
      `
        interface Sample {
          value: number;
          format: (value: number) => string;
        }
        type Scalar = string | number;
        const increment = (value: number) => value + 1;
        export const registry = new Map<string, number>();
        class Counter {
          value = 0;
          bump(delta: number) {
            this.value += delta;
            return this.value;
          }
        }
        export function render(sample: Sample) {
          const next = increment(sample.value);
          const values = [next];
          const counter = new Counter();
          counter.value = next;
          return sample.format(counter.bump(values[0]));
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedIntermediateFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('typedef Scalar = flight._internal._Union2<String, Float>;');
    expect(output).toContain('registry:flight._internal._Map<String, Float>');
    expect(output).toContain('function render(sample:Sample):String');
    expect(output).toContain('next = (cast increment((cast (cast sample : Sample).value : Float)) : Float)');
    expect(output).toContain('(cast sample : Sample).value');
    expect(output).toContain('(cast counter : Counter).value = next');
    expect(output).toContain('(cast counter : Counter).bump');
    expect(output).toContain('(cast sample : Sample).format');
    expect(output).not.toContain('_Runtime.callValue(TypedIntermediateFixture.increment');
    expect(output).not.toContain("_Runtime.field(sample, 'value')");
  });

  it('preserves checker-inferred private types across package source files', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/consumer.ts',
      `
        export function firstValue() {
          const value = parseValue().value;
          return Array.isArray(value) ? value[0] : value;
        }
      `,
      {
        '/workspace/upstream/packages/example/src/parser.ts': `
          type ParserValue = null | boolean | number | string | ParserValue[] | ParserMapping;
          interface ParserMapping { [key: string]: ParserValue; }
          interface ParserResult { value: ParserValue; }
          declare function parseValue(): ParserResult;
        `,
      },
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'PrivateTypeConsumerFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('value:ParserValue__parser');
    expect(output).toContain('function firstValue():ParserValue__parser');
    expect(output).not.toContain('checker-known-unrepresentable');
  });

  it('lowers template-literal string refinements without external or Dynamic type debt', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/types/src/templateLiteral.ts',
      `
        export type VendorKind = \`${'${string}'}.${'${string}'}\`;
        export interface VendorShape { kind: VendorKind; }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/types', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TemplateLiteralFixture',
      packageName: '@flighthq/types',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('typedef VendorKind = String;');
    expect(output).toContain('typedef VendorShape = { var kind:VendorKind; };');
    expect(output).not.toContain('Dynamic');
  });

  it('uses the typed no-value carrier for structural void brand fields', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/types/src/brand.ts',
      `
        declare const BrandKey: unique symbol;
        export interface Branded { readonly [BrandKey]?: void; }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/types', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'VoidBrandFixture',
      packageName: '@flighthq/types',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('@:optional var __BrandKey:flight._internal._Nothing;');
    expect(output).not.toContain('var __BrandKey:Void;');
  });

  it('flattens variadic tuple tails into their Haxe array element type', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/types/src/nonEmpty.ts',
      `export type NonEmpty = [string, ...string[]];`,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/types', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'NonEmptyTupleFixture',
      packageName: '@flighthq/types',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('typedef NonEmpty = Array<String>;');
  });

  it('materializes concrete inline mapped wrappers while retaining open generic applications', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/entity/src/concreteMapped.ts',
      `
        interface Entity { runtime?: object; }
        type EntityWithoutRuntime<Type extends Entity> = Omit<Type, 'runtime'>;
        interface Bitmap extends Entity { width: number; format: string; }
        interface Runtime<Traits> { test?: (value: Traits) => boolean; count: number; }
        type MethodsOf<Type> = { [Key in keyof Type as Type[Key] extends (...args: any) => any ? Key : never]: Type[Key] };
        type RuntimeMethods = Partial<MethodsOf<Runtime<string>> & Pick<Runtime<string>, 'test'>>;
        declare function createEntity<Type extends object>(value: Type): Type & Entity;
        export function concrete(bitmap: EntityWithoutRuntime<Bitmap>) { return createEntity(bitmap); }
        export function generic<Type extends Entity>(value: EntityWithoutRuntime<Type>): EntityWithoutRuntime<Type> {
          return value;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/entity', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ConcreteMappedFixture',
      packageName: '@flighthq/entity',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function concrete(bitmap:{ var width:Float; var format:String; })');
    expect(output).toContain('):{ >Entity, var width:Float; var format:String; }');
    expect(output).toContain(
      'function generic<Type:Entity>(value:EntityWithoutRuntime<Type>):EntityWithoutRuntime<Type>',
    );
    expect(output).toContain('typedef RuntimeMethods = { @:optional var test:Null<String->Bool>; };');
    expect(output).not.toContain('typedef RuntimeMethods = { @:optional var test:Null<Traits->Bool>; };');
    expect(output).not.toContain('>EntityWithoutRuntime<Bitmap>');
  });

  it('routes SharedArrayBuffer runtime checks through the explicit host-value LUT', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/render-wgpu/src/sharedBuffer.ts',
      `
        export function isShared(value: unknown): boolean {
          return typeof SharedArrayBuffer !== 'undefined' && value instanceof SharedArrayBuffer;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-wgpu', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'SharedBufferFixture',
      packageName: '@flighthq/render-wgpu',
    });

    expect(output).toContain("_HostValueLut.typeofValue('SharedArrayBuffer')");
    expect(output).toContain("_HostValueLut.get('SharedArrayBuffer')");
    expect(output).not.toMatch(/isInstanceOf\(value, SharedArrayBuffer\)/u);
  });

  it('routes matchMedia availability and calls through the explicit host-value LUT', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/device/src/device.ts',
      `
        export function detectHdr(): boolean {
          if (typeof matchMedia === 'undefined') return false;
          return matchMedia('(dynamic-range: high)').matches;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/device', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'DeviceFixture',
      packageName: '@flighthq/device',
    });

    expect(output).toContain("_HostValueLut.typeofValue('matchMedia')");
    expect(output).toContain("_Runtime.callValue(flight._internal._HostValueLut.get('matchMedia')");
    expect(output).not.toMatch(/\bmatchMedia\(/u);
  });

  it('erases local type declarations while retaining their strict structural field types', () => {
    const { checker, program, source } = typedSource(
      '/workspace/upstream/packages/example/src/localTypes.ts',
      `
        export function readRows(): number {
          interface Row { data: Uint8Array; tag: number; }
          type Pair = { left: number; right: string };
          const rows: Row[] = [{ data: new Uint8Array(0), tag: 3 }];
          const pair: Pair = { left: 2, right: 'ok' };
          return rows[0].tag + pair.left;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker, undefined, { program });
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'LocalTypesFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('rows:Array<{ var data:flight._internal._UInt8Array; var tag:Float; }>');
    expect(output).toContain('pair:{ var left:Float; var right:String; }');
    expect(output).not.toContain('interface Row');
    expect(output).not.toContain('typedef Pair');
    expect(output).not.toContain("_Runtime.field(pair, 'left')");
  });

  it('preserves omitted call arity while keeping possibly undefined arguments nullable', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/optional-default.ts',
      `
        function withDefault(value = 0.25): number {
          return value;
        }
        interface Handler {
          read(value?: number): number;
        }
        interface Options {
          tolerance?: number;
        }
        export function invoke(handler: Handler, options?: Options): number {
          return withDefault() + withDefault(options?.tolerance) + handler.read();
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'OptionalDefaultFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('#if js _Runtime.callValue(withDefault, cast ([] : Array<Dynamic>)) #else withDefault(');
    expect(output).toContain(
      'withDefault(#if js (cast ({ final __structural0 = options; __structural0 == null ? _Runtime.UNDEFINED : (cast __structural0 : { @:optional var tolerance:Null<Float>; }).tolerance; }) : Float) #else (cast ({ final __structural0 = options; __structural0 == null ? _Runtime.UNDEFINED : (cast __structural0 : { @:optional var tolerance:Null<Float>; }).tolerance; }) : Null<Float>) #end)',
    );
    expect(output).toContain(
      ".read(#if js (cast _Runtime.field(_Runtime, 'UNDEFINED') : Dynamic) #else (cast null : Dynamic) #end)",
    );
    expect(output).not.toContain('(cast _Runtime.UNDEFINED : Float)');
    expect(output).not.toContain("(cast _Runtime.field(_Runtime, 'UNDEFINED') : Float)");
  });

  it('keeps asserted scalar values nullable until nullish fallbacks and checks run', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/nullish-scalars.ts',
      `
        export function numberDefault(value: unknown): number { return (value as number) ?? 0.25; }
        export function booleanDefault(value: unknown): boolean { return (value as boolean) ?? true; }
        export function undefinedCheck(value: unknown): boolean { return (value as number) === undefined; }
        export function nullCheck(value: unknown): boolean { return null !== (value as boolean); }
        export async function awaitedDefault(value: unknown, fallback: Promise<number>): Promise<number> {
          return (value as number) ?? (await fallback);
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
      name: 'NullishScalarsFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      '_Runtime.coalesce(#if js (cast value : Float) #else (cast value : Null<Float>) #end, function():Dynamic return cast 0.25)',
    );
    expect(output).toContain(
      '_Runtime.coalesce(#if js (cast value : Bool) #else (cast value : Null<Bool>) #end, function():Dynamic return cast true)',
    );
    expect(output).toContain(
      "_Runtime.strictEquals(#if js (cast value : Float) #else (cast value : Null<Float>) #end, _Runtime.field(_Runtime, 'UNDEFINED'))",
    );
    expect(output).toContain(
      '!_Runtime.strictEquals(null, #if js (cast value : Bool) #else (cast value : Null<Bool>) #end)',
    );
    expect(output).toContain(
      '_Runtime.strictEquals(#if js (cast value : Float) #else (cast value : Null<Float>) #end, null)',
    );
    expect(output).not.toContain('_Runtime.coalesce((cast value : Float)');
    expect(output).not.toContain('_Runtime.coalesce((cast value : Bool)');
  });

  it('uses primitive generic constraints for explicit any without guessing ambiguous constraints', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/constrainedAny.ts',
      `
        export type CommandKey = 'begin' | 'end';
        export interface Command<K extends CommandKey = CommandKey> { readonly key: K; }
        export interface Payload<T> { readonly value: T; }
        export interface Mixed<T extends string | number> { readonly value: T; }
        export const constrainedDefaults: Command<any>[] = [];
        export const unconstrainedDefaults: Payload<any>[] = [];
        export const ambiguousDefaults: Mixed<any>[] = [];
        export function register(commands: readonly Command[]): void { void commands; }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ConstrainedAnyFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('constrainedDefaults:Array<Command<String>>');
    expect(output).toContain('function register(commands:Array<Command<CommandKey>>):Void');
    expect(output).toContain('unconstrainedDefaults:Array<Payload<flight._internal._Any>>');
    expect(output).toContain('ambiguousDefaults:Array<Mixed<flight._internal._Any>>');
    expect(output).not.toContain('constrainedDefaults:Array<Command<flight._internal._Any>>');
    expect(output).not.toContain('function register(commands:Array<Command<flight._internal._Any>>):Void');
  });

  it('lowers ECMAScript Math.fround to the portable binary32 runtime operation', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/fround.ts',
      'export function single(value: number): number { return Math.fround(value); }',
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'Fround',
      packageName: '@flighthq/example',
    });

    expect(output).toContain('return cast _Runtime.fround(value);');
    expect(output).not.toContain('HxMath.fround');
  });

  it('emits completion metadata deterministically on selected declarations only', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/service.ts',
      `
        export function protectedService(): number { return 1; }
        export function publicService(): number { return 2; }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const protectedDeclaration = lowered.declarations.find((declaration) => declaration.name === 'protectedService');
    if (!protectedDeclaration) throw new Error('Expected protectedService fixture declaration');
    protectedDeclaration.noCompletion = true;
    const module = {
      declarations: lowered.declarations,
      imports: [],
      name: 'Service',
      packageName: '@flighthq/example',
    };
    const output = emitHaxeModule(module);

    expect(output).toBe(emitHaxeModule(module));
    expect(output).toContain('@:noCompletion\n  public static function protectedService()');
    expect(output).not.toContain('@:noCompletion\n  public static function publicService()');
  });

  it('initializes nested function declarations before earlier calls without hoisting function expressions', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/hoisting.ts',
      `
        export function callDeclaration(value: number): number {
          const expression = function expression(input: number): number {
            return input + 1;
          };
          return declaration(expression(value));
          function declaration(input: number): number {
            return input * 2;
          }
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
      name: 'Hoisting',
      packageName: '@flighthq/example',
    });
    const declaration = output.indexOf('declaration = (cast function declaration');
    const expression = output.indexOf('expression = function expression');
    const call = output.indexOf('return cast _Runtime.callValue(declaration');
    expect(declaration).toBeGreaterThan(-1);
    expect(expression).toBeGreaterThan(declaration);
    expect(call).toBeGreaterThan(expression);
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

  it('materializes constructor parameter properties as initialized class fields', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/reader.ts',
      `
        export class Reader {
          constructor(readonly source: Uint8Array, private end: number) {}
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
      name: 'Reader',
      packageName: '@flighthq/example',
    });
    expect(output).toContain('public final source:flight._internal._UInt8Array;');
    expect(output).toContain('private var end:Float;');
    expect(output).toContain('(this.source = cast (source : Dynamic));');
    expect(output).toContain('(this.end = cast (end : Dynamic));');
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
        export function callNestedDeclaration(value: number): number {
          return twice(value);
          function twice(input: number): number {
            return input * 2;
          }
        }
        export function sumNestedRecursive(values: number[]): number {
          let result = 0;
          for (const value of values) {
            const walk = (count: number): number => count <= 0 ? 0 : count + walk(count - 1);
            result += walk(value);
          }
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
        export function switchControl(): number {
          let total = 0;
          for (let i = 0; i < 3; i++) {
            switch (i) {
              case 0:
                if (i === 0) { total += 1; break; }
              case 1:
                continue;
              default:
                total += 10;
                break;
            }
            total += 100;
          }
          return total;
        }
        export function nestedLoopBreak(): number {
          let total = 0;
          for (let outer = 0; outer < 2; outer++) {
            switch (outer) {
              case 0:
                for (let inner = 0; inner < 3; inner++) {
                  total += 1;
                  if (inner === 0) break;
                }
                break;
              default:
                total += 10;
                break;
            }
            total += 100;
          }
          return total;
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
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'MathFixture',
      packageName: '@flighthq/math',
    });
    writeFileSync(path.join(packageDirectory, 'MathFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.MathFixture.*;
        class Main {
          static function main() {
            if (clamp(12, 0, 10) != 10) throw 'clamp failed';
            if (quarter(8) != 2) throw 'quarter failed';
            if (callNestedDeclaration(4) != 8) throw 'nested function declaration hoisting failed';
            if (sumNestedRecursive([2, 3]) != 9) throw 'nested recursive closure failed';
            if (sumOdd(6) != 9) throw 'for continue failed';
            if (switchControl() != 211) throw 'switch control ownership failed';
            if (nestedLoopBreak() != 211) throw 'nested loop break ownership failed';
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
    expect(output).toContain('do {');
    expect(output).toContain('__switchContinue');
    expect(output).toContain('_Runtime.throwValue(__finallyError');
    expect(output).toContain('var walk:Dynamic = cast _Runtime.UNDEFINED;');
    expect(output).toContain('walk = function(count:Float)');
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

  it('preserves TypeScript overloads so typed protocol object literals avoid implementation unions', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/overloads.ts',
      `
        export type NumericProps<T> = { [K in keyof T as T[K] extends number ? K : never]?: number };
        export interface Manager { brand: string; }
        export interface Options { delay?: number; }
        export interface Shape { x: number; y: number; }
        export function createTween<T extends object>(
          manager: Manager,
          target: T,
          duration: number,
          properties: Readonly<NumericProps<T>>,
          options?: Readonly<Options>,
        ): T;
        export function createTween<T extends object>(
          target: T,
          duration: number,
          properties: Readonly<NumericProps<T>>,
          options?: Readonly<Options>,
        ): T;
        export function createTween<T extends object>(
          managerOrTarget: Manager | T,
          targetOrDuration: T | number,
          durationOrProperties: number | Readonly<NumericProps<T>>,
          propertiesOrOptions?: Readonly<NumericProps<T>> | Readonly<Options>,
          options?: Readonly<Options>,
        ): T {
          return managerOrTarget as T;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'Overloads',
      packageName: '@flighthq/example',
    });
    const fixtureDirectory = path.resolve('build/haxe-overload-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'Overloads.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.Overloads.Manager;
        import flight.Overloads.Shape;
        class Main {
          static function main() {
            final manager:Manager = { brand: 'manager' };
            final shape:Shape = { x: 0.0, y: 0.0 };
            flight.Overloads.createTween(manager, shape, 1.0, { x: 2.0, y: 3.0 });
            flight.Overloads.createTween(shape, 1.0, { x: 2.0, y: 3.0 }, { delay: 0.5 });
          }
        }
      `,
    );

    expect(lowered.diagnostics).toEqual([]);
    expect(output.match(/@:overload\(/gu)).toHaveLength(2);
    expect(output).toContain(
      '@:overload(function<T:flight._internal._Object>(manager:Manager, target:T, duration:Float, properties:NumericProps<T>, ?options:Options):T {})',
    );
    expect(() =>
      execFileSync('node', ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'Main', '--interp'], {
        cwd: path.resolve('.'),
        stdio: 'pipe',
      }),
    ).not.toThrow();
  });

  it('terminates when a private generic overload alias preserves its caller type parameter', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/privateGenericOverload.ts',
      `
        type Identity<T> = T;
        export function choose<T>(value: Identity<T>): T;
        export function choose<T>(value: T): T {
          return value;
        }
      `,
    );

    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'PrivateGenericOverload',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('@:overload(function<T>(value:T):T {})');
  });

  it('erases standard utility types used as interface heritage', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/utilityHeritage.ts',
      `
        declare function createRuntime(): { readonly hidden: string };
        export interface Runtime extends ReturnType<typeof createRuntime> {
          count: number;
        }
      `,
    );

    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'UtilityHeritage',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('typedef Runtime = { var count:Float; };');
    expect(output).not.toContain('ReturnType');
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
    expect(output).toContain('function():flight._internal._Promise<String>');
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
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'ExampleFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.ExampleFixture.combine;
        import flight._internal._Async;
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
    expect(output).toContain('_Async.resolve(flight._internal._Async.protect');
    expect(output).toContain('_Async.resolve(7.0)');
  });

  it('captures object method receivers across targets, async work, and arrow continuations', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function createBackend() {
          return {
            value: 'outer',
            async beforeAwait() {
              const __thisValue0 = 'local';
              const read = () => this.value + __thisValue0;
              return read();
            },
            async afterAwait(pending: Promise<void>) {
              await pending;
              return this.value;
            },
            noReceiver() {
              return 1;
            },
            nestedOwner() {
              return function (this: { value: string }) {
                return this.value;
              };
            },
          };
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
      name: 'ReceiverFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('({ var __thisValue1:Dynamic = null; __thisValue1 = {');
    expect(output).toContain("_Runtime.field(__thisValue1, 'value')");
    expect(output).toMatch(/_Async\.flatMap[\s\S]*_Runtime\.field\(__thisValue1, 'value'\)/u);
    expect(output).toContain('var __thisValue2:Dynamic = _Runtime.thisValue();');
    expect(output.match(/_Runtime\.thisValue\(\)/gu)).toHaveLength(1);
    expect(output).toContain('noReceiver: function() {\n      return cast 1.0;\n    }');
  });

  it('executes an IPC-style object method receiver on a portable target', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/ipc/src/ipc.ts',
      `
        export function createEvent() {
          return {
            senderId: 41,
            reply() {
              return this.senderId + 1;
            },
          };
        }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/ipc', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'IpcReceiverFixture',
      packageName: '@flighthq/ipc',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).not.toContain('_Runtime.thisValue()');
    expect(output).toMatch(/var (__thisValue\d+):Dynamic = null; \1 = \{ senderId:/u);

    const fixtureDirectory = path.resolve('build/haxe-ipc-receiver-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'IpcReceiverFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.IpcReceiverFixture.createEvent;
        class Main {
          static function main() {
            final event:Dynamic = createEvent();
            final reply:Dynamic = Reflect.field(event, 'reply');
            final result:Dynamic = Reflect.callMethod(event, reply, []);
            if (result != 42) throw 'object method receiver was not preserved';
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
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncBranchFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.AsyncBranchFixture.choose;
        import flight._internal._Async;
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

  it('propagates returns through a switch after an await', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function project(pending: Promise<string>): Promise<number> {
          const outcome = await pending;
          switch (outcome) {
            case 'one':
              return 1;
            case 'two':
            case 'second':
              return 2;
            default:
              return 3;
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
      name: 'AsyncSwitchFixture',
      packageName: '@flighthq/example',
    });

    expect(output).toContain('_Async.finishFlow');
    expect(output.match(/_Async\.flowReturn/gu)).toHaveLength(3);

    const fixtureDirectory = path.resolve('build/haxe-async-switch-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncSwitchFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.AsyncSwitchFixture.project;
        import flight._internal._Async;
        class Main {
          static function main() {
            var result = 0;
            project(_Async.resolve('one')).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 1) throw 'first switch branch failed';
            project(_Async.resolve('second')).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 2) throw 'grouped switch branch failed';
            project(_Async.resolve('other')).then(function(value) {
              result = Std.int(value);
              return value;
            });
            if (result != 3) throw 'default switch branch failed';
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
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncTryFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.AsyncTryFixture.overrideValue;
        import flight.AsyncTryFixture.recoverValue;
        import flight._internal._Async;
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
    resetStaticLoweringEmissionCounts();
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
    expect(output).toMatch(
      /if \(__flowIndex\d+ >= __flowIterator\d+\.length\).*\n.*__flowIterator\d+\[__flowIndex\d+\+\+\]/u,
    );
    expect(output).not.toContain('_StaticIndex.readArray(__flowIterator');
    expect(staticLoweringEmissionCounts().guardedArrayReads).toEqual({
      asyncFlowForInKeys: 0,
      asyncFlowForOfValues: 1,
    });

    const fixtureDirectory = path.resolve('build/haxe-async-loop-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncLoopFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.AsyncLoopFixture.sumSelected;
        import flight._internal._Async;
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
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncNumericLoopFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.AsyncNumericLoopFixture.count;
        import flight._internal._Async;
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

  it('preserves explicit null returns from synchronous loops after an await', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export async function returnFromFor(values: number[], pending: Promise<void>): Promise<number | null> {
          await pending;
          for (let index = 0; index < values.length; index++) {
            if (values[index] === 0) return null;
          }
          return 1;
        }
        export async function returnFromWhile(values: number[], pending: Promise<void>): Promise<number | null> {
          await pending;
          let index = 0;
          while (index < values.length) {
            if (values[index] === 0) return null;
            index++;
          }
          return 1;
        }
        export async function returnFromForOf(values: number[], pending: Promise<void>): Promise<number | null> {
          await pending;
          for (const value of values) {
            if (value === 0) return null;
          }
          return 1;
        }
        export async function returnFromForIn(values: Record<string, number>, pending: Promise<void>): Promise<number | null> {
          await pending;
          for (const key in values) {
            if (values[key] === 0) return null;
          }
          return 1;
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
      name: 'AsyncSyncLoopReturnFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output.match(/_Async\.repeatFlow/gu)).toHaveLength(4);
    expect(output.match(/_Async\.flowReturn\(null\)/gu)).toHaveLength(4);
    expect(output).not.toContain('if ((cast _Runtime.strictEquals(value, 0.0) : Bool)) { return cast null; }');

    const fixtureDirectory = path.resolve('build/haxe-async-sync-loop-return-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    const javaScript = path.join(fixtureDirectory, 'main.cjs');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'AsyncSyncLoopReturnFixture.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.AsyncSyncLoopReturnFixture.returnFromFor;
        import flight.AsyncSyncLoopReturnFixture.returnFromForIn;
        import flight.AsyncSyncLoopReturnFixture.returnFromForOf;
        import flight.AsyncSyncLoopReturnFixture.returnFromWhile;
        import flight._internal._Async;
        class Main {
          static function expectNull(promise:Dynamic, label:String):Void {
            promise.then(function(value) {
              if (js.Syntax.code('{0} !== null', value)) throw label;
              return value;
            });
          }
          static function main() {
            final pending = cast _Async.resolve(null);
            expectNull(returnFromFor([1, 0], pending), 'for return lost');
            expectNull(returnFromWhile([1, 0], pending), 'while return lost');
            expectNull(returnFromForOf([1, 0], pending), 'for-of return lost');
            expectNull(returnFromForIn({ first: 1, second: 0 }, pending), 'for-in return lost');
          }
        }
      `,
    );
    execFileSync(
      'node',
      [
        'tools/haxe.mjs',
        '-cp',
        fixtureDirectory,
        '-cp',
        'src',
        '-cp',
        'generated',
        '--main',
        'Main',
        '--js',
        javaScript,
      ],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    expect(() => execFileSync('node', [javaScript], { cwd: path.resolve('.'), stdio: 'pipe' })).not.toThrow();
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
    expect(output).toContain('flight._internal._Async.recover(task');
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

  it('keeps variadic function values positional across declarations, values, and properties', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/signals/src/sample.ts',
      `
        type Emitter = { emit: (...args: any[]) => void };
        export function makeDispatch(slot: (value: number) => void) {
          return (...args: any[]) => slot(...args);
        }
        export function makeHostHandler(listener: (value: string) => void) {
          return (event: unknown, ...args: any[]) => listener(args[1] ?? args[0] ?? event);
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
    expect(output).toContain('function(...args:flight._internal._Any)');
    expect(output).toContain('_Runtime.haxeRest(function(...args:flight._internal._Any)');
    expect(output).toContain('function(event:flight._internal._Any, ...args:flight._internal._Any)');
    expect(output).not.toContain('function(args:Array<Dynamic>)');
    expect(output).toContain('_Runtime.apply(slot, _Runtime.concatArrays([_Runtime.toArray(args)]))');
    expect(output).toContain(
      "_Runtime.callHaxeRestProperty(emitter, 'emit', _Runtime.concatArrays([_Runtime.toArray(args)]), 0)",
    );
    expect(output).toContain(
      '_Runtime.callHaxeRestValue(emit, _Runtime.concatArrays([[emitter], _Runtime.toArray(args)]), 1)',
    );
    expect(output).not.toContain('packedVariadicRestIndex');
    expect(output).not.toContain('cast ([_Runtime.toArray(args)] : Array<Dynamic>)');
  });

  it('does not guess a rest convention for fixed, declaration-file, generic, or ambiguous calls', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        type Ambiguous = ((value: number) => void) & ((value: number, ...rest: number[]) => void);
        export function forwardArray(values: number[]) { values.push(...values); }
        export function forwardGeneric<T extends (...args: any[]) => void>(fn: T, args: any[]) { fn(...args); }
        export function forwardAmbiguous(fn: Ambiguous, values: number[]) { fn(...values); }
        export function forwardAsserted(emitter: { emit: (value: number) => void }, values: number[]) {
          (emitter.emit as (...args: number[]) => void)(...values);
        }
        export const fixed = (value: number) => value;
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'RestBoundaryFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function(value:Float)');
    expect(output).not.toContain('function(...value:Float)');
    expect(output).toContain("_Runtime.callProperty(values, 'push', _Runtime.concatArrays");
    expect(output).toContain('_Runtime.apply(fn, _Runtime.concatArrays');
    expect(output).toContain(
      '_Runtime.apply((cast (cast emitter : { var emit:Float->Void; }).emit : Array<Float>->Void), _Runtime.concatArrays',
    );
    expect(output).not.toContain('_Runtime.callHaxeRestProperty(values');
    expect(output).not.toContain('_Runtime.callHaxeRestValue(fn');
    expect(output).not.toContain("_Runtime.callHaxeRestValue((cast _Runtime.field(emitter, 'emit') : Dynamic)");
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
          gl.pixelStorei(gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL, true);
          gl.stencilOp(gl.KEEP, gl.KEEP, gl.INVERT);
          const dimensions = [gl.drawingBufferWidth, gl.drawingBufferHeight];
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
      "flight._internal.backend.WebGl2Backend.bindBuffer(gl, flight._internal.backend.WebGl2Backend.contextConstant(gl, 'ARRAY_BUFFER', flight._internal.backend.WebGl2Backend.ARRAY_BUFFER), buffer)",
    );
    expect(output).toContain(
      "flight._internal.backend.WebGl2Backend.drawArrays(alias, flight._internal.backend.WebGl2Backend.contextConstant(gl, 'TRIANGLES', flight._internal.backend.WebGl2Backend.TRIANGLES), 0.0, 3.0)",
    );
    expect(output).toContain('flight._internal.backend.WebGl2Backend.bufferData(');
    expect(output).toContain(
      "flight._internal.backend.WebGl2Backend.pixelStorei(gl, flight._internal.backend.WebGl2Backend.contextConstant(gl, 'UNPACK_PREMULTIPLY_ALPHA_WEBGL', flight._internal.backend.WebGl2Backend.UNPACK_PREMULTIPLY_ALPHA_WEBGL), true)",
    );
    expect(output).toContain(
      "flight._internal.backend.WebGl2Backend.stencilOp(gl, flight._internal.backend.WebGl2Backend.contextConstant(gl, 'KEEP', flight._internal.backend.WebGl2Backend.KEEP), flight._internal.backend.WebGl2Backend.contextConstant(gl, 'KEEP', flight._internal.backend.WebGl2Backend.KEEP), flight._internal.backend.WebGl2Backend.contextConstant(gl, 'INVERT', flight._internal.backend.WebGl2Backend.INVERT))",
    );
    expect(output).toContain('flight._internal.backend.WebGl2Backend.drawingBufferWidth(gl)');
    expect(output).toContain('flight._internal.backend.WebGl2Backend.drawingBufferHeight(gl)');
    expect(output).not.toContain("contextConstant(gl, 'drawingBufferWidth'");
    expect(output).not.toContain('WebGl2Backend.bufferDataSize(');
    expect(output).toContain('flight._internal.backend.WebGl2Backend.texImage2DSource(');
    expect(output).toContain('flight._internal.backend.WebGl2Backend.texImage2D(');
    expect(output).toContain(
      "flight._internal.backend.WebGl2Backend.clear(gl, flight._internal.backend.WebGl2Backend.contextConstant(gl, 'COLOR_BUFFER_BIT', flight._internal.backend.WebGl2Backend.COLOR_BUFFER_BIT))",
    );
    expect(output).not.toContain('WebGl2Backend.call(');
    expect(output).not.toContain('WebGl2Backend.field(');
    expect(output).not.toContain("_Runtime.callProperty(gl, 'bindBuffer'");
  });

  it('fails generation for WebGL2 members absent from the shared host endpoint contract', () => {
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

    expect(emit('gl.futureMethod();')).toThrow('WebGL2 method is not in the host endpoint contract: futureMethod');
    expect(emit('return gl.FUTURE_CONSTANT;')).toThrow(
      'WebGL2 constant is not in the host endpoint contract: FUTURE_CONSTANT',
    );
    expect(emit('gl.clear(...[gl.COLOR_BUFFER_BIT]);')).toThrow(
      'WebGL2 spread call has no typed backend endpoint: clear',
    );
    expect(emit("const name = 'ARRAY_BUFFER'; return gl[name];")).toThrow(
      'WebGL2 computed property access is not a recognized closed string-literal constant union',
    );
  });

  it('lowers computed WebGL2 constants to an exhaustive typed constant switch', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/render-gl/src/sample.ts',
      `
        type GlBlendEquation = 'FUNC_ADD' | 'FUNC_REVERSE_SUBTRACT' | 'MAX' | 'MIN';
        type GlBlendFactor = 'DST_COLOR' | 'ONE' | 'ONE_MINUS_SRC_ALPHA' | 'ONE_MINUS_SRC_COLOR' | 'ZERO';
        export function read(
          gl: WebGL2RenderingContext,
          realization: { src: GlBlendFactor; equation?: GlBlendEquation },
        ) {
          gl.blendEquation(gl[realization.equation ?? 'FUNC_ADD']);
          return gl[realization.src];
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-gl', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'WebGlComputedConstantFixture',
      packageName: '@flighthq/render-gl',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      "(switch (_Runtime.coalesce((cast realization : { var src:GlBlendFactor; @:optional var equation:Null<String>; }).equation, function():Dynamic return cast 'FUNC_ADD')) { case 'FUNC_ADD':",
    );
    expect(output).toContain("case 'MIN': flight._internal.backend.WebGl2Backend.MIN;");
    expect(output).toContain(
      "default: _Runtime.throwValue('WebGL2 computed constant is outside the closed GlBlendEquation domain: upstream/packages/render-gl/src/sample.ts');",
    );
    expect(output).toContain(
      "(switch ((cast realization : { var src:GlBlendFactor; @:optional var equation:Null<String>; }).src) { case 'DST_COLOR':",
    );
    expect(output).toContain(
      "default: _Runtime.throwValue('WebGL2 computed constant is outside the closed GlBlendFactor domain: upstream/packages/render-gl/src/sample.ts');",
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
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.setField(ctx, 'fillStyle'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.setField(ctx, 'lineCap'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.call(ctx, 'quadraticCurveTo'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.call(ctx, 'bezierCurveTo'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.call(ctx, 'ellipse'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.call(ctx, 'roundRect'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.call(ctx, 'closePath'");
    expect(output).toContain("flight._internal.backend.Canvas2dBackend.call(ctx, 'fillRect'");
    expect(output).not.toContain("_Runtime.callProperty(ctx, 'quadraticCurveTo'");
    expect(output).toContain("Canvas2dBackend.field(ctx, 'roundRect')");
    expect(output).not.toContain("_Runtime.callProperty(ctx, 'fillRect'");
    expect(output).toContain("_Runtime.field(ctx, 'source')");
    expect(output).not.toContain("Canvas2dBackend.field(ctx, 'source')");
  });

  it('fails generation for Canvas 2D members absent from the shared host endpoint contract', () => {
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

    expect(emit('ctx.arcTo(0, 0, 1, 1, 2);')).toThrow('Canvas2D method is not in the host endpoint contract: arcTo');
    expect(emit('return ctx.direction;')).toThrow('Canvas2D field is not in the host endpoint contract: direction');
    expect(emit("ctx.direction = 'rtl';")).toThrow('Canvas2D property is not in the host endpoint contract: direction');
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
    expect(output).toContain('(cast map : AliasMap).set(');
    expect(output).toContain('(cast map : AliasMap).delete_(');
    expect(output).toContain('(cast readonlyMap : flight._internal._Map<String, Float>).entries(');
    expect(output).toContain('(cast wrappedMap : flight._internal._Map<String, Float>).get(');
    expect(output).toContain('(cast set : flight._internal._Set<String>).add(');
    expect(output).toContain('(cast weakMap : flight._internal._WeakMap<flight._internal._Object, Float>).set(');
    expect(output).toContain('(cast weakSet : flight._internal._WeakSet<flight._internal._Object>).has(');
    expect(output).toContain('(cast map : AliasMap).size');
    expect(output).toContain('__collection');
    expect(output).not.toContain("_Runtime.callProperty(map, 'get'");
    expect(output).not.toContain("_Runtime.field(map, 'size')");
    expect(output).toContain("_Runtime.callProperty(dynamic_, 'get'");
  });

  it('routes typed Array callbacks through JS-arity collection endpoints', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/tween/src/tween.ts',
      `
        interface Mapper {
          map(callback: (value: string) => string): string[];
        }
        export function makeTweenProperties(keys: string[]) {
          return keys.map((key) => ({ change: 0, key, start: 0 }));
        }
        export function indexed(keys: readonly string[], out: string[]) {
          keys.forEach((key, index) => out.push(key + index));
          return keys.filter((key) => key.length > 0);
        }
        export function dynamicMap(values: any) {
          return values.map((value: any) => value);
        }
        export function structuralMap(mapper: Mapper) {
          return mapper.map((value) => value);
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/tween', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ArrayCallbackFixture',
      packageName: '@flighthq/tween',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('_Runtime.mapArray((cast keys : Array<String>)');
    expect(output).toContain('_Runtime.forEachArray((cast keys : Array<String>)');
    expect(output).toContain('_Runtime.filterArray((cast keys : Array<String>)');
    expect(output).toContain('function(key:String, __unused0:Float, __unused1:Array<String>)');
    expect(output).toContain("_Runtime.callProperty(values, 'map'");
    expect(output).toContain('_Runtime.haxeArity(function(value:flight._internal._Any)');
    expect(output).toContain('(cast mapper : Mapper).map');
    expect(output).not.toContain('_Runtime.mapArray((cast mapper');
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
          read(tolerance: number = 0.25): number {
            return tolerance;
          }
        }
        export function advance(
          counter: Counter,
          maybe: Counter | undefined,
          dynamic: any,
          options?: { tolerance?: number },
        ): void {
          counter.bump(1);
          maybe?.bump(2);
          counter.read();
          counter.read(options?.tolerance);
          maybe?.read();
          maybe?.read(options?.tolerance);
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
    expect(output).toContain('(cast counter : Counter).read()');
    expect(output).toContain('(cast counter : Counter).read(#if js (cast ({ final __structural');
    expect(output).toContain(': Float) #else (cast ({ final __structural');
    expect(output).toContain(': Null<Float>) #end)');
    expect(output).toMatch(/\(cast __generatedClass\d+ : Counter\)\.read\(\)/);
    expect(output).toContain("_Runtime.callProperty(counter, 'bump', _Runtime.concatArrays");
    expect(output).toContain("_Runtime.callProperty(dynamic_, 'bump'");
    expect(output).not.toContain("_Runtime.callProperty(counter, 'bump', cast ([1.0]");
  });

  it('emits direct calls for generated class receivers declared in another package source file', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/useReader.ts',
      `
        export function readValue(reader: SharedReader): number {
          return reader.readUint32();
        }
      `,
      {
        '/workspace/upstream/packages/example/src/sharedReader.ts': `
          class SharedReader {
            readUint32(): number { return 42; }
          }
        `,
      },
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CrossSourceClassFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('(cast reader : SharedReader).readUint32()');
    expect(output).not.toContain("_Runtime.callProperty(reader, 'readUint32'");
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
          return [gl, canvas.style];
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
    expect(output).toContain("_Runtime.field(canvas, 'style')");
    expect(output).not.toContain("CanvasElementBackend.field(canvas, 'style')");
    expect(output).not.toContain("Canvas2dBackend.call(canvas, 'getContext'");
    expect(output).not.toContain("_Runtime.callProperty(canvas, 'getContext'");
  });

  it('maps checker-resolved host types and emits their unbound members directly', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/image/src/hostTypes.ts',
      `
        interface HTMLFlightLocal { width: number; }
        interface ImageBox { image: HTMLImageElement; }
        interface StreamBox { stream: ReadableStream<Uint8Array>; }
        export function host(
          image: HTMLImageElement,
          nullable: HTMLImageElement | null,
          media: HTMLImageElement | HTMLVideoElement,
          local: HTMLFlightLocal,
          box: ImageBox,
          streams: StreamBox,
          message: MessageEvent,
          url: string,
        ) {
          const width = image.width;
          image.src = url;
          image.decode();
          const optional = nullable?.height;
          const ambiguous = media.src;
          const localWidth = local.width;
          const boxedWidth = box.image.width;
          streams.stream.cancel();
          console.debug(url);
          const view = new DataView(new ArrayBuffer(4));
          const decoder = new TextDecoder();
          const unresolvedGpuName = GPUFlightMissing;
          return { width, optional, ambiguous, localWidth, boxedWidth, view, decoder, unresolvedGpuName };
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/image', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'HostTypes',
      packageName: '@flighthq/image',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('image:flight._internal.dom.HTMLImageElement');
    expect(output).toContain('nullable:Null<flight._internal.dom.HTMLImageElement>');
    expect(output).toContain(
      'media:flight._internal._Union2<flight._internal.dom.HTMLImageElement, flight._internal.dom.HTMLVideoElement>',
    );
    expect(output).toContain('message:flight._internal.dom.MessageEvent<flight._internal._Any>');
    expect(output).toContain('local:HTMLFlightLocal');
    expect(output).toContain('width = image.width;');
    expect(output).toContain('(image.src = url)');
    expect(output).toContain('image.decode()');
    expect(output).not.toContain('#if js image');
    expect(output).not.toContain("_Runtime.setField(image, 'src'");
    expect(output).not.toContain("_Runtime.callProperty(image, 'decode'");
    expect(output).toContain('__hostType');
    expect(output).toContain('.height; })');
    expect(output).toContain('(cast media : { var src:String; }).src');
    expect(output).toContain('(cast local : HTMLFlightLocal).width');
    expect(output).toContain('(cast (cast box : ImageBox).image : flight._internal.dom.HTMLImageElement).width');
    expect(output).toContain(
      '(cast (cast streams : StreamBox).stream : flight._internal.dom.ReadableStream<Dynamic>).cancel()',
    );
    expect(output).toContain(
      "(cast flight._internal._HostValueLut.get('console') : flight._internal.dom.Console).debug(url)",
    );
    expect(output).toContain("_Runtime.construct(flight._internal._HostValueLut.get('DataView')");
    expect(output).toContain("_Runtime.construct(flight._internal._HostValueLut.get('TextDecoder')");
    expect(output).toContain('unresolvedGpuName = GPUFlightMissing;');
    expect(output).not.toContain("flight._internal._HostValueLut.get('GPUFlightMissing')");
    expect(lowered.hostTypes.map((use) => use.name)).toContain('HTMLImageElement');
    expect(lowered.hostTypes.some((use) => use.kind === 'member' && use.member === 'decode')).toBe(true);
    expect(lowered.hostTypes.some((use) => use.name === 'HTMLFlightLocal')).toBe(false);
    const audit = createHostTypeAudit('fixture', lowered.hostTypes);
    expect(audit.types.find((type) => type.name === 'ReadableStream')?.arities).toEqual([1]);
    expect(audit).toEqual(createHostTypeAudit('fixture', [...lowered.hostTypes].reverse()));
  });

  it('keeps exact audio and vignette host calls receiver-safe on Neko', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/audio/src/hostStub.ts',
      `
        export function copySamples(buffer: AudioBuffer, samples: Float32Array): void {
          buffer.copyToChannel(samples, 0);
        }
        export function addVignetteStop(gradient: CanvasGradient): void {
          gradient.addColorStop(1, 'rgba(0,0,0,1)');
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/audio', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'HostStub',
      packageName: '@flighthq/audio',
    });
    const fixtureDirectory = path.resolve('build/haxe-host-stub-neko-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    const nekoOutput = path.join(fixtureDirectory, 'main.n');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'HostStub.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'StubAudioBuffer.hx'),
      `
        class StubAudioBuffer implements flight._internal.dom.AudioBuffer {
          public final duration:Float = 0;
          public final length:Int = 1;
          public final numberOfChannels:Int = 1;
          public final sampleRate:Float = 44100;
          public var calls:Int = 0;
          public function new() {}
          public function getChannelData(_channel:Float):flight._internal._Float32Array {
            return new flight._internal._Float32Array(1);
          }
          public function copyToChannel(_source:flight._internal._Float32Array, _channel:Float, ?_start:Float):Void {
            calls++;
          }
        }
      `,
    );
    writeFileSync(
      path.join(fixtureDirectory, 'StubCanvasGradient.hx'),
      `
        class StubCanvasGradient implements flight._internal.dom.CanvasGradient {
          public var pattern:Int = 0;
          public function new() {}
          public function addColorStop(_offset:Float, _color:String):Void pattern++;
        }
      `,
    );
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        class Main {
          static function main() {
            final audio = new StubAudioBuffer();
            flight.HostStub.copySamples(audio, new flight._internal._Float32Array(1));
            if (audio.calls != 1) throw 'optional-arity audio call did not execute exactly once';
            final gradient = new StubCanvasGradient();
            flight.HostStub.addVignetteStop(gradient);
            if (gradient.pattern != 1) throw 'vignette call lost its receiver';
          }
        }
      `,
    );

    expect(output).toContain('buffer.copyToChannel(samples, 0.0);');
    expect(output).toContain("gradient.addColorStop(1.0, 'rgba(0,0,0,1)');");
    expect(output).not.toContain("_Runtime.callProperty(buffer, 'copyToChannel'");
    expect(output).not.toContain("_Runtime.callProperty(gradient, 'addColorStop'");
    execFileSync(
      'node',
      [
        'tools/haxe.mjs',
        '-cp',
        fixtureDirectory,
        '-cp',
        'src',
        '-cp',
        'generated',
        '--main',
        'Main',
        '-neko',
        nekoOutput,
      ],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    execFileSync('neko', [nekoOutput], { cwd: path.resolve('.'), stdio: 'pipe' });
  });

  it('does not emit bare casts for typed closure call arguments', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/swf/src/swfCast.ts',
      `
        type Decompressor = (compressed: Uint8Array, uncompressedSize: number) => Uint8Array | null;
        const FWS_SIGNATURE = 70;
        const CWS_SIGNATURE = 67;
        const ZWS_SIGNATURE = 90;
        const W_SIGNATURE = 87;
        const S_SIGNATURE = 83;
        const SWF_PREFIX_LENGTH = 8;
        const SWF_LZMA_PREFIX_LENGTH = 17;
        const MIN_SWF_LENGTH = 30;
        let registered: Decompressor | null = null;
        class SwfReader {
          constructor(source: Uint8Array, start: number, end: number) {}
          readUint32(): number { return 30; }
        }
        function getDecompressor(compression: string): Decompressor | null { return registered; }
        export interface Narrow { value: number; }
        export interface Wide { value: number; extra: number; }
        function useNarrow(value: Narrow): void {}
        export function useWide(value: Wide): void { useNarrow(value); }
        export function uncompressSwfSource(source: Uint8Array): Uint8Array | null {
          if (source.length < SWF_PREFIX_LENGTH || source[1] !== W_SIGNATURE || source[2] !== S_SIGNATURE) return null;
          const signature = source[0];
          if (signature === FWS_SIGNATURE) return source;
          const compression = signature === CWS_SIGNATURE ? 'Deflate' : signature === ZWS_SIGNATURE ? 'Lzma' : null;
          if (compression === null) return null;
          const decompress = getDecompressor(compression);
          if (decompress === null) return null;
          const header = new SwfReader(source, 0, SWF_PREFIX_LENGTH);
          header.readUint32();
          const fileLength = header.readUint32();
          if (fileLength < MIN_SWF_LENGTH) return null;
          const bodyLength = fileLength - SWF_PREFIX_LENGTH;
          const streamStart = compression === 'Lzma' ? SWF_LZMA_PREFIX_LENGTH : SWF_PREFIX_LENGTH;
          if (streamStart > source.length) return null;
          const body = decompress(source.subarray(streamStart), bodyLength);
          if (body === null || body.length < bodyLength) return null;
          const uncompressed = new Uint8Array(SWF_PREFIX_LENGTH + bodyLength);
          uncompressed.set(source.subarray(0, SWF_PREFIX_LENGTH));
          uncompressed[0] = FWS_SIGNATURE;
          uncompressed.set(body.subarray(0, bodyLength), SWF_PREFIX_LENGTH);
          return uncompressed;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/swf', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'SwfCastFixture',
      packageName: '@flighthq/swf',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      'decompress((cast source : flight._internal._UInt8Array).subarray(Std.int(streamStart)), (cast bodyLength : Float))',
    );
    expect(output).not.toContain('decompress((cast (cast');
    expect(output).toMatch(/useNarrow\(\(\{ final (__callArgument\d+):Dynamic = value; \1; \}\)\)/u);
  });

  it('runs the production SWF decompressor call shape on Neko with full DCE', () => {
    const fixtureDirectory = path.resolve('build/haxe-swf-cast-neko-fixture');
    const nekoOutput = path.join(fixtureDirectory, 'main.n');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(fixtureDirectory, { recursive: true });
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight._internal._UInt8Array;
        import flight._Compression.registerDeflateDecompressor;
        import flight._Swf.createScene2DFromSwf;

        class Main {
          static function main():Void {
            registerDeflateDecompressor();
            final source = new _UInt8Array([
              67, 87, 83, 10, 38, 0, 0, 0,
              120, 156, 99, 96, 192, 7, 0, 0, 30, 0, 1,
            ]);
            createScene2DFromSwf(source);
          }
        }
      `,
    );
    execFileSync(
      'node',
      [
        'tools/haxe.mjs',
        '-cp',
        fixtureDirectory,
        '-cp',
        'src',
        '-cp',
        'generated',
        '--main',
        'Main',
        '-neko',
        nekoOutput,
        '-dce',
        'full',
      ],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    expect(() => execFileSync('neko', [nekoOutput], { cwd: path.resolve('.'), stdio: 'pipe' })).not.toThrow();
  });

  it('routes non-Flight imported values through stable module toolkit keys', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/host/src/external.ts',
      `
        import defaultValue, { named as localName } from 'host-package';
        import * as namespace from 'host-namespace';
        export function values() { return [defaultValue, localName, namespace]; }
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/host', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ExternalValues',
      packageName: '@flighthq/host',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("flight._internal._HostModuleLut.get('host-package', 'default')");
    expect(output).toContain("flight._internal._HostModuleLut.get('host-package', 'named')");
    expect(output).toContain("flight._internal._HostModuleLut.get('host-namespace', '*')");
    expect(output).not.toContain('_Runtime.externalValue');
  });

  it('does not route an imported host-typed value as an ambient global', () => {
    const sourceFile = '/workspace/upstream/packages/scene3d-wgpu/src/shadow.ts';
    const constantsFile = '/workspace/upstream/packages/scene3d-wgpu/src/constants.ts';
    const ambientFile = '/workspace/node_modules/@webgpu/types/index.d.ts';
    const { checker, source } = typedSource(
      sourceFile,
      `
        import { SHADOW_DEPTH_FORMAT } from './constants';
        export function shadowFormat(): GPUTextureFormat { return SHADOW_DEPTH_FORMAT; }
        export function textureUsage(): number { return GPUTextureUsage.TEXTURE_BINDING; }
      `,
      {
        [constantsFile]: "export const SHADOW_DEPTH_FORMAT: GPUTextureFormat = 'depth32float';",
        [ambientFile]: `
          export {};
          declare global {
            type GPUTextureFormat = 'depth32float';
            const GPUTextureUsage: { readonly TEXTURE_BINDING: number };
          }
        `,
      },
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/scene3d-wgpu', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'Shadow',
      packageName: '@flighthq/scene3d-wgpu',
    });

    expect(output).toContain('return cast SHADOW_DEPTH_FORMAT;');
    expect(output).not.toContain("flight._internal._HostValueLut.get('SHADOW_DEPTH_FORMAT')");
    expect(output).toContain("WebGpuConstantsBackend.value('GPUTextureUsage', 'TEXTURE_BINDING')");
  });

  it('leaves unresolved type names visible so Haxe compilation fails loudly', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/missingHost.ts',
      'export function identity(value: MissingHostType): MissingHostType { return value; }',
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'MissingHost',
      packageName: '@flighthq/example',
    });
    const fixtureDirectory = path.resolve('build/haxe-missing-host-type-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'MissingHost.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        import flight.MissingHost.identity;
        class Main {
          static function main() identity(null);
        }
      `,
    );

    expect(output).toContain('value:MissingHostType');
    expect(output).not.toContain('value:Dynamic');
    expect(output).not.toContain('flight._internal.dom.MissingHostType');
    let errorText = '';
    try {
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '-cp', 'generated', '--main', 'Main', '--interp'],
        { cwd: path.resolve('.'), stdio: 'pipe' },
      );
    } catch (error) {
      errorText = String((error as { stderr?: unknown }).stderr ?? error);
    }
    expect(errorText).toMatch(/Type not found.*MissingHostType/su);
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
      "DomNavigatorBackend.hasField(flight._internal.backend.DomNavigatorBackend.value(), 'share')",
    );
    expect(output).toContain(
      "DomWindowBackend.call(flight._internal.backend.DomWindowBackend.value(), 'addEventListener'",
    );
    expect(output).toContain("DomWindowBackend.call(flight._internal.backend.DomWindowBackend.value(), 'matchMedia'");
    expect(output).toContain("DomWindowBackend.call(win, 'getScreenDetails'");
    expect(output).toContain(
      "DomDocumentBackend.setField(flight._internal.backend.DomDocumentBackend.value(), 'title', 'Flight')",
    );
    expect(output).toContain(
      "DomDocumentBackend.call(flight._internal.backend.DomDocumentBackend.value(), 'createElement'",
    );
    expect(output).toContain("DomDocumentBackend.call(flight._internal.backend.DomDocumentBackend.value(), 'hasFocus'");
    expect(output).toContain(
      "DomNavigatorBackend.call(flight._internal.backend.DomNavigatorBackend.value(), 'getGamepads'",
    );
    expect(output).toContain(
      "DomNavigatorBackend.field(flight._internal.backend.DomNavigatorBackend.value(), 'language')",
    );
    expect(output).toContain("DomNavigatorBackend.call(nav, 'getBattery'");
    expect(output).toContain("_Runtime.field(document, 'title')");
    expect(output).toContain("_Runtime.hasField(window, 'local')");
    expect(output).toContain("_Runtime.hasField(document, 'local')");
    expect(output).toContain("_Runtime.hasField(navigator, 'local')");
    expect(output).toContain("flight._internal._HostValueLut.typeofValue('window')");
    expect(output).toContain("flight._internal._HostValueLut.typeofValue('document')");
    expect(output).toContain("flight._internal._HostValueLut.typeofValue('navigator')");
    expect(output).toContain("_Runtime.hasField(localNavigator, 'share')");
    expect(output).toContain("_Runtime.field(localNavigator, 'share')");
    expect(output).toContain("_Runtime.hasField(mutableNavigator, 'share')");
    expect(output).not.toContain("flight._internal._HostValueLut.get('window')");
    expect(output).not.toContain("flight._internal._HostValueLut.get('document')");
    expect(output).not.toContain("flight._internal._HostValueLut.get('navigator')");
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
          const dictionary = Object.create(null);
          Object.fromEntries(Object.entries(target));
          return Object.keys(target).length + Object.entries(target).length + (Object.hasOwn(dictionary, 'key') ? 1 : 0);
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
    expect(output).toContain('flight._internal.DynamicObject.assign(target, source)');
    expect(output).toContain('flight._internal.DynamicObject.keys(target)');
    expect(output).toContain('flight._internal.DynamicObject.entries(target)');
    expect(output).toContain(
      'flight._internal.DynamicObject.fromEntries(flight._internal.DynamicObject.entries(target))',
    );
    expect(output).toContain('flight._internal.DynamicObject.create(null)');
    expect(output).toContain("flight._internal.DynamicObject.hasOwn(dictionary, 'key')");
    expect(output).not.toContain("_HostValueLut.get('Object')");
    expect(output).not.toContain('Reflect.fields');
  });

  it('collapses generic object intersections and sequences void call arguments', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/genericBoundary.ts',
      `
        interface Common { done: boolean; }
        interface Sink { stop(): void; }
        type IsAny<T> = 0 extends 1 & T ? true : false;
        function assertSyncVoid<T>(value: T & (IsAny<T> extends true ? never : T extends void ? unknown : never)): void {
          void value;
        }
        export function merge<T extends object>(fields: T): T & Common { return { ...fields, done: false }; }
        export function release(sink: Sink): void { assertSyncVoid(sink.stop()); }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'GenericBoundaryFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function merge<T:flight._internal._Object>(fields:T):T');
    expect(output).not.toContain('{ >T,');
    expect(output).toContain('; _Runtime.UNDEFINED; })');
  });

  it('keeps wrapped generic members of inferred intersections nominal', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/wrappedGenericIntersection.ts',
      `
        declare const EntityRuntimeKey: unique symbol;
        interface Entity { readonly [EntityRuntimeKey]: undefined; }
        interface Host extends Entity { readonly app: {}; }
        declare function createEntity<T extends object>(value: T): T & Entity;
        export function createHost<Capabilities extends Partial<Host>>(
          capabilities: Readonly<Capabilities>,
        ): Host & Capabilities {
          return createEntity({ app: {}, ...capabilities });
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'WrappedGenericIntersectionFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('flight._internal._Intersection2');
    expect(output).not.toContain('{ >Capabilities,');
  });

  it('keeps intersections with conflicting structural fields nominal', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/overlappingIntersection.ts',
      `
        interface SessionBackend { destroy(): void; }
        interface ActionBackend { destroy(): void; }
        interface HasSession { media: { session: SessionBackend }; }
        interface HasAction { media: { action: ActionBackend }; }
        export function destroy(host: HasSession & HasAction): void {
          host.media.session.destroy();
          host.media.action.destroy();
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'OverlappingIntersectionFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('host:flight._internal._Intersection2<HasSession, HasAction>');
    expect(output).not.toContain('host:{ >HasSession, >HasAction, }');
  });

  it('keeps Host intersections with conflicting capability fields nominal', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/hostIntersection.ts',
      `
        interface Host { clipboard: { text: { read(): string } }; }
        interface HasClipboardChange { clipboard: { change: { listen(): void } }; }
        export const host = {} as Host & HasClipboardChange;
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'HostIntersectionFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('flight._internal._Intersection2<Host, HasClipboardChange>');
    expect(output).not.toContain('{ >Host, >HasClipboardChange, }');
  });

  it('keeps nested Host capability intersections with conflicting fields nominal', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/hostCapabilityIntersection.ts',
      `
        interface HostClipboardCapabilities { change?: { subscribe(listener: () => void): void }; }
        export function combine(
          value: HostClipboardCapabilities & { change: unknown; text: { read(): string } },
        ): void { void value; }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'HostCapabilityIntersectionFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('flight._internal._Intersection2<HostClipboardCapabilities');
    expect(output).not.toContain('{ >HostClipboardCapabilities, var change:');
  });

  it('expands Partial interface heritage into optional structural fields', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/partialHeritage.ts',
      `
        interface BasicBackend { copy(from: string, to: string): Promise<boolean>; remove(path: string): void; }
        export interface HostBackend extends Partial<BasicBackend> { usage?(): Promise<number>; }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'PartialHeritageFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('@:optional var copy:Null<String->String->flight._internal._Promise<Bool>>');
    expect(output).toContain('@:optional var remove:Null<String->Void>');
  });

  it('keeps options refinements with conflicting fields nominal', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/optionsRefinement.ts',
      `
        type Platform = 'linux' | 'windows';
        interface ElectronBackendOptions { platform: Platform; }
        export function register<Profile extends Platform>(
          options: Readonly<ElectronBackendOptions> & { readonly platform: Profile },
        ): void { void options; }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'OptionsRefinementFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('flight._internal._Intersection2<ElectronBackendOptions');
    expect(output).not.toContain('{ >ElectronBackendOptions, var platform:Profile; }');
  });

  it('erases local type parameters from generic arrow signatures', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/genericArrow.ts',
      `
        type Failure = 'failed';
        declare function classify<T>(value: T): T;
        export const persist = <FailureReason extends Failure>(
          fallback: FailureReason,
        ): { reason: 'ok' | FailureReason } => ({ reason: classify(fallback) });
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'GenericArrowFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).not.toContain('FailureReason');
    expect(output).toMatch(/fallback:(?:Dynamic|flight\._internal\._Any)/u);
  });

  it('erases generic contextual padding parameter types', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/contextualPadding.ts',
      `
        type Listener<Arguments extends unknown[]> = (...args: Arguments) => void;
        declare function use<Arguments extends unknown[]>(listener: Listener<Arguments>): void;
        export function attach(): void { use(() => {}); }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ContextualPaddingFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).not.toMatch(/__unused\d+:Arguments/u);
  });

  it('lowers portable standard identity, constants, and iterable probes explicitly', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function inspect(size: number[] | { width: number }) {
          return {
            same: Object.is(0, -0),
            diagonal: Math.SQRT2,
            wordBytes: Uint16Array.BYTES_PER_ELEMENT,
            positional: Symbol.iterator in Object(size),
          };
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
      name: 'StandardRuntimeFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('flight._internal.DynamicObject.is(0.0, -0.0)');
    expect(output).toContain(`diagonal: ${String(Math.SQRT2)}`);
    expect(output).toContain('wordBytes: 2.0');
    expect(output).toContain('_Runtime.isIterable(size)');
    expect(output).not.toContain('Symbol.iterator');
    expect(output).not.toContain('Uint16Array.BYTES_PER_ELEMENT');
  });

  it('keeps Object.keys results string-typed through keyof assertions', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/objectKeys.ts',
      `
        interface TextFormat { bold?: boolean; size?: number; }
        export function formatKeys(format: TextFormat): (keyof TextFormat)[] {
          const keys = Object.keys(format) as (keyof TextFormat)[];
          return keys;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ObjectKeysFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function formatKeys(format:TextFormat):Array<String>');
    expect(output).toContain('var keys:Array<String> = cast _Runtime.UNDEFINED;');
    expect(output).toContain('(cast flight._internal.DynamicObject.keys(format) : Array<String>)');
    expect(output).not.toContain('Array<TextFormat>');
  });

  it('lowers defensive nullish assignment on structural primitive fields portably', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/nullishField.ts',
      `
        interface Counter { value: number; }
        export function initialize(counter: Counter): number {
          return counter.value ??= 0;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'NullishFieldFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('final __nullishValue1:Null<Float>');
    expect(output).toContain(
      '__nullishValue1 == null ? ((cast __nullishOwner0 : Counter).value = (cast 0.0 : Float)) : (cast __nullishValue1 : Float)',
    );
    expect(output).not.toContain('counter.value ??=');
    expect(output).not.toContain('Dynamic = cast (cast __nullishOwner0 : Counter).value');
  });

  it('lowers portable callbacks and guarded platform constructors without capturing locals', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function compact(values: string[]): string[] {
          return values.filter(Boolean);
        }
        export function isFrame(value: unknown): boolean {
          return typeof VideoFrame !== 'undefined' && value instanceof VideoFrame;
        }
        export function isTypeError(value: unknown): boolean {
          return value instanceof TypeError;
        }
        export function local(Boolean: (value: unknown) => boolean, VideoFrame: new () => object) {
          return [Boolean(1), new VideoFrame()];
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'PlatformValueFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      '_Runtime.filterArray((cast values : Array<String>), _Runtime.truthy, _Runtime.UNDEFINED)',
    );
    expect(output).toContain("_Runtime.isInstanceOf(value, flight._internal._HostValueLut.get('VideoFrame'))");
    expect(output).toContain("_Runtime.isInstanceOfName(value, 'TypeError')");
    expect(output).toContain('Boolean((cast 1.0 : flight._internal._Any))');
    expect(output).not.toContain('_Runtime.callValue(Boolean,');
    expect(output).toContain('_Runtime.construct(VideoFrame, [])');
  });

  it('uses the typed no-value carrier for contextual void callback parameters', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/voidCallback.ts',
      `
        export function settled(result: Promise<void>): Promise<boolean> {
          return result.then(() => true);
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'VoidCallbackFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function(__unused0:flight._internal._Nothing):Bool return true');
    expect(output).not.toContain('function(__unused0:Void)');
  });

  it('routes string aliases through portable methods without capturing structural lookalikes', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/stringAlias.ts',
      `
        type Format = 'astc-rgba' | 'bc-rgba';
        interface Matcher { startsWith(prefix: string): boolean; }
        export function matches(format: Format): boolean {
          return format.startsWith('astc') && format.endsWith('rgba') && format.includes('-');
        }
        export function structural(matcher: Matcher): boolean {
          return matcher.startsWith('astc');
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'StringAliasFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("StringTools.startsWith(format, 'astc')");
    expect(output).toContain("StringTools.endsWith(Std.string(format), 'rgba')");
    expect(output).toContain("_Runtime.includes(format, '-')");
    expect(output).toContain("(cast matcher : Matcher).startsWith((cast 'astc' : String))");
  });

  it('uses runtime construction for constructor values while preserving nominal classes', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export class Service {}
        export function copy(source: Map<string, number>) {
          const Registry = source.constructor as new () => Map<string, number>;
          return [new Registry(), new Service()];
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'RuntimeConstructorFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('_Runtime.construct(Registry, [])');
    expect(output).toContain('new Service()');
    expect(output).not.toContain('new Registry()');
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
            features: device.features,
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
      "WebGpuQueueBackend.call(flight._internal.backend.WebGpuDeviceBackend.field(device, 'queue'), 'submit'",
    );
    expect(output).toContain("WebGpuCanvasContextBackend.call(context, 'configure'");
    expect(output).toContain("WebGpuCanvasContextBackend.call(context, 'getCurrentTexture'");
    expect(output).toContain("WebGpuDeviceBackend.field(device, 'limits')");
    expect(output).toContain("_Runtime.field(device, 'features')");
    expect(output).not.toContain("WebGpuDeviceBackend.field(device, 'features')");
    expect(output).toContain(
      "WebGpuLimitsBackend.field(flight._internal.backend.WebGpuDeviceBackend.field(device, 'limits'), 'minUniformBufferOffsetAlignment')",
    );
    expect(output).toContain(
      "WebGpuLimitsBackend.field(flight._internal.backend.WebGpuDeviceBackend.field(device, 'limits'), 'maxTextureDimension2D')",
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

  it('keeps statically typed optional Void property calls direct', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/optional-call.ts',
      `
        export interface Handler {
          submit(value: number): void;
          optional?: (value: number) => void;
          read(): number;
        }
        export function invoke(handler: Handler | null, value: number): number | undefined {
          handler?.submit(value);
          handler?.optional?.(value);
          return handler?.read();
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'OptionalCallFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('final __optionalOwner1 = handler');
    expect(output).toContain('(cast __optionalOwner1 : { var submit:Float->Void; }).submit');
    expect(output).toContain('if (__optionalCall0 != null) __optionalCall0(value)');
    expect(output).toContain('@:optional var optional:Null<Float->Void>');
    expect(output).toContain('if (__optionalCall2 != null) __optionalCall2(value)');
    expect(output).toContain('_Runtime.callOptionalValue(({ final __structural');
    expect(output.match(/_Runtime\.callOptionalValue/g)).toHaveLength(1);
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

  it('lowers object destructuring assignments through a single evaluated temporary', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/objectAssignment.ts',
      `
        export function update(value: any): boolean {
          let attachFailed = false;
          let releaseFailed = false;
          ({ attachFailed, releaseFailed } = value);
          return attachFailed || releaseFailed;
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
      name: 'ObjectAssignmentFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("attachFailed = cast _Runtime.field(__destructure0, 'attachFailed')");
    expect(output).toContain("releaseFailed = cast _Runtime.field(__destructure0, 'releaseFailed')");
    expect(output).not.toContain('} = value');
  });

  it('routes queueMicrotask through the portable runtime', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/microtask.ts',
      `export function schedule(callback: () => void): void { queueMicrotask(callback); }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'MicrotaskFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('_Runtime.queueMicrotask(callback)');
    expect(output).not.toContain("_HostValueLut.get('queueMicrotask')");
  });

  it('widens shorter callbacks assigned to typed function variables', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/callbackAssignment.ts',
      `
        function noop(): void {}
        export function bind(): (outcome: string) => void {
          let resolve: (outcome: string) => void = noop;
          return resolve;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CallbackAssignmentFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toMatch(/resolve = \(cast function\(__unused\d+:String\):Void/u);
  });

  it('declares object bindings before initializers that capture their owner', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/objectRecursion.ts',
      `
        export function create() {
          const release = { released: false, run() { release.released = true; } };
          return release;
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
      name: 'ObjectRecursionFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toMatch(/var release:[^;]+ = cast _Runtime\.UNDEFINED;\s+release =/u);
  });

  it('emits direct Array destructuring reads while keeping unapproved receiver shapes dynamic', () => {
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
      assignment: { direct: 0, parked: 0, proven: 2 },
      declaration: { direct: 4, parked: 6, proven: 7 },
      parameter: { direct: 2, parked: 0, proven: 2 },
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
    expect(emission.indexedAccesses).toEqual({ reads: 6, writes: 0 });
    expect(emission.indexedReceivers.Array).toEqual({ reads: 6, writes: 0 });
    expect(output.match(/_Runtime\.getIndex\(/gu)).toHaveLength(11);
    expect(output.match(/_StaticIndex\.readArray\(/gu)).toHaveLength(6);
    expect(output).not.toContain('__flight_destructuring_index');
    expect(output).not.toContain('_StaticIndex.readFloat32Array');
    expect(output).not.toContain('_StaticIndex.readArrayOrFloat32Array');
    expect(output).not.toContain('_StaticIndex.readUint16ArrayOrUint32Array');
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
        assignment: { direct: 0, parked: 0, proven: 0 },
        declaration: { direct: 0, parked: 0, proven: 0 },
        parameter: { direct: 0, parked: 0, proven: 0 },
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
      guardedArrayReads: {
        asyncFlowForInKeys: 0,
        asyncFlowForOfValues: 0,
      },
      numericRelations: 1,
      syntheticArrayReads: {
        highArityArguments: 0,
        iterationBindings: 0,
      },
      typedArraySetCalls: 0,
      typedArraySetReceivers: {
        Float32Array: 0,
        Float64Array: 0,
        Int16Array: 0,
        Int32Array: 0,
        Int8Array: 0,
        Uint16Array: 0,
        Uint16ArrayOrUint32Array: 0,
        Uint32Array: 0,
        Uint8Array: 0,
        Uint8ClampedArray: 0,
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
    expect(output).toContain('_StaticIndex.readFloat32ArrayTyped((cast floats : flight._internal._Float32Array)');
    expect(output).toContain('_StaticIndex.writeFloatArrayTyped((cast values : Array<Float>)');
    expect(output).toMatch(
      /\(\{ var __indexedObject\d+:flight\._internal\._Float32Array = floats; var __indexedKey\d+:Float = 2\.0; flight\._internal\._StaticIndex\.writeFloat32ArrayTyped\(.+_StaticIndex\.readFloat32ArrayTyped\(.+ \+ b\).+\); \}\)/u,
    );
    expect(output).not.toContain('_Runtime.addNumbers(flight._internal._StaticIndex.readFloat32ArrayTyped');
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

  it('sequences void-valued logical branches without using Void as a value', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/voidLogical.ts',
      `
        export function subscribe(active: boolean, listener: () => void): () => void {
          const handle = () => active && listener();
          return handle;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'VoidLogicalFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('function():Dynamic { listener(); return _Runtime.UNDEFINED; }');
    expect(output).not.toContain('function():Dynamic return cast listener()');
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
      expect(output).toContain(`_StaticIndex.read${receiver}Typed(`);
      expect(output).toContain(`_StaticIndex.write${receiver}Typed(`);
    }
    expect(output).toContain('_StaticIndex.readFloatArrayTyped((cast values : Array<Float>)');
    expect(output).toContain('_StaticIndex.readFloat32ArrayTyped((cast typed : flight._internal._Float32Array)');
    expect(output).toContain('_StaticIndex.readFloat32ArrayTyped((cast readonly : flight._internal._Float32Array)');
    expect(output).toContain('_StaticIndex.readFloat32ArrayTyped((cast same : flight._internal._Float32Array)');
    expect(output).toContain('_Runtime.getIndex(structural, key)');
    expect(output).toContain('_Runtime.getIndex(mixed, key)');
    expect(output).toContain('_Runtime.getIndex((cast value : flight._internal._Any), key)');
    expect(output).toMatch(
      /\(\{ var (__indexedObject\d+):Array<Float> = .*receiver.*; var (__indexedKey\d+):Float = .*key.*; flight\._internal\._StaticIndex\.writeFloatArrayTyped\(.+_StaticIndex\.readFloatArrayTyped\(.+ \+ .*value.*\).+\); \}\)/u,
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
    expect(output).toContain(
      '_Runtime.setIndex(indices, key, _Runtime.addNumbers(_Runtime.getIndex(indices, key), value))',
    );
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
      }
      export function createView(buffer: ArrayBuffer, offset: number, length: number) {
        return new Uint8Array(buffer, offset, length);
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
    expect(output).toContain('new flight._internal._Float32Array(4.0)');
    expect(output).toContain('new flight._internal._Float64Array(');
    expect(output).toContain('new flight._internal._Int16Array(');
    expect(output).toContain('new flight._internal._Int32Array(');
    expect(output).toContain('new flight._internal._Int8Array(');
    expect(output).toContain('new flight._internal._UInt16Array(');
    expect(output).toContain('new flight._internal._UInt32Array(');
    expect(output).toContain('new flight._internal._UInt8Array(');
    expect(output).toContain('new flight._internal._UInt8ClampedArray(');
    expect(output).toContain('new flight._internal._UInt8Array(buffer, Std.int(offset), Std.int(length))');
    expect(output).not.toContain('new flight._internal._Float32Array(Std.int(4.0))');
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
      expect(output).not.toContain(`_Runtime.construct(flight._internal._HostValueLut.get('${name}')`);
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
    expect(output).toContain('(cast data : flight._internal._Float32Array).subarray(Std.int(1.0), Std.int(3.0))');
    expect(output).toContain('(cast bytes : flight._internal._UInt8Array).subarray(Std.int(2.0))');
    expect(output).not.toContain('data.subarray(');
    expect(output).not.toContain('bytes.subarray(');
  });

  it('emits method-specific typed-array set calls without coercing their sources', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/typed-array-set.ts',
      `export function copy(
         float32: Float32Array,
         float64: Float64Array,
         int16: Int16Array,
         int32: Int32Array,
         int8: Int8Array,
         uint16: Uint16Array,
         uint32: Uint32Array,
         uint8: Uint8Array,
         clamped: Uint8ClampedArray,
         source: ArrayLike<number>,
         offset: number,
       ) {
         float32.set(source, offset);
         float64.set(source);
         int16.set(source);
         int32.set(source);
         int8.set(source);
         uint16.set(source);
         uint32.set(source);
         uint8.set(source);
         clamped.set(source);
       }`,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedArraySetFixture',
      packageName: '@flighthq/example',
    });
    const emission = staticLoweringEmissionCounts();

    expect(lowered.diagnostics).toEqual([]);
    expect(lowered.staticFacts.typedArraySetCalls).toBe(9);
    expect(emission.typedArraySetCalls).toBe(9);
    for (const receiver of [
      'Float32Array',
      'Float64Array',
      'Int16Array',
      'Int32Array',
      'Int8Array',
      'Uint16Array',
      'Uint32Array',
      'Uint8Array',
      'Uint8ClampedArray',
    ] as const) {
      expect(lowered.staticFacts.typedArraySetReceivers[receiver]).toBe(1);
      expect(emission.typedArraySetReceivers[receiver]).toBe(1);
    }
    expect(output).toContain('(cast float32 : flight._internal._Float32Array).set(source, Std.int(offset))');
    expect(output).toContain('(cast clamped : flight._internal._UInt8ClampedArray).set(source)');
    expect(output).not.toContain('Std.int(source)');
    expect(output).not.toContain("_Runtime.callProperty(float32, 'set'");
    expect(output).not.toContain('__flight_direct_typed_array_set');
  });

  it('keeps shadowed and structural set calls outside typed-array intrinsic lowering', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/typed-array-set-negative.ts',
      `interface Float32Array {
         set(source: ArrayLike<number>, offset?: number): void;
       }
       export function copy(
         shadowed: Float32Array,
         structural: { set(source: ArrayLike<number>, offset?: number): void },
         mixed: globalThis.Float32Array | Uint8Array,
         unsigned: Uint16Array | Uint32Array,
         nullable: globalThis.Float32Array | null,
         floats: globalThis.Float32Array,
         source: ArrayLike<number>,
         textOffset: string,
       ) {
         shadowed.set(source);
         structural.set(source);
         mixed.set(source);
         unsigned.set(source);
         nullable?.set(source);
         floats.set(source, textOffset as any);
         floats.set(...[source]);
       }`,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedArraySetNegativeFixture',
      packageName: '@flighthq/example',
    });
    const emission = staticLoweringEmissionCounts();

    expect(lowered.diagnostics).toEqual([]);
    expect(lowered.staticFacts.typedArraySetCalls).toBe(0);
    expect(emission.typedArraySetCalls).toBe(0);
    expect(output).toContain('(cast shadowed : Float32Array).set(source)');
    expect(output).toContain(
      '(cast structural : { var set:flight._internal._ArrayLike<Float>->Null<Float>->Void; }).set(source)',
    );
    expect(output).toContain('(cast mixed : { var set:flight._internal._Any; }).set(source)');
    expect(output).toContain('(cast unsigned : { var set:flight._internal._Any; }).set(source)');
    expect(output).toContain("_Runtime.callOptionalProperty(nullable, 'set'");
    expect(output).not.toContain('flight._internal._Float32Array).set(source');
  });

  it('uses both maintained widths only for a discriminator-correlated unsigned set', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/typed-array-set-union.ts',
      `export function clone(source: Uint16Array | Uint32Array) {
         let target: Uint16Array | Uint32Array;
         if (source instanceof Uint32Array) {
           target = new Uint32Array(source.length);
         } else {
           target = new Uint16Array(source.length);
         }
         target.set(source);
         return target;
       }
       export function unrelated(target: Uint16Array | Uint32Array, source: Uint16Array | Uint32Array) {
         target.set(source);
       }
       export function inverse(source: Uint16Array | Uint32Array) {
         let target: Uint16Array | Uint32Array;
         if (source instanceof Uint16Array) {
           target = new Uint16Array(source.length);
         } else {
           target = new Uint32Array(source.length);
         }
         target.set(source);
       }`,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedArraySetUnionFixture',
      packageName: '@flighthq/example',
    });
    const emission = staticLoweringEmissionCounts();

    expect(lowered.diagnostics).toEqual([]);
    expect(lowered.staticFacts.typedArraySetCalls).toBe(1);
    expect(lowered.staticFacts.typedArraySetReceivers.Uint16ArrayOrUint32Array).toBe(1);
    expect(emission.typedArraySetCalls).toBe(1);
    expect(emission.typedArraySetReceivers.Uint16ArrayOrUint32Array).toBe(1);
    expect(output).toMatch(
      /_Runtime\.isInstanceOf\((__typedArraySetTarget\d+), flight\._internal\._HostValueLut\.get\('Uint32Array'\)\).*\(cast \1 : flight\._internal\._UInt32Array\)\.set\((__typedArraySetSource\d+)\).*\(cast \1 : flight\._internal\._UInt16Array\)\.set\(\2\)/u,
    );
    expect(output.match(/\(cast target : \{ var set:flight\._internal\._Any; \}\)\.set/gu)).toHaveLength(2);
    expect(output).not.toContain('__flight_direct_typed_array_set');
  });

  it('lowers typed-array static from calls to maintained wrapper construction', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function arrays(values: number[]) {
          return [Float32Array.from(values), Uint16Array.from(values)];
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'TypedArrayFromFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('new flight._internal._Float32Array(values)');
    expect(output).toContain('new flight._internal._UInt16Array(values)');
    expect(output).not.toContain("callProperty(flight._internal._HostValueLut.get('Float32Array'), 'from'");
    expect(output).not.toContain("callProperty(Uint16Array, 'from'");
  });

  it('preserves typed Array.from initializers and asserted indexed assignment targets', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/sample.ts',
      `
        export function prepare(binding: { values?: number[] }, count: number) {
          const buckets: number[][] = Array.from({ length: count }, () => []);
          (binding['values'] as number[] | undefined) = [1, 2, 3];
          return buckets;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ContextualArrayFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      '(cast _Runtime.toArray({ length: count }, function(__unused0:flight._internal._Any, __unused1:Float):Array<flight._internal._Any> return cast ([] : Array<Dynamic>)) : Array<Array<Float>>)',
    );
    expect(output).toContain("_Runtime.setIndex(binding, 'values', cast ([1.0, 2.0, 3.0] : Array<Dynamic>))");
    expect(output).not.toContain('cast _Runtime.getIndex(binding');
  });

  it('lowers Number constants without nullable global namespace lookups', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/sample.ts',
      `export const limits = [
        Number.POSITIVE_INFINITY,
        Number.NEGATIVE_INFINITY,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER,
        Number.MAX_VALUE,
        Number.MIN_SAFE_INTEGER,
        Number.MIN_VALUE,
        Number.NaN,
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
    expect(output).toContain('_Runtime.NUMBER_MAX_VALUE');
    expect(output).toContain('-_Runtime.MAX_SAFE_INTEGER');
    expect(output).toContain('_Runtime.NUMBER_MIN_VALUE');
    expect(output).toContain('HxMath.NaN');
    expect(output).not.toContain("flight._internal._HostValueLut.get('Number')");
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
        export class Reader {
          bitBuffer = 4;
          shift(amount: number) {
            this.bitBuffer >>= amount;
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
      '(this.bitBuffer = cast ((_Runtime.toInt32(this.bitBuffer) >> _Runtime.toInt32(amount)) : Dynamic))',
    );
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

  it('bridges runtime-Dynamic numeric arithmetic through typed runtime frames', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/dynamicNumeric.ts',
      `
        interface NumericBox { value: number; }
        interface UnknownBox { value: any; }

        export function dynamicNumeric(
          source: NumericBox,
          parent: NumericBox,
          sink: NumericBox,
          left: number,
          right: number,
        ) {
          sink.value = source.value * parent.value;
          sink.value = source.value / parent.value;
          sink.value = source.value - parent.value;
          sink.value = source.value + parent.value;
          sink.value *= parent.value;
          sink.value /= parent.value;
          sink.value -= parent.value;
          sink.value += parent.value;
          const typedProduct = left * right;
          const typedSum = left + right;
          return typedProduct + typedSum;
        }

        export function ambiguousPlus(left: UnknownBox, right: UnknownBox) {
          return left.value + right.value;
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'DynamicNumericFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    for (const [method, operator] of [
      ['multiplyNumbers', '*'],
      ['divideNumbers', '/'],
      ['subtractNumbers', '-'],
      ['addNumbers', '+'],
    ]) {
      expect(output).toContain(`((cast source : NumericBox).value ${operator} (cast parent : NumericBox).value)`);
      expect(output).toContain(`((cast sink : NumericBox).value ${operator}= (cast parent : NumericBox).value)`);
      expect(output).not.toContain(`_Runtime.${method}(_Runtime.field(source, 'value')`);
    }
    expect(output).toContain('typedProduct = (left * right)');
    expect(output).toContain('typedSum = (left + right)');
    expect(output).toContain('return cast ((cast left : UnknownBox).value + (cast right : UnknownBox).value)');
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
        type CanvasShapeHandler = (ctx: object, state: object, buf: unknown[], i: number) => void;
        interface CanvasShapeCommand {
          readonly draw: CanvasShapeHandler;
        }
        export const renderer: Renderer = {
          finish(state: number) {},
          bind(state: number) {},
          pack: (state: number) => {},
        };
        export const defaultCanvasEndFill: CanvasShapeCommand = {
          draw(_ctx, state) { void state; },
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
    expect(output).toContain(
      'draw: function(_ctx:Dynamic, state:Dynamic, __unused2:Array<flight._internal._Any>, __unused3:Float)',
    );
  });

  it('widens inferred object methods to the typed protocol arity accepted by TypeScript', () => {
    const solverFile = '/workspace/upstream/packages/example/src/solver.ts';
    const { checker, program, source } = typedSource(
      solverFile,
      `
        interface Solver {
          swapEnds(value: number): boolean;
          solve(value: number): void;
          warmStart?(value: number): void;
        }
        declare function register(value: Solver): void;
        export const solver = {
          swapEnds(): boolean { return false; },
          solve(value: number): void { void value; },
        };
        register(solver);
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker, undefined, {
      program,
    });
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'InferredProtocolArityFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('swapEnds:Float->Bool');
    expect(output).toContain('@:optional var warmStart:Float->Void');
    expect(output).toContain('swapEnds: function(__unused0:Float):Bool');
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
    expect(output).toContain(
      "return _Runtime.subtractNumbers(_Runtime.field(b, 'weight'), _Runtime.field(a, 'weight'))",
    );
    expect(output).not.toContain('return Std.int(');
  });

  it('lowers for-in through proven record keys or the runtime enumeration bridge', () => {
    const { checker, source } = typedSource(
      '/workspace/upstream/packages/example/src/forIn.ts',
      `
        export function recordKeys(values: Record<string, number>) {
          const result: string[] = [];
          for (const key in values) result.push(key);
          return result;
        }
        export function dynamicKeys(values: any) {
          const result: string[] = [];
          for (const key in values) result.push(key);
          return result;
        }
        export async function visitDynamic(values: any, visit: (key: string) => Promise<void>) {
          for (const key in values) await visit(key);
        }
      `,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace', checker);
    resetStaticLoweringEmissionCounts();
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'ForInFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('for (key in flight._internal.DynamicObject.keys(values))');
    expect(output).toContain('for (key in _Runtime.forInKeys(values))');
    expect(output).toContain('var __flowKeys');
    expect(output).toContain(':Array<String> = _Runtime.forInKeys(values);');
    expect(output).toMatch(/if \(__flowIndex\d+ >= __flowKeys\d+\.length\).*\n.*__flowKeys\d+\[__flowIndex\d+\+\+\]/u);
    expect(output).not.toContain('_StaticIndex.readArray(__flowKeys');
    expect(staticLoweringEmissionCounts().guardedArrayReads).toEqual({
      asyncFlowForInKeys: 1,
      asyncFlowForOfValues: 0,
    });
  });

  it('rejects for-in initializers that cannot declare one identifier', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/invalidForIn.ts',
      `export function invalid(values: any) {
        let key = '';
        for (key in values) key = key;
      }`,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');

    expect(lowered.diagnostics).toEqual([
      expect.objectContaining({ message: 'Unsupported TypeScript for-in initializer' }),
    ]);
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
