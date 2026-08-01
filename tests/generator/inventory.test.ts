import { mkdirSync, mkdtempSync, rmSync, writeFileSync } from 'node:fs';
import os from 'node:os';
import path from 'node:path';

import {
  analyzeUpstream,
  packageNameToHaxePackage,
  packageNameToModule,
  packageRootExportLane,
  readPackageExportManifest,
  resolvePackageExportLane,
  sourcePathToHaxePackage,
  sourcePathToImplementationModule,
  sourcePathToModule,
} from '../../tools/generator/src/analyze/inventory.ts';
import { auditLowering } from '../../tools/generator/src/analyze/lowering.ts';

describe('analyzeUpstream', () => {
  it('accounts for every upstream package and representative export', () => {
    const inventory = analyzeUpstream(path.resolve('.'));
    const inventoryByName = new Map(inventory.packages.map((item) => [item.name, item]));
    const geometry = inventory.packages.find((item) => item.name === '@flighthq/geometry');
    const sdk = inventory.packages.find((item) => item.name === '@flighthq/sdk');
    const hostElectron = inventory.packages.find((item) => item.name === '@flighthq/host-electron');
    const toolCapture = inventory.packages.find((item) => item.name === '@flighthq/tool-capture');
    if (!geometry || !sdk || !hostElectron || !toolCapture) throw new Error('Expected representative packages');
    const geometryRoot = resolvePackageExportLane(inventoryByName, '@flighthq/geometry');
    const geometryContract = resolvePackageExportLane(inventoryByName, '@flighthq/geometry/contract');
    const rootVector = geometryRoot.exports.find((item) => item.name === 'createVector2');
    const contractVector = geometryContract.exports.find((item) => item.name === 'createVector2');

    expect(inventory.schemaVersion).toBe(2);
    expect(inventory.summary).toMatchObject({
      exportConflicts: 0,
      exportLanes: 291,
      exports: 30_378,
      packages: 139,
      rootExports: 11_740,
      sourceFiles: 2_338,
      testFiles: 1_266,
    });
    expect(inventory.packages.every((item) => item.exportLanes.some((lane) => lane.entry === '.'))).toBe(true);
    expect(inventory.packages.every((item) => item.exportLanes.some((lane) => lane.entry === './contract'))).toBe(true);
    expect(rootVector).toMatchObject({ kind: 'function', source: expect.stringContaining('/geometry/src/vector2.ts') });
    expect(contractVector).toEqual(rootVector);
    expect(() => resolvePackageExportLane(inventoryByName, '@flighthq/geometry/private')).toThrow(
      'Package import uses an unaccounted export lane: @flighthq/geometry/private',
    );
    expect(geometry.haxeModule).toBe('flighthq.geometry.Geometry');
    expect(packageRootExportLane(geometry)).toBe(geometryRoot);
    expect(sdk.exportLanes).toHaveLength(15);
    expect(sdk.sdkIncluded).toBe(false);
    expect(hostElectron.sdkIncluded).toBe(false);
    expect(toolCapture.exportLanes.find((lane) => lane.entry === '.')?.conditions).toContainEqual({
      condition: 'browser',
      source: expect.stringContaining('/tool-capture/src/browser.ts'),
      target: './dist/browser.js',
    });
  });

  it('derives SDK exposure from every SDK barrel and preserves exact target lanes', () => {
    const inventory = analyzeUpstream(path.resolve('.'));
    const sceneResources = inventory.packages.find((item) => item.name === '@flighthq/scene2d-resources');
    const entity = inventory.packages.find((item) => item.name === '@flighthq/entity');
    if (!sceneResources || !entity) throw new Error('Expected SDK packages');

    expect(sceneResources.sdkExposures).toContainEqual({
      sdkLane: '@flighthq/sdk/contract',
      target: '@flighthq/scene2d-resources/contract',
    });
    expect(entity.sdkExposures).toContainEqual({
      sdkLane: '@flighthq/sdk',
      target: '@flighthq/entity',
    });
  });

  it('rejects manifest lanes whose conditions cannot be traced to source barrels', () => {
    const directory = mkdtempSync(path.join(os.tmpdir(), 'flight-inventory-'));
    try {
      mkdirSync(path.join(directory, 'src'));
      writeFileSync(path.join(directory, 'src', 'index.ts'), 'export const value = 1;\n');
      writeFileSync(
        path.join(directory, 'package.json'),
        JSON.stringify({
          exports: {
            '.': { types: './dist/index.d.ts', default: './dist/index.js' },
            './missing': { types: './dist/missing.d.ts', default: './dist/missing.js' },
          },
          name: '@flighthq/fixture',
          version: '0.0.0',
        }),
      );

      expect(() => readPackageExportManifest(directory)).toThrow(
        'Package export condition @flighthq/fixture/missing [types] has no source barrel',
      );
    } finally {
      rmSync(directory, { force: true, recursive: true });
    }
  });
});

describe('auditLowering', () => {
  it('accounts for current translator coverage without hiding diagnostics', () => {
    const audit = auditLowering(path.resolve('.'));
    const math = audit.packages.find((item) => item.packageName === '@flighthq/math');

    expect(audit.summary.packages).toBe(131);
    expect(audit.summary.declarations).toBeGreaterThan(5_000);
    expect(audit.summary.lowered).toBe(audit.summary.declarations);
    expect(audit.summary.diagnostics).toBe(0);
    expect(audit.summary.staticFacts.booleanExplicitTruthiness).toBeGreaterThan(1_000);
    expect(audit.summary.staticFacts.numericRelations).toBeGreaterThan(1_000);
    expect(audit.summary.staticFacts.indexedAccesses.reads).toBeGreaterThan(1_000);
    expect(audit.summary.staticFacts.indexedReceivers.Float32Array.expressions).toBeGreaterThan(1_000);
    expect(math?.lowered).toBeGreaterThan(50);
    expect(math?.staticFacts.numericRelations).toBeGreaterThan(10);
  }, 60_000);
});

describe('packageNameToModule', () => {
  it('maps scoped kebab-case package names deterministically', () => {
    expect(packageNameToModule('@flighthq/geometry')).toBe('Geometry');
    expect(packageNameToModule('@flighthq/camera2d')).toBe('Camera2d');
    expect(packageNameToModule('@flighthq/displayobject-gl')).toBe('DisplayobjectGl');
    expect(packageNameToModule('@flighthq/entity')).toBe('Entity');
    expect(packageNameToModule('@flighthq/render-gl')).toBe('RenderGl');
    expect(packageNameToModule('@flighthq/sdk')).toBe('Sdk');
  });

  it('maps npm packages and defining source files to nested Haxe modules', () => {
    expect(packageNameToHaxePackage('@flighthq/render-gl')).toBe('flighthq.renderGl');
    expect(sourcePathToModule('upstream/packages/geometry/src/vector2.ts')).toBe('Vector2');
    expect(sourcePathToModule('upstream/packages/textshaper/src/_textShaperHooks.ts')).toBe('_TextShaperHooks');
    expect(sourcePathToModule('upstream/packages/menu/src/menu-templates.ts')).toBe('MenuTemplates');
    expect(sourcePathToHaxePackage('@flighthq/geometry', 'upstream/packages/geometry/src/vector2.ts')).toBe(
      'flighthq.geometry',
    );
  });

  it('hides internal and test-helper implementation modules', () => {
    expect(sourcePathToModule('upstream/packages/signals/src/internal.ts')).toBeUndefined();
    expect(sourcePathToModule('upstream/packages/render-wgpu/src/wgpuTestHelper.ts')).toBeUndefined();
    expect(sourcePathToImplementationModule('upstream/packages/signals/src/internal.ts')).toBe('_Internal');
    expect(sourcePathToHaxePackage('@flighthq/signals', 'upstream/packages/signals/src/internal.ts')).toBe(
      'flighthq.signals._internal',
    );
  });
});
