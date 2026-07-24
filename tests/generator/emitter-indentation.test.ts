import ts from 'typescript';

import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';

function emit(sourceText: string): string {
  const source = ts.createSourceFile(
    '/workspace/upstream/packages/example/src/sample.ts',
    sourceText,
    ts.ScriptTarget.Latest,
    true,
    ts.ScriptKind.TS,
  );
  const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
  expect(lowered.diagnostics).toEqual([]);
  return emitHaxeModule({
    declarations: lowered.declarations,
    imports: [],
    name: 'IndentFixture',
    packageName: '@flighthq/example',
  });
}

describe('Haxe emitter indentation', () => {
  it('indents every physical line in nested statement blocks and function expressions', () => {
    const output = emit(`
      export function branch(first: boolean, second: boolean): number {
        if (first) {
          if (second) return 1;
          else return 2;
        } else return 3;
      }

      export function install(): () => number {
        const handler: () => number = function (): number {
          if (true) return 4;
          return 5;
        };
        return handler;
      }
    `);

    expect(output).toContain(
      [
        '    if (_Runtime.truthy(first)) {',
        '      if (_Runtime.truthy(second)) { return cast 1.0; } else { return cast 2.0; }',
        '    } else { return cast 3.0; }',
      ].join('\n'),
    );
    expect(output).toContain(
      [
        '    handler = function() {',
        '      if (_Runtime.truthy(true)) { return cast 4.0; }',
        '      return cast 5.0;',
        '    };',
      ].join('\n'),
    );
  });

  it('retains contextual indentation through async and nested closures', () => {
    const output = emit(`
      export async function run(): Promise<number> {
        const task: () => Promise<number> = async (): Promise<number> => {
          const nested: () => number = (): number => {
            return 7;
          };
          return nested();
        };
        return task();
      }
    `);

    expect(output).toContain(
      [
        '      var task:Dynamic = cast _Runtime.UNDEFINED;',
        '      task = function():flighthq._internal._Promise<Float> {',
        '        return cast flighthq._internal._Async.protect(function():Dynamic {',
        '          var nested:Dynamic = cast _Runtime.UNDEFINED;',
        '          nested = function() {',
        '            return cast 7.0;',
        '          };',
        '          return flighthq._internal._Async.resolve(_Runtime.callValue(nested, cast ([] : Array<Dynamic>)));',
        '        });',
        '      };',
      ].join('\n'),
    );
  });

  it('indents multiline semantic-patch bodies with normalized line endings', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/example/src/patched.ts',
      'export function patched(flag: boolean): number { return 0; }',
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const lowered = lowerTypeScriptSource(source, '@flighthq/example', '/workspace');
    expect(lowered.diagnostics).toEqual([]);
    const declaration = lowered.declarations[0];
    if (!declaration || declaration.kind !== 'function') throw new Error('Expected a lowered function declaration.');
    declaration.haxeBody = 'if (flag) {\r  return 1.0;\r\n} else {\n  return 2.0;\n}';

    const output = emitHaxeModule({
      declarations: lowered.declarations,
      imports: [],
      name: 'PatchFixture',
      packageName: '@flighthq/example',
    });

    expect(output).toContain(
      ['    if (flag) {', '      return 1.0;', '    } else {', '      return 2.0;', '    }'].join('\n'),
    );
    expect(output).not.toContain('\r');
  });
});
