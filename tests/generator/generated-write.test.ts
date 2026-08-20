import { mkdtempSync, readFileSync, rmSync, statSync, utimesSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';

import { afterEach, describe, expect, it } from 'vitest';

import { writeOrCheck } from '../../tools/generator/src/emit/reports.ts';

describe('generated output writes', () => {
  const temporaryDirectories: string[] = [];

  afterEach(() => {
    for (const directory of temporaryDirectories.splice(0)) rmSync(directory, { force: true, recursive: true });
  });

  it('preserves an existing file when its normalized content is unchanged', () => {
    const directory = mkdtempSync(path.join(tmpdir(), 'flight-hx-generated-write-'));
    temporaryDirectories.push(directory);
    const file = path.join(directory, 'Generated.hx');
    writeFileSync(file, 'package generated;\n');
    const fixedTime = new Date('2020-01-02T03:04:05.000Z');
    utimesSync(file, fixedTime, fixedTime);
    const before = statSync(file).mtimeMs;

    writeOrCheck(file, 'package generated;\r\n', false);

    expect(readFileSync(file, 'utf8')).toBe('package generated;\n');
    expect(statSync(file).mtimeMs).toBe(before);
  });

  it('rewrites an existing file when normalized content changes', () => {
    const directory = mkdtempSync(path.join(tmpdir(), 'flight-hx-generated-write-'));
    temporaryDirectories.push(directory);
    const file = path.join(directory, 'Generated.hx');
    writeFileSync(file, 'package old;\n');

    writeOrCheck(file, 'package generated;\r\n', false);

    expect(readFileSync(file, 'utf8')).toBe('package generated;\n');
  });
});
