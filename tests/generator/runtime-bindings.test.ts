import { execFileSync } from 'node:child_process';
import { mkdirSync, readFileSync } from 'node:fs';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

const workspace = process.cwd();

describe('maintained runtime bindings', () => {
  it('keeps typed collection calls dispatchable on native JavaScript collections', () => {
    for (const name of ['_Map', '_Set']) {
      const source = readFileSync(path.join(workspace, 'src', 'flighthq', '_internal', `${name}.hx`), 'utf8');
      expect(source).toContain('public function has(');
      expect(source).not.toContain('public inline function has(');
      expect(source).toContain('@:native("delete")');
    }

    const runtime = readFileSync(path.join(workspace, 'src', 'flighthq', '_internal', '_Runtime.hx'), 'utf8');
    expect(runtime).not.toContain("name == 'delete'");
  });

  it('expands WebGL2 operations to typed target APIs without reflection', () => {
    const source = readFileSync(
      path.join(workspace, 'src', 'flighthq', '_internal', 'WebGl2RenderingContext.hx'),
      'utf8',
    );

    expect(source).toContain("Context.defined('lime') && !Context.defined('js')");
    expect(source).toContain("castTarget(context, ['lime', 'graphics'], 'WebGL2RenderContext')");
    expect(source).toContain("Context.defined('js') && Context.defined('html5')");
    expect(source).toContain("castTarget(context, ['js', 'html', 'webgl'], 'WebGL2RenderingContext')");
    expect(source).not.toContain('Reflect.');
  });

  it('keeps Lime typed arrays native through runtime and GL boundaries', () => {
    for (const name of ['_Float32Array', '_Int16Array', '_UInt16Array', '_UInt8Array']) {
      const source = readFileSync(path.join(workspace, 'src', 'flighthq', '_internal', `${name}.hx`), 'utf8');
      expect(source).toContain('#if js');
      expect(source).toContain('#elseif lime');
      expect(source).toContain("new _LimeTypedArray('");
    }

    const storage = readFileSync(path.join(workspace, 'src', 'flighthq', '_internal', '_LimeTypedArray.hx'), 'utf8');
    expect(storage).toContain('new lime.utils.Float32Array(length)');
    expect(storage).toContain('new lime.utils.Int16Array(length)');
    expect(storage).toContain('new lime.utils.UInt16Array(length)');
    expect(storage).toContain('new lime.utils.UInt8Array(length)');

    const gl = readFileSync(
      path.join(workspace, 'src', 'flighthq', '_internal', 'backend', 'WebGl2Backend.hx'),
      'utf8',
    );
    expect(gl).toContain('typedef GlContext = lime.graphics.WebGL2RenderContext;');
    expect(gl).toContain('static function nativeView(source:GlBufferSource):lime.utils.ArrayBufferView');
    expect(gl).toContain('(raw : _LimeTypedArray).nativeView');

    execFileSync(
      process.execPath,
      [
        'tools/haxe.mjs',
        '-cp',
        'src',
        '-cp',
        'tests/haxe',
        '-cp',
        'tests/fake-lime',
        '--main',
        'LimeTypedArraySmoke',
        '--interp',
        '-D',
        'lime',
        '-dce',
        'full',
      ],
      { cwd: workspace, stdio: 'pipe' },
    );
  });

  it('packs scene lights through Lime typed-array views under full DCE', () => {
    execFileSync(
      process.execPath,
      [
        'tools/haxe.mjs',
        '-cp',
        'src',
        '-cp',
        'generated',
        '-cp',
        'tests/haxe',
        '-cp',
        'tests/fake-lime',
        '--main',
        'SceneLightSmoke',
        '--interp',
        '-D',
        'lime',
        '-dce',
        'full',
      ],
      { cwd: workspace, stdio: 'pipe' },
    );
  });

  it('executes generated internal-class methods in path booleans under full JavaScript DCE', () => {
    const outputDirectory = path.join(workspace, 'build', 'haxe-js');
    const output = path.join(outputDirectory, 'path-boolean-dce.cjs');
    mkdirSync(outputDirectory, { recursive: true });
    execFileSync(
      process.execPath,
      [
        'tools/haxe.mjs',
        '-cp',
        'src',
        '-cp',
        'generated',
        '-cp',
        'tests/haxe',
        '--main',
        'PathBooleanDceSmoke',
        '-dce',
        'full',
        '--js',
        output,
      ],
      { cwd: workspace, stdio: 'pipe' },
    );
    execFileSync(process.execPath, [output], { cwd: workspace, stdio: 'pipe' });
  });
});
