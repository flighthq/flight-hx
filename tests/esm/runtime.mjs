import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdirSync, mkdtempSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { unpack } from '../support/archive.mjs';
import { buildWebBundle } from '../../tools/esm/buildWeb.mjs';
import { bundleFlightJs } from '../../tools/esm/bundle.mjs';

const root = path.resolve(import.meta.dirname, '../..');
mkdirSync(path.join(root, '.artifacts'), { recursive: true });
const work = mkdtempSync(path.join(root, '.artifacts/esm-consumer-'));
const archive = path.join(work, 'flight.zip');
run(process.execPath, ['tools/package-haxelib.mjs', '--externs-only', '--out', archive]);
const installed = path.join(work, 'installed');
unpack(readFileSync(archive), installed);
const classpaths = [path.join(installed, 'lib'), path.join(installed, 'examples/esm-smoke')];
const built = await buildWebBundle({ main: 'WebSmoke', classpaths, outDir: path.join(work, 'used') });
assert.match(run(process.execPath, [built.bundle]), /FLIGHT_ESM_SMOKE_OK/u);
const emitted = readFileSync(built.entry, 'utf8');
assert.match(emitted, /from "@flighthq\/geometry"/u);
assert.match(emitted, /from "@flighthq\/math"/u);
assert.doesNotMatch(emitted, /\brequire\s*\(|\bflight_(?:create|get|set|free|lerp)/u);
const bundle = readFileSync(built.bundle, 'utf8');
assert.doesNotMatch(bundle, /\brequire\s*\(/u);
assert.match(bundle, /function createVector2\(/u);
assert.doesNotMatch(bundle, /\breflectVector2\b|\bfactorial\b/u, 'Unused SDK exports were retained');
assert.ok(Object.keys(built.metafile.inputs).some((name) => name.includes('packages/geometry/src/vector2.ts')));
writeFileSync(path.join(work, 'Empty.hx'), 'class Empty { static function main() trace("FLIGHT_ESM_EMPTY_OK"); }\n');
const empty = await buildWebBundle({ main: 'Empty', classpaths: [path.join(installed, 'lib'), work], outDir: path.join(work, 'empty') });
assert.match(run(process.execPath, [empty.bundle]), /FLIGHT_ESM_EMPTY_OK/u);
assert.ok(!Object.keys(empty.metafile.inputs).some((name) => name.includes('/packages/')), 'An unused Flight package was imported');
const missing = path.join(work, 'missing-export.mjs');
writeFileSync(missing, 'import * as math from "@flighthq/math"; console.log(math.__missing_flight_export);\n');
await assert.rejects(bundleFlightJs({ entry: missing, outfile: path.join(work, 'missing-bundle.mjs') }), /matching export|always be undefined/u);
process.stdout.write(`ESM installed archive: real Flight math/geometry, arrays, callbacks/options, fields, lifecycle and tree-shaking passed. Artifacts: ${work}\n`);

function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
  assert.equal(result.status, 0, `${result.error ?? ''}${result.stdout}${result.stderr}`);
  return `${result.stdout}${result.stderr}`;
}
