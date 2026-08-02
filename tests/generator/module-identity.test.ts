import { buildSourceModules, validateHaxeModuleIdentities } from '../../tools/generator/src/emit/core.ts';
import type { IrModule } from '../../tools/generator/src/model/ir.ts';

const origin = {
  column: 1,
  fingerprint: 'sha256:fixture',
  line: 1,
  packageName: '@flighthq/example',
  source: 'upstream/packages/host-electron/src/electronModule.ts',
};

describe('generated Haxe module identities', () => {
  it('imports module-local values when a same-named class owns the public module', () => {
    const source = 'upstream/packages/example/src/reader.ts';
    const modules = buildSourceModules(
      '@flighthq/example',
      {
        declarations: [
          {
            constructorBody: [],
            constructorParameters: [],
            exported: true,
            fields: [],
            kind: 'class',
            methods: [],
            name: 'Reader',
            origin: { ...origin, source },
            typeParameters: [],
          },
          {
            exported: false,
            initializer: { kind: 'literal', value: 5 },
            kind: 'variable',
            mutable: false,
            name: 'LIMIT__reader',
            origin: { ...origin, source },
          },
        ],
        diagnostics: [],
        file: `/workspace/${source}`,
      },
      '/workspace',
    );

    expect(modules).toHaveLength(2);
    expect(modules[0]?.imports).toEqual(['flighthq.example._internal._ReaderValues.LIMIT__reader']);
    expect(modules[1]).toMatchObject({
      haxePackage: 'flighthq.example._internal',
      name: '_ReaderValues',
    });
  });

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

  it('accepts a secondary-type collision owned by a namespace module', () => {
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

    expect(() => validateHaxeModuleIdentities(modules)).not.toThrow();
  });

  it('reports unresolved secondary-type collisions', () => {
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
            exported: true,
            kind: 'type',
            name: 'ElectronApp',
            origin: { ...origin, source: 'upstream/packages/host-electron/src/other.ts' },
            type: { kind: 'dynamic' },
            typeParameters: [],
          },
        ],
        haxePackage: 'flighthq.hostElectron',
        imports: [],
        name: 'Other',
        packageName: '@flighthq/host-electron',
        source: 'upstream/packages/host-electron/src/other.ts',
      },
    ];

    expect(() => validateHaxeModuleIdentities(modules)).toThrowError(
      /flighthq\.hostElectron\.ElectronApp:.*electronModule\.ts.*other\.ts/isu,
    );
  });
});
