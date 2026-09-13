// Generated-surface gate: type-check the ENTIRE compiler-emitted extern surface — every function,
// value and public type alias — not just the subset an example happens to call. The legacy common
// facade contains declarations for modules that the pinned compiler explicitly refused, so it is
// intentionally outside this dependency-closed compiler-output gate.
import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import process from 'node:process';

const repoRoot = join(import.meta.dirname, '..', '..');
const check = spawnSync(
  'node',
  [
    'tools/haxe.mjs',
    '-cp',
    'generated/js',
    '-cp',
    'src',
    '-D',
    'flight_esm',
    '-js',
    join(tmpdir(), 'flight-hx-surface.js'),
    '--macro',
    "include('flight')",
    '--macro',
    "include('flight._js')",
  ],
  { cwd: repoRoot, encoding: 'utf8' },
);

if (check.status !== 0) {
  process.stderr.write(`generated-surface gate: full surface did not type-check:\n${check.stdout}${check.stderr}\n`);
  process.exit(1);
}
process.stdout.write('generated-surface gate: the full compiler-emitted extern surface type-checks.\n');
