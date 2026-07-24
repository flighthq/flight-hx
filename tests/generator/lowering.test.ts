import { execFileSync } from 'node:child_process';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';

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
    expect(output).toContain('_Async.make(function():flighthq._internal._Promise<String>');
    expect(output).toContain('_Runtime.asyncIterator(values)');
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
    expect(output).toContain("_Runtime.callProperty(task, 'catch'");
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
    expect(output).toContain("_Runtime.callProperty(target, 'push', _Runtime.concatArrays");
  });

  it('routes WebGL2 context access through its maintained internal binding', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-gl/src/sample.ts',
      `
        export function draw(gl: WebGL2RenderingContext, buffer: WebGLBuffer) {
          gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
          const alias = gl;
          alias.drawArrays(gl.TRIANGLES, 0, 3);
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
    expect(output).toContain("flighthq._internal.backend.WebGl2Backend.call(gl, 'bindBuffer'");
    expect(output).toContain("flighthq._internal.backend.WebGl2Backend.field(gl, 'ARRAY_BUFFER')");
    expect(output).toContain("flighthq._internal.backend.WebGl2Backend.call(alias, 'drawArrays'");
    expect(output).toContain("flighthq._internal.backend.WebGl2Backend.call(gl, 'clear'");
    expect(output).not.toContain("_Runtime.callProperty(gl, 'bindBuffer'");
  });

  it('routes Canvas 2D context access through its maintained internal binding', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/render-canvas/src/sample.ts',
      `
        export function draw(ctx: CanvasRenderingContext2D) {
          ctx.fillStyle = '#fff';
          ctx.fillRect(0, 0, 10, 10);
        }
        export const runner = (ctx: any) => ctx.source;
      `,
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/render-canvas', '/workspace');
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CanvasFixture',
      packageName: '@flighthq/render-canvas',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.setField(ctx, 'fillStyle'");
    expect(output).toContain("flighthq._internal.backend.Canvas2dBackend.call(ctx, 'fillRect'");
    expect(output).not.toContain("_Runtime.callProperty(ctx, 'fillRect'");
    expect(output).toContain("_Runtime.field(ctx, 'source')");
    expect(output).not.toContain("Canvas2dBackend.field(ctx, 'source')");
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
          const nav = navigator as Navigator & { getBattery(): Promise<unknown> };
          window.addEventListener('resize', () => {});
          const media = window.matchMedia('(dark)');
          const details = win.getScreenDetails();
          document.title = 'Flight';
          const canvas = document.createElement('canvas');
          const focused = document.hasFocus();
          const pads = navigator.getGamepads();
          const language = navigator.language;
          const battery = nav.getBattery();
          return { media, details, canvas, focused, pads, language, battery };
        }
        export function local(document: { title: string }) {
          return document.title;
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
    expect(output).toContain("DomWindowBackend.call(_Runtime.globalValue('window'), 'addEventListener'");
    expect(output).toContain("DomWindowBackend.call(_Runtime.globalValue('window'), 'matchMedia'");
    expect(output).toContain("DomWindowBackend.call(win, 'getScreenDetails'");
    expect(output).toContain("DomDocumentBackend.setField(_Runtime.globalValue('document'), 'title', 'Flight')");
    expect(output).toContain("DomDocumentBackend.call(_Runtime.globalValue('document'), 'createElement'");
    expect(output).toContain("DomDocumentBackend.call(_Runtime.globalValue('document'), 'hasFocus'");
    expect(output).toContain("DomNavigatorBackend.call(_Runtime.globalValue('navigator'), 'getGamepads'");
    expect(output).toContain("DomNavigatorBackend.field(_Runtime.globalValue('navigator'), 'language')");
    expect(output).toContain("DomNavigatorBackend.call(nav, 'getBattery'");
    expect(output).toContain("return cast _Runtime.field(document, 'title')");
    expect(output).not.toContain("DomDocumentBackend.field(document, 'title')");
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
    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'CppArityFixture',
      packageName: '@flighthq/example',
    });

    expect(lowered.diagnostics).toEqual([]);
    expect(output).toContain('private static function oversized(__flightArguments:Array<Dynamic>)');
    expect(output).toContain('CppArityFixture.oversized(cast ([');
    expect(output).not.toContain('_Runtime.callValue(CppArityFixture.oversized');
  });
});
