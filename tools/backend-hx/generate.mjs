// Skunkworks bindings backend: flight-compiler inventory -> Haxe ESM externs + flight.* forwarders.
//
// Pure(ish) driver, mirroring flight-cpp/scripts/sdkGeneration.mjs: it does NOT re-derive names or
// parse TypeScript itself — it lowers Flight source through @flighthq/tool-compiler and reads the IR
// (signatures, type shapes, export names). Bodies are ignored (externs have none).
//
// Scope: one Flight package of free functions (geometry) + the value types those functions reference
// (resolved from @flighthq/types). Emits:
//   generated/flight/<Type>.hx        public backend-dispatching typedef per value type
//   generated/js/flight/_js/<Type>.hx structural JS typedef per value type
//   generated/flight/<Module>.hx      public module-level forwarders for the package's free functions
//   generated/js/flight/_js/<Module>.hx  @:jsRequire extern binding the package's named ESM exports
// Unmappable signatures are SKIPPED and reported, so the emitted surface always compiles. This is the
// ESM half of the bindings backend that AGENTS.md says promotes upstream to compiler-backend-hx.
import { mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
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

// --- the slice to generate -------------------------------------------------
// One package of free functions, plus the type package its signatures reference.
const PACKAGE = { name: '@flighthq/geometry', specifier: '@flighthq/geometry', module: 'Geometry', srcDir: 'packages/geometry/src' };
const TYPES = { name: '@flighthq/types', srcDir: 'packages/types/src' };

// Generic wrappers that carry no runtime shape of their own — unwrap to the argument.
const WRAPPERS = new Set(['Readonly', 'ReadonlyArray', 'EntityWithoutRuntime', 'Partial', 'Writable']);
// Native JS typed arrays -> Haxe js.lib externs.
const TYPED_ARRAYS = new Map([
  ['Float32Array', 'js.lib.Float32Array'], ['Float64Array', 'js.lib.Float64Array'],
  ['Int8Array', 'js.lib.Int8Array'], ['Int16Array', 'js.lib.Int16Array'], ['Int32Array', 'js.lib.Int32Array'],
  ['Uint8Array', 'js.lib.Uint8Array'], ['Uint16Array', 'js.lib.Uint16Array'], ['Uint32Array', 'js.lib.Uint32Array'],
]);

// --- lower + registry ------------------------------------------------------
function lowerFile(pkg, file) {
  const path = join(flight.directory, pkg.srcDir, file);
  const sf = tc.parseTypeScriptSource(path, readFileSync(path, 'utf8'));
  return tc.lowerTypeScriptSource(sf, { packageName: pkg.name, upstreamDirectory: flight.directory }).module;
}
function sourceFiles(pkg) {
  return readdirSync(join(flight.directory, pkg.srcDir))
    .filter((f) => f.endsWith('.ts') && !f.endsWith('.test.ts') && !f.endsWith('.d.ts') && f !== 'index.ts' && f !== 'contract.ts');
}

// name -> declaration, for every type in @flighthq/types (interfaces + aliases).
const registry = new Map();
for (const file of sourceFiles(TYPES)) {
  let mod;
  try { mod = lowerFile(TYPES, file); } catch { continue; }
  for (const d of mod.declarations) {
    const name = d.binding?.name ?? d.name;
    if (name && !registry.has(name)) registry.set(name, d);
  }
}

// --- IR type -> Haxe type --------------------------------------------------
class Unmappable extends Error {}
const emitTypes = new Set(); // interface names that need a generated typedef

function refName(t) {
  const r = t.reference ?? {};
  return r.binding?.name ?? (r.kind === 'ambient' ? r.name : r.kind);
}

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
      const props = (t.properties ?? []).map((p) => `${p.optional ? '?' : ''}${p.name}:${mapType(p.type, depth + 1)}`);
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
  if (nonNull.length && nonNull.every((k) => k.kind === 'literal')) return 'String'; // string-literal union
  if (nonNull.length === 1) { const inner = mapType(nonNull[0], depth + 1); return nullable ? `Null<${inner}>` : inner; }
  throw new Unmappable(`union of ${nonNull.length}`);
}

// --- collect functions -----------------------------------------------------
function collectFunctions() {
  const kept = [];
  const skipped = [];
  for (const file of sourceFiles(PACKAGE)) {
    const mod = lowerFile(PACKAGE, file);
    for (const d of mod.declarations) {
      if (d.kind !== 'function' || d.exported !== true) continue;
      try {
        const params = d.parameters.map((p) => {
          if (p.rest) throw new Unmappable('rest param');
          return { name: p.binding.name, type: mapType(p.type), optional: Boolean(p.optional) };
        });
        kept.push({ name: d.binding.name, params, returns: mapType(d.returns) });
      } catch (error) {
        if (error instanceof Unmappable) skipped.push({ name: d.binding?.name, reason: error.message });
        else throw error;
      }
    }
  }
  kept.sort((a, b) => (a.name < b.name ? -1 : a.name > b.name ? 1 : 0));
  return { kept, skipped };
}

// --- emitters --------------------------------------------------------------
const header = (from) => `// Generated by tools/backend-hx from ${from} at flight@${flight.commit.slice(0, 12)}. Do not edit.\n`;
const sig = (f) => `${f.name}(${f.params.map((p) => `${p.optional ? '?' : ''}${p.name}:${p.type}`).join(', ')}):${f.returns}`;

function emitTypedefBacking(name) {
  const props = (registry.get(name).properties ?? []).map((p) => `  ${p.optional ? '?' : ''}var ${p.name}:${mapType(p.type)};`).join('\n');
  return `${header(`${TYPES.name}/packages/types/src/${name}.ts`)}#if js
package flight._js;

typedef ${name} = {
${props}
}
#end
`;
}

function emitTypedefPublic(name) {
  return `${header(`${TYPES.name}/packages/types/src/${name}.ts`)}package flight;

#if flight_hx
typedef ${name} = flight._hx.${name};
#elseif (js && flight_esm)
typedef ${name} = flight._js.${name};
#elseif cpp
typedef ${name} = flight._cpp.${name};
#elseif js
#error "flight on js: define flight_esm for the hostWeb ESM pipeline, or flight_hx for the transpiled fallback."
#else
#error "flight: no backend for this target — define flight_hx, or target cpp / (js + flight_esm)."
#end
`;
}

function emitFunctionsBacking(fns) {
  const methods = fns.map((f) => `  static function ${sig(f)};`).join('\n');
  return `${header(`${PACKAGE.name}`)}#if js
package flight._js;

// Named ESM exports of ${PACKAGE.specifier}, bound as extern statics. @:jsRequire without a member
// name binds each static to the module's like-named named export; the vendored ESM generator
// (tools/esm) turns that into a tree-shakeable static import.
@:jsRequire("${PACKAGE.specifier}")
extern class ${PACKAGE.module} {
${methods}
}
#end
`;
}

function emitFunctionsPublic(fns) {
  const fwd = (f) => {
    const args = f.params.map((p) => p.name).join(', ');
    const ret = f.returns === 'Void' ? '' : 'return ';
    const call = (b) => `flight._${b}.${PACKAGE.module}.${f.name}(${args})`;
    return `inline function ${sig(f)} {
  #if flight_hx
  ${ret}${call('hx')};
  #elseif (js && flight_esm)
  ${ret}${call('js')};
  #elseif cpp
  ${ret}${call('cpp')};
  #else
  #error "flight.${PACKAGE.module}: no backend — define flight_hx, or js+flight_esm, or target cpp.";
  #end
}`;
  };
  return `${header(`${PACKAGE.name}`)}package flight;

${fns.map(fwd).join('\n\n')}
`;
}

// --- run -------------------------------------------------------------------
const outPublic = join(repoRoot, 'generated');
const outJs = join(repoRoot, 'generated/js');
rmSync(join(outPublic, 'flight'), { recursive: true, force: true });
rmSync(join(outJs, 'flight'), { recursive: true, force: true });

function write(base, rel, contents) {
  const target = join(base, rel);
  mkdirSync(dirname(target), { recursive: true });
  writeFileSync(target, contents);
}

const { kept, skipped } = collectFunctions();
// emitTypes was populated as a side effect of mapping the kept functions' signatures.
const typeNames = [...emitTypes].sort();
for (const name of typeNames) {
  write(outJs, `flight/_js/${name}.hx`, emitTypedefBacking(name));
  write(outPublic, `flight/${name}.hx`, emitTypedefPublic(name));
}
write(outJs, `flight/_js/${PACKAGE.module}.hx`, emitFunctionsBacking(kept));
write(outPublic, `flight/${PACKAGE.module}.hx`, emitFunctionsPublic(kept));

console.log(`${PACKAGE.module}: ${kept.length} functions bound, ${skipped.length} skipped; ${typeNames.length} value types generated.`);
console.log(`types: ${typeNames.join(', ')}`);
if (skipped.length) {
  const byReason = new Map();
  for (const s of skipped) byReason.set(s.reason, (byReason.get(s.reason) ?? 0) + 1);
  console.log('\nskipped by reason:');
  for (const [reason, count] of [...byReason].sort((a, b) => b[1] - a[1])) console.log(`  ${count}x ${reason}`);
}
