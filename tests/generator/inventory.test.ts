import path from 'node:path';

import { analyzeUpstream, packageNameToModule } from '../../tools/generator/src/analyze/inventory.ts';
import { auditLowering } from '../../tools/generator/src/analyze/lowering.ts';

describe('analyzeUpstream', () => {
  it('accounts for every upstream package and representative export', () => {
    const inventory = analyzeUpstream(path.resolve('.'));
    const geometry = inventory.packages.find((item) => item.name === '@flighthq/geometry');
    const sdk = inventory.packages.find((item) => item.name === '@flighthq/sdk');
    const hostElectron = inventory.packages.find((item) => item.name === '@flighthq/host-electron');

    expect(inventory.summary.packages).toBe(131);
    expect(inventory.summary.sourceFiles).toBeGreaterThan(1_000);
    expect(inventory.summary.testFiles).toBeGreaterThan(1_000);
    expect(geometry?.exports.some((item) => item.name === 'createVector2')).toBe(true);
    expect(sdk?.sdkIncluded).toBe(false);
    expect(hostElectron?.sdkIncluded).toBe(false);
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
    expect(math?.lowered).toBeGreaterThan(50);
  });
});

describe('packageNameToModule', () => {
  it('maps scoped kebab-case package names deterministically', () => {
    expect(packageNameToModule('@flighthq/geometry')).toBe('Geometry');
    expect(packageNameToModule('@flighthq/camera2d')).toBe('Camera2DApi');
    expect(packageNameToModule('@flighthq/displayobject-gl')).toBe('DisplayObjectGl');
    expect(packageNameToModule('@flighthq/entity')).toBe('EntityApi');
    expect(packageNameToModule('@flighthq/render-gl')).toBe('RenderGl');
    expect(packageNameToModule('@flighthq/sdk')).toBe('Sdk');
  });
});
