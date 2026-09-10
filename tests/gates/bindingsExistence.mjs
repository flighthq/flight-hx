// Bindings-existence gate: the validation type-checking CANNOT do. A Haxe @:jsRequire extern is an
// unchecked promise — it can name an export that doesn't exist, or bind to the wrong package, and the
// compiler will never notice. This gate loads the REAL Flight ESM for every generated function module
// and asserts each bound static actually resolves to an exported function of that package. It covers
// the whole surface (all ~4000 bound functions), not the handful an example calls.
//
// Types are not checked here: Flight's types are TS interfaces, erased from the ESM output, so there
// is nothing to resolve at runtime — their fidelity rests on the shared inventory + gate:surface.
// Skips (labeled) without the rehydrated + built dependencies.
import { readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import process from 'node:process';
import { bundleFlightJs } from '../../tools/esm/bundle.mjs';
import { webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';

const blocked = webBuildBlockedReason();
if (blocked) {
  process.stdout.write(`bindings-existence gate: SKIPPED — ${blocked}\n`);
  process.exit(0);
}

const repoRoot = join(import.meta.dirname, '..', '..');
const fnDir = join(repoRoot, 'generated/js/flight/_js/_fn');

// Parse each generated function-module backing: its @:jsRequire specifier + static function names.
const modules = [];
for (const file of readdirSync(fnDir).filter((f) => f.endsWith('.hx'))) {
  const text = readFileSync(join(fnDir, file), 'utf8');
  const specifier = text.match(/@:jsRequire\("([^"]+)"\)/)?.[1];
  const names = [...text.matchAll(/static function (\w+)\(/g)].map((m) => m[1]);
  if (specifier && names.length) modules.push({ module: file.replace(/\.hx$/, ''), specifier, names });
}

let checkedFns = 0;
const problems = [];
for (const m of modules) {
  // Bundle a re-export of the real package (Flight dist is bundler-targeted ESM), import, enumerate.
  const entry = join(tmpdir(), `flight-hx-exists-${m.module}.entry.mjs`);
  const out = join(tmpdir(), `flight-hx-exists-${m.module}.mjs`);
  try {
    writeEntry(entry, m.specifier);
    await bundleFlightJs({ entry, outfile: out, format: 'esm', platform: 'neutral' });
    const ns = (await import(`${out}?t=${checkedFns}`)).ns;
    for (const name of m.names) {
      checkedFns++;
      if (typeof ns[name] !== 'function') problems.push(`${m.specifier} · ${name} (${ns[name] === undefined ? 'missing' : 'not a function: ' + typeof ns[name]})`);
    }
  } catch (error) {
    problems.push(`${m.specifier}: could not load real package — ${(error?.errors ?? [{ text: error?.message }]).map((e) => e.text).join('; ')}`);
  }
}

function writeEntry(path, specifier) {
  writeFileSync(path, `export * as ns from ${JSON.stringify(specifier)};\n`);
}

if (problems.length) {
  process.stderr.write(`bindings-existence gate: ${problems.length} generated bindings do not resolve to a real Flight export:\n`);
  for (const p of problems.slice(0, 40)) process.stderr.write(`  - ${p}\n`);
  if (problems.length > 40) process.stderr.write(`  … and ${problems.length - 40} more\n`);
  process.exit(1);
}
process.stdout.write(`bindings-existence gate: all ${checkedFns} generated functions across ${modules.length} modules resolve to real Flight exports.\n`);
