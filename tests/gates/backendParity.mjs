// Structural parity for the compiler-generated public backends. The transpiled backend is an
// explicitly reported subset while flight-compiler still refuses modules: every available Haxe
// declaration must match the JavaScript extern signature, and every JavaScript declaration must
// appear in exactly one of the supported/unavailable partitions. Native generation is a separate
// flight-cpp integration task and is not represented by a generated manifest yet.
import { readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';

import { collectExternSurface, collectPublicHaxeSurface } from '../../tools/backend-hx/haxeSurface.mjs';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const externFiles = loadHaxeFiles(path.join(repoRoot, 'generated', 'js'));
const transpiledFiles = loadHaxeFiles(path.join(repoRoot, 'generated', 'hx'));
const extern = collectExternSurface(externFiles);
const transpiled = collectPublicHaxeSurface(transpiledFiles);
const report = JSON.parse(readFileSync(path.join(repoRoot, 'generated', 'hx', 'public-surface.json'), 'utf8'));
const failures = [];

comparePartition('type', extern.types, transpiled.types, report.supported.types, report.unavailable.types, (entry) =>
  entryKey(entry),
);
comparePartition(
  'function',
  extern.functions,
  transpiled.functions,
  report.supported.functions,
  report.unavailable.functions,
  entryKey,
);
comparePartition('value', extern.values, transpiled.values, report.supported.values, report.unavailable.values, entryKey);

compareSignatures(
  'function',
  extern.functions,
  transpiled.functions,
  (entry) => entry.signature,
  entryKey,
);
compareSignatures('value', extern.values, transpiled.values, (entry) => entry.valueType, entryKey);
compareSignatures('type', extern.types, transpiled.types, (entry) => entry.typeParameters, entryKey);

const summary = report.summary;
for (const [name, actual] of [
  ['publicFunctions', extern.functions.length],
  ['publicTypes', extern.types.length],
  ['publicValues', extern.values.length],
  ['supportedFunctions', transpiled.functions.length],
  ['supportedTypes', transpiled.types.length],
  ['supportedValues', transpiled.values.length],
]) {
  if (summary[name] !== actual) failures.push(`public-surface summary ${name} is ${String(summary[name])}, expected ${actual}`);
}

if (failures.length > 0) {
  process.stderr.write(`backend-parity gate failed:\n- ${failures.slice(0, 60).join('\n- ')}\n`);
  if (failures.length > 60) process.stderr.write(`- … and ${String(failures.length - 60)} more\n`);
  process.exit(1);
}

process.stdout.write(
  `backend-parity gate: JS↔HX identities/generic arity match for ${String(transpiled.types.length)} types and exact signatures match for ${String(transpiled.functions.length)} functions and ${String(transpiled.values.length)} values; ${String(summary.unavailableFunctions + summary.unavailableTypes + summary.unavailableValues)} upstream-unavailable declarations remain explicit.\n`,
);

function comparePartition(kind, externEntries, actualEntries, supportedEntries, unavailableEntries, key) {
  const expected = new Set(externEntries.map(key));
  const actual = new Set(actualEntries.map(key));
  const supported = new Set(supportedEntries.map(key));
  const unavailable = new Set(unavailableEntries.map(key));
  for (const name of actual) {
    if (!expected.has(name)) failures.push(`${kind} ${name} exists in HX but not JS`);
    if (!supported.has(name)) failures.push(`${kind} ${name} exists in HX but not the supported report`);
  }
  for (const name of supported) {
    if (!actual.has(name)) failures.push(`${kind} ${name} is reported supported but absent from HX`);
    if (unavailable.has(name)) failures.push(`${kind} ${name} is both supported and unavailable`);
  }
  for (const name of expected) {
    if (!supported.has(name) && !unavailable.has(name)) failures.push(`${kind} ${name} is absent from both report partitions`);
  }
  for (const name of unavailable) {
    if (!expected.has(name)) failures.push(`${kind} ${name} is reported unavailable but absent from JS`);
  }
}

function compareSignatures(kind, externEntries, actualEntries, signature, key) {
  const expected = new Map(externEntries.map((entry) => [key(entry), signature(entry)]));
  for (const entry of actualEntries) {
    const name = key(entry);
    if (expected.has(name) && expected.get(name) !== signature(entry)) {
      failures.push(`${kind} ${name} signature differs: JS=${expected.get(name)} HX=${signature(entry)}`);
    }
  }
}

function entryKey(entry) {
  return `${entry.holder ?? ''}.${entry.name ?? entry.publicName}`;
}

function loadHaxeFiles(root) {
  return filesUnder(root)
    .filter((filename) => filename.endsWith('.hx'))
    .map((filename) => ({ contents: readFileSync(filename, 'utf8'), path: portable(path.relative(root, filename)) }));
}

function filesUnder(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const filename = path.join(directory, entry.name);
    return entry.isDirectory() ? filesUnder(filename) : [filename];
  });
}

function portable(filename) {
  return filename.split(path.sep).join('/');
}
