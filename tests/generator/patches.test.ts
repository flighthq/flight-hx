import ts from 'typescript';

import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';
import type { SemanticPatch } from '../../tools/generator/src/model/patch.ts';
import { applySemanticPatches, semanticBodyPatchFunctionNames } from '../../tools/generator/src/patch/apply.ts';

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
  it('lets a body patch own syntax that the general lowerer cannot represent', () => {
    const source = ts.createSourceFile(
      '/workspace/upstream/packages/math/src/accessor.ts',
      'function createCursor(): { readonly length: number } { return { get length() { return 1; } }; }',
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const patch = {
      expect: { astHash: 'sha256:fixture', kind: 'function' as const },
      fragment: 'fixture.hx',
      id: 'math.cursor',
      operation: 'replaceBody' as const,
      reason: 'Exercise body ownership before semantic patch application.',
      target: {
        export: 'createCursor__accessor',
        package: '@flighthq/math',
        source: 'upstream/packages/math/src/accessor.ts',
      },
    };

    const unowned = lowerTypeScriptSource(source, '@flighthq/math', '/workspace');
    expect(unowned.declarations).toHaveLength(0);
    expect(unowned.diagnostics).toHaveLength(1);

    const owned = lowerTypeScriptSource(source, '@flighthq/math', '/workspace', undefined, undefined, {
      ownedFunctionBodies: semanticBodyPatchFunctionNames(
        [patch],
        '@flighthq/math',
        'upstream/packages/math/src/accessor.ts',
      ),
    });
    expect(owned.declarations).toHaveLength(1);
    expect(owned.declarations[0]).toMatchObject({ body: [], kind: 'function', name: 'createCursor' });
    expect(owned.diagnostics).toHaveLength(0);
  });

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
