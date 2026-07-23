import ts from 'typescript';

import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';
import type { SemanticPatch } from '../../tools/generator/src/model/patch.ts';
import { applySemanticPatches } from '../../tools/generator/src/patch/apply.ts';

function fixture() {
  const source = ts.createSourceFile(
    '/workspace/upstream/packages/math/src/sample.ts',
    'export function clamp(value: number): number { return value; }',
    ts.ScriptTarget.Latest,
    true,
    ts.ScriptKind.TS,
  );
  const result = lowerTypeScriptSource(source, '@flighthq/math', '/workspace');
  const declaration = result.declarations[0]!;
  const base = {
    expect: { astHash: declaration.origin.fingerprint, kind: 'function' as const },
    id: 'math.clamp',
    reason: 'Exercise deterministic semantic patch matching.',
    target: {
      export: 'clamp',
      package: '@flighthq/math',
      source: 'upstream/packages/math/src/sample.ts',
    },
  };
  return { base, declaration, declarations: result.declarations };
}

describe('semantic patches', () => {
  it('applies an exact fingerprinted operation and audits it', () => {
    const { base, declaration, declarations } = fixture();
    const patch = { ...base, name: 'clampValue', operation: 'rename' as const };
    const audit = applySemanticPatches(declarations, [patch], '/workspace');

    expect(declaration.name).toBe('clampValue');
    expect(audit.summary).toEqual({ applied: 1, conflicting: 0, stale: 0, unmatched: 0 });
  });

  it('rejects stale, unmatched, and conflicting patches loudly', () => {
    const staleFixture = fixture();
    const stale = {
      ...staleFixture.base,
      expect: { ...staleFixture.base.expect, astHash: 'sha256:stale' },
      name: 'clampValue',
      operation: 'rename' as const,
    };
    expect(() => applySemanticPatches(staleFixture.declarations, [stale], '/workspace')).toThrow(
      'Stale semantic patch',
    );

    const unmatchedFixture = fixture();
    const unmatched = {
      ...unmatchedFixture.base,
      id: 'math.missing',
      name: 'missing',
      operation: 'rename' as const,
      target: { ...unmatchedFixture.base.target, export: 'missing' },
    };
    expect(() => applySemanticPatches(unmatchedFixture.declarations, [unmatched], '/workspace')).toThrow(
      'Unmatched semantic patch',
    );

    const conflictFixture = fixture();
    const first = { ...conflictFixture.base, name: 'first', operation: 'rename' as const };
    const second: SemanticPatch = { ...first, id: 'math.clamp-again', name: 'second' };
    expect(() => applySemanticPatches(conflictFixture.declarations, [first, second], '/workspace')).toThrow(
      'Conflicting semantic patches',
    );
  });
});
