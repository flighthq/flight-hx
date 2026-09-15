// Bindings-existence gate: the validation type-checking CANNOT do. A Haxe @:jsImport extern is an
// unchecked promise — it can name an export that doesn't exist, or bind to the wrong package, and the
// compiler will never notice. This gate loads the REAL Flight ESM for every generated contract
// holder and asserts that each bound function and value resolves to the expected kind of export.
//
// Types are not checked here: Flight's types are TS interfaces, erased from the ESM output, so there
// is nothing to resolve at runtime — their fidelity rests on the shared inventory + gate:surface.
// Skips (labeled) without the rehydrated + built dependencies.
import { readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path, { join } from 'node:path';
import process from 'node:process';
import { collectExternSurface } from '../../tools/backend-hx/haxeSurface.mjs';
import { bundleFlightJs } from '../../tools/esm/bundle.mjs';
import { webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';

const blocked = webBuildBlockedReason();
if (blocked) {
  process.stdout.write(`bindings-existence gate: SKIPPED — ${blocked}\n`);
  process.exit(0);
}

const repoRoot = join(import.meta.dirname, '..', '..');
const externRoot = join(repoRoot, 'generated/js');
const surface = collectExternSurface(
  filesUnder(externRoot)
    .filter((filename) => filename.endsWith('.hx'))
    .map((filename) => ({
      contents: readFileSync(filename, 'utf8'),
      path: path.relative(externRoot, filename).split(path.sep).join('/'),
    })),
);
const declarationsByPackage = new Map();
for (const declaration of [...surface.functions, ...surface.values]) {
  const declarations = declarationsByPackage.get(declaration.sourcePackage) ?? [];
  declarations.push(declaration);
  declarationsByPackage.set(declaration.sourcePackage, declarations);
}
const publicSurface = JSON.parse(readFileSync(path.join(externRoot, 'public-surface.json'), 'utf8'));
for (const package_ of publicSurface.packages) {
  for (const sourceName of package_.inlined ?? []) {
    const declarations = declarationsByPackage.get(package_.package) ?? [];
    declarations.push({ kind: 'value', sourceName });
    declarationsByPackage.set(package_.package, declarations);
  }
}

let checkedFns = 0;
let checkedValues = 0;
const problems = [];
for (const [packageName, declarations] of [...declarationsByPackage].sort(([left], [right]) => left.localeCompare(right))) {
  // Bundle a re-export of the real package (Flight dist is bundler-targeted ESM), import, enumerate.
  const packageSlug = packageName.slice('@flighthq/'.length);
  const specifier = `${packageName}/contract`;
  const entry = join(tmpdir(), `flight-hx-exists-${packageSlug}.entry.mjs`);
  const out = join(tmpdir(), `flight-hx-exists-${packageSlug}.mjs`);
  try {
    writeEntry(entry, specifier);
    await bundleFlightJs({ entry, outfile: out, format: 'esm', platform: 'neutral' });
    const ns = (await import(`${out}?t=${checkedFns + checkedValues}`)).ns;
    for (const declaration of declarations) {
      if (declaration.kind === 'function') {
        checkedFns += 1;
        if (typeof ns[declaration.sourceName] === 'function') continue;
        problems.push(
          `${specifier} · ${declaration.sourceName} (${ns[declaration.sourceName] === undefined ? 'missing' : `not a function: ${typeof ns[declaration.sourceName]}`})`,
        );
      } else {
        checkedValues += 1;
        if (Object.hasOwn(ns, declaration.sourceName)) continue;
        problems.push(`${specifier} · ${declaration.sourceName} (missing value export)`);
      }
    }
  } catch (error) {
    problems.push(
      `${specifier}: could not load real package — ${(error?.errors ?? [{ text: error?.message }]).map((e) => e.text).join('; ')}`,
    );
  }
}

function writeEntry(path, specifier) {
  writeFileSync(path, `export * as ns from ${JSON.stringify(specifier)};\n`);
}

if (problems.length) {
  process.stderr.write(
    `bindings-existence gate: ${problems.length} generated bindings do not resolve to a real Flight export:\n`,
  );
  for (const p of problems.slice(0, 40)) process.stderr.write(`  - ${p}\n`);
  if (problems.length > 40) process.stderr.write(`  … and ${problems.length - 40} more\n`);
  process.exit(1);
}
process.stdout.write(
  `bindings-existence gate: all ${checkedFns} functions and ${checkedValues} values across ${declarationsByPackage.size} package contracts resolve to real Flight exports.\n`,
);

function filesUnder(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const filename = join(directory, entry.name);
    return entry.isDirectory() ? filesUnder(filename) : [filename];
  });
}
