import { validateHaxeModuleIdentities } from '../../tools/generator/src/emit/core.ts';
import type { IrModule } from '../../tools/generator/src/model/ir.ts';

const origin = {
  column: 1,
  fingerprint: 'sha256:fixture',
  line: 1,
  packageName: '@flighthq/example',
  source: 'upstream/packages/host-electron/src/electronModule.ts',
};

describe('generated Haxe module identities', () => {
  it('accepts distinct source-derived modules', () => {
    const modules: IrModule[] = [
      {
        declarations: [],
        haxePackage: 'flighthq.geometry',
        imports: [],
        name: 'Vector2',
        packageName: '@flighthq/geometry',
        source: 'upstream/packages/geometry/src/vector2.ts',
      },
    ];

    expect(() => validateHaxeModuleIdentities(modules)).not.toThrow();
  });

  it('reports every namespace and secondary-type collision together', () => {
    const modules: IrModule[] = [
      {
        declarations: [
          {
            exported: true,
            kind: 'type',
            name: 'ElectronApp',
            origin,
            type: { kind: 'dynamic' },
            typeParameters: [],
          },
        ],
        haxePackage: 'flighthq.hostElectron',
        imports: [],
        name: 'ElectronModule',
        packageName: '@flighthq/host-electron',
        source: origin.source,
      },
      {
        declarations: [
          {
            body: [],
            exported: true,
            kind: 'function',
            name: 'createElectronAppBackend',
            origin: { ...origin, source: 'upstream/packages/host-electron/src/electronApp.ts' },
            parameters: [],
            returns: { kind: 'dynamic' },
            typeParameters: [],
          },
        ],
        haxePackage: 'flighthq.hostElectron',
        imports: [],
        name: 'ElectronApp',
        packageName: '@flighthq/host-electron',
        source: 'upstream/packages/host-electron/src/electronApp.ts',
      },
    ];

    expect(() => validateHaxeModuleIdentities(modules)).toThrowError(
      /flighthq\.hostElectron\.ElectronApp:.*electronModule\.ts.*electronApp\.ts/isu,
    );
  });
});
