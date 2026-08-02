import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import os from 'node:os';
import path from 'node:path';

import { derivePackageExclusions } from '../../tools/generator/src/analyze/exclusions.ts';
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
import type { PackageInventory } from '../../tools/generator/src/model/inventory.ts';

describe('analyzeUpstream', () => {
  it('accounts for every upstream package and representative export', () => {
    const inventory = analyzeUpstream(path.resolve('.'));
    const inventoryByName = new Map(inventory.packages.map((item) => [item.name, item]));
    const abc = inventory.packages.find((item) => item.name === '@flighthq/abc');
    const compression = inventory.packages.find((item) => item.name === '@flighthq/compression');
    const geometry = inventory.packages.find((item) => item.name === '@flighthq/geometry');
    const sdk = inventory.packages.find((item) => item.name === '@flighthq/sdk');
    const hostElectron = inventory.packages.find((item) => item.name === '@flighthq/host-electron');
    const toolCapture = inventory.packages.find((item) => item.name === '@flighthq/tool-capture');
    if (!abc || !compression || !geometry || !sdk || !hostElectron || !toolCapture) {
      throw new Error('Expected representative packages');
    }
    const abcRoot = resolvePackageExportLane(inventoryByName, '@flighthq/abc');
    const compressionRoot = resolvePackageExportLane(inventoryByName, '@flighthq/compression');
    const geometryRoot = resolvePackageExportLane(inventoryByName, '@flighthq/geometry');
    const geometryContract = resolvePackageExportLane(inventoryByName, '@flighthq/geometry/contract');
    const rootVector = geometryRoot.exports.find((item) => item.name === 'createVector2');
    const contractVector = geometryContract.exports.find((item) => item.name === 'createVector2');

    expect(inventory.schemaVersion).toBe(4);
    expect(inventory.summary).toMatchObject({
      excludedPackages: 1,
      exportConflicts: 0,
      exportLanes: 295,
      exports: 30_935,
      packages: 141,
      rootExports: 11_961,
      sourceFiles: 2_390,
      testFiles: 1_304,
    });
    expect(inventory.packages.every((item) => item.exportLanes.some((lane) => lane.entry === '.'))).toBe(true);
    expect(inventory.packages.every((item) => item.exportLanes.some((lane) => lane.entry === './contract'))).toBe(true);
    expect(rootVector).toMatchObject({ kind: 'function', source: expect.stringContaining('/geometry/src/vector2.ts') });
    expect(contractVector).toEqual(rootVector);
    expect(abcRoot.exports).toContainEqual(expect.objectContaining({ kind: 'function', name: 'readAbcFile' }));
    expect(compressionRoot.exports).toContainEqual(
      expect.objectContaining({ kind: 'variable', name: 'inflateDeflate' }),
    );
    const pathContract = resolvePackageExportLane(inventoryByName, '@flighthq/path/contract');
    expect(pathContract.exports.find((item) => item.name === 'StrokeStyle')).toMatchObject({
      kind: 'interface',
      runtime: false,
    });
    const typesContract = resolvePackageExportLane(inventoryByName, '@flighthq/types/contract');
    expect(typesContract.exports.find((item) => item.name === 'BlendMode')).toMatchObject({
      kind: 'type',
      runtime: true,
      runtimeBinding: { kind: 'variable', source: expect.stringContaining('/types/src/BlendMode.ts') },
    });
    expect(typesContract.exports.find((item) => item.name === 'AppearanceFlags')).toMatchObject({
      kind: 'enum',
      runtime: true,
      source: expect.stringContaining('/types/src/AppearanceFlags.ts'),
    });
    expect(() => resolvePackageExportLane(inventoryByName, '@flighthq/geometry/private')).toThrow(
      'Package import uses an unaccounted export lane: @flighthq/geometry/private',
    );
    expect(geometry.haxeModule).toBe('flighthq.geometry.Geometry');
    expect(packageRootExportLane(geometry)).toBe(geometryRoot);
    expect(sdk.exportLanes).toHaveLength(15);
    expect(sdk.sdkIncluded).toBe(false);
    expect(hostElectron.sdkIncluded).toBe(false);
    expect(hostElectron.exclusion).toBeNull();
    expect(toolCapture.exclusion).toMatchObject({
      evidence: {
        nodeImports: expect.arrayContaining(['node:fs']),
        playwrightDependencies: ['@playwright/test'],
        playwrightImports: ['@playwright/test'],
        sdkExposures: [],
        toolingBins: ['tool-capture -> dist/bin.js'],
      },
      reason: expect.stringContaining('absent from SDK barrels'),
      rule: 'node-playwright-tooling',
    });
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

  it('derives the exclusion without a package-name configuration entry', () => {
    const config = readFileSync(path.resolve('tools/generator/port.config.ts'), 'utf8');

    expect(config).not.toContain('tool-capture');
    expect(config).not.toContain('excludedPackages');
  });

  it('fails closed for partial or additional tooling exclusion claims', () => {
    const directory = mkdtempSync(path.join(os.tmpdir(), 'flight-exclusions-'));
    try {
      const complete = exclusionFixture(directory, 'complete', {
        dependencies: { '@playwright/test': '^1.0.0' },
        imports: ["import 'node:fs';", "import type { Page } from '@playwright/test';"],
        toolingBin: true,
      });
      expect(derivePackageExclusions(directory, [complete]).get(complete.name)).toMatchObject({
        rule: 'node-playwright-tooling',
      });

      const partial = exclusionFixture(directory, 'partial', {
        dependencies: {},
        imports: ["import 'node:path';"],
        toolingBin: true,
      });
      expect(() => derivePackageExclusions(directory, [complete, partial])).toThrow(
        /Partial package exclusion matches:[\s\S]*missing Playwright production dependency/u,
      );

      const newHostReason = exclusionFixture(directory, 'new-host-reason', {
        dependencies: { '@playwright/test': '^1.0.0', electron: '^1.0.0' },
        imports: [
          "import 'node:fs';",
          "import type { Page } from '@playwright/test';",
          "import electron from 'electron';",
        ],
        toolingBin: true,
      });
      expect(() => derivePackageExclusions(directory, [complete, newHostReason])).toThrow(
        /Partial package exclusion matches:[\s\S]*unsupported host dependencies \(electron\)[\s\S]*unsupported host imports \(electron\)/u,
      );

      const additional = exclusionFixture(directory, 'additional', {
        dependencies: { '@playwright/test': '^1.0.0' },
        imports: ["import 'node:crypto';", "import type { Browser } from '@playwright/test';"],
        toolingBin: true,
      });
      expect(() => derivePackageExclusions(directory, [complete, additional])).toThrow(
        'Package exclusion derivation changed: expected exactly one node-playwright-tooling exclusion, found 2',
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

    expect(audit.summary.packages).toBe(140);
    expect(audit.summary.declarations).toBeGreaterThan(5_000);
    expect(audit.summary.lowered).toBe(audit.summary.declarations);
    expect(audit.summary.diagnostics).toBe(0);
    expect(audit.summary.staticFacts.booleanExplicitTruthiness).toBeGreaterThan(1_000);
    expect(audit.summary.staticFacts.numericRelations).toBeGreaterThan(1_000);
    expect(audit.summary.staticFacts.indexedAccesses.reads).toBeGreaterThan(1_000);
    expect(audit.summary.staticFacts.indexedReceivers.Float32Array.expressions).toBeGreaterThan(1_000);
    expect(math?.lowered).toBeGreaterThan(50);
    expect(math?.staticFacts.numericRelations).toBeGreaterThan(10);
  }, 180_000);
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

function exclusionFixture(
  workspaceDirectory: string,
  name: string,
  options: {
    dependencies: Record<string, string>;
    imports: string[];
    toolingBin: boolean;
  },
): PackageInventory {
  const directory = path.join('packages', name);
  const absoluteDirectory = path.join(workspaceDirectory, directory);
  mkdirSync(path.join(absoluteDirectory, 'src'), { recursive: true });
  writeFileSync(
    path.join(absoluteDirectory, 'package.json'),
    JSON.stringify({
      ...(options.toolingBin ? { bin: { [name]: 'dist/bin.js' } } : {}),
      dependencies: options.dependencies,
      name: `@flighthq/${name}`,
      version: '0.0.0',
    }),
  );
  writeFileSync(path.join(absoluteDirectory, 'src', 'index.ts'), `${options.imports.join('\n')}\n`);
  return {
    dependencies: Object.keys(options.dependencies),
    directory,
    exclusion: null,
    exportLanes: [],
    haxeModule: `flighthq.${name}.${name}`,
    name: `@flighthq/${name}`,
    sdkExposures: [],
    sdkIncluded: false,
    sourceFiles: 1,
    testFiles: 0,
    version: '0.0.0',
  };
}
