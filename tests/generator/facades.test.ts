import { readFileSync } from 'node:fs';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

import { packageBridge } from '../../vitest.upstream.config.ts';

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

  it('preserves source-level export-star barrels in JavaScript bridges', () => {
    const workspace = process.cwd();
    const rendering = readFileSync(path.join(workspace, 'tests', 'bridges', 'sources', 'sdk', 'rendering.mjs'), 'utf8');
    const typesContract = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'types', 'contract.mjs'),
      'utf8',
    );

    expect(rendering).toContain("export * from '@flighthq/scene2d-canvas';");
    expect(rendering).toContain("export * from '@flighthq/render-gl';");
    expect(rendering).toContain("export * from '@flighthq/render-wgpu';");
    expect(typesContract).toContain("export * from './Abc.mjs';");
    expect(typesContract).toContain("export * from './Compression.mjs';");
  });

  it('resolves package export lanes to their source bridges', () => {
    const workspace = process.cwd();

    expect(packageBridge('@flighthq/types/contract')).toBe(
      path.join(workspace, 'tests', 'bridges', 'sources', 'types', 'contract.mjs'),
    );
    expect(packageBridge('@flighthq/compression')).toBe(path.join(workspace, 'tests', 'bridges', 'compression.mjs'));
  });
});
