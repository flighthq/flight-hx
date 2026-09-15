// Downstream implementation contract for the compiler-elected Haxe runtime vocabulary.
import { spawnSync } from 'node:child_process';
import { existsSync, readFileSync, readdirSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const manifests = new Map(
  ['js', 'hx'].map((directory) => [
    directory,
    JSON.parse(readFileSync(path.join(repoRoot, 'generated', directory, 'manifest.json'), 'utf8')),
  ]),
);
const runtimeContract = collectRuntimeContract(manifests.get('js').runtime?.abi);
const requiredModules = runtimeContract.modules;
const failures = [];
equal('compiler Haxe runtime ABI', manifests.get('js').runtime?.abi?.schema, 'flight-haxe-runtime-abi/2');
for (const filename of filesUnder(path.join(repoRoot, 'generated', 'hx')).filter((entry) => entry.endsWith('.hx'))) {
  const contents = readFileSync(filename, 'utf8');
  for (const match of contents.matchAll(/\bflight\._internal\.(_[A-Za-z_][A-Za-z0-9_]*)\b/gu)) {
    requiredModules.add(match[1]);
  }
}

for (const moduleName of [...requiredModules].sort()) {
  const filename = path.join(repoRoot, 'src', 'flight', '_internal', `${moduleName}.hx`);
  if (!existsSync(filename)) {
    failures.push(`generated code references runtime module ${moduleName}, but ${moduleName}.hx is missing`);
    continue;
  }
  const contents = readFileSync(filename, 'utf8');
  for (const member of [...(runtimeContract.members.get(moduleName) ?? [])].sort()) {
    if (!new RegExp(`\\b(?:function|var)\\s+${member}\\b`, 'u').test(contents)) {
      failures.push(`runtime ABI declares ${moduleName}.${member}, but ${moduleName}.hx does not implement it`);
    }
  }
}
for (const directory of ['js', 'hx']) {
  const manifest = manifests.get(directory);
  equal(`${directory} external symbol contract`, manifest.runtime?.externalSymbols, 'flight-runtime-contract/2');
  equal(`${directory} constructor ABI`, manifest.runtime?.constructorAbi, 'flight-runtime-constructor-abi/1');
  equal(`${directory} task ABI`, manifest.runtime?.taskAbi, 'flight-runtime-task-capability-abi/1');
  equal(`${directory} JavaScript runtime coverage`, manifest.runtime?.profiles?.javascript?.coverage, 'complete');
  equal(`${directory} portable runtime scope`, manifest.runtime?.profiles?.portable?.coverage, 'host-free-subset');
}
if (failures.length > 0) fail();

const jsOutput = path.join(tmpdir(), 'flight-hx-runtime-contract.js');
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
    jsOutput,
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
if (jsCompile.status === 0) {
  const jsRun = spawnSync('node', [jsOutput], { cwd: repoRoot, encoding: 'utf8' });
  if (jsRun.status !== 0 || !(jsRun.stdout + jsRun.stderr).includes('RUNTIME_CONTRACT_OK')) {
    failures.push(`JavaScript runtime behavior failed:\n${jsRun.stdout}${jsRun.stderr}`);
  }
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
  `runtime-contract gate: ${String(requiredModules.size)} declared runtime modules compile and the elected JavaScript helpers execute; the host-free portable subset executed on Haxe eval.\n`,
);

function equal(label, actual, expected) {
  if (actual !== expected) failures.push(`${label}: ${String(actual)} != ${String(expected)}`);
}

function fail() {
  process.stderr.write(`runtime-contract gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}

function collectRuntimeContract(abi) {
  const modules = new Set();
  const members = new Map();
  if (abi?.schema !== 'flight-haxe-runtime-abi/2') return { members, modules };
  const visit = (value) => {
    if (Array.isArray(value)) {
      for (const entry of value) visit(entry);
    } else if (value && typeof value === 'object') {
      const target = typeof value.targetName === 'string' ? /^(_[A-Za-z][A-Za-z0-9]*)$/u.exec(value.targetName) : undefined;
      if (target && Array.isArray(value.members) && value.members.every((entry) => typeof entry === 'string')) {
        const moduleMembers = members.get(target[1]) ?? new Set();
        for (const member of value.members) moduleMembers.add(member);
        members.set(target[1], moduleMembers);
      }
      for (const entry of Object.values(value)) visit(entry);
    } else if (typeof value === 'string') {
      const target = /^(_[A-Za-z][A-Za-z0-9]*)(?:\.([A-Za-z_][A-Za-z0-9_]*))?/u.exec(value);
      if (target) {
        modules.add(target[1]);
        if (target[2]) {
          const moduleMembers = members.get(target[1]) ?? new Set();
          moduleMembers.add(target[2]);
          members.set(target[1], moduleMembers);
        }
      }
    }
  };
  visit(abi);
  return { members, modules };
}

function filesUnder(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const filename = path.join(directory, entry.name);
    return entry.isDirectory() ? filesUnder(filename) : [filename];
  });
}
