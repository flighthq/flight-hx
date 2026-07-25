import { readFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

export type WebGl2ComputedConstantDomain = 'GlBlendEquation' | 'GlBlendFactor';

export const webGl2ComputedConstantDomains: Readonly<Record<WebGl2ComputedConstantDomain, readonly string[]>> = {
  GlBlendEquation: ['FUNC_ADD', 'FUNC_REVERSE_SUBTRACT', 'MAX', 'MIN'],
  GlBlendFactor: ['DST_COLOR', 'ONE', 'ONE_MINUS_SRC_ALPHA', 'ONE_MINUS_SRC_COLOR', 'ZERO'],
};

export function validateWebGl2ComputedConstantDomains(workspaceDirectory: string): void {
  const sourcePath = path.join(workspaceDirectory, 'upstream', 'packages', 'types', 'src', 'GlRenderState.ts');
  const source = ts.createSourceFile(
    sourcePath,
    readFileSync(sourcePath, 'utf8'),
    ts.ScriptTarget.Latest,
    true,
    ts.ScriptKind.TS,
  );
  validateWebGl2ComputedConstantDomainSource(source);
}

export function validateWebGl2ComputedConstantDomainSource(source: ts.SourceFile): void {
  const aliases = new Map(
    source.statements.filter(ts.isTypeAliasDeclaration).map((declaration) => [declaration.name.text, declaration]),
  );
  for (const [name, expected] of Object.entries(webGl2ComputedConstantDomains)) {
    const alias = aliases.get(name);
    if (!alias) throw new Error(`WebGL2 computed constant domain is missing: ${name} in ${source.fileName}`);
    const nodes = ts.isUnionTypeNode(alias.type) ? alias.type.types : [alias.type];
    const actual = nodes.map((node) => {
      if (!ts.isLiteralTypeNode(node) || !ts.isStringLiteral(node.literal)) {
        throw new Error(
          `WebGL2 computed constant domain must be a closed string-literal union: ${name} in ${source.fileName}`,
        );
      }
      return node.literal.text;
    });
    const sortedExpected = [...expected].sort();
    const sortedActual = [...actual].sort();
    if (
      sortedActual.length !== sortedExpected.length ||
      sortedActual.some((value, index) => value !== sortedExpected[index])
    ) {
      throw new Error(
        `WebGL2 computed constant domain changed: ${name} in ${source.fileName}; expected ${expected.join(' | ')}, received ${actual.join(' | ')}`,
      );
    }
  }
}
