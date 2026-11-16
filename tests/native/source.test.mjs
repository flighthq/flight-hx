import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdtempSync, mkdirSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { test } from 'node:test';
import { prepareFlight, preparedIdentity } from '../../tools/flight-source.mjs';
function execute(command, args, cwd) {
  const result = spawnSync(command, args, { cwd, encoding: 'utf8' });
  if (result.status !== 0) throw new Error(result.stderr);
  return result.stdout;
}
function fixture(t) {
  const root = mkdtempSync(path.join(tmpdir(), 'flight-source-'));
  t.after(() => rmSync(root, { recursive: true, force: true }));
  const original = path.join(root, 'input'); mkdirSync(original);
  execute('git', ['init', '-q'], original);
  const file = path.join(original, 'producer.txt'); writeFileSync(file, 'before\n');
  execute('git', ['add', 'producer.txt'], original);
  execute('git', ['-c', 'user.name=Fixture', '-c', 'user.email=fixture@example.invalid', 'commit', '-qm', 'fixture'], original);
  const commit = execute('git', ['rev-parse', 'HEAD'], original).trim();
  writeFileSync(file, 'after\n'); const patch = execute('git', ['diff'], original); writeFileSync(file, 'before\n');
  const patches = path.join(root, 'patches/flight'); mkdirSync(patches, { recursive: true });
  writeFileSync(path.join(patches, 'change.patch'), patch);
  writeFileSync(path.join(patches, 'manifest.json'), JSON.stringify({ sourceCommit: commit, patches: ['patches/flight/change.patch'] }));
  return { root, original, file };
}
test('producer patch is reproducible and does not change the pinned source checkout', (t) => {
  const f = fixture(t); const prepared = prepareFlight(f.root, f.original, execute);
  assert.equal(readFileSync(f.file, 'utf8'), 'before\n');
  assert.equal(readFileSync(path.join(prepared, 'producer.txt'), 'utf8'), 'after\n');
  assert.equal(prepareFlight(f.root, f.original, execute), prepared);
  assert.equal(preparedIdentity(prepared, execute).patches.length, 1);
});
test('unrecorded edits to the prepared producer are rejected', (t) => {
  const f = fixture(t); const prepared = prepareFlight(f.root, f.original, execute);
  writeFileSync(path.join(prepared, 'producer.txt'), 'unrecorded\n');
  assert.throws(() => prepareFlight(f.root, f.original, execute), /changed outside/u);
});
test('dirty pinned inputs are not silently mixed into generated artifacts', (t) => {
  const f = fixture(t); writeFileSync(f.file, 'dirty\n');
  assert.throws(() => prepareFlight(f.root, f.original, execute), /must be clean/u);
});
