import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdirSync } from 'node:fs';
import path from 'node:path';
import { nativePayload } from '../../tools/native/artifacts.mjs';

const root = path.resolve(import.meta.dirname, '../..');
assert.equal(process.platform, 'darwin', 'iOS static linking requires the Apple SDK');
const platform = process.argv[process.argv.indexOf('--platform') + 1];
const targets = {
  iPhoneOSArm64: { sdk: 'iphoneos', triple: 'arm64-apple-ios15.0' },
  iPhoneSimulator64: { sdk: 'iphonesimulator', triple: 'x86_64-apple-ios15.0-simulator' },
  iPhoneSimulatorArm64: { sdk: 'iphonesimulator', triple: 'arm64-apple-ios15.0-simulator' },
};
const target = targets[platform];
assert.ok(target, 'Select an iOS --platform');
assert.ok(nativePayload(root).includes(`native/lib/${platform}/libflight_ffi.a`));
const work = path.join(root, '.artifacts', `ios-link-${platform}`);
mkdirSync(work, { recursive: true });
const sdk = run('xcrun', ['--sdk', target.sdk, '--show-sdk-path']).trim();
run('xcrun', ['--sdk', target.sdk, 'clang++', '-std=c++11', '-target', target.triple, '-isysroot', sdk,
  '-I', path.join(root, 'native/include'), path.join(root, 'tests/migration/ffi-smoke.cpp'),
  path.join(root, `native/lib/${platform}/libflight_ffi.a`), '-framework', 'Security', '-framework', 'CoreFoundation',
  '-framework', 'SystemConfiguration', '-liconv', '-o', path.join(work, 'Smoke')]);
process.stdout.write(`${platform}: real C ABI consumer linked with the Apple SDK (execution is not covered).\n`);

function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8' });
  assert.equal(result.status, 0, `${result.error ?? ''}${result.stdout}${result.stderr}`);
  return result.stdout;
}
