import { readFileSync } from 'node:fs';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

describe('public Haxe facades', () => {
  it('emits the broad SDK facade and renamed package re-exports', () => {
    const workspace = process.cwd();
    const sdk = readFileSync(path.join(workspace, 'generated', 'flighthq', 'sdk', 'Sdk.hx'), 'utf8');
    const displayObjectGl = readFileSync(
      path.join(workspace, 'generated', 'flighthq', 'displayobjectGl', 'DisplayobjectGl.hx'),
      'utf8',
    );

    expect(sdk).toContain('public static function createVector2(');
    expect(sdk).toContain('Facade_Sdk_flighthq_geometry_Vector2.createVector2(x, y)');
    expect(sdk).not.toContain('_Runtime.callValue(Facade_');
    expect(sdk).toContain('_Runtime.callHaxeRestValue(Facade_');
    expect(sdk).toContain('public static final defaultGlBeginBitmapFill:');
    expect(displayObjectGl).toContain('public static final defaultGlBeginBitmapFill:');
  });
});
