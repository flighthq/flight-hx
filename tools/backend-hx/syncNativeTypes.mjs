// Materialize every compiler-emitted Haxe/C++ type extern, including declarations that have not
// yet crossed a consumer compile/run proof. The generated attempt surface is deliberately broader
// than src-cpp/manifest.json's proven extension inventory; exact provenance remains in
// generated/js/native-planning.json and src-cpp/type-attempts.json.
import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, statSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const root = path.resolve(import.meta.dirname, '..', '..');
const check = process.argv.includes('--check');
const unknown = process.argv.slice(2).filter((option) => option !== '--check');
if (unknown.length > 0) {
  process.stderr.write(`Unknown native-type sync option(s): ${unknown.join(', ')}\n`);
  process.exit(2);
}

const planning = readJson(path.join(root, 'generated', 'js', 'native-planning.json'));
const defaultApi = readJson(path.join(root, 'generated', 'js', 'default-api.json'));
const manifest = readJson(path.join(root, 'src-cpp', 'manifest.json'));
const flightCpp = resolveDependency(root, 'flight-cpp');
if (planning.schema !== 'flight-hx-native-binding-plan/1') {
  throw new Error(`Unknown native binding plan schema ${String(planning.schema)}`);
}
if (manifest.haxeBindingPlan?.typeAttempt !== 'compiler-emitted-unproven-materialization') {
  throw new Error(`Unknown native type-attempt policy ${String(manifest.haxeBindingPlan?.typeAttempt)}`);
}

const publicTypes = new Set(defaultApi.packages.flatMap((package_) => package_.types));
const holderNames = new Set([
  ...manifest.modules.map(({ module }) => module),
  ...planning.bindingAttempts
    .filter(
      ({ cpp, publicHaxe }) =>
        cpp.availability === 'available' && (publicHaxe.kind === 'function' || publicHaxe.kind === 'value'),
    )
    .map(({ publicHaxe }) => publicHaxe.owner),
]);
const maintainedOverrides = new Set(manifest.extensions.flatMap(({ publicTypes: names }) => names));
const compilerDeclarations = planning.declarations
  .filter(({ kind }) => kind === 'type')
  .map((declaration) => ({ ...declaration, attemptOrigin: 'compiler-emitted', typeShape: simpleTypeShape(declaration.publicName) }));
const cppDefinitions = indexCppDefinitions(path.join(flightCpp.directory, 'generated', 'include'));
const symbolBackedRefusals = planning.bindingAttempts
  .filter(
    ({ cpp, haxeCpp, publicHaxe }) =>
      cpp.availability === 'available' && haxeCpp.status === 'refused' && publicHaxe.kind === 'type',
  )
  .map((attempt) => createRefusedTypeAttempt(attempt, cppDefinitions));
const declarations = [...compilerDeclarations, ...symbolBackedRefusals]
  .sort((left, right) => compareText(left.publicName, right.publicName));
const generatedMarker = '// Generated from flight-compiler native-planning.json. Do not edit.\n';
const duplicateNames = declarations
  .map(({ publicName }) => publicName)
  .filter((name, index, names) => names.indexOf(name) !== index);
if (duplicateNames.length > 0) {
  throw new Error(`Native type plan repeats public names: ${[...new Set(duplicateNames)].join(', ')}`);
}
const collisionGroups = Map.groupBy(
  declarations.filter(({ publicName }) => /_flight_[0-9a-f]{8}$/u.test(publicName)),
  ({ publicName }) => publicName.replace(/^flight\./u, '').replace(/_flight_[0-9a-f]{8}$/u, ''),
);
const collisionAliases = [...collisionGroups]
  .filter(([name]) => publicTypes.has(name))
  .map(([name, candidates]) => ({
    name,
    target: [...candidates].sort(
      (left, right) =>
        Number(right.package === '@flighthq/types') - Number(left.package === '@flighthq/types') ||
        compareText(left.publicName, right.publicName),
    )[0],
    typeShape: readTypeShape(name),
  }))
  .sort((left, right) => compareText(left.name, right.name));
const internalCarriers = [
  { haxeName: '_ArrayBuffer', include: 'flight/array_buffer.hpp', nativeName: 'flight::ArrayBuffer', parameters: '' },
  { haxeName: '_UInt32Array', include: 'flight/typed_array.hpp', nativeName: 'flight::Uint32Array', parameters: '<T = Dynamic>' },
  { haxeName: '_UInt8Array', include: 'flight/typed_array.hpp', nativeName: 'flight::Uint8Array', parameters: '<T = Dynamic>' },
  {
    haxeName: '_UInt8ClampedArray',
    include: 'flight/typed_array.hpp',
    nativeName: 'flight::Uint8ClampedArray',
    parameters: '<T = Dynamic>',
  },
];
const hostCarriers = [
  {
    haxeName: 'AbortSignal',
    include: 'flight/abort.hpp',
    nativeName: 'flight::AbortSignal',
    webType: 'js.html.AbortSignal',
  },
  {
    haxeName: 'AudioBuffer',
    include: 'flight/audio_buffer.hpp',
    nativeName: 'flight::AudioBuffer',
    webType: 'js.html.audio.AudioBuffer',
  },
  { haxeName: 'Blob', include: 'flight/blob.hpp', nativeName: 'flight::Blob', webType: 'js.html.Blob' },
];

const expected = new Map();
const forwardReferenceTypeNames = [...new Set(
  declarations.flatMap((declaration) => {
    const match = referenceForwardName(declaration);
    return match ? [match] : [];
  }),
)].sort(compareText);
expected.set(
  path.join(root, 'src-cpp', 'include', 'flight_hx', 'types', 'reference_fwd.hpp'),
  emitReferenceForwardHeader(forwardReferenceTypeNames),
);
for (const declaration of declarations) {
  const match = /^flight\.([A-Za-z_][A-Za-z0-9_]*)$/u.exec(declaration.publicName);
  if (!match) throw new Error(`Native type has unsupported public name ${declaration.publicName}`);
  const name = match[1];
  const unifiedPublicType = publicTypes.has(name);
  if (!unifiedPublicType && !/_flight_[0-9a-f]{8}$/u.test(name)) {
    throw new Error(`${declaration.publicName} is neither a default web type nor a compiler disambiguation`);
  }
  if (maintainedOverrides.has(declaration.publicName)) {
    for (const filename of [
      path.join(root, 'src-cpp', 'flight', `${name}.hx`),
      path.join(root, 'src-cpp', 'flight', '_cpp', `${name}.hx`),
    ]) {
      if (!existsSync(filename)) throw new Error(`${declaration.publicName} maintained override is missing ${filename}`);
    }
    continue;
  }
  if (declaration.templateAdapter) {
    expected.set(
      path.join(root, 'src-cpp', 'include', declaration.templateAdapter.include),
      emitTemplateAdapter(declaration),
    );
  }
  expected.set(path.join(root, 'src-cpp', 'flight', '_cpp', `${name}.hx`), emitHiddenType(name, declaration));
  if (unifiedPublicType && !holderNames.has(declaration.publicName)) {
    expected.set(path.join(root, 'src-cpp', 'flight', `${name}.hx`), emitPublicType(name, declaration));
  }
}
for (const alias of collisionAliases) {
  if (holderNames.has(`flight.${alias.name}`)) continue;
  expected.set(
    path.join(root, 'src-cpp', 'flight', `${alias.name}.hx`),
    emitPublicCollisionType(alias.name, alias.target.publicName.replace(/^flight\./u, ''), alias.typeShape),
  );
}
for (const carrier of internalCarriers) {
  expected.set(
    path.join(root, 'src-cpp', 'flight', '_internal', `${carrier.haxeName}.hx`),
    emitInternalCarrier(carrier),
  );
}
for (const carrier of hostCarriers) {
  expected.set(
    path.join(root, 'src-cpp', 'flight', '_cpp_runtime', `${carrier.haxeName}.hx`),
    emitHostCarrierExtern(carrier),
  );
  expected.set(path.join(root, 'src', 'flight', `${carrier.haxeName}.hx`), emitHostCarrierFacade(carrier));
}

const report = {
  collisionAliases: collisionAliases.map(({ name, target, typeShape }) => ({
    genericArity: typeShape.genericArity,
    publicName: `flight.${name}`,
    target: target.publicName,
  })),
  internalCarriers,
  hostCarriers,
  declarations: declarations.map(({ attemptOrigin, headerStatus, include, nativeName, package: packageName, publicName, representation, templateAdapter, transport, typeShape }) => ({
    attemptOrigin,
    genericArity: typeShape.genericArity,
    headerStatus,
    include,
    nativeName,
    package: packageName,
    ...(representation ? { representation } : {}),
    ...(templateAdapter ? { templateAdapter } : {}),
    publicName,
    status: maintainedOverrides.has(publicName)
      ? 'maintained-override'
      : publicTypes.has(publicName.replace(/^flight\./u, ''))
        ? attemptOrigin === 'compiler-emitted'
          ? 'compiler-emitted-unproven'
          : 'symbol-backed-refusal-attempt'
        : 'native-only-disambiguation',
    transport,
  })),
  pins: planning.pins,
  schema: 'flight-hx-native-type-attempts/1',
  summary: {
    compilerEmitted: compilerDeclarations.length,
    collisionAliases: collisionAliases.length,
    generatedHiddenExterns: declarations.filter(({ publicName }) => !maintainedOverrides.has(publicName)).length,
    internalCarriers: internalCarriers.length,
    hostCarriers: hostCarriers.length,
    maintainedOverrides: declarations.filter(({ publicName }) => maintainedOverrides.has(publicName)).length,
    nativeOnlyDisambiguations: declarations.filter(
      ({ publicName }) => !publicTypes.has(publicName.replace(/^flight\./u, '')),
    ).length,
    publicAliases: declarations.filter(({ publicName }) => publicTypes.has(publicName.replace(/^flight\./u, ''))).length,
    symbolBackedRefusals: symbolBackedRefusals.length,
    templateAdapters: declarations.filter(({ templateAdapter }) => templateAdapter).length,
    totalAttempts: declarations.length,
  },
};
expected.set(path.join(root, 'src-cpp', 'type-attempts.json'), `${JSON.stringify(report, undefined, 2)}\n`);

const expectedPaths = new Set(expected.keys());
const generatedPaths = [
  ...filesUnder(path.join(root, 'src-cpp', 'flight')),
  ...filesUnder(path.join(root, 'src-cpp', 'include', 'flight_hx', 'types')),
].filter((filename) => readFileSync(filename, 'utf8').startsWith(generatedMarker));
const stale = generatedPaths.filter((filename) => !expectedPaths.has(filename));
if (stale.length > 0) {
  if (check) {
    throw new Error(`Stale native type output must be removed: ${stale.map((filename) => path.relative(root, filename)).join(', ')}`);
  }
  for (const filename of stale) rmSync(filename);
}

const drift = [];
for (const [filename, contents] of expected) {
  if (existsSync(filename) && readFileSync(filename, 'utf8') === contents) continue;
  drift.push(portable(path.relative(root, filename)));
  if (!check) {
    mkdirSync(path.dirname(filename), { recursive: true });
    writeFileSync(filename, contents);
  }
}
if (check && drift.length > 0) {
  process.stderr.write(`Native type attempts differ in ${String(drift.length)} path(s):\n`);
  for (const filename of drift.slice(0, 30)) process.stderr.write(`- ${filename}\n`);
  if (drift.length > 30) process.stderr.write(`- … and ${String(drift.length - 30)} more\n`);
  process.stderr.write('Run `npm run native:sync:types` and commit the result.\n');
  process.exit(1);
}

process.stdout.write(
  `Native type attempts ${check ? 'are current' : 'updated'}: ${String(declarations.length)} type declaration(s), ` +
    `${String(report.summary.generatedHiddenExterns)} compiler extern(s), ` +
    `${String(report.summary.symbolBackedRefusals)} formerly refused symbol-backed attempt(s), ` +
    `${String(report.summary.maintainedOverrides)} maintained override(s).\n`,
);

function emitHiddenType(name, declaration) {
  const ownership =
    declaration.transport === 'reference'
      ? '// The carrier is flight::Ref<T>; copying this value retains shared ownership and never exposes a raw pointer.'
      : '// The carrier is copied by value; no heap owner or borrowed address crosses the Haxe boundary.';
  return [
    generatedMarker.trimEnd(),
    'package flight._cpp;',
    '',
    '#if cpp',
    ownership,
    `@:include(${JSON.stringify(referenceForwardName(declaration) ? 'flight_hx/types/reference_fwd.hpp' : declaration.templateAdapter?.include ?? declaration.include)})`,
    `@:native(${JSON.stringify(declaration.nativeName)})`,
    '@:structAccess',
    `extern class ${name}${declaration.typeShape.externParameters} {}`,
    '#end',
    '',
  ].join('\n');
}

function referenceForwardName(declaration) {
  if (declaration.transport !== 'reference' || declaration.templateAdapter) return undefined;
  const name = /^flight::Ref<flight::types::([A-Za-z_][A-Za-z0-9_]*)>$/u.exec(declaration.nativeName)?.[1];
  // A C++ alias cannot be redeclared as a struct. Keep aliases on their defining
  // header until they receive a purpose-built thin adapter; only real structs can
  // safely share the dependency-light forward-declaration header.
  return name && cppDefinitions.structs.has(name) ? name : undefined;
}

function emitReferenceForwardHeader(names) {
  return [
    generatedMarker.trimEnd(),
    '#pragma once',
    '#include <flight/reference.hpp>',
    '',
    'namespace flight::types {',
    ...names.map((name) => `struct ${name};`),
    '} // namespace flight::types',
    '',
  ].join('\n');
}

function emitTemplateAdapter(declaration) {
  const { alias, include, target } = declaration.templateAdapter;
  const parameters = genericNames(declaration.typeShape.genericArity).map((name) => `typename ${name}`).join(', ');
  const arguments_ = genericNames(declaration.typeShape.genericArity).join(', ');
  return [
    '// Generated from flight-compiler native-planning.json. Do not edit.',
    '#pragma once',
    `#include <${declaration.include}>`,
    '',
    'namespace flight_hx::types {',
    `template <${parameters}> using ${alias} = ${target.replace(declaration.typeShape.nativeArguments, `<${arguments_}>`)};`,
    '} // namespace flight_hx::types',
    '',
  ].join('\n');
}

function emitPublicType(name, declaration) {
  return [
    generatedMarker.trimEnd(),
    'package flight;',
    '',
    `typedef ${name}${declaration.typeShape.publicParameters} = flight._cpp.${name}${declaration.typeShape.arguments};`,
    '',
  ].join('\n');
}

function emitPublicCollisionType(name, target, typeShape) {
  return [
    generatedMarker.trimEnd(),
    'package flight;',
    '',
    `typedef ${name}${typeShape.publicParameters} = flight._cpp.${target}${typeShape.arguments};`,
    '',
  ].join('\n');
}

function emitInternalCarrier({ haxeName, include, nativeName, parameters }) {
  const arguments_ = parameters ? `<${splitTopLevel(parameters.slice(1, -1)).map((part) => /^\s*([A-Za-z_][A-Za-z0-9_]*)/u.exec(part)[1]).join(', ')}>` : '';
  return [
    generatedMarker.trimEnd(),
    'package flight._internal;',
    '',
    `typedef ${haxeName}${parameters} = ${haxeName}Native${arguments_};`,
    '',
    `@:include(${JSON.stringify(include)})`,
    `@:native(${JSON.stringify(nativeName)})`,
    `extern class ${haxeName}Native${parameters ? `<${splitTopLevel(parameters.slice(1, -1)).map((part) => stripTopLevelDefault(part)).join(', ')}>` : ''} {}`,
    '',
  ].join('\n');
}

function emitHostCarrierExtern({ haxeName, include, nativeName }) {
  return [
    generatedMarker.trimEnd(),
    'package flight._cpp_runtime;',
    '',
    '#if cpp',
    `@:include(${JSON.stringify(include)})`,
    `@:native(${JSON.stringify(nativeName)})`,
    '@:structAccess',
    `extern class ${haxeName} {}`,
    '#end',
    '',
  ].join('\n');
}

function emitHostCarrierFacade({ haxeName, webType }) {
  return [
    generatedMarker.trimEnd(),
    'package flight;',
    '',
    '#if (js && flight_esm)',
    `typedef ${haxeName} = ${webType};`,
    '#elseif cpp',
    `typedef ${haxeName} = flight._cpp_runtime.${haxeName};`,
    '#else',
    `typedef ${haxeName} = Dynamic;`,
    '#end',
    '',
  ].join('\n');
}

function createRefusedTypeAttempt({ cpp, haxeCpp, package: packageName, publicHaxe }, definitions) {
  const { locator } = cpp;
  const typeShape = readTypeShape(publicHaxe.name, publicTypes.has(publicHaxe.name));
  const target = `${locator.namespace}::${locator.spelling}${typeShape.nativeArguments}`;
  const representation =
    locator.carrier === 'interface' || definitions.structs.has(locator.spelling)
      ? 'reference'
      : definitions.aliases.has(locator.spelling)
        ? 'value-alias'
        : 'unknown';
  // hxcpp supplies an extern class's Haxe type arguments itself. Embedding the same
  // arguments in @:native produces `Native<Type><Type>` in generated C++. Direct C++
  // alias templates therefore name only their template, while nested generic refs stay
  // deliberately literal/unproven until they have a purpose-built carrier adapter.
  const templateAdapter =
    representation === 'reference' && typeShape.genericArity > 0
      ? {
          alias: publicHaxe.name,
          include: `flight_hx/types/${publicHaxe.name}.hpp`,
          target: `flight::Ref<${target}>`,
        }
      : undefined;
  const nativeName =
    representation === 'value-alias' && typeShape.genericArity > 0
      ? `${locator.namespace}::${locator.spelling}`
      : templateAdapter
        ? `flight_hx::types::${templateAdapter.alias}`
      : representation === 'reference'
        ? `flight::Ref<${target}>`
        : target;
  return {
    attemptOrigin: 'compiler-refusal',
    headerStatus: 'pass',
    include: locator.include,
    nativeName,
    package: packageName,
    publicName: publicHaxe.qualifiedName,
    representation,
    refusal: haxeCpp.refusal,
    transport: representation,
    typeShape,
    templateAdapter,
  };
}

function simpleTypeShape(publicName) {
  const name = publicName.replace(/^flight\./u, '');
  return readTypeShape(name, false);
}

function readTypeShape(name, requirePublic = true) {
  const filename = path.join(root, 'generated', 'js', 'flight', `${name}.hx`);
  if (!existsSync(filename)) {
    if (!requirePublic) return { arguments: '', externParameters: '', genericArity: 0, nativeArguments: '', publicParameters: '' };
    throw new Error(`Native type attempt is missing its generated public declaration: ${filename}`);
  }
  const source = readFileSync(filename, 'utf8');
  const prefix = `typedef ${name}`;
  const start = source.indexOf(prefix);
  if (start < 0) throw new Error(`Native type attempt cannot find ${prefix} in ${filename}`);
  const parameterStart = start + prefix.length;
  if (source[parameterStart] !== '<') {
    return { arguments: '', externParameters: '', genericArity: 0, nativeArguments: '', publicParameters: '' };
  }
  const parameterEnd = matchingAngle(source, parameterStart);
  const publicParameters = source.slice(parameterStart, parameterEnd + 1);
  const parameterBody = publicParameters.slice(1, -1);
  const parts = splitTopLevel(parameterBody);
  const names = parts.map((part) => {
    const match = /^\s*([A-Za-z_][A-Za-z0-9_]*)/u.exec(part);
    if (!match) throw new Error(`Native type attempt cannot parse generic parameter ${part} in ${filename}`);
    return match[1];
  });
  const externParts = parts.map((part) => stripTopLevelDefault(part));
  return {
    arguments: `<${names.join(', ')}>`,
    externParameters: `<${externParts.join(', ')}>`,
    genericArity: names.length,
    nativeArguments: `<${names.join(', ')}>`,
    publicParameters,
  };
}

function matchingAngle(source, start) {
  let depth = 0;
  for (let index = start; index < source.length; index += 1) {
    if (source[index] === '<') depth += 1;
    if (source[index] === '>' && source[index - 1] !== '-') depth -= 1;
    if (depth === 0) return index;
  }
  throw new Error('Unterminated Haxe type parameter list');
}

function splitTopLevel(source) {
  const result = [];
  let start = 0;
  let angle = 0;
  let brace = 0;
  let parenthesis = 0;
  for (let index = 0; index < source.length; index += 1) {
    const character = source[index];
    if (character === '<') angle += 1;
    else if (character === '>' && source[index - 1] !== '-') angle -= 1;
    else if (character === '{') brace += 1;
    else if (character === '}') brace -= 1;
    else if (character === '(') parenthesis += 1;
    else if (character === ')') parenthesis -= 1;
    else if (character === ',' && angle === 0 && brace === 0 && parenthesis === 0) {
      result.push(source.slice(start, index).trim());
      start = index + 1;
    }
  }
  result.push(source.slice(start).trim());
  return result;
}

function stripTopLevelDefault(parameter) {
  let angle = 0;
  let brace = 0;
  let parenthesis = 0;
  for (let index = 0; index < parameter.length; index += 1) {
    const character = parameter[index];
    if (character === '<') angle += 1;
    else if (character === '>' && parameter[index - 1] !== '-') angle -= 1;
    else if (character === '{') brace += 1;
    else if (character === '}') brace -= 1;
    else if (character === '(') parenthesis += 1;
    else if (character === ')') parenthesis -= 1;
    else if (character === '=' && angle === 0 && brace === 0 && parenthesis === 0) {
      return parameter.slice(0, index).trimEnd();
    }
  }
  return parameter;
}

function genericNames(arity) {
  return Array.from({ length: arity }, (_, index) => `T${String(index)}`);
}

function indexCppDefinitions(directory) {
  const structs = new Set();
  const aliases = new Set();
  for (const filename of filesUnder(directory).filter((candidate) => candidate.endsWith('.hpp'))) {
    const source = readFileSync(filename, 'utf8');
    for (const match of source.matchAll(/\bstruct\s+([A-Za-z_][A-Za-z0-9_]*)\s*(?::[^{;]+)?\{/gu)) structs.add(match[1]);
    for (const match of source.matchAll(/\busing\s+([A-Za-z_][A-Za-z0-9_]*)\s*=/gu)) aliases.add(match[1]);
  }
  return { aliases, structs };
}

function filesUnder(directory) {
  if (!existsSync(directory)) return [];
  return readdirSync(directory)
    .sort(compareText)
    .flatMap((entry) => {
      const filename = path.join(directory, entry);
      return statSync(filename).isDirectory() ? filesUnder(filename) : [filename];
    });
}

function readJson(filename) {
  return JSON.parse(readFileSync(filename, 'utf8'));
}

function portable(filename) {
  return filename.split(path.sep).join('/');
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}
