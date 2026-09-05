import { execFileSync } from 'node:child_process';
import { mkdirSync, readFileSync } from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

const workspace = process.cwd();

describe('maintained runtime bindings', () => {
  it('implements the standard Object operations used by generated dictionaries', () => {
    const source = readFileSync(path.join(workspace, 'src/flight/_internal/DynamicObject.hx'), 'utf8');
    expect(source).toContain('function create(');
    expect(source).toContain('Object.create');
    expect(source).toContain('function hasOwn(');
    expect(source).toContain('hasOwnProperty.call');
  });

  it('keeps typed collection calls dispatchable on native JavaScript collections', () => {
    for (const name of ['_Map', '_Set']) {
      const source = readFileSync(path.join(workspace, 'src', 'flight', '_internal', `${name}.hx`), 'utf8');
      expect(source).toContain('public function has(');
      expect(source).not.toContain('public inline function has(');
      expect(source).toContain('@:native("delete")');
      if (name === '_Map') expect(source).toContain('for (pair in _Runtime.iterable(source))');
    }

    const runtime = readFileSync(path.join(workspace, 'src', 'flight', '_internal', '_Runtime.hx'), 'utf8');
    expect(runtime).not.toContain("name == 'delete'");
  });

  it('uses exact 32-bit multiplication on JavaScript', () => {
    const runtime = readFileSync(path.join(workspace, 'src', 'flight', '_internal', '_Runtime.hx'), 'utf8');
    expect(runtime).toContain("js.Syntax.code('Math.imul({0}, {1})', a, b)");
  });

  it('expands WebGL2 operations to typed target APIs without reflection', () => {
    const source = readFileSync(
      path.join(workspace, 'src', 'flight', '_internal', 'WebGl2RenderingContext.hx'),
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
      const source = readFileSync(path.join(workspace, 'src', 'flight', '_internal', `${name}.hx`), 'utf8');
      expect(source).toContain('#if js');
      expect(source).toContain('#elseif lime');
      expect(source).toContain("new _LimeTypedArray('");
    }

    const storage = readFileSync(path.join(workspace, 'src', 'flight', '_internal', '_LimeTypedArray.hx'), 'utf8');
    expect(storage).toContain('new lime.utils.Float32Array(length)');
    expect(storage).toContain('new lime.utils.Int16Array(length)');
    expect(storage).toContain('new lime.utils.UInt16Array(length)');
    expect(storage).toContain('new lime.utils.UInt8Array(length)');

    const gl = readFileSync(path.join(workspace, 'src', 'flight', '_internal', 'backend', 'WebGl2Backend.hx'), 'utf8');
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

  it('builds generated mesh geometry with Lime on Neko under full DCE', () => {
    const limeSpecification = readFileSync(path.join(workspace, 'haxe_libraries/lime.hxml'), 'utf8');
    const limeRelativeCachePath = / into ([^\s"]+)/u.exec(limeSpecification)?.[1];
    if (!limeRelativeCachePath) throw new Error('Could not resolve the pinned Lime cache path');
    const libraryCache = process.env.HAXE_LIBCACHE ?? path.join(os.homedir(), 'haxe', 'haxe_libraries');
    const limeSource = path.join(libraryCache, limeRelativeCachePath, 'src');
    const outputDirectory = path.join(workspace, 'build', 'haxe-mesh-lime-neko');
    const output = path.join(outputDirectory, 'main.n');
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
        '-cp',
        limeSource,
        '--main',
        'MeshLimeNekoSmoke',
        '-neko',
        output,
        '-D',
        'lime',
        '-dce',
        'full',
      ],
      { cwd: workspace, stdio: 'pipe' },
    );
    expect(execFileSync('neko', [output], { cwd: workspace, encoding: 'utf8' })).toContain('MESH_LIME_NEKO_OK');
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

  it('unifies a data-narrowing node subtype with Node<Traits> on both representations', () => {
    // The `Node<Traits>.data(default, never)` covariance fix must hold on the nominal
    // class representation and on `-D flight_struct_typedef`, where structure-to-structure
    // unification is strictest. Compiling NodeCovarianceSmoke (whose `acceptsNode(emitter)`
    // passes a Node3D<ParticleEmitterData> where a structural Node<Traits> is expected) is
    // the assertion on each.
    for (const defines of [[], ['-D', 'flight_struct_typedef']]) {
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
          'NodeCovarianceSmoke',
          '--interp',
          ...defines,
        ],
        { cwd: workspace, stdio: 'pipe' },
      );
    }
  });
});
