import ts from 'typescript';
import { describe, expect, it } from 'vitest';

import { validateWebGl2ComputedConstantDomainSource } from '../../tools/generator/src/emit/webgl2-endpoints.ts';

function source(factor: string, equation: string): ts.SourceFile {
  return ts.createSourceFile(
    '/workspace/upstream/packages/types/src/GlRenderState.ts',
    `export type GlBlendFactor = ${factor}; export type GlBlendEquation = ${equation};`,
    ts.ScriptTarget.Latest,
    true,
    ts.ScriptKind.TS,
  );
}

describe('typed WebGL2 endpoint inventory', () => {
  const factor = "'DST_COLOR' | 'ONE' | 'ONE_MINUS_SRC_ALPHA' | 'ONE_MINUS_SRC_COLOR' | 'ZERO'";
  const equation = "'FUNC_ADD' | 'FUNC_REVERSE_SUBTRACT' | 'MAX' | 'MIN'";

  it('accepts the closed computed-constant unions', () => {
    expect(() => validateWebGl2ComputedConstantDomainSource(source(factor, equation))).not.toThrow();
  });

  it('fails when a computed-constant union gains an unmapped member', () => {
    expect(() => validateWebGl2ComputedConstantDomainSource(source(`${factor} | 'SRC_ALPHA'`, equation))).toThrow(
      'WebGL2 computed constant domain changed: GlBlendFactor',
    );
  });

  it('fails when a computed-constant domain is no longer a closed string-literal union', () => {
    expect(() => validateWebGl2ComputedConstantDomainSource(source('string', equation))).toThrow(
      'WebGL2 computed constant domain must be a closed string-literal union: GlBlendFactor',
    );
  });
});
