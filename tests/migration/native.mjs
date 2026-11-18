import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync } from 'node:fs';
import path from 'node:path';
import { nativePayload } from '../../tools/native/artifacts.mjs';

const root = path.resolve(import.meta.dirname, '../..');
assert.ok(['linux', 'darwin'].includes(process.platform), 'native binary probe currently supports Linux/macOS');
nativePayload(root);
const platform = process.platform === 'linux' ? (process.arch === 'arm64' ? 'LinuxArm64' : 'Linux64') : (process.arch === 'arm64' ? 'MacArm64' : 'Mac64');
const libraryDirectory = path.join(root, 'native/bin', platform);
const library = path.join(libraryDirectory, process.platform === 'darwin' ? 'libflight_ffi.dylib' : 'libflight_ffi.so');
assert.ok(existsSync(library), 'stage Flight binaries first (npm run native:build)');
const work = path.join(root, '.artifacts/native-ffi');
mkdirSync(work, { recursive: true });
const executable = path.join(work, 'smoke');
const build = spawnSync(process.env.CXX ?? 'c++', [
  '-std=c++11', '-I', path.join(root, 'native/include'), path.join(root, 'tests/migration/ffi-smoke.cpp'),
  '-L', libraryDirectory, '-lflight_ffi', `-Wl,-rpath,${libraryDirectory}`, '-o', executable,
], { cwd: root, encoding: 'utf8' });
assert.equal(build.status, 0, `${build.error ?? ''}${build.stdout}${build.stderr}`);
const result = spawnSync(executable, [], { cwd: root, encoding: 'utf8' });
assert.equal(result.status, 0, `${result.error ?? ''}${result.stdout}${result.stderr}`);
assert.match(result.stdout, /FLIGHT_NATIVE_FFI_OK/u);
process.stdout.write('Native C ABI probe passed for scalar calls, owned handles, fields, byte buffers, byte readers, and unit signals.\n');
