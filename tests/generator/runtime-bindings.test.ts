import { execFileSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

const workspace = process.cwd();

describe('maintained runtime bindings', () => {
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
    expect(gl).toContain('inputArguments.map(_LimeTypedArray.unwrap)');

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
      ],
      { cwd: workspace, stdio: 'pipe' },
    );
  });
});
