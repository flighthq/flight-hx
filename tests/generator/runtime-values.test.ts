import { mkdirSync, mkdtempSync, rmSync, writeFileSync } from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import ts from 'typescript';

import { runtimeExportsForSource } from '../../tools/generator/src/analyze/runtime-values.ts';
import { runtimeValueAliasName } from '../../tools/generator/src/emit/core.ts';
import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';

describe('runtime value policy', () => {
  it('derives value bindings and erasure from the checker', () => {
    withProgram(
      {
        'ambient.d.ts': `
          export const DeclaredOnly: { value: number };
          export function declaredFunction(): void;
        `,
        'values.ts': `
          export interface PureInterface { value: number }
          export type PureAlias = string;
          export declare const AmbientValue: { A: number };
          export declare function ambientFunction(): void;
          export declare namespace AmbientNamespace { const A: number }
          export const RuntimeObject = { Later: 4, First: 0 } as const;
          export type RuntimeObject = (typeof RuntimeObject)[keyof typeof RuntimeObject];
          export enum RuntimeEnum { Later = 4, First = 0, String = 'string' }
          export namespace RuntimeEnum { export function helper(): number { return 1; } }
          export const enum ErasedConstEnum { First, Second }
        `,
      },
      {},
      ({ checker, options, source }) => {
        const exports = runtimeExportsForSource(source('values.ts'), checker, options);
        const declarationExports = runtimeExportsForSource(source('ambient.d.ts'), checker, options);
        expect(exports.get('PureInterface')?.runtime).toBe(false);
        expect(exports.get('PureAlias')?.runtime).toBe(false);
        expect(exports.get('AmbientValue')?.runtime).toBe(false);
        expect(exports.get('ambientFunction')?.runtime).toBe(false);
        expect(exports.get('AmbientNamespace')?.runtime).toBe(false);
        expect(exports.get('RuntimeObject')?.runtime).toBe(true);
        expect(
          exports.get('RuntimeObject')?.declaration &&
            ts.isVariableDeclaration(exports.get('RuntimeObject')!.declaration!),
        ).toBe(true);
        expect(exports.get('RuntimeEnum')?.runtime).toBe(true);
        expect(
          exports.get('RuntimeEnum')?.declaration && ts.isEnumDeclaration(exports.get('RuntimeEnum')!.declaration!),
        ).toBe(true);
        expect(exports.get('ErasedConstEnum')?.runtime).toBe(false);
        expect(declarationExports.get('DeclaredOnly')?.runtime).toBe(false);
        expect(declarationExports.get('declaredFunction')?.runtime).toBe(false);
      },
    );
  });

  it('keeps explicit type-only re-exports erased', () => {
    withProgram(
      {
        'barrel.ts': `
          export type { RuntimeObject, RuntimeEnum } from './values';
          export { type AmbientValue } from './values';
          export { RuntimeObject as LiveObject, RuntimeEnum as LiveEnum } from './values';
        `,
        'values.ts': `
          export const RuntimeObject = { A: 1 } as const;
          export type RuntimeObject = (typeof RuntimeObject)[keyof typeof RuntimeObject];
          export enum RuntimeEnum { A }
          export declare const AmbientValue: { A: number };
        `,
      },
      {},
      ({ checker, options, source }) => {
        const exports = runtimeExportsForSource(source('barrel.ts'), checker, options);
        expect(exports.get('RuntimeObject')?.runtime).toBe(false);
        expect(exports.get('RuntimeEnum')?.runtime).toBe(false);
        expect(exports.get('AmbientValue')?.runtime).toBe(false);
        expect(exports.get('LiveObject')?.runtime).toBe(true);
        expect(exports.get('LiveEnum')?.runtime).toBe(true);
      },
    );
  });

  it('matches const-enum preservation under isolatedModules and preserveConstEnums', () => {
    const source = { 'values.ts': 'export const enum RuntimeConstEnum { First, Second }\n' };
    for (const options of [{}, { isolatedModules: true }, { preserveConstEnums: true }]) {
      withProgram(source, options, ({ checker, options: actualOptions, source: getSource }) => {
        const decision = runtimeExportsForSource(getSource('values.ts'), checker, actualOptions).get(
          'RuntimeConstEnum',
        );
        expect(decision?.runtime).toBe(options.isolatedModules === true || options.preserveConstEnums === true);
      });
    }
  });

  it('preserves enum member values, declaration order, and numeric-only reverse mappings', () => {
    withProgram(
      {
        'values.ts': `
          export enum NumericRuntime { Later = 4, First = 0 }
          export enum StringRuntime { Later = 'later', First = 'first' }
          export const KeepModuleNamespace = true;
        `,
      },
      {},
      ({ checker, source }) => {
        const lowered = lowerTypeScriptSource(source('values.ts'), '@flighthq/fixture', '/workspace', checker);
        const numeric = lowered.declarations.find((item) => item.kind === 'enum' && item.name === 'NumericRuntime');
        const string = lowered.declarations.find((item) => item.kind === 'enum' && item.name === 'StringRuntime');
        expect(numeric).toMatchObject({
          members: [
            { initializer: { kind: 'literal', value: 4 }, name: 'Later', reverseMapping: true },
            { initializer: { kind: 'literal', value: 0 }, name: 'First', reverseMapping: true },
          ],
        });
        expect(string).toMatchObject({
          members: [
            { initializer: { kind: 'literal', value: 'later' }, name: 'Later', reverseMapping: false },
            { initializer: { kind: 'literal', value: 'first' }, name: 'First', reverseMapping: false },
          ],
        });

        const output = emitHaxeModule({
          declarations: lowered.declarations,
          imports: [],
          name: 'EnumFixture',
          packageName: '@flighthq/fixture',
        });
        expect(output).toContain('enum abstract NumericRuntime(Int) from Int to Int');
        expect(output).toContain('enum abstract StringRuntime(String) from String to String');
        const numericObject = output.slice(output.indexOf('public static final __enum_NumericRuntime'));
        expect(numericObject.indexOf("{ key: 'Later', value: NumericRuntime.Later }")).toBeLessThan(
          numericObject.indexOf("{ key: NumericRuntime.Later, value: 'Later' }"),
        );
        expect(numericObject.indexOf("{ key: NumericRuntime.Later, value: 'Later' }")).toBeLessThan(
          numericObject.indexOf("{ key: 'First', value: NumericRuntime.First }"),
        );
        const stringObject = output.slice(output.indexOf('public static final __enum_StringRuntime'));
        expect(stringObject).toContain("{ key: 'Later', value: StringRuntime.Later }");
        expect(stringObject).toContain("{ key: 'First', value: StringRuntime.First }");
        expect(stringObject).not.toContain("{ key: StringRuntime.Later, value: 'Later' }");
      },
    );
  });

  it('fails before a runtime value alias can collide with a generated name', () => {
    const declarations = [
      {
        name: 'RuntimeObjectValue',
        origin: {
          column: 1,
          fingerprint: 'fixture',
          line: 1,
          packageName: '@flighthq/fixture',
          source: 'fixture/existing.ts',
        },
      },
    ];
    expect(() => runtimeValueAliasName('RuntimeObject', 'fixture/value.ts', declarations)).toThrow(
      'Runtime value alias collision for RuntimeObject: fixture/value.ts and fixture/existing.ts both generate RuntimeObjectValue',
    );
  });
});

function withProgram(
  files: Record<string, string>,
  extraOptions: ts.CompilerOptions,
  run: (context: {
    checker: ts.TypeChecker;
    options: ts.CompilerOptions;
    source: (name: string) => ts.SourceFile;
  }) => void,
): void {
  const directory = mkdtempSync(path.join(os.tmpdir(), 'flight-runtime-values-'));
  try {
    for (const [name, contents] of Object.entries(files)) {
      const file = path.join(directory, name);
      mkdirSync(path.dirname(file), { recursive: true });
      writeFileSync(file, contents);
    }
    const options: ts.CompilerOptions = {
      module: ts.ModuleKind.ESNext,
      moduleResolution: ts.ModuleResolutionKind.Bundler,
      target: ts.ScriptTarget.ES2022,
      ...extraOptions,
    };
    const program = ts.createProgram(
      Object.keys(files).map((name) => path.join(directory, name)),
      options,
    );
    const checker = program.getTypeChecker();
    run({
      checker,
      options,
      source: (name) => {
        const source = program.getSourceFile(path.join(directory, name));
        if (!source) throw new Error(`Missing fixture source: ${name}`);
        return source;
      },
    });
  } finally {
    rmSync(directory, { force: true, recursive: true });
  }
}
