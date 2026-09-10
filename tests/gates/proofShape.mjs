// Behavioral gate (proof-of-shape slice): compile + run the flight.* consumer on
// the transpiled-Haxe backend, and assert the fail-loud selector rejects a build
// with no backend define. This is the smallest instance of the behavioral gate
// that AGENTS.md mandates — a real compile+run, not a byte diff.
import { spawnSync } from 'node:child_process';
import process from 'node:process';

function haxe(args) {
  return spawnSync('node', ['tools/haxe.mjs', ...args], { encoding: 'utf8' });
}

const failures = [];

// 1. flight_hx backend: must compile, run, and print the sentinel.
const ok = haxe(['-cp', 'src', '-cp', 'tests/haxe', '--main', 'ProofOfShape', '--interp', '-D', 'flight_hx']);
if (!(ok.stdout + ok.stderr).includes('PROOF_OF_SHAPE_OK')) {
  failures.push(`flight_hx build did not reach PROOF_OF_SHAPE_OK:\n${ok.stdout}${ok.stderr}`);
}

// 2. No backend define: the selector must fail loud at compile time.
const bare = haxe(['-cp', 'src', '-cp', 'tests/haxe', '--main', 'ProofOfShape', '--interp']);
if (bare.status === 0 || !(bare.stdout + bare.stderr).includes('no backend')) {
  failures.push('a build with no backend define did not fail loud with "no backend"');
}

if (failures.length > 0) {
  process.stderr.write(`proof-shape gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write('proof-shape gate: flight.* unifies on flight_hx and fails loud with no backend.\n');
