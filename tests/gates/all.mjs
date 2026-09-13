// Production verification runner: execute every independent gate and report all failures.
import { spawnSync } from 'node:child_process';
import path from 'node:path';
import process from 'node:process';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const npm = process.platform === 'win32' ? 'npm.cmd' : 'npm';
const scripts = [
  'rehydrate:check',
  'gate:coverage',
  'gate:proof',
  'gate:surface',
  'gate:bindings',
  'gate:parity',
  'gate:runtime',
  'gate:transpile',
  'gate:behavior',
  'gate:web',
  'gate:dce',
  'generate:check',
];
const failures = [];

for (const script of scripts) {
  const result = spawnSync(npm, ['run', script], { cwd: repoRoot, stdio: 'inherit' });
  if (result.status !== 0) failures.push(`${script} (${result.signal ?? `exit ${String(result.status)}`})`);
}

if (failures.length > 0) {
  process.stderr.write(`production check failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write(`production check: all ${String(scripts.length)} independent gates passed.\n`);
