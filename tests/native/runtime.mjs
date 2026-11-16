import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { chmodSync, constants, copyFileSync, cpSync, existsSync, mkdirSync, mkdtempSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { testEnvironment } from '../../tools/native/test-environment.mjs';
import { nativePayload } from '../../tools/native/artifacts.mjs';

const root = path.resolve(import.meta.dirname, '../..');
assert.equal(process.platform, 'linux', 'This runtime gate currently proves Linux64 only');
assert.equal(process.arch, 'x64');
nativePayload(root);
const artifacts = path.join(root, '.artifacts');
const work = mkdtempSync(path.join(artifacts, 'native-consumer-'));
const environment = testEnvironment(root);
const haxelib = path.join(root, '.haxe/4.3.7/haxelib');
const lime = process.env.FLIGHT_LIME_ROOT ?? path.join(root, '.haxelib/lime/8,3,2');
assert.ok(existsSync(path.join(lime, 'run.n')), 'Install Lime 8.3.2 in the isolated .haxelib repository for this gate');
const hlRuntime = path.join(lime, 'templates/bin/hl/Linux64');
const archive = path.join(work, 'flight.zip');
run(process.execPath, ['tools/package-haxelib.mjs', '--out', archive], root, environment);
const installedLibraries = path.join(work, '.haxelib');
mkdirSync(installedLibraries);
const consumerEnvironment = { ...environment, HAXELIB_PATH: installedLibraries };
run(haxelib, ['install', archive, '--always', '--skip-dependencies'], work, consumerEnvironment);
const hxcpp = readFileSync(path.join(root, '.haxelib/hxcpp/.dev'), 'utf8').trim();
run(haxelib, ['dev', 'hxcpp', hxcpp], work, consumerEnvironment);
// Lime runs library queries from its own directory. A dev link outside this consumer
// would make the legacy haxelib client discover the parent's local repository.
const isolatedLime = path.join(installedLibraries, 'lime/8,3,2');
cpSync(lime, isolatedLime, { recursive: true, mode: constants.COPYFILE_FICLONE });
writeFileSync(path.join(installedLibraries, 'lime/.current'), '8.3.2');
const installedFlight = run(haxelib, ['libpath', 'flight'], work, consumerEnvironment).trim();
assert.ok(installedFlight.startsWith(installedLibraries + path.sep), 'Flight resolved outside the isolated consumer');
const src = path.join(work, 'src');
mkdirSync(src);
copyFileSync(path.join(root, 'examples/ffi-smoke/Smoke.hx'), path.join(src, 'Smoke.hx'));
process.stdout.write('Installed binary archive and isolated haxelib registration passed.\n');
const cpp = path.join(work, 'cpp');
run('haxe', ['-lib', 'flight', '-cp', src, '-main', 'Smoke', '-dce', 'full', '-cpp', cpp], work, consumerEnvironment);
const cleanRuntime = { ...consumerEnvironment };
delete cleanRuntime.LD_LIBRARY_PATH;
assert.match(run(path.join(cpp, 'Smoke'), [], cpp, cleanRuntime), /FLIGHT_FFI_SMOKE_OK/u);
assert.match(run('readelf', ['-d', path.join(cpp, 'Smoke')], work, cleanRuntime), /\$ORIGIN/u);
process.stdout.write('Installed hxcpp shared-library consumer passed.\n');
const hl = path.join(work, 'hl');
mkdirSync(hl);
run('haxe', ['-lib', 'flight', '-cp', src, '-main', 'Smoke', '-dce', 'no', '--macro', 'include("flight", true, ["flight._cpp", "flight._js"])', '-hl', path.join(hl, 'smoke.hl')], work, consumerEnvironment);
for (const filename of ['hl', 'libhl.so']) copyFileSync(path.join(hlRuntime, filename), path.join(hl, filename));
chmodSync(path.join(hl, 'hl'), 0o755);
assert.match(run(path.join(hl, 'hl'), ['smoke.hl'], hl, cleanRuntime), /FLIGHT_FFI_SMOKE_OK/u);

process.stdout.write('Installed HashLink consumer and full native declaration load passed.\n');

// A real Lime application exits before creating its window, so the package integration can be
// proved without a display server or a graphics driver. Both targets use the installed ZIP only.
writeFileSync(path.join(src, 'Main.hx'), `class Main extends lime.app.Application { public function new() { super(); Smoke.main(); Sys.exit(0); } }\n`);
writeFileSync(path.join(work, 'project.xml'), `<project><app main="Main" file="FlightSmoke" path="Export"/><source path="src"/><haxelib name="lime"/><haxelib name="flight"/><window hidden="true"/></project>\n`);
for (const target of ['linux', 'hl']) {
  process.stdout.write(`Running Lime ${target} installed consumer...\n`);
  const output = run(haxelib, ['run', 'lime', 'test', target, '-release'], work, consumerEnvironment);
  assert.match(output, /FLIGHT_FFI_SMOKE_OK/u, `Lime ${target} did not run the installed consumer`);
  const bin = path.join(work, `Export/${target}/bin`);
  assert.ok(existsSync(path.join(bin, 'libflight_ffi.so')), 'Lime did not deploy the shared Flight runtime');
  if (target === 'hl') assert.ok(existsSync(path.join(bin, 'flight.hdll')), 'Lime did not select the HashLink adapter');
  const hxml = readFileSync(path.join(work, `Export/${target}/haxe/release.hxml`), 'utf8');
  assert.ok(!hxml.includes(path.join(root, '.haxelib/flight')), 'Lime used a parent Flight installation');
}
process.stdout.write(`Installed ZIP runtime: hxcpp, full HL declaration load, Lime linux and Lime hl passed. Artifacts: ${work}\n`);

function run(command, args, cwd, env) {
  const result = spawnSync(command, args, { cwd, env, encoding: 'utf8', maxBuffer: 32 * 1024 * 1024 });
  if (result.status !== 0) throw new Error(`${command} ${args.join(' ')}\n${result.error ?? ''}${result.stdout}${result.stderr}`);
  return `${result.stdout}${result.stderr}`;
}
