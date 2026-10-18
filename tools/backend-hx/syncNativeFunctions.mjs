// Materialize the manifest-approved direct Haxe/hxcpp function partition from compiler-owned
// public signatures and native locators. The manifest remains the promotion decision: this tool
// refuses anything absent from flight-compiler's Haxe-C++ plan, anything needing an adapter, and
// anything whose flight-cpp header did not pass its compile sweep.
import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';

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
if (manifest.haxeBindingPlan?.promotion !== 'direct-header-pass-compile-run') {
  throw new Error(`Unknown native promotion policy ${String(manifest.haxeBindingPlan?.promotion)}`);
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
const manifestPublicNames = [];
for (const module of manifest.modules) {
  const holder = module.module.replace(/^flight\./u, '');
  const bindings = module.functions.map((binding) => {
    const publicName = `${module.module}.${binding.name}`;
    manifestPublicNames.push(publicName);
    const plan = planned.get(publicName);
    const declaration = publicFunctions.get(publicName);
    if (!plan) throw new Error(`${publicName} is absent from flight-compiler's Haxe-C++ function plan`);
    if (plan.transport !== 'direct') throw new Error(`${publicName} requires the compiler's ${plan.transport} transport`);
    if (plan.headerStatus !== 'pass') throw new Error(`${publicName} has flight-cpp header status ${plan.headerStatus}`);
    if (plan.nativeName !== binding.native) {
      throw new Error(`${publicName} native locator drifted: ${binding.native} != ${plan.nativeName}`);
    }
    if (!declaration) throw new Error(`${publicName} is absent from the complete default web API`);
    return { ...binding, declaration, parsed: parseSignature(declaration.signature) };
  });
  expected.set(path.join(root, 'src-cpp', 'flight', `${holder}.hx`), emitFacade(holder, bindings));
  expected.set(path.join(root, 'src', 'flight', '_cpp', '_fn', `${holder}.hx`), emitExtern(holder, bindings));
  expected.set(
    path.join(root, 'src-cpp', 'include', 'flight_hx', `${holder.toLowerCase()}.hpp`),
    emitBridgeHeader(module, bindings),
  );
  expected.set(
    path.join(root, 'src-cpp', 'src', `${holder.toLowerCase()}.cpp`),
    emitBridgeSource(module, bindings),
  );
}

const duplicatePublicNames = manifestPublicNames.filter((name, index) => manifestPublicNames.indexOf(name) !== index);
if (duplicatePublicNames.length > 0) {
  throw new Error(`Native manifest repeats public functions: ${[...new Set(duplicatePublicNames)].sort(compareText).join(', ')}`);
}
const promotablePublicNames = planning.declarations
  .filter(({ kind, transport, headerStatus }) => kind === 'function' && transport === 'direct' && headerStatus === 'pass')
  .map(({ publicName }) => publicName)
  .sort(compareText);
const recordedPublicNames = [...manifestPublicNames].sort(compareText);
if (JSON.stringify(recordedPublicNames) !== JSON.stringify(promotablePublicNames)) {
  const recorded = new Set(recordedPublicNames);
  const promotable = new Set(promotablePublicNames);
  const missing = promotablePublicNames.filter((name) => !recorded.has(name));
  const extra = recordedPublicNames.filter((name) => !promotable.has(name));
  throw new Error(
    `Native manifest does not exactly implement direct/header-pass compiler candidates; ` +
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
    `${String(manifest.modules.reduce((total, module) => total + module.functions.length, 0))} direct function(s).\n`,
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
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight._cpp._fn;',
    '',
    '#if cpp',
    `@:buildXml('\n<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />\n<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />\n<set name="NO_PRECOMPILED_HEADERS" value="1" />\n<files id="haxe">\n  <file name="\${removeQuotes:flight_hx_root}/src-cpp/src/${holder.toLowerCase()}.cpp" />\n  <compilerflag value="/std:c++20" if="windows" />\n  <compilerflag value="-std=c++20" unless="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/generated/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />\n</files>\n')`,
    `@:include("flight_hx/${holder.toLowerCase()}.hpp")`,
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
  const match = /^function ([A-Za-z_][A-Za-z0-9_]*)\((.*)\):(Bool|Float|Void)$/u.exec(signature);
  if (!match) throw new Error(`Native direct function has unsupported Haxe signature: ${signature}`);
  const parameters = match[2]
    ? match[2].split(', ').map((parameter) => {
        const parsed = /^([A-Za-z_][A-Za-z0-9_]*):(Bool|Float)$/u.exec(parameter);
        if (!parsed) throw new Error(`Native direct function has unsupported parameter: ${parameter}`);
        return { name: parsed[1], type: parsed[2] };
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
