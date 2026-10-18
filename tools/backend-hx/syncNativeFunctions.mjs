// Materialize the manifest-approved Haxe/hxcpp function partition from compiler-owned public
// signatures, native locators, exact adapter emissions, and explicit downstream scalar overrides.
// Every path uses declaration-only hxcpp headers plus isolated C++ translation units so flight::*
// names never enter hxcpp-generated namespace flight.
import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const root = path.resolve(import.meta.dirname, '..', '..');
const check = process.argv.includes('--check');
const unknown = process.argv.slice(2).filter((option) => option !== '--check');
if (unknown.length > 0) {
  process.stderr.write(`Unknown native-function sync option(s): ${unknown.join(', ')}\n`);
  process.exit(2);
}

const manifest = readJson(path.join(root, 'src-cpp', 'manifest.json'));
const defaultApi = readJson(path.join(root, 'generated', 'js', 'default-api.json'));
const planning = readJson(path.join(root, 'generated', 'js', 'native-planning.json'));
const flightCpp = resolveDependency(root, 'flight-cpp');
const flightCppBestEffort = readJson(path.join(flightCpp.directory, 'generated', 'best-effort.json'));
const compilerPlanProvenance = 'flight-compiler/haxe-cpp-plan/1';
const scalarOverrideProvenance = 'flight-hx/header-confirmed-scalar/1';
const flightCppHeaderStatuses = new Map(
  flightCppBestEffort.modules.map(({ path: header, status }) => [header, status]),
);
if (planning.schema !== 'flight-hx-native-binding-plan/1') {
  throw new Error(`Unknown native binding plan schema ${String(planning.schema)}`);
}
if (manifest.haxeBindingPlan?.schema !== planning.schemas?.cppExternPlan) {
  throw new Error('Native manifest does not name the compiler-owned Haxe-C++ plan schema');
}
if (manifest.haxeBindingPlan?.compilerRevision !== planning.pins?.flightCompiler) {
  throw new Error('Native manifest and Haxe-C++ plan compiler revisions differ');
}
if (manifest.haxeBindingPlan?.candidateArtifact !== 'generated/js/native-planning.json') {
  throw new Error('Native manifest does not name the checked compiler planning artifact');
}
if (manifest.haxeBindingPlan?.promotion !== 'compiler-emitted-header-pass-compile-run') {
  throw new Error(`Unknown native promotion policy ${String(manifest.haxeBindingPlan?.promotion)}`);
}
if (manifest.haxeBindingPlan?.overridePromotion !== 'dependency-complete-required-scalar-compile-run') {
  throw new Error(`Unknown native override policy ${String(manifest.haxeBindingPlan?.overridePromotion)}`);
}
const planned = new Map(
  planning.declarations
    .filter(({ kind }) => kind === 'function')
    .map((declaration) => [declaration.publicName, declaration]),
);
const publicFunctions = new Map(
  defaultApi.packages.flatMap((package_) =>
    package_.functions.map((declaration) => [`flight.${declaration.holder}.${declaration.name}`, declaration]),
  ),
);

const expected = new Map();
const manifestEntries = [];
for (const module of manifest.modules) {
  const holder = module.module.replace(/^flight\./u, '');
  const bindings = module.functions.map((binding) => {
    const publicName = `${module.module}.${binding.name}`;
    const provenance = binding.provenance ?? compilerPlanProvenance;
    manifestEntries.push({ provenance, publicName });
    let plan = planned.get(publicName);
    const declaration = publicFunctions.get(publicName);
    if (!declaration) throw new Error(`${publicName} is absent from the complete default web API`);
    const parsed = parseSignature(declaration.signature);
    if (provenance === scalarOverrideProvenance) {
      if (plan) {
        throw new Error(`${publicName} is now compiler-planned; remove its downstream scalar override`);
      }
      validateScalarOverride(publicName, binding, declaration, parsed);
      plan = {
        headerStatus: 'pass',
        include: binding.header,
        kind: 'function',
        nativeName: binding.native,
        publicName,
        transport: 'direct',
      };
    } else if (provenance !== compilerPlanProvenance) {
      throw new Error(`${publicName} has unknown provenance ${String(provenance)}`);
    }
    if (!plan) throw new Error(`${publicName} is absent from flight-compiler's Haxe-C++ function plan`);
    if (plan.transport !== 'direct' && plan.transport !== 'adapter') {
      throw new Error(`${publicName} uses unknown compiler transport ${String(plan.transport)}`);
    }
    if (plan.headerStatus !== 'pass') throw new Error(`${publicName} has flight-cpp header status ${plan.headerStatus}`);
    if (plan.nativeName !== binding.native) {
      throw new Error(`${publicName} native locator drifted: ${binding.native} != ${plan.nativeName}`);
    }
    if (plan.transport === 'adapter') validateCompilerAdapter(publicName, binding, plan);
    return { ...binding, declaration, parsed, plan, provenance };
  });
  const directBindings = bindings.filter(({ plan }) => plan.transport === 'direct');
  const adapterBindings = bindings.filter(({ plan }) => plan.transport === 'adapter');
  expected.set(path.join(root, 'src-cpp', 'flight', `${holder}.hx`), emitFacade(holder, bindings));
  expected.set(path.join(root, 'src', 'flight', '_cpp', '_fn', `${holder}.hx`), emitExtern(holder, bindings));
  if (directBindings.length > 0) {
    expected.set(
      path.join(root, 'src-cpp', 'include', 'flight_hx', `${holder.toLowerCase()}.hpp`),
      emitBridgeHeader(module, directBindings),
    );
    expected.set(
      path.join(root, 'src-cpp', 'src', `${holder.toLowerCase()}.cpp`),
      emitBridgeSource(module, directBindings),
    );
  }
  for (const binding of adapterBindings) {
    const { name } = adapterIdentity(binding);
    expected.set(
      path.join(root, 'src-cpp', 'include', 'flight_hx', 'adapters', `${name}.hpp`),
      emitAdapterHeader(binding),
    );
    expected.set(path.join(root, 'src-cpp', 'src', 'adapters', `${name}.cpp`), emitAdapterSource(binding));
  }
}

const manifestPublicNames = manifestEntries.map(({ publicName }) => publicName);
const duplicatePublicNames = manifestPublicNames.filter((name, index) => manifestPublicNames.indexOf(name) !== index);
if (duplicatePublicNames.length > 0) {
  throw new Error(`Native manifest repeats public functions: ${[...new Set(duplicatePublicNames)].sort(compareText).join(', ')}`);
}
const promotablePublicNames = planning.declarations
  .filter(
    ({ kind, transport, headerStatus }) =>
      kind === 'function' && (transport === 'direct' || transport === 'adapter') && headerStatus === 'pass',
  )
  .map(({ publicName }) => publicName)
  .sort(compareText);
const recordedPublicNames = manifestEntries
  .filter(({ provenance }) => provenance === compilerPlanProvenance)
  .map(({ publicName }) => publicName)
  .sort(compareText);
if (JSON.stringify(recordedPublicNames) !== JSON.stringify(promotablePublicNames)) {
  const recorded = new Set(recordedPublicNames);
  const promotable = new Set(promotablePublicNames);
  const missing = promotablePublicNames.filter((name) => !recorded.has(name));
  const extra = recordedPublicNames.filter((name) => !promotable.has(name));
  throw new Error(
    `Native manifest's compiler-owned partition does not exactly implement compiler-emitted/header-pass candidates; ` +
      `missing=${missing.join(', ') || 'none'}; extra=${extra.join(', ') || 'none'}`,
  );
}

const drift = [];
for (const [filename, contents] of expected) {
  if (existsSync(filename) && readFileSync(filename, 'utf8') === contents) continue;
  drift.push(path.relative(root, filename).split(path.sep).join('/'));
  if (!check) {
    mkdirSync(path.dirname(filename), { recursive: true });
    writeFileSync(filename, contents);
  }
}
if (check && drift.length > 0) {
  process.stderr.write(`Native function bindings differ in ${String(drift.length)} path(s):\n`);
  for (const filename of drift) process.stderr.write(`- ${filename}\n`);
  process.stderr.write('Run `npm run native:sync` and commit the result.\n');
  process.exit(1);
}
process.stdout.write(
  `Native function bindings ${check ? 'are current' : 'updated'}: ${String(manifest.modules.length)} holder(s), ` +
    `${String(manifestPublicNames.length)} function(s) ` +
    `(${String(planning.declarations.filter(({ kind, transport, headerStatus }) => kind === 'function' && transport === 'direct' && headerStatus === 'pass').length)} direct, ` +
    `${String(planning.declarations.filter(({ kind, transport, headerStatus }) => kind === 'function' && transport === 'adapter' && headerStatus === 'pass').length)} compiler adapter, ` +
    `${String(manifestEntries.filter(({ provenance }) => provenance === scalarOverrideProvenance).length)} downstream scalar override).\n`,
);

function emitFacade(holder, bindings) {
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight;',
    '',
  ];
  for (const { declaration, parsed } of bindings) {
    lines.push(`inline ${declaration.signature} {`);
    const call = `flight._cpp._fn.${holder}.${declaration.name}(${parsed.parameters.map(({ name }) => name).join(', ')})`;
    lines.push(parsed.result === 'Void' ? `  ${call};` : `  return ${call};`);
    lines.push('}', '');
  }
  return lines.join('\n');
}

function emitExtern(holder, bindings) {
  const direct = bindings.filter(({ plan }) => plan.transport === 'direct');
  const adapters = bindings.filter(({ plan }) => plan.transport === 'adapter');
  const sources = [
    ...(direct.length > 0 ? [`${holder.toLowerCase()}.cpp`] : []),
    ...adapters.map((binding) => `adapters/${adapterIdentity(binding).name}.cpp`),
  ];
  const includes = [
    ...(direct.length > 0 ? [`flight_hx/${holder.toLowerCase()}.hpp`] : []),
    ...adapters.map((binding) => `flight_hx/adapters/${adapterIdentity(binding).name}.hpp`),
  ];
  const sourceFiles = sources
    .map((source) => `  <file name="\${removeQuotes:flight_hx_root}/src-cpp/src/${source}" />`)
    .join('\n');
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight._cpp._fn;',
    '',
    '#if cpp',
    `@:buildXml('\n<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />\n<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />\n<set name="NO_PRECOMPILED_HEADERS" value="1" />\n<files id="haxe">\n${sourceFiles}\n  <compilerflag value="/std:c++20" if="windows" />\n  <compilerflag value="-std=c++20" unless="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/generated/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />\n</files>\n')`,
    ...includes.map((include) => `@:include(${JSON.stringify(include)})`),
    `extern class ${holder} {`,
  ];
  for (const { declaration, native } of bindings) {
    lines.push(`  @:native(${JSON.stringify(native.replace(/^flight::/u, 'flight_hx::'))})`);
    lines.push(`  static ${declaration.signature};`, '');
  }
  if (lines.at(-1) === '') lines.pop();
  lines.push('}', '#end', '');
  return lines.join('\n');
}

function validateCompilerAdapter(publicName, binding, plan) {
  const adapter = plan.adapter;
  if (!adapter || adapter.nativeName !== binding.native || adapter.nativeName !== plan.nativeName) {
    throw new Error(`${publicName} has incomplete compiler adapter identity`);
  }
  if (
    adapter.emittedFile?.path !== adapter.headerPath ||
    adapter.headerPath !== `flight/_cpp/adapters/${adapterIdentity({ ...binding, plan }, false).name}.hpp` ||
    !adapter.emittedFile?.dependencies?.includes(plan.include) ||
    !adapter.emittedFile?.contents?.includes(`${adapter.targetNativeName}(`)
  ) {
    throw new Error(`${publicName} compiler adapter emission does not match its plan`);
  }
}

function validateScalarOverride(publicName, binding, declaration, parsed) {
  if (flightCppHeaderStatuses.get(binding.header) !== 'emitted') {
    throw new Error(`${publicName} override header is not dependency-complete: ${binding.header}`);
  }
  if (parsed.parameters.some(({ optional, type }) => optional || type === 'String') || parsed.result === 'String') {
    throw new Error(`${publicName} override is not a required primitive scalar signature`);
  }
  const cppName = camelToSnake(declaration.sourceName);
  if (!binding.native.endsWith(`::${cppName}`)) {
    throw new Error(`${publicName} override native locator does not end in ${cppName}`);
  }
  const headerPath = path.join(flightCpp.directory, 'generated', 'include', binding.header);
  if (!existsSync(headerPath)) throw new Error(`${publicName} override header is missing: ${binding.header}`);
  const parameters = parsed.parameters
    .map(({ name, type }) => `${cppType(type)} ${safeCppName(camelToSnake(name))}`)
    .join(', ');
  const expectedSignature = `inline ${cppType(parsed.result)} ${cppName}(${parameters})`;
  if (!readFileSync(headerPath, 'utf8').includes(expectedSignature)) {
    throw new Error(`${publicName} override header does not contain ${expectedSignature}`);
  }
}

function adapterIdentity(binding, requireEmission = true) {
  const match = /^flight::haxe::_cpp::([A-Za-z_][A-Za-z0-9_]*)$/u.exec(binding.native);
  if (!match) throw new Error(`${binding.native} is not a compiler Haxe-C++ adapter locator`);
  const contents = binding.plan?.adapter?.emittedFile?.contents;
  if (!requireEmission) return { name: match[1] };
  if (typeof contents !== 'string') throw new Error(`${binding.native} has no compiler adapter emission`);
  const escapedName = escapeRegExp(match[1]);
  const signatureMatch = new RegExp(`^inline ([^\\n{]+\\b${escapedName}\\([^\\n]*\\)) \\{$`, 'mu').exec(contents);
  if (!signatureMatch) throw new Error(`${binding.native} compiler adapter signature is not recognized`);
  return { contents, name: match[1], signature: signatureMatch[1] };
}

function emitAdapterHeader(binding) {
  const { name, signature } = adapterIdentity(binding);
  return [
    '// Generated from flight-compiler native-planning.json. Do not edit.',
    '#pragma once',
    '#include <hxcpp.h>',
    '',
    '// Declaration-only boundary: Flight headers remain in the isolated adapter translation unit.',
    'namespace flight_hx::haxe::_cpp {',
    `${signature};`,
    '',
    '} // namespace flight_hx::haxe::_cpp',
    '',
  ].join('\n');
}

function emitAdapterSource(binding) {
  const { contents, name, signature } = adapterIdentity(binding);
  let source = contents;
  source = replaceExactly(source, '#pragma once\n', '// Generated from flight-compiler native-planning.json. Do not edit.\n');
  source = replaceExactly(source, 'namespace flight::haxe::_cpp {', 'namespace flight_hx::haxe::_cpp {');
  source = replaceExactly(source, `inline ${signature} {`, `${signature} {`);
  source = replaceExactly(
    source,
    '} // namespace flight::haxe::_cpp',
    '} // namespace flight_hx::haxe::_cpp',
  );
  if (!source.includes(`${binding.plan.adapter.targetNativeName}(`) || !source.includes(`${name}(`)) {
    throw new Error(`${binding.native} isolated adapter lost compiler-owned behavior`);
  }
  return source;
}

function replaceExactly(source, pattern, replacement) {
  const first = source.indexOf(pattern);
  if (first < 0 || source.indexOf(pattern, first + pattern.length) >= 0) {
    throw new Error(`Expected exactly one adapter emission fragment: ${pattern}`);
  }
  return `${source.slice(0, first)}${replacement}${source.slice(first + pattern.length)}`;
}

function nativeNamespace(module, bindings) {
  const namespaces = new Set();
  for (const { native } of bindings) {
    const match = /^flight::(.+)::([^:]+)$/u.exec(native);
    if (!match) throw new Error(`${module.module} native locator is not a flight namespace function: ${native}`);
    namespaces.add(match[1]);
  }
  if (namespaces.size !== 1) throw new Error(`${module.module} spans multiple native namespaces`);
  return [...namespaces][0];
}

function emitBridgeHeader(module, bindings) {
  const namespace = nativeNamespace(module, bindings);
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    '#pragma once',
    '',
    '// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.',
    `namespace flight_hx::${namespace} {`,
    '',
  ];
  for (const { native, parsed } of bindings) {
    const functionName = native.slice(native.lastIndexOf('::') + 2);
    const parameters = parsed.parameters
      .map(({ name, type }) => `${cppType(type)} ${safeCppName(name)}`)
      .join(', ');
    lines.push(`${cppType(parsed.result)} ${functionName}(${parameters});`);
  }
  lines.push('', `} // namespace flight_hx::${namespace}`, '');
  return lines.join('\n');
}

function emitBridgeSource(module, bindings) {
  const namespace = nativeNamespace(module, bindings);
  const holder = module.module.replace(/^flight\./u, '').toLowerCase();
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    ...[...new Set(bindings.map(({ header }) => header))].sort(compareText).map((header) => `#include <${header}>`),
    `#include <flight_hx/${holder}.hpp>`,
    '',
    `namespace flight_hx::${namespace} {`,
    '',
  ];
  for (const { native, parsed } of bindings) {
    const functionName = native.slice(native.lastIndexOf('::') + 2);
    const parameters = parsed.parameters
      .map(({ name, type }) => `${cppType(type)} ${safeCppName(name)}`)
      .join(', ');
    const arguments_ = parsed.parameters.map(({ name }) => safeCppName(name)).join(', ');
    lines.push(`${cppType(parsed.result)} ${functionName}(${parameters}) {`);
    const call = `${native}(${arguments_})`;
    lines.push(parsed.result === 'Void' ? `  ${call};` : `  return ${call};`);
    lines.push('}', '');
  }
  lines.push(`} // namespace flight_hx::${namespace}`, '');
  return lines.join('\n');
}

function parseSignature(signature) {
  const match = /^function ([A-Za-z_][A-Za-z0-9_]*)\((.*)\):(Bool|Float|String|Void)$/u.exec(signature);
  if (!match) throw new Error(`Native function has unsupported Haxe signature: ${signature}`);
  const parameters = match[2]
    ? match[2].split(', ').map((parameter) => {
        const parsed = /^(\??)([A-Za-z_][A-Za-z0-9_]*):(Bool|Float|String)$/u.exec(parameter);
        if (!parsed) throw new Error(`Native function has unsupported parameter: ${parameter}`);
        return { name: parsed[2], optional: parsed[1] === '?', type: parsed[3] };
      })
    : [];
  return { name: match[1], parameters, result: match[3] };
}

function cppType(type) {
  if (type === 'Bool') return 'bool';
  if (type === 'Float') return 'double';
  if (type === 'Void') return 'void';
  throw new Error(`Unsupported native C++ carrier ${type}`);
}

function safeCppName(name) {
  return new Set(['alignas', 'alignof', 'and', 'asm', 'auto', 'bool', 'break', 'case', 'catch', 'char', 'class', 'const', 'continue', 'default', 'delete', 'do', 'double', 'else', 'enum', 'explicit', 'export', 'extern', 'false', 'float', 'for', 'friend', 'goto', 'if', 'inline', 'int', 'long', 'namespace', 'new', 'not', 'operator', 'or', 'private', 'protected', 'public', 'register', 'return', 'short', 'signed', 'sizeof', 'static', 'struct', 'switch', 'template', 'this', 'throw', 'true', 'try', 'typedef', 'typename', 'union', 'unsigned', 'using', 'virtual', 'void', 'volatile', 'while']).has(name)
    ? `${name}_`
    : name;
}

function readJson(filename) {
  return JSON.parse(readFileSync(filename, 'utf8'));
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
}

function camelToSnake(value) {
  return value
    .replace(/([A-Z]+)([A-Z][a-z])/gu, '$1_$2')
    .replace(/([a-z0-9])([A-Z])/gu, '$1_$2')
    .toLowerCase();
}
