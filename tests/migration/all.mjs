import { spawnSync } from 'node:child_process';
import path from 'node:path';
const root = path.resolve(import.meta.dirname, '../..');
const commands = ['rehydrate:check', 'test:externs-driver', 'generate:check', 'check:externs:upstream', 'gate:surface', 'test:native-producer', 'native:build:test', 'test:native-packaging', 'gate:package', 'gate:native-ffi', 'gate:native-runtime'];
const failures = [];
for (const command of commands) {
  const result = spawnSync(process.platform === 'win32' ? 'npm.cmd' : 'npm', ['run', command], { cwd: root, stdio: 'inherit' });
  if (result.status !== 0) failures.push(command);
}
if (failures.length) {
  process.stderr.write(`Migration checks failed: ${failures.join(', ')}\n`);
  process.exitCode = 1;
} else process.stdout.write('All migration checks passed (type surface, native archive, Linux hxcpp/HashLink and Lime runtime; web runtime is separate).\n');
