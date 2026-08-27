import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

import { bridgeHookTimeoutMs, bridgeTestTimeoutMs, packageBridge } from '../../vitest.upstream.config.ts';
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
        omittedModules: Array<{ module: string; reason: string }>;
        protectedDeclarationIdentities: number;
        restrictedMemberDeclarations: number;
      };
    };
    const firstIdentities = [...contractOnlyDeclarationIdentities(inventory.packages)];
    const secondIdentities = [...contractOnlyDeclarationIdentities(inventory.packages)];
    const entity = readFileSync(path.join(workspace, 'generated', 'flight', '_Entity.hx'), 'utf8');
    const renderCacheAdapter = readFileSync(
      path.join(workspace, 'generated', 'flight', 'types', 'RenderCacheAdapter.hx'),
      'utf8',
    );
    const internalGeometry = readFileSync(path.join(workspace, 'generated', 'flight', '_Geometry.hx'), 'utf8');
    const geometry = readFileSync(path.join(workspace, 'generated', 'flight', 'Geometry.hx'), 'utf8');
    const abc = readFileSync(path.join(workspace, 'generated', 'flight', 'Abc.hx'), 'utf8');

    expect(firstIdentities).toEqual(secondIdentities);
    expect(core.contractSurface.protectedDeclarationIdentities).toBe(firstIdentities.length);
    expect(core.contractSurface.noCompletionDeclarations + core.contractSurface.restrictedMemberDeclarations).toBe(
      firstIdentities.length,
    );
    expect(new Set(core.contractSurface.omittedModules.map((item) => item.module)).size).toBe(
      core.contractSurface.omittedModules.length,
    );
    expect(
      core.contractSurface.omittedModules.every((item) => item.reason === 'header-only-contract-export-lane'),
    ).toBe(true);
    expect(existsSync(path.join(workspace, 'generated', 'flight', '_Entity', 'Contract.hx'))).toBe(false);
    expect(existsSync(path.join(workspace, 'tests', 'bridges', 'sources', 'entity', 'contract.mjs'))).toBe(true);
    expect(entity).toContain('@:allow(flight)\n  @:keep\n  private static function createEntity<Type:');
    expect(renderCacheAdapter).toContain('@:noCompletion\ntypedef RenderCacheAdapter =');
    expect(internalGeometry).toContain('@:noCompletion\nclass _Geometry {');
    expect(geometry).not.toContain('@:noCompletion\nclass Geometry {');
    expect(abc).not.toContain('@:noCompletion\nclass Abc {');
  });

  it('emits the broad SDK facade and renamed package re-exports', () => {
    const workspace = process.cwd();
    const sdk = readFileSync(path.join(workspace, 'generated', 'flight', 'Sdk.hx'), 'utf8');
    const scene2dGl = readFileSync(path.join(workspace, 'generated', 'flight', 'Scene2DGl.hx'), 'utf8');

    expect(sdk).toContain('public static function createVector2(');
    expect(sdk).toContain('Facade_Sdk_flight__Geometry.createVector2(x, y)');
    expect(sdk).not.toContain('_Runtime.callValue(Facade_');
    expect(sdk).toContain('_Runtime.callHaxeRestValue(Facade_');
    expect(sdk).toContain('public static final defaultGlSpriteRenderer:');
    expect(sdk).toContain('#if lime\n  public static function createCairoSurface(window:lime.ui.Window)');
    expect(sdk).toContain('flight._internal.scene2DCairo.CairoSurface.createCairoSurface(window)');
    expect(sdk).toContain('#if lime\n  public static function createGlSurface(window:lime.ui.Window)');
    expect(sdk).toContain('flight.hostLime.GlSurface.createGlSurface(window)');
    expect(scene2dGl).toContain('public static final defaultGlSpriteRenderer:');
  });

  it('places every exported canonical type in its own public module', () => {
    const workspace = process.cwd();
    const layoutState = readFileSync(path.join(workspace, 'generated', 'flight', 'Layout.hx'), 'utf8');

    expect(layoutState).toContain('public static function createLayoutState():LayoutState');
    expect(layoutState).toContain('public static function registerLayoutResolver(state:LayoutState,');
    expect(existsSync(path.join(workspace, 'generated', 'flight', 'types', 'Vector2Like.hx'))).toBe(true);
    const vector2Like = readFileSync(path.join(workspace, 'generated', 'flight', 'types', 'Vector2Like.hx'), 'utf8');
    expect(vector2Like).toContain('typedef Vector2Like =');
    expect(readFileSync(path.join(workspace, 'generated', 'flight', 'types', 'Vector2.hx'), 'utf8')).not.toContain(
      'typedef Vector2Like =',
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
    expect(bridgeTestTimeoutMs).toBe(30_000);
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
    const glChromaticAberration = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'effects-gl', 'glChromaticAberrationEffect.mjs'),
      'utf8',
    );

    expect(applicationGl).toContain("import * as __dependency0 from '@flighthq/node/contract';");
    expect(applicationGl).toContain("import * as __dependency1 from '@flighthq/render-gl/contract';");
    expect(applicationGl).toContain('compiled.flight._Node.createViewport = __dependency0.createViewport;');
    expect(applicationGl).toContain(
      'compiled.flight._RenderGl.createGlRenderState = __dependency1.createGlRenderState;',
    );
    expect(applicationGl).toContain(
      'compiled.flight._RenderGl.createGlRenderTarget = __dependency1.createGlRenderTarget;',
    );
    expect(gltfLoad).toContain("import * as __dependency0 from '@flighthq/scene3d-formats/contract';");
    expect(gltfLoad).toContain("import * as __dependency1 from '@flighthq/net/contract';");
    expect(gltfLoad).toContain('compiled.flight._Net.sendNetRequest = __dependency1.sendNetRequest;');
    expect(ambientLight).not.toContain('__dependency');
    expect(glDropShadow).toContain(
      'compiled.flight._RenderGl.acquireGlRenderTarget = __dependency0.acquireGlRenderTarget;',
    );
    expect(glDropShadow).not.toContain('getGlRenderStateRuntime = __dependency0.getGlRenderStateRuntime;');
    expect(glChromaticAberration).toContain(
      'compiled.flight._EffectsGl.getGlEffectProgram = __dependency1.getGlEffectProgram;',
    );
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
    const wgpuBlendEffect = readFileSync(
      path.join(workspace, 'tests', 'bridges', 'sources', 'effects-wgpu', 'wgpuBlendEffect.mjs'),
      'utf8',
    );

    expect(entityContract).toContain("export * from './entity.mjs';");
    expect(dialog).toContain('export const setDialogBackend = api.setDialogBackend;');
    expect(renderWgpuContract).toContain("export { installWgpuMock } from './wgpuTestHelper.mjs';");
    expect(renderWgpuTestHelper).toContain('const api = compiled.flight._RenderWgpu;');
    expect(renderWgpuTestHelper).toContain('export const installWgpuMock = api.installWgpuMock;');
    expect(wgpuBlendEffect).toContain('const api = compiled.flight._EffectsWgpu;');
    expect(wgpuBlendEffect).toContain('export const applyBlendEffectToWgpu = api.applyBlendEffectToWgpu;');
  });

  it('emits checker-proven runtime values and TypeScript-shaped enums', () => {
    const workspace = process.cwd();
    const typesBridge = readFileSync(path.join(workspace, 'tests', 'bridges', 'types.mjs'), 'utf8');
    const typesFacade = readFileSync(path.join(workspace, 'generated', 'flight', 'Types.hx'), 'utf8');
    const typesImplementation = readFileSync(path.join(workspace, 'generated', 'flight', '_Types.hx'), 'utf8');

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
    expect(typesFacade).toContain("{ key: 'Quad', value: Facade_Types_flight_types_BatchFormat_BatchFormat.Quad }");
    expect(typesFacade).toContain("{ key: Facade_Types_flight_types_BatchFormat_BatchFormat.Quad, value: 'Quad' }");
    expect(typesFacade).toContain('public static final __enum_AppearanceFlags:Dynamic = _Runtime.objectFromPairs(');
    expect(typesFacade).toContain(
      "{ key: 'any', value: Facade_Types_flight_types_AppearanceFlags_AppearanceFlags.any }",
    );
    expect(typesImplementation).not.toContain('import flight._internal._AudioResourceReferenceValues.');
    expect(typesImplementation).not.toContain('import flight._internal._ImageResourceReferenceValues.');
    expect(typesImplementation).not.toContain('import flight._internal._SceneCoverageEntryValues.');
  });
});
