import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

import { auditHostToolkit, type HostToolkitAudit } from '../../tools/generator/src/analyze/host-toolkit.ts';
import type { HostTypeAudit } from '../../tools/generator/src/analyze/host-types.ts';

describe('host toolkit dependency boundary', () => {
  it('matches the committed deterministic manifest and exposes compatibility debt', () => {
    const workspace = process.cwd();
    const hostTypes = JSON.parse(
      readFileSync(path.join(workspace, 'reports', 'host-types.json'), 'utf8'),
    ) as HostTypeAudit;
    const committed = JSON.parse(
      readFileSync(path.join(workspace, 'reports', 'host-toolkit.json'), 'utf8'),
    ) as HostToolkitAudit;
    const audit = auditHostToolkit(workspace, hostTypes);

    expect(audit).toEqual(committed);
    expect(audit.summary.missingEntries).toBe(0);
    expect(audit.types.find((entry) => entry.key === 'host:AudioBuffer')?.coverage).toBe('typed');
    expect(audit.types.find((entry) => entry.key === 'host:AbortSignal')?.coverage).toBe('typed');
    expect(audit.types.find((entry) => entry.key === 'host:Performance')?.coverage).toBe('typed');
    expect(audit.values.find((entry) => entry.key === 'global:TextDecoder')?.coverage).toBe('portable');
    expect(audit.values.find((entry) => entry.key === 'global:matchMedia')?.coverage).toBe('js-only');
    for (const key of [
      'global:AbortController',
      'global:Date',
      'global:Float32Array',
      'global:performance',
      'global:structuredClone',
      'global:TextEncoder',
      'global:Uint8Array',
    ]) {
      expect(audit.values.find((entry) => entry.key === key)?.coverage, key).toBe('portable');
    }
    expect(audit.values.some((entry) => entry.key === 'global:SHADOW_DEPTH_FORMAT')).toBe(false);

    const runtime = readFileSync(path.join(workspace, 'src', 'flight', '_internal', '_Runtime.hx'), 'utf8');
    expect(runtime).not.toMatch(/public static function (?:externalValue|globalValue|typeofGlobal)\b/u);
  });

  it('fails generation when emitted code references an undeclared key', () => {
    const workspace = mkdtempSync(path.join(tmpdir(), 'flight-hx-host-toolkit-'));
    try {
      mkdirSync(path.join(workspace, 'generated', 'flight'), { recursive: true });
      mkdirSync(path.join(workspace, 'src', 'flight', '_internal', 'dom'), { recursive: true });
      writeFileSync(
        path.join(workspace, 'generated', 'flight', 'Fixture.hx'),
        "class Fixture { static final value = flight._internal._HostValueLut.get('MissingValue'); }\n",
      );
      writeFileSync(
        path.join(workspace, 'src', 'flight', '_internal', '_HostValueLut.hx'),
        'class _HostValueLut { public static final keys:Array<String> = [\n  ]; public static final portableKeys:Array<String> = [\n  ]; }\n',
      );
      writeFileSync(
        path.join(workspace, 'src', 'flight', '_internal', '_HostModuleLut.hx'),
        'class _HostModuleLut {}\n',
      );
      writeFileSync(path.join(workspace, 'src', 'flight', '_internal', 'WebExterns.hx'), 'class WebExterns {}\n');
      const hostTypes: HostTypeAudit = {
        schemaVersion: 2,
        summary: { calls: 0, memberAccesses: 0, reads: 0, typeReferences: 0, types: 0, writes: 0 },
        types: [],
        upstreamCommit: 'fixture',
      };

      expect(() => auditHostToolkit(workspace, hostTypes)).toThrowError(
        'Host toolkit LUT is missing generated dependencies:\n- global:MissingValue',
      );
    } finally {
      rmSync(workspace, { force: true, recursive: true });
    }
  });
});
