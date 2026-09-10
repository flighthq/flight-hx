// Web behavioral gate: the GENERATED flight.* bindings, compiled on the ESM pipeline
// (js + flight_esm), bundled with the real Flight ESM, must run and produce the right
// answer. This is the only check that proves the bindings bind to *real* Flight rather
// than a hand-written stand-in. It needs the rehydrated + built dependencies; on a fresh
// clone without them it SKIPS (exit 0 with a reason), mirroring flight-cpp's fresh-clone
// behavior — a skip is labeled, never a false green.
//
// Tree-shaking / pay-per-use is a SEPARATE property checked by tests/gates/webDce.mjs;
// this gate only asserts correctness.
import { spawnSync } from 'node:child_process';
import { existsSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import process from 'node:process';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { bundleFlightJs } from '../../tools/esm/bundle.mjs';

const repoRoot = join(import.meta.dirname, '..', '..');

function skip(reason) {
  process.stdout.write(`web-behavioral gate: SKIPPED — ${reason}\n`);
  process.exit(0);
}

let flight, compiler;
try {
  flight = resolveDependency(repoRoot, 'flight');
  compiler = resolveDependency(repoRoot, 'flight-compiler');
} catch {
  skip('dependencies not rehydrated (run `npm run rehydrate`)');
}
const compilerEntry = join(compiler.directory, 'packages/tool-compiler/dist/packages/tool-compiler/src/index.js');
const flightGeomDist = join(flight.directory, 'packages/geometry/dist/index.js');
if (!existsSync(compilerEntry)) skip('flight-compiler not built (cd .dependencies/flight-compiler && npm i && npm run build)');
if (!existsSync(flightGeomDist)) skip('flight geometry not built (cd .dependencies/flight && npm i && npx tsc -b packages/geometry)');
if (!existsSync(join(repoRoot, 'generated/flight/Geom.hx'))) skip('bindings not generated (run `npm run generate`)');

const jsOut = join(tmpdir(), 'flight-hx-webgate.js');
const bundleOut = join(tmpdir(), 'flight-hx-webgate.bundle.cjs');

const compile = spawnSync('node', [
  'tools/haxe.mjs', '-cp', 'generated', '-cp', 'generated/js', '-cp', 'examples/web-geometry',
  '--main', 'WebGeometry', '-D', 'flight_esm', '-js', jsOut,
], { cwd: repoRoot, encoding: 'utf8' });
if (compile.status !== 0) {
  process.stderr.write(`web-behavioral gate: compile failed:\n${compile.stdout}${compile.stderr}\n`);
  process.exit(1);
}

try {
  await bundleFlightJs({ entry: jsOut, outfile: bundleOut });
} catch (error) {
  process.stderr.write(`web-behavioral gate: bundle failed:\n${(error?.errors ?? []).map((e) => e.text).join('\n')}\n`);
  process.exit(1);
}

const run = spawnSync('node', [bundleOut], { encoding: 'utf8' });
if (!(run.stdout + run.stderr).includes('WEB_GEOMETRY_OK')) {
  process.stderr.write(`web-behavioral gate: run did not reach WEB_GEOMETRY_OK:\n${run.stdout}${run.stderr}\n`);
  process.exit(1);
}
process.stdout.write('web-behavioral gate: generated flight.* ran against real @flighthq/geometry ESM (bundled).\n');
