// Downstream conformance gate for flight-compiler's transpiled-Haxe mode. The compiler repository
// cannot install Haxe, so flight-hx owns compiling the complete emitted file set and executing a
// representative implementation body.
import { spawnSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';

const manifest = JSON.parse(readFileSync('generated/hx/manifest.json', 'utf8'));
if (manifest.compiler.emissionMode !== 'transpile' || manifest.summary.emittedFiles === 0) {
  process.stderr.write('transpiled-source gate: generated/hx is not a non-empty transpile result.\n');
  process.exit(1);
}

const output = path.join(tmpdir(), 'flight-hx-generated-transpile-gate.js');
const compile = spawnSync(
  'node',
  [
    'tools/haxe.mjs',
    '-cp',
    'generated/hx',
    '-cp',
    'src',
    '-cp',
    'tests/haxe',
    '--main',
    'GeneratedTranspileSmoke',
    '-js',
    output,
    '-D',
    'flight_hx',
    '--macro',
    "include('flight._hx')",
  ],
  { encoding: 'utf8' },
);
if (compile.status !== 0) {
  process.stderr.write(
    `transpiled-source gate: complete generated tree did not compile:\n${compile.stdout}${compile.stderr}`,
  );
  process.exit(1);
}

const run = spawnSync('node', [output], { encoding: 'utf8' });
if (run.status !== 0 || !(run.stdout + run.stderr).includes('GENERATED_TRANSPILE_OK')) {
  process.stderr.write(`transpiled-source gate: emitted implementation did not run:\n${run.stdout}${run.stderr}`);
  process.exit(1);
}

process.stdout.write(
  `transpiled-source gate: compiled ${String(manifest.summary.emittedFiles)} files and executed compiler-emitted code.\n`,
);
