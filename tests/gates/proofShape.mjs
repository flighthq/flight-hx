// Behavioral gate (proof-of-shape slice): compile + run the flight.* consumer on
// the transpiled-Haxe backend, assert the fail-loud selector rejects unsupported
// or ambiguous pipelines, and exercise the Lime/Clay-web fallback (js + flight_hx).
// This is the smallest instance of the behavioral gate AGENTS.md mandates — a real
// compile+run, not a byte diff.
import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import process from 'node:process';

function haxe(args) {
  return spawnSync('node', ['tools/haxe.mjs', ...args], { encoding: 'utf8' });
}
const SRC = ['-cp', 'src', '-cp', 'tests/haxe', '--main', 'ProofOfShape'];
const failures = [];

// 1. flight_hx backend on interp: must compile, run, and print the sentinel.
const ok = haxe([...SRC, '--interp', '-D', 'flight_hx']);
if (!(ok.stdout + ok.stderr).includes('PROOF_OF_SHAPE_OK')) {
  failures.push(`flight_hx (interp) did not reach PROOF_OF_SHAPE_OK:\n${ok.stdout}${ok.stderr}`);
}

// 2. No pipeline define at all: the selector must fail loud at compile time.
const bare = haxe([...SRC, '--interp']);
if (bare.status === 0 || !(bare.stdout + bare.stderr).includes('no backend')) {
  failures.push('a build with no backend define did not fail loud with "no backend"');
}

// 3. js target with NO pipeline define: must fail loud naming the two web choices,
//    never silently pick _js (the target!=pipeline bug). Emitting js would set the
//    `js` define; the #error fires first.
const jsBare = haxe([...SRC, '-js', join(tmpdir(), 'flight-hx-gate-bare.js')]);
const jsBareOut = jsBare.stdout + jsBare.stderr;
if (jsBare.status === 0 || !(jsBareOut.includes('flight_esm') && jsBareOut.includes('flight_hx'))) {
  failures.push(`bare js did not fail loud naming flight_esm/flight_hx:\n${jsBareOut}`);
}

// 4. Lime/Clay-web fallback (js + flight_hx): must compile to js AND run under node,
//    proving the transpiled backend rides a foreign host's own Haxe->JS output.
const jsOut = join(tmpdir(), 'flight-hx-gate-hx.js');
const jsBuild = haxe([...SRC, '-js', jsOut, '-D', 'flight_hx']);
if (jsBuild.status !== 0) {
  failures.push(`js + flight_hx did not compile:\n${jsBuild.stdout}${jsBuild.stderr}`);
} else {
  const run = spawnSync('node', [jsOut], { encoding: 'utf8' });
  if (!(run.stdout + run.stderr).includes('PROOF_OF_SHAPE_OK')) {
    failures.push(`js + flight_hx compiled but did not run to PROOF_OF_SHAPE_OK:\n${run.stdout}${run.stderr}`);
  }
}

if (failures.length > 0) {
  process.stderr.write(`proof-shape gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write('proof-shape gate: flight.* unifies (interp + js/flight_hx), and js-without-a-pipeline fails loud.\n');
