// Generated-surface gate: type-check the ENTIRE generated binding surface — every function and value
// typedef — not just the subset an example happens to call. `include('flight')` forces the whole
// package to compile, so a generation bug in any of the ~380 bindings fails here even though the
// behavioral/DCE gates (which DCE down to a handful) would never touch it. Skips (labeled) without
// generated bindings + built flight-compiler.
import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import process from 'node:process';
import { webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';

const blocked = webBuildBlockedReason();
if (blocked) {
  process.stdout.write(`generated-surface gate: SKIPPED — ${blocked}\n`);
  process.exit(0);
}

const repoRoot = join(import.meta.dirname, '..', '..');
const check = spawnSync('node', [
  'tools/haxe.mjs', '-cp', 'generated', '-cp', 'generated/js', '-D', 'flight_esm',
  '-js', join(tmpdir(), 'flight-hx-surface.js'),
  '--macro', "include('flight')", '--macro', "include('flight._js')",
], { cwd: repoRoot, encoding: 'utf8' });

if (check.status !== 0) {
  process.stderr.write(`generated-surface gate: full surface did not type-check:\n${check.stdout}${check.stderr}\n`);
  process.exit(1);
}
process.stdout.write('generated-surface gate: the full generated flight.* surface type-checks.\n');
