import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

import { bridgeHookTimeoutMs, packageBridge } from '../../vitest.upstream.config.ts';
import { contractOnlyDeclarationIdentities } from '../../tools/generator/src/emit/core.ts';
import type { PackageInventory } from '../../tools/generator/src/model/inventory.ts';

describe('public Haxe facades', () => {
  it('omits empty contract modules and hides only globally contract-exclusive declarations', () => {
    const workspace = process.cwd();
    const inventory = JSON.parse(readFileSync(path.join(workspace, 'reports', 'inventory.json'), 'utf8')) as {
      packages: PackageInventory[];
    };
    const core = JSON.parse(readFileSync(path.join(workspace, 'reports', 'core.json'), 'utf8')) as {
      contractSurface: {
        noCompletionDeclarations: number;
        omittedModules: Array<{ reason: string }>;
        protectedDeclarationIdentities: number;
      };
    };
    const firstIdentities = [...contractOnlyDeclarationIdentities(inventory.packages)];
    const secondIdentities = [...contractOnlyDeclarationIdentities(inventory.packages)];
    const entity = readFileSync(path.join(workspace, 'generated', 'flighthq', 'entity', 'Entity.hx'), 'utf8');
    const renderCacheAdapter = readFileSync(
      path.join(workspace, 'generated', 'flighthq', 'types', 'RenderCacheAdapter.hx'),
      'utf8',
    );
    const vector2 = readFileSync(path.join(workspace, 'generated', 'flighthq', 'geometry', 'Vector2.hx'), 'utf8');
    const precedingLine = (source: string, declaration: string): string | undefined =>
      source.slice(0, source.indexOf(declaration)).trimEnd().split('\n').at(-1)?.trim();

    expect(firstIdentities).toEqual(secondIdentities);
    expect(firstIdentities).toHaveLength(1_213);
    expect(core.contractSurface).toMatchObject({
      noCompletionDeclarations: 1_213,
      protectedDeclarationIdentities: 1_213,
    });
    expect(core.contractSurface.omittedModules).toHaveLength(142);
    expect(
      core.contractSurface.omittedModules.every((item) => item.reason === 'header-only-contract-export-lane'),
    ).toBe(true);
    expect(existsSync(path.join(workspace, 'generated', 'flighthq', 'entity', 'Contract.hx'))).toBe(false);
    expect(existsSync(path.join(workspace, 'tests', 'bridges', 'sources', 'entity', 'contract.mjs'))).toBe(true);
    expect(precedingLine(entity, 'public static function createEntity<Type:')).toBe('@:noCompletion');
    expect(precedingLine(renderCacheAdapter, 'typedef RenderCacheAdapter =')).toBe('@:noCompletion');
    expect(precedingLine(vector2, 'public static function createVector2(')).not.toBe('@:noCompletion');
  });

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

  it('fully qualifies a self-named type owned by a mixed canonical types module', () => {
    const workspace = process.cwd();
    const layoutState = readFileSync(path.join(workspace, 'generated', 'flighthq', 'layout', 'LayoutState.hx'), 'utf8');

    expect(layoutState).toContain('public static function createLayoutState():flighthq.types.Layout.LayoutState');
    expect(layoutState).toContain(
      'public static function registerLayoutResolver(state:flighthq.types.Layout.LayoutState,',
    );
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

    expect(bridgeHookTimeoutMs).toBe(30_000);
    expect(packageBridge('@flighthq/types/contract')).toBe(
      path.join(workspace, 'tests', 'bridges', 'sources', 'types', 'contract.mjs'),
    );
    expect(packageBridge('@flighthq/compression')).toBe(path.join(workspace, 'tests', 'bridges', 'compression.mjs'));
  });

  it('routes mocked contract imports to their canonical compiled owners', () => {
    const workspace = process.cwd();
    const applicationGl = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'application-gl', 'glApplicationRenderView.mjs'),
      'utf8',
    );
    const gltfLoad = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'scene3d-resources', 'gltfLoad.mjs'),
      'utf8',
    );
    const ambientLight = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'lighting', 'ambientLight.mjs'),
      'utf8',
    );
    const glDropShadow = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'effects-gl', 'glDropShadowEffect.mjs'),
      'utf8',
    );

    expect(applicationGl).toContain("import * as __dependency0 from '@flighthq/node/contract';");
    expect(applicationGl).toContain("import * as __dependency1 from '@flighthq/render-gl/contract';");
    expect(applicationGl).toContain('compiled.flighthq.node.Viewport.createViewport = __dependency0.createViewport;');
    expect(applicationGl).toContain(
      'compiled.flighthq.renderGl.GlRenderState.createGlRenderState = __dependency1.createGlRenderState;',
    );
    expect(applicationGl).toContain(
      'compiled.flighthq.renderGl.GlRenderTarget.createGlRenderTarget = __dependency1.createGlRenderTarget;',
    );
    expect(gltfLoad).toContain("import * as __dependency0 from '@flighthq/scene3d-formats/contract';");
    expect(gltfLoad).toContain("import * as __dependency1 from '@flighthq/net/contract';");
    expect(gltfLoad).toContain('compiled.flighthq.net.Net.sendNetRequest = __dependency1.sendNetRequest;');
    expect(ambientLight).not.toContain('__dependency');
    expect(glDropShadow).toContain(
      'compiled.flighthq.renderGl.GlRenderTargetPool.acquireGlRenderTarget = __dependency0.acquireGlRenderTarget;',
    );
    expect(glDropShadow).not.toContain('getGlRenderStateRuntime = __dependency0.getGlRenderStateRuntime;');
  });

  it('keeps callable contract, backend-registration, and test-helper exports live', () => {
    const workspace = process.cwd();
    const entityContract = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'entity', 'contract.mjs'),
      'utf8',
    );
    const dialog = readFileSync(path.join(workspace, 'tests', 'bridges', 'sources', 'dialog', 'dialog.mjs'), 'utf8');
    const renderWgpuContract = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'render-wgpu', 'contract.mjs'),
      'utf8',
    );
    const renderWgpuTestHelper = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'render-wgpu', 'wgpuTestHelper.mjs'),
      'utf8',
    );

    expect(entityContract).toContain("export * from './entity.mjs';");
    expect(dialog).toContain('export const setDialogBackend = api.setDialogBackend;');
    expect(renderWgpuContract).toContain("export { installWgpuMock } from './wgpuTestHelper.mjs';");
    expect(renderWgpuTestHelper).toContain('export const installWgpuMock = api.installWgpuMock;');
  });

  it('emits checker-proven runtime values and TypeScript-shaped enums', () => {
    const workspace = process.cwd();
    const typesBridge = readFileSync(path.join(workspace, 'tests', 'bridges', 'types.mjs'), 'utf8');
    const typesFacade = readFileSync(path.join(workspace, 'generated', 'flighthq', 'types', 'Types.hx'), 'utf8');

    for (const name of [
      'AdvancedBlendMode',
      'BlendMode',
      'ImageChannel',
      'ImageResourceReferenceKind',
      'ImportDiagnosticSeverity',
      'KeyCode',
      'PathCommand',
      'ResourceResolutionState',
      'Skeleton2DAnimationPath',
    ]) {
      expect(typesBridge).toContain(`export const ${name} = `);
    }
    expect(typesFacade).toContain('public static final __enum_BatchFormat:Dynamic = _Runtime.objectFromPairs(');
    expect(typesFacade).toContain("{ key: 'Quad', value: Facade_Types_flighthq_types_BatchFormat_BatchFormat.Quad }");
    expect(typesFacade).toContain("{ key: Facade_Types_flighthq_types_BatchFormat_BatchFormat.Quad, value: 'Quad' }");
    expect(typesFacade).toContain('public static final __enum_AppearanceFlags:Dynamic = _Runtime.objectFromPairs(');
    expect(typesFacade).toContain(
      "{ key: 'any', value: Facade_Types_flighthq_types_AppearanceFlags_AppearanceFlags.any }",
    );
  });
});
