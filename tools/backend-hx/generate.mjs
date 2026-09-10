// Skunkworks bindings backend: flight-compiler inventory -> Haxe ESM externs + flight.* forwarders.
//
// Pure(ish) driver, mirroring flight-cpp/scripts/sdkGeneration.mjs: it does NOT re-derive names or
// parse TypeScript itself — it lowers Flight source through @flighthq/tool-compiler and reads the IR
// (signatures, type shapes, export names). Bodies are ignored (externs have none).
//
// Scope: the WHOLE Flight SDK — every @flighthq/* package the sdk aggregate depends on. Each package
// of free functions becomes one `flight.<Package>` module (backed by a @:jsRequire extern); every
// value type those signatures reference becomes a `flight.<Type>` structural typedef. Emits:
//   generated/flight/<Type>.hx / generated/js/flight/_js/<Type>.hx       value typedefs
//   generated/flight/<Package>.hx / generated/js/flight/_js/<Package>.hx free-function modules
// Unmappable signatures are SKIPPED and reported per reason, so the emitted surface always compiles.
// This is the ESM half of the bindings backend that AGENTS.md says promotes upstream to
// compiler-backend-hx.
import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const repoRoot = join(dirname(fileURLToPath(import.meta.url)), '..', '..');
const flight = resolveDependency(repoRoot, 'flight');
const compiler = resolveDependency(repoRoot, 'flight-compiler');
const compilerEntry = join(compiler.directory, 'packages/tool-compiler/dist/packages/tool-compiler/src/index.js');

let tc;
try {
  tc = await import(pathToFileURL(compilerEntry).href);
} catch (error) {
  console.error(`Cannot load @flighthq/tool-compiler at ${compilerEntry}`);
  console.error('Build it first: (cd .dependencies/flight-compiler && npm install && npm run build)');
  console.error(String(error?.message ?? error));
  process.exit(1);
}

// --- discover the SDK package set -----------------------------------------
const pkgRoot = join(flight.directory, 'packages');
const nameToDir = new Map();
for (const dir of readdirSync(pkgRoot)) {
  const manifest = join(pkgRoot, dir, 'package.json');
  if (!existsSync(manifest)) continue;
  const json = JSON.parse(readFileSync(manifest, 'utf8'));
  if (json.name?.startsWith('@flighthq/')) nameToDir.set(json.name, dir);
}
const sdkManifest = JSON.parse(readFileSync(join(pkgRoot, nameToDir.get('@flighthq/sdk'), 'package.json'), 'utf8'));
// The SDK aggregate's @flighthq/* dependencies are "all of Flight" a web consumer sees.
const sdkPackages = Object.keys(sdkManifest.dependencies ?? {}).filter((n) => n.startsWith('@flighthq/') && nameToDir.has(n));

// @flighthq/display-list -> DisplayList
function moduleName(pkgName) {
  return pkgName.slice('@flighthq/'.length).split(/[-_]/).map((s) => s.charAt(0).toUpperCase() + s.slice(1)).join('');
}
function sourceFiles(pkgName) {
  const src = join(pkgRoot, nameToDir.get(pkgName), 'src');
  if (!existsSync(src)) return [];
  return readdirSync(src)
    .filter((f) => f.endsWith('.ts') && !f.endsWith('.test.ts') && !f.endsWith('.d.ts') && f !== 'index.ts' && f !== 'contract.ts')
    .map((f) => join(src, f));
}

// --- single lowering pass: registry (types) + stashed function decls -------
const registry = new Map();                 // type name -> declaration (interface/alias), any package
const packageFns = new Map();               // pkgName -> function declarations (exported)
console.error('lowering the SDK source (one pass)…');
for (const pkgName of sdkPackages) {
  const fns = [];
  for (const file of sourceFiles(pkgName)) {
    let mod;
    try { mod = tc.lowerTypeScriptSource(tc.parseTypeScriptSource(file, readFileSync(file, 'utf8')), { packageName: pkgName, upstreamDirectory: flight.directory }).module; }
    catch { continue; }
    for (const d of mod.declarations) {
      const name = d.binding?.name ?? d.name;
      if ((d.kind === 'interface' || d.kind === 'typeAlias') && name && !registry.has(name)) registry.set(name, d);
      if (d.kind === 'function' && d.exported === true) fns.push(d);
    }
  }
  if (fns.length) packageFns.set(pkgName, fns);
}

// --- IR type -> Haxe type --------------------------------------------------
const WRAPPERS = new Set(['Readonly', 'ReadonlyArray', 'EntityWithoutRuntime', 'Partial', 'Writable', 'Required']);
const TYPED_ARRAYS = new Map([
  ['Float32Array', 'js.lib.Float32Array'], ['Float64Array', 'js.lib.Float64Array'],
  ['Int8Array', 'js.lib.Int8Array'], ['Int16Array', 'js.lib.Int16Array'], ['Int32Array', 'js.lib.Int32Array'],
  ['Uint8Array', 'js.lib.Uint8Array'], ['Uint16Array', 'js.lib.Uint16Array'], ['Uint32Array', 'js.lib.Uint32Array'],
]);
class Unmappable extends Error {}
const emitTypes = new Set();

// Haxe reserved words. A param that is one is cosmetically renamed (extern binding is positional).
const KEYWORDS = new Set(('abstract break case cast catch class continue default do dynamic else enum extends '
  + 'extern false final for function if implements import in inline interface macro new null operator overload '
  + 'override package private public return static switch this throw true try typedef untyped using var while').split(' '));
const safeParam = (name) => (KEYWORDS.has(name) ? `${name}_` : name);

const refName = (t) => { const r = t.reference ?? {}; return r.binding?.name ?? (r.kind === 'ambient' ? r.name : r.kind); };

function mapType(t, depth = 0) {
  if (!t || typeof t !== 'object' || depth > 24) throw new Unmappable('missing/deep type');
  switch (t.kind) {
    case 'primitive':
      switch (t.name) {
        case 'void': return 'Void';
        case 'number': return 'Float';
        case 'boolean': return 'Bool';
        case 'string': return 'String';
        default: throw new Unmappable(`primitive ${t.name}`);
      }
    case 'array': return 'Array<' + mapType(t.element ?? t.elementType, depth + 1) + '>';
    case 'object': {
      const props = (t.properties ?? [])
        .filter((p) => !KEYWORDS.has(p.name)) // a keyword field name is invalid in an anon structure
        .map((p) => `${p.optional ? '?' : ''}${p.name}:${mapType(p.type, depth + 1)}`);
      if (!props.length) throw new Unmappable('empty object');
      return `{ ${props.join(', ')} }`;
    }
    case 'union': return mapUnion(t, depth);
    case 'named': {
      const name = refName(t);
      if (WRAPPERS.has(name)) return mapType(t.typeArguments?.[0], depth + 1);
      if (TYPED_ARRAYS.has(name)) return TYPED_ARRAYS.get(name);
      const decl = registry.get(name);
      if (decl?.kind === 'interface') { emitTypes.add(name); return `flight.${name}`; }
      if (decl?.kind === 'typeAlias') return mapType(decl.aliased ?? decl.type, depth + 1);
      throw new Unmappable(`named ${name}`);
    }
    default: throw new Unmappable(`kind ${t.kind}`);
  }
}
function mapUnion(t, depth) {
  const members = t.types ?? [];
  const nonNull = members.filter((k) => k.kind !== 'null' && k.kind !== 'undefined');
  const nullable = nonNull.length !== members.length;
  if (nonNull.length && nonNull.every((k) => k.kind === 'literal')) return 'String';
  if (nonNull.length === 1) { const inner = mapType(nonNull[0], depth + 1); return nullable ? `Null<${inner}>` : inner; }
  throw new Unmappable(`union of ${nonNull.length}`);
}

// --- map (no lowering) -----------------------------------------------------
const skipReasons = new Map();
function mapFunctions(decls) {
  const kept = [];
  const seen = new Set();
  for (const d of decls) {
    // Flight overloads a few free functions (same name, different signatures). Haxe module-level
    // functions can't overload, so bind the first and skip the rest (reported).
    if (seen.has(d.binding?.name)) { skipReasons.set('overloaded name', (skipReasons.get('overloaded name') ?? 0) + 1); continue; }
    try {
      const params = d.parameters.map((p) => {
        if (p.rest) throw new Unmappable('rest param');
        return { name: safeParam(p.binding.name), type: mapType(p.type), optional: Boolean(p.optional) };
      });
      kept.push({ name: d.binding.name, params, returns: mapType(d.returns) });
      seen.add(d.binding.name);
    } catch (error) {
      if (!(error instanceof Unmappable)) throw error;
      skipReasons.set(error.message, (skipReasons.get(error.message) ?? 0) + 1);
    }
  }
  kept.sort((a, b) => (a.name < b.name ? -1 : a.name > b.name ? 1 : 0));
  return kept;
}

// Map every package's functions first (this also populates emitTypes with referenced value types).
const mappedPackages = [];
for (const [pkgName, decls] of packageFns) {
  const fns = mapFunctions(decls);
  if (fns.length) mappedPackages.push({ pkgName, specifier: pkgName, fns });
}

// A function module shares the `flight.<Name>` namespace with value types. Flight names both the same
// concept with differing case (`scene2d` package / `Scene2D` type, `bitmapfont` / `BitmapFont`), and
// two files differing only by case break on case-insensitive filesystems. Fold each function module
// onto the value type it case-matches (using the TYPE's exact casing, since signatures reference it),
// so the pair merges into one module — exactly as the exact-match `Shape` case already does.
const canonicalType = new Map();
for (const name of emitTypes) canonicalType.set(name.toLowerCase(), name);
const modules = new Map(); // module name -> { pkgName, module, specifier, fns }
for (const p of mappedPackages) {
  const base = moduleName(p.pkgName);
  const module = canonicalType.get(base.toLowerCase()) ?? base;
  if (modules.has(module)) { // two packages folding to one name — merge, keeping unique fn names
    const existing = modules.get(module);
    const seen = new Set(existing.fns.map((f) => f.name));
    for (const f of p.fns) if (!seen.has(f.name)) existing.fns.push(f);
  } else {
    modules.set(module, { pkgName: p.pkgName, module, specifier: p.specifier, fns: p.fns });
  }
}

// --- emitters --------------------------------------------------------------
// Two independent axes share the `flight.<Name>` namespace: value TYPES (a typedef) and PACKAGES of
// free functions (module-level functions). Flight often names both the same (`Shape` the type, `shape`
// the package), so a public module may carry BOTH. Backings never collide: type typedefs live at
// `flight._js.<Type>`, function externs at `flight._js._fn.<Module>` (a subpackage).
const header = (from) => `// Generated by tools/backend-hx from ${from} at flight@${flight.commit.slice(0, 12)}. Do not edit.\n`;
const sig = (f) => `${f.name}(${f.params.map((p) => `${p.optional ? '?' : ''}${p.name}:${p.type}`).join(', ')}):${f.returns}`;

let degradedFields = 0;
let droppedFields = 0;
// A value type must stay emittable even if a field's type is beyond the mapper — functions already
// reference it, so dropping it would break compilation. A hard field degrades to `Dynamic` (reported),
// which keeps the binding compiling and the field accessible, just untyped.
function mapField(t) {
  try { return mapType(t); }
  catch (error) { if (error instanceof Unmappable) { degradedFields++; return 'Dynamic'; } throw error; }
}
function typedefBackingFile(name) {
  const props = (registry.get(name).properties ?? [])
    // A field whose name is a Haxe keyword can't be a struct field and can't be renamed without
    // breaking the structural JS mapping — omit it (reported). Rare.
    .filter((p) => { if (KEYWORDS.has(p.name)) { droppedFields++; return false; } return true; })
    .map((p) => `  ${p.optional ? '@:optional ' : ''}var ${p.name}:${mapField(p.type)};`).join('\n');
  return `${header(`type ${name}`)}#if js
package flight._js;

typedef ${name} = {
${props}
}
#end
`;
}
function functionsBackingFile(m) {
  const methods = m.fns.map((f) => `  static function ${sig(f)};`).join('\n');
  return `${header(m.pkgName)}#if js
package flight._js._fn;

// Named ESM exports of ${m.specifier}, bound as extern statics; @:jsRequire binds each to the module's
// like-named export. The vendored ESM generator (tools/esm) turns that into a tree-shakeable import.
@:jsRequire("${m.specifier}")
extern class ${m.module} {
${methods}
}
#end
`;
}

const typedefSelector = (name) => `#if flight_hx
typedef ${name} = flight._hx.${name};
#elseif (js && flight_esm)
typedef ${name} = flight._js.${name};
#elseif cpp
typedef ${name} = flight._cpp.${name};
#elseif js
#error "flight on js: define flight_esm for the hostWeb ESM pipeline, or flight_hx for the transpiled fallback."
#else
#error "flight: no backend for this target — define flight_hx, or target cpp / (js + flight_esm)."
#end`;

function forwarder(m, f) {
  const args = f.params.map((p) => p.name).join(', ');
  const ret = f.returns === 'Void' ? '' : 'return ';
  const call = (b) => `flight._${b}._fn.${m.module}.${f.name}(${args})`;
  return `inline function ${sig(f)} {
  #if flight_hx
  ${ret}${call('hx')};
  #elseif (js && flight_esm)
  ${ret}${call('js')};
  #elseif cpp
  ${ret}${call('cpp')};
  #else
  #error "flight.${m.module}: no backend — define flight_hx, or js+flight_esm, or target cpp.";
  #end
}`;
}

// A public module composes an optional value typedef and optional free functions under one name.
function publicFile(name, hasType, m) {
  const parts = [];
  if (hasType) parts.push(typedefSelector(name));
  if (m) parts.push(m.fns.map((f) => forwarder(m, f)).join('\n\n'));
  const from = m ? m.pkgName : `type ${name}`;
  return `${header(from)}package flight;

${parts.join('\n\n')}
`;
}

// --- run -------------------------------------------------------------------
const outPublic = join(repoRoot, 'generated');
const outJs = join(repoRoot, 'generated/js');
rmSync(join(outPublic, 'flight'), { recursive: true, force: true });
rmSync(join(outJs, 'flight'), { recursive: true, force: true });
const write = (base, rel, contents) => { const t = join(base, rel); mkdirSync(dirname(t), { recursive: true }); writeFileSync(t, contents); };

// Function backings + closure over value types they reference (mapping props may register more types).
for (const m of modules.values()) write(outJs, `flight/_js/_fn/${m.module}.hx`, functionsBackingFile(m));
const emitted = new Set();
while (emitTypes.size > emitted.size) {
  for (const name of [...emitTypes]) {
    if (emitted.has(name)) continue;
    emitted.add(name);
    write(outJs, `flight/_js/${name}.hx`, typedefBackingFile(name));
  }
}
// Public modules: the union of every name that is a type and/or a function package.
const publicNames = new Set([...emitted, ...modules.keys()]);
for (const name of publicNames) write(outPublic, `flight/${name}.hx`, publicFile(name, emitted.has(name), modules.get(name)));

const merged = [...publicNames].filter((n) => emitted.has(n) && modules.has(n));
const totalFns = [...modules.values()].reduce((n, m) => n + m.fns.length, 0);
const totalSkipped = [...skipReasons.values()].reduce((a, b) => a + b, 0);
console.log(`\ngenerated ${publicNames.size} public modules (${modules.size} with functions, ${emitted.size} value types, ${merged.length} carrying both).`);
console.log(`functions bound: ${totalFns}  (skipped: ${totalSkipped}, coverage ${(100 * totalFns / (totalFns + totalSkipped)).toFixed(1)}%)`);
console.log(`value-type fields degraded to Dynamic: ${degradedFields}; dropped (keyword name): ${droppedFields}`);
console.log('\ntop modules by function count:');
for (const m of [...modules.values()].sort((a, b) => b.fns.length - a.fns.length).slice(0, 15)) console.log(`  ${m.module.padEnd(20)} ${m.fns.length}`);
console.log('\nskipped by reason (top 15):');
for (const [reason, count] of [...skipReasons].sort((a, b) => b[1] - a[1]).slice(0, 15)) console.log(`  ${String(count).padStart(5)}x ${reason}`);
