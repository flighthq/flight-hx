// Downstream implementation contract for the compiler-elected Haxe runtime vocabulary.
import { spawnSync } from 'node:child_process';
import { existsSync, readFileSync, readdirSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const requiredModules = new Set([
  '_Date',
  '_Float32Array',
  '_Float64Array',
  '_Int8Array',
  '_Int16Array',
  '_Int32Array',
  '_Map',
  '_Promise',
  '_Set',
  '_Symbol',
  '_UInt8Array',
  '_UInt8ClampedArray',
  '_UInt16Array',
  '_UInt32Array',
  '_WeakMap',
]);
for (const filename of filesUnder(path.join(repoRoot, 'generated', 'hx')).filter((entry) => entry.endsWith('.hx'))) {
  const contents = readFileSync(filename, 'utf8');
  for (const match of contents.matchAll(/\bflight\._internal\.(_[A-Za-z_][A-Za-z0-9_]*)\b/gu)) {
    requiredModules.add(match[1]);
  }
}

const failures = [];
for (const moduleName of [...requiredModules].sort()) {
  if (!existsSync(path.join(repoRoot, 'src', 'flight', '_internal', `${moduleName}.hx`))) {
    failures.push(`generated code references runtime module ${moduleName}, but ${moduleName}.hx is missing`);
  }
}
for (const directory of ['js', 'hx']) {
  const manifest = JSON.parse(readFileSync(path.join(repoRoot, 'generated', directory, 'manifest.json'), 'utf8'));
  equal(`${directory} external symbol contract`, manifest.runtime?.externalSymbols, 'flight-runtime-contract/2');
  equal(`${directory} constructor ABI`, manifest.runtime?.constructorAbi, 'flight-runtime-constructor-abi/1');
  equal(`${directory} task ABI`, manifest.runtime?.taskAbi, 'flight-runtime-task-capability-abi/1');
  equal(`${directory} JavaScript runtime coverage`, manifest.runtime?.profiles?.javascript?.coverage, 'complete');
  equal(`${directory} portable runtime scope`, manifest.runtime?.profiles?.portable?.coverage, 'host-free-subset');
}
if (failures.length > 0) fail();

const jsCompile = spawnSync(
  'node',
  [
    'tools/haxe.mjs',
    '-cp',
    'src',
    '-cp',
    'tests/haxe',
    '--main',
    'RuntimeContractCompile',
    '-js',
    path.join(tmpdir(), 'flight-hx-runtime-contract.js'),
    '-D',
    'flight_hx',
    '--macro',
    "include('flight._internal')",
  ],
  { cwd: repoRoot, encoding: 'utf8' },
);
if (jsCompile.status !== 0) {
  failures.push(`JavaScript runtime modules did not compile:\n${jsCompile.stdout}${jsCompile.stderr}`);
}

const portableRun = spawnSync(
  'node',
  [
    'tools/haxe.mjs',
    '-cp',
    'src',
    '-cp',
    'generated/hx',
    '-cp',
    'tests/haxe',
    '--main',
    'GeneratedTranspilePortableSmoke',
    '--interp',
    '-D',
    'flight_hx',
  ],
  { cwd: repoRoot, encoding: 'utf8' },
);
if (portableRun.status !== 0 || !(portableRun.stdout + portableRun.stderr).includes('GENERATED_TRANSPILE_PORTABLE_OK')) {
  failures.push(`portable runtime behavior failed:\n${portableRun.stdout}${portableRun.stderr}`);
}
if (failures.length > 0) fail();

process.stdout.write(
  `runtime-contract gate: ${String(requiredModules.size)} referenced runtime modules satisfy the declared JavaScript ABI; the host-free portable subset executed on Haxe eval.\n`,
);

function equal(label, actual, expected) {
  if (actual !== expected) failures.push(`${label}: ${String(actual)} != ${String(expected)}`);
}

function fail() {
  process.stderr.write(`runtime-contract gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}

function filesUnder(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const filename = path.join(directory, entry.name);
    return entry.isDirectory() ? filesUnder(filename) : [filename];
  });
}
