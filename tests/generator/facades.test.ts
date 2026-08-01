import { readFileSync } from 'node:fs';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

describe('public Haxe facades', () => {
  it('emits the broad SDK facade and renamed package re-exports', () => {
    const workspace = process.cwd();
    const sdk = readFileSync(path.join(workspace, 'generated', 'flighthq', 'sdk', 'Sdk.hx'), 'utf8');
    const scene2dGl = readFileSync(path.join(workspace, 'generated', 'flighthq', 'scene2dGl', 'Scene2dGl.hx'), 'utf8');

    expect(sdk).toContain('public static function createVector2(');
    expect(sdk).toContain('Facade_Sdk_flighthq_geometry_Vector2.createVector2(x, y)');
    expect(sdk).not.toContain('_Runtime.callValue(Facade_');
    expect(sdk).toContain('_Runtime.callHaxeRestValue(Facade_');
    expect(sdk).toContain('public static final defaultGlSpriteRenderer:');
    expect(scene2dGl).toContain('public static final defaultGlSpriteRenderer:');
  });
});
