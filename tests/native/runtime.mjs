import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { chmodSync, constants, copyFileSync, cpSync, existsSync, mkdirSync, mkdtempSync, readFileSync, readdirSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { testEnvironment } from '../../tools/native/test-environment.mjs';
import { nativePayload } from '../../tools/native/artifacts.mjs';

const root = path.resolve(import.meta.dirname, '../..');
const host = {
  linux: { platform: 'Linux64', limeTarget: 'linux', core: 'libflight_ffi.so', executable: 'Smoke', hl: 'hl' },
  darwin: { platform: 'Mac64', limeTarget: 'mac', core: 'libflight_ffi.dylib', executable: 'Smoke', hl: 'hl' },
  win32: { platform: 'Windows64', limeTarget: 'windows', core: 'flight_ffi.dll', executable: 'Smoke.exe', hl: 'hl.exe' },
}[process.platform];
assert.ok(host, 'Native runtime gate supports Linux, macOS and Windows');
assert.equal(process.arch, 'x64', 'The bundled Lime HL runtimes are x64');
nativePayload(root);
const artifacts = path.join(root, '.artifacts');
const work = mkdtempSync(path.join(artifacts, 'native-consumer-'));
const environment = testEnvironment(root);
const haxelib = path.join(root, '.haxe/4.3.7', process.platform === 'win32' ? 'haxelib.exe' : 'haxelib');
const lime = process.env.FLIGHT_LIME_ROOT ?? path.join(root, '.haxelib/lime/8,3,2');
assert.ok(existsSync(path.join(lime, 'run.n')), 'Install Lime 8.3.2 in the isolated .haxelib repository for this gate');
const hlRuntime = path.join(lime, 'templates/bin/hl', host.platform);
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
const installedFlight = path.resolve(run(haxelib, ['libpath', 'flight'], work, consumerEnvironment).trim());
assert.ok(installedFlight.startsWith(installedLibraries + path.sep), 'Flight resolved outside the isolated consumer');
const src = path.join(work, 'src');
mkdirSync(src);
copyFileSync(path.join(installedFlight, 'examples/ffi-smoke/Smoke.hx'), path.join(src, 'Smoke.hx'));
process.stdout.write('Installed binary archive and isolated haxelib registration passed.\n');
const cpp = path.join(work, 'cpp');
// This gate packages x64 binaries. In particular, hxcpp can default to x86 on
// Windows even with x64 Node and MSVC, so select the consumer architecture too.
run('haxe', ['-lib', 'flight', '-cp', src, '-main', 'Smoke', '-dce', 'full', '-D', 'HXCPP_M64', '-cpp', cpp], work, consumerEnvironment);
const cleanRuntime = { ...consumerEnvironment };
delete cleanRuntime.LD_LIBRARY_PATH;
delete cleanRuntime.DYLD_LIBRARY_PATH;
assert.match(run(path.join(cpp, host.executable), [], cpp, cleanRuntime), /FLIGHT_FFI_SMOKE_OK/u);
if (process.platform === 'linux') assert.match(run('readelf', ['-d', path.join(cpp, host.executable)], work, cleanRuntime), /\$ORIGIN/u);
if (process.platform === 'darwin') assert.match(run('otool', ['-l', path.join(cpp, host.executable)], work, cleanRuntime), /@executable_path/u);
assert.ok(existsSync(path.join(cpp, host.core)), 'Plain hxcpp did not deploy its shared runtime');
process.stdout.write('Installed hxcpp shared-library consumer passed.\n');
const hl = path.join(work, 'hl');
mkdirSync(hl);
run('haxe', ['-lib', 'flight', '-cp', src, '-main', 'Smoke', '-dce', 'no', '--macro', 'include("flight", true, ["flight._cpp", "flight._js"])', '-hl', path.join(hl, 'smoke.hl')], work, consumerEnvironment);
for (const filename of readdirSync(hlRuntime).filter((name) => name === host.hl || /\.(dll|dylib|so|hdll)$/u.test(name)))
  copyFileSync(path.join(hlRuntime, filename), path.join(hl, filename));
if (process.platform !== 'win32') chmodSync(path.join(hl, host.hl), 0o755);
assert.match(run(path.join(hl, host.hl), ['smoke.hl'], hl, cleanRuntime), /FLIGHT_FFI_SMOKE_OK/u);

process.stdout.write('Installed HashLink consumer and full native declaration load passed.\n');

// A real Lime application exits before creating its window, so the package integration can be
// proved without a display server or a graphics driver. Both targets use the installed ZIP only.
writeFileSync(path.join(src, 'Main.hx'), `class Main extends lime.app.Application { public function new() { super(); Smoke.main(); Sys.exit(0); } }\n`);
writeFileSync(path.join(work, 'project.xml'), `<project><app main="Main" file="FlightSmoke" path="Export"/><source path="src"/><haxelib name="lime"/><haxelib name="flight"/><window hidden="true"/></project>\n`);
for (const target of [host.limeTarget, 'hl']) {
  process.stdout.write(`Running Lime ${target} installed consumer...\n`);
  const output = run(haxelib, ['run', 'lime', 'test', target, '-release', '-64'], work, consumerEnvironment);
  assert.match(output, /FLIGHT_FFI_SMOKE_OK/u, `Lime ${target} did not run the installed consumer`);
  const outputDirectory = path.join(work, `Export/${target === 'mac' ? 'macos' : target}`);
  const bin = path.join(outputDirectory, 'bin', ...(process.platform === 'darwin' ? ['FlightSmoke.app/Contents/MacOS'] : []));
  assert.ok(existsSync(path.join(bin, host.core)), 'Lime did not deploy the shared Flight runtime');
  if (target === 'hl') assert.ok(existsSync(path.join(bin, 'flight.hdll')), 'Lime did not select the HashLink adapter');
  const hxml = readFileSync(path.join(outputDirectory, 'haxe/release.hxml'), 'utf8').replaceAll('\\', '/');
  assert.ok(!hxml.includes(path.join(root, '.haxelib/flight').replaceAll('\\', '/')), 'Lime used a parent Flight installation');
}
process.stdout.write(`Installed ZIP runtime (${host.platform}): hxcpp, full HL declaration load, Lime ${host.limeTarget} and Lime hl passed. Artifacts: ${work}\n`);

function run(command, args, cwd, env) {
  const result = spawnSync(command, args, { cwd, env, encoding: 'utf8', maxBuffer: 32 * 1024 * 1024 });
  if (result.status !== 0) throw new Error(`${command} ${args.join(' ')}\n${result.error ?? ''}${result.stdout}${result.stderr}`);
  return `${result.stdout}${result.stderr}`;
}
