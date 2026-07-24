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
});
