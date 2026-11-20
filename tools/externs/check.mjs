import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import { patchIdentity } from '../flight-source.mjs';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { assertPortablePaths } from './portable-paths.mjs';

const root = path.resolve(import.meta.dirname, '../..');
const generated = path.join(root, 'generated/externs');
const provenance = JSON.parse(readFileSync(path.join(generated, 'provenance.json'), 'utf8'));
assert.equal(provenance.schema, 'flight-hx-rust-externs/1');
assert.equal(provenance.source.commit, resolveDependency(root, 'flight').commit, 'extern source differs from Flight pin');
assert.deepEqual(provenance.source.patches, patchIdentity(root).patches, 'extern producer patch differs from tracked source');
const expected = new Map(provenance.files.map((file) => [file.path, file.sha256]));
assert.equal(expected.size, provenance.files.length, 'duplicate provenance path');
const actual = filesUnder(generated).filter((file) => file !== 'provenance.json');
assertPortablePaths(actual);
assert.deepEqual([...actual].sort(), [...expected.keys()].sort(), 'generated file inventory drift');
for (const filename of actual) {
  const contents = readFileSync(path.join(generated, filename));
  assert.equal(createHash('sha256').update(contents).digest('hex'), expected.get(filename), `changed extern: ${filename}`);
}

// Match the upstream target exclusions while loading this repository's checked-in copy.
for (const [target, exclude, defines] of [
  ['hl', ['flight._cpp', 'flight._js', 'flight.esm'], []],
  ['cpp', ['flight._hl', 'flight._js', 'flight.esm'], []],
  ['js', ['flight._hl', 'flight._cpp'], ['-D', 'flight_esm']],
]) {
  const result = haxe([
    '--no-output', '-cp', generated,
    `--${target}`, path.join(root, '.artifacts', `surface.${target}`), ...defines,
    '--macro', `include("flight", true, ${JSON.stringify(exclude)})`,
  ]);
  assert.equal(result.status, 0, `${target} generated surface failed:\n${result.stdout}${result.stderr}`);
  process.stdout.write(`Copied extern surface: ${target} passed.\n`);
}
process.stdout.write(`Extern inventory: ${actual.length} files match Flight ${provenance.source.commit}.\n`);

function haxe(args) {
  return spawnSync(process.execPath, ['tools/haxe.mjs', ...args], { cwd: root, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
}

function filesUnder(directory, prefix = '') {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    assert.ok(!entry.isSymbolicLink(), `symlink in extern tree: ${entry.name}`);
    const name = prefix ? `${prefix}/${entry.name}` : entry.name;
    return entry.isDirectory() ? filesUnder(path.join(directory, entry.name), name) : [name];
  });
}
