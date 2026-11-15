import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync } from 'node:fs';
import path from 'node:path';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const root = path.resolve(import.meta.dirname, '../..');
assert.ok(['linux', 'darwin'].includes(process.platform), 'native binary probe currently supports Linux/macOS');
const flight = resolveDependency(root, 'flight');
const libraryDirectory = path.join(flight.directory, 'target/debug');
const library = path.join(libraryDirectory, process.platform === 'darwin' ? 'libflight_ffi.dylib' : 'libflight_ffi.so');
assert.ok(existsSync(library), 'build flight-ffi first (npm run generate:externs)');
const work = path.join(root, '.artifacts/native-ffi');
mkdirSync(work, { recursive: true });
const executable = path.join(work, 'smoke');
const build = spawnSync(process.env.CXX ?? 'c++', [
  '-std=c++11', path.join(root, 'tests/migration/ffi-smoke.cpp'),
  '-L', libraryDirectory, '-lflight_ffi', `-Wl,-rpath,${libraryDirectory}`, '-o', executable,
], { cwd: root, encoding: 'utf8' });
assert.equal(build.status, 0, `${build.error ?? ''}${build.stdout}${build.stderr}`);
const result = spawnSync(executable, [], { cwd: root, encoding: 'utf8' });
assert.equal(result.status, 0, `${result.error ?? ''}${result.stdout}${result.stderr}`);
assert.match(result.stdout, /FLIGHT_NATIVE_FFI_OK/u);
process.stdout.write('Native C ABI probe: scalar call, opaque allocation, field access/mutation, and release passed. Haxe linking is not covered.\n');
