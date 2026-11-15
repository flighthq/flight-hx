import { spawnSync } from 'node:child_process';
import path from 'node:path';
const root = path.resolve(import.meta.dirname, '../..');
const commands = ['rehydrate:check', 'test:externs-driver', 'generate:check', 'check:externs:upstream', 'gate:surface', 'gate:package', 'gate:native-ffi'];
const failures = [];
for (const command of commands) {
  const result = spawnSync(process.platform === 'win32' ? 'npm.cmd' : 'npm', ['run', command], { cwd: root, stdio: 'inherit' });
  if (result.status !== 0) failures.push(command);
}
if (failures.length) {
  process.stderr.write(`Migration checks failed: ${failures.join(', ')}\n`);
  process.exitCode = 1;
} else process.stdout.write('All migration checks passed (type surface, archive/ESM emission, native C ABI; not Haxe native/web runtime certification).\n');
