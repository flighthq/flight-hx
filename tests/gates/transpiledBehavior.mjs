// Differential semantic oracle: run deterministic public flight.* calls through compiler-emitted
// Haxe and compare them with the same pinned Flight TypeScript implementation bundled as ESM.
import { spawnSync } from 'node:child_process';
import { existsSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';
import { pathToFileURL } from 'node:url';

import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { bundleFlightJs } from '../../tools/esm/bundle.mjs';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const flight = resolveDependency(repoRoot, 'flight');
for (const packageName of ['color', 'math']) {
  if (!existsSync(path.join(flight.directory, 'packages', packageName, 'dist', 'contract.js'))) {
    process.stdout.write(
      `transpiled-behavior gate: SKIPPED — @flighthq/${packageName} is not built (build pinned Flight first).\n`,
    );
    process.exit(0);
  }
}

const haxeOutput = path.join(tmpdir(), 'flight-hx-transpiled-behavior.js');
const compile = spawnSync(
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
    'GeneratedTranspileBehavior',
    '-js',
    haxeOutput,
    '-D',
    'flight_hx',
  ],
  { cwd: repoRoot, encoding: 'utf8' },
);
if (compile.status !== 0) {
  process.stderr.write(`transpiled-behavior gate: Haxe compile failed:\n${compile.stdout}${compile.stderr}`);
  process.exit(1);
}
const haxeRun = spawnSync('node', [haxeOutput], { encoding: 'utf8' });
if (haxeRun.status !== 0) {
  process.stderr.write(`transpiled-behavior gate: Haxe run failed:\n${haxeRun.stdout}${haxeRun.stderr}`);
  process.exit(1);
}
let actual;
try {
  actual = JSON.parse(haxeRun.stdout.trim().split('\n').at(-1));
} catch {
  process.stderr.write(`transpiled-behavior gate: Haxe output was not JSON:\n${haxeRun.stdout}${haxeRun.stderr}`);
  process.exit(1);
}

const oracleEntry = path.join(tmpdir(), 'flight-hx-transpiled-oracle.entry.mjs');
const oracleBundle = path.join(tmpdir(), 'flight-hx-transpiled-oracle.bundle.mjs');
const oraclePath = path.join(repoRoot, 'tests', 'oracles', 'transpiledBehavior.mjs');
writeFileSync(oracleEntry, `import { collectTranspiledBehavior } from ${JSON.stringify(oraclePath)};\nexport const result = collectTranspiledBehavior();\n`);
try {
  await bundleFlightJs({ entry: oracleEntry, outfile: oracleBundle, format: 'esm', platform: 'node' });
} catch (error) {
  process.stderr.write(
    `transpiled-behavior gate: Flight oracle bundle failed:\n${(error?.errors ?? [{ text: error?.message }]).map((entry) => entry.text).join('\n')}\n`,
  );
  process.exit(1);
}
const expected = (await import(`${pathToFileURL(oracleBundle).href}?v=${Date.now()}`)).result;
const mismatches = [];
compare(expected, actual, '$');
if (mismatches.length > 0) {
  process.stderr.write(`transpiled-behavior gate failed:\n- ${mismatches.slice(0, 40).join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write(
  `transpiled-behavior gate: ${String(countLeaves(expected))} deterministic results match pinned Flight JavaScript.\n`,
);

function compare(expectedValue, actualValue, location) {
  if (typeof expectedValue === 'number' && typeof actualValue === 'number') {
    const tolerance = 1e-10 * Math.max(1, Math.abs(expectedValue), Math.abs(actualValue));
    if (Math.abs(expectedValue - actualValue) > tolerance) {
      mismatches.push(`${location}: JS=${String(expectedValue)} HX=${String(actualValue)}`);
    }
    return;
  }
  if (Array.isArray(expectedValue) && Array.isArray(actualValue)) {
    if (expectedValue.length !== actualValue.length) {
      mismatches.push(`${location}.length: JS=${String(expectedValue.length)} HX=${String(actualValue.length)}`);
      return;
    }
    expectedValue.forEach((value, index) => compare(value, actualValue[index], `${location}[${String(index)}]`));
    return;
  }
  if (expectedValue && actualValue && typeof expectedValue === 'object' && typeof actualValue === 'object') {
    const keys = [...new Set([...Object.keys(expectedValue), ...Object.keys(actualValue)])].sort();
    for (const key of keys) compare(expectedValue[key], actualValue[key], `${location}.${key}`);
    return;
  }
  if (expectedValue !== actualValue) mismatches.push(`${location}: JS=${String(expectedValue)} HX=${String(actualValue)}`);
}

function countLeaves(value) {
  if (Array.isArray(value)) return value.reduce((total, item) => total + countLeaves(item), 0);
  if (value && typeof value === 'object') {
    return Object.values(value).reduce((total, item) => total + countLeaves(item), 0);
  }
  return 1;
}
