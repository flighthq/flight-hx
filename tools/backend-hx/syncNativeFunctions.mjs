// Materialize the manifest-approved Haxe/hxcpp function partition from compiler-owned public
// signatures, native locators, exact adapter emissions, and explicit downstream scalar overrides.
// Every path uses declaration-only hxcpp headers plus isolated C++ translation units so flight::*
// names never enter hxcpp-generated namespace flight.
import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, statSync, writeFileSync } from 'node:fs';
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
const typeAttempts = readJson(path.join(root, 'src-cpp', 'type-attempts.json'));
const flightCpp = resolveDependency(root, 'flight-cpp');
const flightCppBestEffort = readJson(path.join(flightCpp.directory, 'generated', 'best-effort.json'));
const compilerPlanProvenance = 'flight-compiler/haxe-cpp-plan/1';
const scalarOverrideProvenance = 'flight-hx/header-confirmed-scalar/1';
const optionalScalarOverrideProvenance = 'flight-hx/header-confirmed-optional-scalar/1';
const arrayFloatAdapterProvenance = 'flight-hx/array-float-copy-adapter/1';
const nullableStringAdapterProvenance = 'flight-hx/nullable-string-copy-adapter/1';
const referenceCarrierProvenance = 'flight-hx/reference-carrier/1';
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
if (
  manifest.haxeBindingPlan?.optionalOverridePromotion !==
  'dependency-complete-optional-scalar-adapter-compile-run'
) {
  throw new Error(
    `Unknown native optional override policy ${String(manifest.haxeBindingPlan?.optionalOverridePromotion)}`,
  );
}
if (
  manifest.haxeBindingPlan?.arrayFloatAdapterPromotion !==
  'dependency-complete-array-float-copy-adapter-compile-run'
) {
  throw new Error(
    `Unknown native Array<Float> adapter policy ${String(manifest.haxeBindingPlan?.arrayFloatAdapterPromotion)}`,
  );
}
if (
  manifest.haxeBindingPlan?.nullableStringAdapterPromotion !==
  'dependency-complete-nullable-string-copy-adapter-compile-run'
) {
  throw new Error(
    `Unknown native Null<String> adapter policy ${String(manifest.haxeBindingPlan?.nullableStringAdapterPromotion)}`,
  );
}
if (
  manifest.haxeBindingPlan?.referenceCarrierPromotion !==
  'dependency-complete-reference-carrier-compile-run'
) {
  throw new Error(
    `Unknown native reference carrier policy ${String(manifest.haxeBindingPlan?.referenceCarrierPromotion)}`,
  );
}
const planned = new Map(
  planning.declarations
    .filter(({ kind }) => kind === 'function')
    .map((declaration) => [declaration.publicName, declaration]),
);
const attemptedFunctions = new Map(
  planning.bindingAttempts
    .filter(({ publicHaxe }) => publicHaxe.kind === 'function')
    .map((attempt) => [attempt.publicHaxe.qualifiedName, attempt]),
);
const nativeReferenceTypes = new Map(
  planning.declarations
    .filter(({ headerStatus, kind, transport }) =>
      kind === 'type' && transport === 'reference' && headerStatus === 'pass')
    .map((declaration) => [declaration.publicName, declaration]),
);
const publicFunctions = new Map(
  defaultApi.packages.flatMap((package_) =>
    package_.functions.map((declaration) => [`flight.${declaration.holder}.${declaration.name}`, declaration]),
  ),
);
const nativeFacadeTypes = new Map(typeAttempts.declarations.map((declaration) => [declaration.publicName, declaration]));
const manifestPublicNameSet = new Set(
  manifest.modules.flatMap(({ module, functions }) => functions.map(({ name }) => `${module}.${name}`)),
);
const unprovenAttempts = planning.bindingAttempts
  .filter(
    ({ cpp, haxeCpp, publicHaxe }) =>
      cpp.availability === 'available' &&
      haxeCpp.status === 'refused' &&
      (publicHaxe.kind === 'function' || publicHaxe.kind === 'value') &&
      !manifestPublicNameSet.has(publicHaxe.qualifiedName),
  )
  .map((attempt) => {
    if (attempt.publicHaxe.kind === 'function') {
      const declaration = publicFunctions.get(attempt.publicHaxe.qualifiedName);
      if (!declaration) throw new Error(`${attempt.publicHaxe.qualifiedName} is absent from the complete default web API`);
      return {
        ...attempt,
        publicHaxe: { ...attempt.publicHaxe, signature: `${normalizeNativeHaxeType(declaration.signature)};` },
      };
    }
    return {
      ...attempt,
      publicHaxe: {
        ...attempt.publicHaxe,
        typeIdentity: normalizeNativeHaxeType(attempt.publicHaxe.typeIdentity),
      },
    };
  });
const attemptsByOwner = Map.groupBy(unprovenAttempts, ({ publicHaxe }) => publicHaxe.owner);

const expected = new Map();
const manifestEntries = [];
for (const module of manifest.modules) {
  const holder = module.module.replace(/^flight\./u, '');
  const holderAttempts = attemptsByOwner.get(module.module) ?? [];
  attemptsByOwner.delete(module.module);
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
    } else if (provenance === optionalScalarOverrideProvenance) {
      if (plan) {
        throw new Error(`${publicName} is now compiler-planned; remove its downstream optional scalar override`);
      }
      validateOptionalScalarOverride(publicName, binding, declaration, parsed);
      plan = {
        headerStatus: 'pass',
        include: binding.header,
        kind: 'function',
        nativeName: binding.native,
        publicName,
        transport: 'direct',
      };
    } else if (provenance === arrayFloatAdapterProvenance) {
      if (plan) {
        throw new Error(`${publicName} is now compiler-planned; remove its downstream Array<Float> adapter`);
      }
      validateArrayFloatAdapter(publicName, binding, declaration, parsed);
      plan = {
        headerStatus: 'pass',
        include: binding.header,
        kind: 'function',
        nativeName: binding.native,
        publicName,
        transport: 'direct',
      };
    } else if (provenance === nullableStringAdapterProvenance) {
      if (plan) {
        throw new Error(`${publicName} is now compiler-planned; remove its downstream Null<String> adapter`);
      }
      validateNullableStringAdapter(publicName, binding, declaration, parsed);
      plan = {
        headerStatus: 'pass',
        include: binding.header,
        kind: 'function',
        nativeName: binding.native,
        publicName,
        transport: 'direct',
      };
    } else if (provenance === referenceCarrierProvenance) {
      if (plan) {
        throw new Error(`${publicName} is now compiler-planned; remove its downstream reference carrier`);
      }
      validateReferenceCarrier(publicName, binding, declaration, parsed);
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
  expected.set(
    path.join(root, 'src-cpp', 'flight', `${holder}.hx`),
    emitFacade(holder, bindings, nativeFacadeTypes.get(module.module), holderAttempts),
  );
  expected.set(
    path.join(root, 'src', 'flight', '_cpp', '_fn', `${holder}.hx`),
    emitExtern(holder, bindings),
  );
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

for (const [owner, holderAttempts] of [...attemptsByOwner].sort(([left], [right]) => compareText(left, right))) {
  const holder = owner.replace(/^flight\./u, '');
  if (!/^[A-Za-z_][A-Za-z0-9_]*$/u.test(holder)) throw new Error(`Unsupported native attempt owner ${owner}`);
  expected.set(
    path.join(root, 'src-cpp', 'flight', `${holder}.hx`),
    emitFacade(holder, [], nativeFacadeTypes.get(owner), holderAttempts),
  );
}

expected.set(
  path.join(root, 'src', 'flight', '_cpp', '_attempt', 'AttemptConfig.hx'),
  emitAttemptConfig(),
);
for (const attempt of unprovenAttempts) {
  expected.set(
    path.join(root, 'src', 'flight', '_cpp', '_attempt', `${attemptExternClass(attempt)}.hx`),
    emitAttemptExtern(attempt),
  );
}

expected.set(
  path.join(root, 'src-cpp', 'binding-attempts.json'),
  `${JSON.stringify(createBindingAttemptReport(unprovenAttempts), undefined, 2)}\n`,
);

const manifestPublicNames = manifestEntries.map(({ publicName }) => publicName);
const duplicatePublicNames = manifestPublicNames.filter((name, index) => manifestPublicNames.indexOf(name) !== index);
if (duplicatePublicNames.length > 0) {
  throw new Error(`Native manifest repeats public functions: ${[...new Set(duplicatePublicNames)].sort(compareText).join(', ')}`);
}
validateScalarOverrideRefusals(new Set(manifestPublicNames));
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
const generatedMarker = '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.\n';
const generatedPaths = [
  ...filesUnder(path.join(root, 'src', 'flight', '_cpp', '_fn')),
  ...filesUnder(path.join(root, 'src', 'flight', '_cpp', '_attempt')),
].filter((filename) => readFileSync(filename, 'utf8').startsWith(generatedMarker));
const stale = generatedPaths.filter((filename) => !expected.has(filename));
if (stale.length > 0) {
  if (check) {
    throw new Error(`Stale native function output must be removed: ${stale.map((filename) => path.relative(root, filename)).join(', ')}`);
  }
  for (const filename of stale) rmSync(filename);
}
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
    `${String(manifestEntries.filter(({ provenance }) => provenance === scalarOverrideProvenance).length)} required scalar override, ` +
    `${String(manifestEntries.filter(({ provenance }) => provenance === optionalScalarOverrideProvenance).length)} optional scalar adapter, ` +
    `${String(manifestEntries.filter(({ provenance }) => provenance === arrayFloatAdapterProvenance).length)} array carrier adapter, ` +
    `${String(manifestEntries.filter(({ provenance }) => provenance === nullableStringAdapterProvenance).length)} Null<String> adapter, ` +
    `${String(manifestEntries.filter(({ provenance }) => provenance === referenceCarrierProvenance).length)} reference carrier); ` +
    `${String(unprovenAttempts.filter(({ publicHaxe }) => publicHaxe.kind === 'function').length)} unproven function attempt(s) and ` +
    `${String(unprovenAttempts.filter(({ publicHaxe }) => publicHaxe.kind === 'value').length)} unproven value attempt(s) across ` +
    `${String(new Set(unprovenAttempts.map(({ publicHaxe }) => publicHaxe.owner)).size)} holder(s).\n`,
);

function emitFacade(holder, bindings, nativeType, attempts = []) {
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight;',
    '',
  ];
  if (nativeType) {
    const parameters = nativeType.genericArity > 0 ? `<${genericNames(nativeType.genericArity).join(', ')}>` : '';
    lines.push(`typedef ${holder}${parameters} = flight._cpp.${holder}${parameters};`, '');
  }
  for (const binding of bindings) {
    const { declaration, parsed } = binding;
    const inlineKind = binding.provenance === referenceCarrierProvenance ? 'extern inline' : 'inline';
    lines.push(`${inlineKind} ${declaration.signature} {`);
    const call = `flight._cpp._fn.${holder}.${declaration.name}(${facadeArguments(binding).join(', ')})`;
    lines.push(parsed.result === 'Void' ? `  ${call};` : `  return ${call};`);
    lines.push('}', '');
  }
  for (const attempt of attempts.sort(compareAttempts)) {
    if (attempt.publicHaxe.kind === 'function') {
      const parsed = parseAttemptSignature(attempt.publicHaxe.signature);
      // `extern inline` makes the attempted call exist at the public API while preventing Haxe
      // from emitting every sibling wrapper merely because a proven member imports this holder.
      // A selected attempt is still inlined and reaches the native symbol, so ABI failures remain
      // visible at its actual use site.
      lines.push(`extern inline ${attempt.publicHaxe.signature.slice(0, -1)} {`);
      const call = `flight._cpp._attempt.${attemptExternClass(attempt)}.${attempt.publicHaxe.name}(${parsed.parameters.map(({ call }) => call).join(', ')})`;
      lines.push(parsed.result === 'Void' ? `  ${call};` : `  return ${call};`);
      lines.push('}', '');
      continue;
    }
    const { name, typeIdentity } = attempt.publicHaxe;
    lines.push(`var ${name}(get, set):${typeIdentity};`, '');
    lines.push(`private extern inline function get_${name}():${typeIdentity} return flight._cpp._attempt.${attemptExternClass(attempt)}.${name};`, '');
    lines.push(
      `private extern inline function set_${name}(value:${typeIdentity}):${typeIdentity} return flight._cpp._attempt.${attemptExternClass(attempt)}.${name} = value;`,
      '',
    );
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
  const includes = [...new Set([
    ...(direct.length > 0 ? [`flight_hx/${holder.toLowerCase()}.hpp`] : []),
    ...adapters.map((binding) => `flight_hx/adapters/${adapterIdentity(binding).name}.hpp`),
  ])].sort(compareText);
  const sourceFiles = sources
    .map((source) => `  <file name="\${removeQuotes:flight_hx_root}/src-cpp/src/${source}" />`)
    .join('\n');
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight._cpp._fn;',
    '',
    '#if cpp',
    'import flight.*;',
    emitBuildXml(sourceFiles),
    ...includes.map((include) => `@:include(${JSON.stringify(include)})`),
    `extern class ${holder} {`,
  ];
  for (const binding of bindings) {
    const { declaration, native } = binding;
    lines.push(`  @:native(${JSON.stringify(native.replace(/^flight::/u, 'flight_hx::'))})`);
    lines.push(`  static ${emitInternalSignature(binding)};`, '');
  }
  if (lines.at(-1) === '') lines.pop();
  lines.push('}', '#end', '');
  return lines.join('\n');
}

function emitAttemptExtern(attempt) {
  const className = attemptExternClass(attempt);
  const nativeName = `${attempt.cpp.locator.namespace}::${attempt.cpp.locator.spelling}`;
  const declaration =
    attempt.publicHaxe.kind === 'function'
      ? `  public static ${attempt.publicHaxe.signature}`
      : `  public static var ${attempt.publicHaxe.name}:${attempt.publicHaxe.typeIdentity};`;
  return [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight._cpp._attempt;',
    '',
    '#if cpp',
    'import flight.*;',
    `@:include(${JSON.stringify(attempt.cpp.locator.include)})`,
    `extern class ${className} extends AttemptConfig {`,
    `  @:native(${JSON.stringify(nativeName)})`,
    declaration,
    '}',
    '#end',
    '',
  ].join('\n');
}

function emitAttemptConfig() {
  return [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    'package flight._cpp._attempt;',
    '',
    '#if cpp',
    emitBuildXml(''),
    'extern class AttemptConfig {}',
    '#end',
    '',
  ].join('\n');
}

function emitBuildXml(sourceFiles) {
  return `@:buildXml('\n<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />\n<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />\n<set name="NO_PRECOMPILED_HEADERS" value="1" />\n<set name="HXCPP_NO_CPP11" value="1" />\n<unset name="HXCPP_CPP11" />\n<files id="haxe">\n${sourceFiles}\n  <compilerflag value="/std:c++20" if="windows" />\n  <compilerflag value="-std=c++20" unless="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_cpp_root}/generated/include" if="windows" />\n  <compilerflag value="/I\${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />\n  <compilerflag value="-I\${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />\n</files>\n')`;
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

function validateOptionalScalarOverride(publicName, binding, declaration, parsed) {
  if (flightCppHeaderStatuses.get(binding.header) !== 'emitted') {
    throw new Error(`${publicName} optional override header is not dependency-complete: ${binding.header}`);
  }
  if (
    !parsed.parameters.some(({ optional }) => optional) ||
    parsed.parameters.some(({ type }) => type === 'String') ||
    parsed.result === 'String'
  ) {
    throw new Error(`${publicName} optional override is not an optional primitive scalar signature`);
  }
  const firstOptional = parsed.parameters.findIndex(({ optional }) => optional);
  if (parsed.parameters.slice(firstOptional).some(({ optional }) => !optional)) {
    throw new Error(`${publicName} optional override has a required parameter after an optional parameter`);
  }
  const cppName = camelToSnake(declaration.sourceName);
  if (!binding.native.endsWith(`::${cppName}`)) {
    throw new Error(`${publicName} optional override native locator does not end in ${cppName}`);
  }
  const headerPath = path.join(flightCpp.directory, 'generated', 'include', binding.header);
  if (!existsSync(headerPath)) throw new Error(`${publicName} optional override header is missing: ${binding.header}`);
  const parameterPattern = parsed.parameters
    .map(({ optional, type }) => {
      const typePattern = optional ? `std::optional<${cppType(type)}>` : cppType(type);
      const defaultPattern = optional ? '\\s*=\\s*std::nullopt' : '';
      return `${escapeRegExp(typePattern)}\\s+[A-Za-z_][A-Za-z0-9_]*${defaultPattern}`;
    })
    .join('\\s*,\\s*');
  const signaturePattern = new RegExp(
    `\\binline\\s+${escapeRegExp(cppType(parsed.result))}\\s+${escapeRegExp(cppName)}\\s*\\(${parameterPattern}\\)`,
    'u',
  );
  if (!signaturePattern.test(readFileSync(headerPath, 'utf8'))) {
    throw new Error(`${publicName} optional override header does not contain the exact optional scalar signature`);
  }
}

function validateArrayFloatAdapter(publicName, binding, declaration, parsed) {
  if (flightCppHeaderStatuses.get(binding.header) !== 'emitted') {
    throw new Error(`${publicName} Array<Float> adapter header is not dependency-complete: ${binding.header}`);
  }
  const allowed = new Set(['Array<Array<Float>>', 'Array<Float>', 'Bool', 'Float', 'Void']);
  const types = [...parsed.parameters.map(({ type }) => type), parsed.result];
  if (!types.some((type) => isArrayFloatType(type)) || types.some((type) => !allowed.has(type))) {
    throw new Error(`${publicName} is not an Array<Float> carrier plus primitive signature`);
  }
  const firstOptional = parsed.parameters.findIndex(({ optional }) => optional);
  if (firstOptional >= 0 && parsed.parameters.slice(firstOptional).some(({ optional }) => !optional)) {
    throw new Error(`${publicName} Array<Float> adapter has a required parameter after an optional parameter`);
  }
  const cppName = camelToSnake(declaration.sourceName);
  if (!binding.native.endsWith(`::${cppName}`)) {
    throw new Error(`${publicName} Array<Float> adapter native locator does not end in ${cppName}`);
  }
  const headerPath = path.join(flightCpp.directory, 'generated', 'include', binding.header);
  if (!existsSync(headerPath)) throw new Error(`${publicName} Array<Float> adapter header is missing: ${binding.header}`);
  const parameterPattern = parsed.parameters
    .map(({ optional, type }) => {
      const typePattern = optional ? `std::optional<${flightCppType(type)}>` : flightCppType(type);
      const defaultPattern = optional ? '\\s*=\\s*std::nullopt' : '';
      return `${escapeRegExp(typePattern)}\\s+[A-Za-z_][A-Za-z0-9_]*${defaultPattern}`;
    })
    .join('\\s*,\\s*');
  const signaturePattern = new RegExp(
    `\\binline\\s+${escapeRegExp(flightCppType(parsed.result))}\\s+${escapeRegExp(cppName)}\\s*\\(${parameterPattern}\\)`,
    'u',
  );
  const packageHeaders = filesUnder(path.dirname(headerPath))
    .filter((filename) => filename.endsWith('.hpp'))
    .map((filename) => readFileSync(filename, 'utf8'))
    .join('\n');
  if (!signaturePattern.test(packageHeaders)) {
    throw new Error(`${publicName} Array<Float> adapter cannot find its exact native signature`);
  }
}

function validateNullableStringAdapter(publicName, binding, declaration, parsed) {
  if (flightCppHeaderStatuses.get(binding.header) !== 'emitted') {
    throw new Error(`${publicName} Null<String> adapter header is not dependency-complete: ${binding.header}`);
  }
  if (
    parsed.result !== 'Null<String>' ||
    parsed.parameters.some(({ optional, type }) => optional || type !== 'String')
  ) {
    throw new Error(`${publicName} is not a required String to Null<String> signature`);
  }
  const cppName = camelToSnake(declaration.sourceName);
  if (!binding.native.endsWith(`::${cppName}`)) {
    throw new Error(`${publicName} Null<String> adapter native locator does not end in ${cppName}`);
  }
  const headerPath = path.join(flightCpp.directory, 'generated', 'include', binding.header);
  const parameterPattern = parsed.parameters.map(() => 'flight::String\\s+[A-Za-z_][A-Za-z0-9_]*').join('\\s*,\\s*');
  const signaturePattern = new RegExp(
    `\\binline\\s+std::optional<flight::String>\\s+${escapeRegExp(cppName)}\\s*\\(${parameterPattern}\\)`,
    'u',
  );
  const packageHeaders = filesUnder(path.dirname(headerPath))
    .filter((filename) => filename.endsWith('.hpp'))
    .map((filename) => readFileSync(filename, 'utf8'))
    .join('\n');
  if (!signaturePattern.test(packageHeaders)) {
    throw new Error(`${publicName} Null<String> adapter cannot find its exact native signature`);
  }
}

function validateReferenceCarrier(publicName, binding, declaration, parsed) {
  if (flightCppHeaderStatuses.get(binding.header) !== 'emitted') {
    throw new Error(`${publicName} reference carrier header is not dependency-complete: ${binding.header}`);
  }
  const types = [...parsed.parameters.map(({ type }) => type), parsed.result];
  const referenceTypes = types.filter((type) => isReferenceCarrierType(type));
  if (
    referenceTypes.length === 0 ||
    types.some(
      (type) => !new Set(['Bool', 'Float', 'String', 'Null<String>', 'Void']).has(type) && !isReferenceCarrierType(type),
    ) ||
    parsed.parameters.some(({ type }) => nullableReferenceInner(type))
  ) {
    throw new Error(`${publicName} is not a reference carrier plus primitive signature`);
  }
  const firstOptional = parsed.parameters.findIndex(({ optional }) => optional);
  if (firstOptional >= 0 && parsed.parameters.slice(firstOptional).some(({ optional }) => !optional)) {
    throw new Error(`${publicName} reference carrier has a required parameter after an optional parameter`);
  }
  const attempt = attemptedFunctions.get(publicName);
  const locator = attempt?.cpp?.availability === 'available' ? attempt.cpp.locator : undefined;
  if (!locator) {
    throw new Error(`${publicName} reference carrier has no compiler/flight-cpp function locator`);
  }
  const expectedNativeName = `${locator.namespace}::${locator.spelling}`;
  if (binding.native !== expectedNativeName || binding.header !== locator.include) {
    throw new Error(
      `${publicName} reference carrier locator drifted: ` +
        `${binding.native} in ${binding.header} != ${expectedNativeName} in ${locator.include}`,
    );
  }
  const cppName = locator.spelling;
  const headerPath = path.join(flightCpp.directory, 'generated', 'include', binding.header);
  if (!existsSync(headerPath)) {
    throw new Error(`${publicName} reference carrier header is missing: ${binding.header}`);
  }
  const parameterPattern = parsed.parameters
    .map(({ optional, type }) => {
      if (nativeReferenceTypes.has(type)) {
        const nativeType = cppType(type);
        const structuralReadonly =
          `flight::StructuralRef<flight::RowReadonly<flight::RowOf<${nativeType}>>>`;
        const typePattern = `(?:${escapeRegExp(nativeType)}|${escapeRegExp(structuralReadonly)})`;
        const optionalPattern = optional ? `std::optional<${typePattern}>` : typePattern;
        const defaultPattern = optional ? '\\s*=\\s*std::nullopt' : '';
        return `${optionalPattern}\\s+[A-Za-z_][A-Za-z0-9_]*${defaultPattern}`;
      }
      const typePattern = optional ? `std::optional<${flightCppType(type)}>` : flightCppType(type);
      const defaultPattern = optional ? '\\s*=\\s*std::nullopt' : '';
      return `${escapeRegExp(typePattern)}\\s+[A-Za-z_][A-Za-z0-9_]*${defaultPattern}`;
    })
    .join('\\s*,\\s*');
  const signaturePattern = new RegExp(
    `\\binline\\s+${nativeResultPattern(parsed.result)}\\s+${escapeRegExp(cppName)}\\s*\\(${parameterPattern}\\)`,
    'u',
  );
  const packageHeaders = filesUnder(path.dirname(headerPath))
    .filter((filename) => filename.endsWith('.hpp'))
    .map((filename) => readFileSync(filename, 'utf8'))
    .join('\n');
  if (!signaturePattern.test(packageHeaders)) {
    throw new Error(`${publicName} reference carrier cannot find its exact native signature`);
  }
}

function validateScalarOverrideRefusals(boundPublicNames) {
  const seen = new Set();
  for (const refusal of manifest.scalarOverrideRefusals ?? []) {
    if (seen.has(refusal.publicName)) throw new Error(`Duplicate scalar override refusal ${refusal.publicName}`);
    seen.add(refusal.publicName);
    if (refusal.code !== 'flight-cpp-header-compile-failed') {
      throw new Error(`${refusal.publicName} has unknown scalar override refusal ${String(refusal.code)}`);
    }
    if (!publicFunctions.has(refusal.publicName)) {
      throw new Error(`Scalar override refusal is absent from the default web API: ${refusal.publicName}`);
    }
    if (planned.has(refusal.publicName)) {
      throw new Error(`${refusal.publicName} is now compiler-planned; remove its scalar override refusal`);
    }
    if (boundPublicNames.has(refusal.publicName)) {
      throw new Error(`${refusal.publicName} is both bound and recorded as a scalar override refusal`);
    }
    if (flightCppHeaderStatuses.get(refusal.header) !== 'emitted') {
      throw new Error(`${refusal.publicName} refusal header status drifted: ${refusal.header}`);
    }
    if (typeof refusal.detail !== 'string' || refusal.detail.length === 0) {
      throw new Error(`${refusal.publicName} scalar override refusal has no diagnostic detail`);
    }
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
  const borrowedStringReturn = '  return ::String(haxe_result_utf8.data(), haxe_result_utf8.size());';
  if (source.includes(borrowedStringReturn)) {
    source = replaceExactly(
      source,
      '#include <hxcpp.h>\n',
      '#include <hxcpp.h>\n#include <limits>\n#include <stdexcept>\n',
    );
    source = replaceExactly(source, borrowedStringReturn, haxeStringCopyLines('haxe_result_utf8').join('\n'));
  }
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
  const referenceTypeNames = [...new Set(
    bindings
      .flatMap(({ parsed }) => [...parsed.parameters.map(({ type }) => type), parsed.result])
      .map((type) => nativeReferenceTypes.get(nullableReferenceInner(type) ?? type)?.nativeName)
      .filter(Boolean)
      .map((nativeName) => {
        const match = /^flight::Ref<flight::types::([A-Za-z_][A-Za-z0-9_]*)>$/u.exec(nativeName);
        if (!match) throw new Error(`Reference carrier cannot be forward-declared: ${nativeName}`);
        return match[1];
      }),
  )].sort(compareText);
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    '#pragma once',
    ...(bindings.some(
      (binding) =>
        isArrayFloatAdapter(binding) ||
        isNullableStringAdapter(binding) ||
        [...binding.parsed.parameters.map(({ type }) => type), binding.parsed.result].some(
          (type) => type === 'String' || type === 'Null<String>',
        ),
    )
      ? ['#include <hxcpp.h>']
      : []),
    ...(referenceTypeNames.length > 0 ? ['#include <flight_hx/types/reference_fwd.hpp>'] : []),
    '',
    '// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.',
    `namespace flight_hx::${namespace} {`,
    '',
  ];
  for (const binding of bindings) {
    const { native, parsed } = binding;
    const functionName = native.slice(native.lastIndexOf('::') + 2);
    const parameters = bridgeParameters(binding)
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
  const needsArrayFloatAdapter = bindings.some(isArrayFloatAdapter);
  const needsStringCopy = bindings.some(
    (binding) =>
      isNullableStringAdapter(binding) ||
      [...binding.parsed.parameters.map(({ type }) => type), binding.parsed.result].some(
        (type) => type === 'String' || type === 'Null<String>',
      ),
  );
  const needsNestedArrayAdapter = bindings.some(
    (binding) =>
      isArrayFloatAdapter(binding) &&
      (binding.parsed.result === 'Array<Array<Float>>' ||
        binding.parsed.parameters.some(({ type }) => type === 'Array<Array<Float>>')),
  );
  const lines = [
    '// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.',
    ...(needsArrayFloatAdapter ? ['#include <limits>', '#include <stdexcept>'] : []),
    ...(needsStringCopy
      ? [...(needsArrayFloatAdapter ? [] : ['#include <limits>', '#include <stdexcept>']), '#include <string>']
      : []),
    ...[...new Set(bindings.map(({ header }) => header))].sort(compareText).map((header) => `#include <${header}>`),
    `#include <flight_hx/${holder}.hpp>`,
    '',
    `namespace flight_hx::${namespace} {`,
    '',
  ];
  if (needsArrayFloatAdapter) {
    lines.push(
      'namespace {',
      '',
      'flight::Array<double> to_flight_array(const ::Array<double>& source) {',
      '  flight::Array<double> result;',
      '  for (int index = 0; index < source->length; ++index) result.push(source[index]);',
      '  return result;',
      '}',
      '',
      '::Array<double> to_haxe_array(const flight::Array<double>& source) {',
      '  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {',
      '    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");',
      '  }',
      '  ::Array<double> result = ::Array_obj<double>::__new(static_cast<int>(source.size()));',
      '  int index = 0;',
      '  for (const double value : source) result[index++] = value;',
      '  return result;',
      '}',
      '',
      'void replace_haxe_array(::Array<double> destination, const flight::Array<double>& source) {',
      '  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {',
      '    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");',
      '  }',
      '  destination->resize(static_cast<int>(source.size()));',
      '  int index = 0;',
      '  for (const double value : source) destination[index++] = value;',
      '}',
      '',
      ...(needsNestedArrayAdapter
        ? [
      'flight::Array<flight::Array<double>> to_flight_nested_array(const ::Array<::Array<double>>& source) {',
      '  flight::Array<flight::Array<double>> result;',
      '  for (int index = 0; index < source->length; ++index) {',
      '    bool reused = false;',
      '    for (int previous = 0; previous < index; ++previous) {',
      '      if (source[index].GetPtr() == source[previous].GetPtr()) {',
      '        result.push(result[static_cast<std::size_t>(previous)]);',
      '        reused = true;',
      '        break;',
      '      }',
      '    }',
      '    if (!reused) result.push(to_flight_array(source[index]));',
      '  }',
      '  return result;',
      '}',
      '',
      '::Array<::Array<double>> to_haxe_nested_array(const flight::Array<flight::Array<double>>& source) {',
      '  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {',
      '    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");',
      '  }',
      '  ::Array<::Array<double>> result = ::Array_obj<::Array<double>>::__new(static_cast<int>(source.size()));',
      '  for (std::size_t index = 0; index < source.size(); ++index) {',
      '    bool reused = false;',
      '    for (std::size_t previous = 0; previous < index; ++previous) {',
      '      if (source[index].identity() == source[previous].identity()) {',
      '        result[static_cast<int>(index)] = result[static_cast<int>(previous)];',
      '        reused = true;',
      '        break;',
      '      }',
      '    }',
      '    if (!reused) result[static_cast<int>(index)] = to_haxe_array(source[index]);',
      '  }',
      '  return result;',
      '}',
      '',
      'void replace_haxe_nested_array(::Array<::Array<double>> destination, const flight::Array<flight::Array<double>>& source) {',
      '  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {',
      '    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");',
      '  }',
      '  destination->resize(static_cast<int>(source.size()));',
      '  for (std::size_t index = 0; index < source.size(); ++index) {',
      '    bool reused = false;',
      '    for (std::size_t previous = 0; previous < index; ++previous) {',
      '      if (source[index].identity() == source[previous].identity()) {',
      '        destination[static_cast<int>(index)] = destination[static_cast<int>(previous)];',
      '        reused = true;',
      '        break;',
      '      }',
      '    }',
      '    if (reused) continue;',
      '    ::Array<double> item = destination[static_cast<int>(index)];',
      '    if (!item.GetPtr()) item = ::Array_obj<double>::__new();',
      '    replace_haxe_array(item, source[index]);',
      '    destination[static_cast<int>(index)] = item;',
      '  }',
      '}',
      '',
          ]
        : []),
      '} // namespace',
      '',
    );
  }
  for (const binding of bindings) {
    const { native, parsed } = binding;
    const functionName = native.slice(native.lastIndexOf('::') + 2);
    const parameters = bridgeParameters(binding)
      .map(({ name, type }) => `${cppType(type)} ${safeCppName(name)}`)
      .join(', ');
    if (isArrayFloatAdapter(binding)) {
      emitArrayFloatBridgeBody(lines, binding, functionName, parameters);
      continue;
    }
    if (isNullableStringAdapter(binding)) {
      emitNullableStringBridgeBody(lines, binding, functionName, parameters);
      continue;
    }
    const arguments_ = nativeArguments(binding).join(', ');
    lines.push(`${cppType(parsed.result)} ${functionName}(${parameters}) {`);
    const call = `${native}(${arguments_})`;
    if (nullableReferenceInner(parsed.result)) {
      lines.push(`  const auto result = ${call};`);
      lines.push(`  return result.has_value() ? ${cppType(parsed.result)}{result.value()} : ${cppType(parsed.result)}{};`);
    } else if (parsed.result === 'Null<String>') {
      lines.push(`  const auto result = ${call};`);
      lines.push('  if (!result.has_value()) return null();');
      lines.push('  const std::string result_utf8 = result->to_utf8();');
      lines.push(...haxeStringCopyLines('result_utf8'));
    } else if (parsed.result === 'String') {
      lines.push(`  const auto result = ${call};`);
      lines.push('  const std::string result_utf8 = result.to_utf8();');
      lines.push(...haxeStringCopyLines('result_utf8'));
    } else {
      lines.push(parsed.result === 'Void' ? `  ${call};` : `  return ${call};`);
    }
    lines.push('}', '');
  }
  lines.push(`} // namespace flight_hx::${namespace}`, '');
  return lines.join('\n');
}

function bridgeParameters(binding) {
  if (!usesExpandedOptionalParameters(binding)) return binding.parsed.parameters;
  return binding.parsed.parameters.flatMap((parameter) =>
    parameter.optional
      ? [
          { name: `${parameter.name}Present`, optional: false, type: 'Bool' },
          { ...parameter, optional: false },
        ]
      : [parameter],
  );
}

function facadeArguments(binding) {
  if (!usesExpandedOptionalParameters(binding)) {
    return binding.parsed.parameters.map(({ name }) => name);
  }
  return binding.parsed.parameters.flatMap(({ name, optional, type }) =>
    optional ? [`${name} != null`, `${name} == null ? ${haxeZero(type)} : ${name}`] : [name],
  );
}

function nativeArguments(binding) {
  if (!usesExpandedOptionalParameters(binding)) {
    return binding.parsed.parameters.map(({ name, optional, type }) => {
      const nativeName = safeCppName(name);
      if (!optional) return nativeArgumentValue(nativeName, type);
      if (!nativeReferenceTypes.has(type)) return nativeArgumentValue(nativeName, type);
      return `(${nativeName} ? std::optional<${cppType(type)}>{${nativeName}} : std::nullopt)`;
    });
  }
  return binding.parsed.parameters.map(({ name, optional, type }) => {
    const nativeName = safeCppName(name);
    const value = nativeArgumentValue(nativeName, type);
    if (!optional) return value;
    return `(${safeCppName(`${name}Present`)} ? std::optional<${flightCppType(type)}>{${value}} : std::nullopt)`;
  });
}

function nativeArgumentValue(name, type) {
  return type === 'String' ? `flight::String::from_utf8(${name}.utf8_str())` : name;
}

function usesExpandedOptionalParameters(binding) {
  return (
    binding.provenance === optionalScalarOverrideProvenance ||
    (binding.provenance === arrayFloatAdapterProvenance && binding.parsed.parameters.some(({ optional }) => optional)) ||
    (binding.provenance === referenceCarrierProvenance &&
      binding.parsed.parameters.some(({ optional, type }) => optional && !nativeReferenceTypes.has(type)))
  );
}

function isArrayFloatAdapter(binding) {
  return binding.provenance === arrayFloatAdapterProvenance;
}

function isNullableStringAdapter(binding) {
  return binding.provenance === nullableStringAdapterProvenance;
}

function nullableReferenceInner(type) {
  const match = /^Null<(flight\.[A-Z][A-Za-z0-9_]*)>$/u.exec(type);
  return match && nativeReferenceTypes.has(match[1]) ? match[1] : undefined;
}

function isReferenceCarrierType(type) {
  return nativeReferenceTypes.has(type) || nullableReferenceInner(type) !== undefined;
}

function nativeResultPattern(type) {
  const inner = nullableReferenceInner(type);
  if (inner) return escapeRegExp(`std::optional<${cppType(inner)}>`);
  if (type === 'Null<String>') return escapeRegExp('std::optional<flight::String>');
  return escapeRegExp(flightCppType(type));
}

function isArrayFloatType(type) {
  return type === 'Array<Float>' || type === 'Array<Array<Float>>';
}

function emitArrayFloatBridgeBody(lines, binding, functionName, parameters) {
  const arrayParameters = binding.parsed.parameters.filter(({ type }) => isArrayFloatType(type));
  lines.push(`${cppType(binding.parsed.result)} ${functionName}(${parameters}) {`);
  for (let index = 0; index < arrayParameters.length; index += 1) {
    const parameter = arrayParameters[index];
    const name = safeCppName(parameter.name);
    const earlier = arrayParameters.slice(0, index).filter(({ type }) => type === parameter.type);
    const converter = parameter.type === 'Array<Float>' ? 'to_flight_array' : 'to_flight_nested_array';
    const conversion = earlier.reduceRight(
      (fallback, previous) => {
        const previousName = safeCppName(previous.name);
        return `${name}.GetPtr() == ${previousName}.GetPtr() ? flight_${previousName} : (${fallback})`;
      },
      `${converter}(${name})`,
    );
    lines.push(`  auto flight_${name} = ${conversion};`);
  }
  const arguments_ = binding.parsed.parameters.map(({ name, optional, type }) => {
    const cppName = safeCppName(name);
    const value = isArrayFloatType(type) ? `flight_${cppName}` : cppName;
    if (!optional) return value;
    return `(${safeCppName(`${name}Present`)} ? std::optional<${flightCppType(type)}>{${value}} : std::nullopt)`;
  });
  const call = `${binding.native}(${arguments_.join(', ')})`;
  if (binding.parsed.result === 'Void') lines.push(`  ${call};`);
  else lines.push(`  auto result = ${call};`);
  for (const parameter of arrayParameters) {
    const name = safeCppName(parameter.name);
    const replacer = parameter.type === 'Array<Float>' ? 'replace_haxe_array' : 'replace_haxe_nested_array';
    const statement = `${replacer}(${name}, flight_${name});`;
    lines.push(parameter.optional ? `  if (${safeCppName(`${parameter.name}Present`)}) ${statement}` : `  ${statement}`);
  }
  if (isArrayFloatType(binding.parsed.result)) {
    for (const parameter of arrayParameters) {
      if (parameter.type !== binding.parsed.result) continue;
      const name = safeCppName(parameter.name);
      const condition = `result.identity() == flight_${name}.identity()`;
      lines.push(parameter.optional ? `  if (${safeCppName(`${parameter.name}Present`)} && ${condition}) return ${name};` : `  if (${condition}) return ${name};`);
    }
    lines.push(
      binding.parsed.result === 'Array<Float>'
        ? '  return to_haxe_array(result);'
        : '  return to_haxe_nested_array(result);',
    );
  } else if (binding.parsed.result !== 'Void') {
    lines.push('  return result;');
  }
  lines.push('}', '');
}

function emitNullableStringBridgeBody(lines, binding, functionName, parameters) {
  lines.push(`${cppType(binding.parsed.result)} ${functionName}(${parameters}) {`);
  for (const parameter of binding.parsed.parameters) {
    const name = safeCppName(parameter.name);
    if (parameter.type === 'String') {
      lines.push(`  const flight::String flight_${name} = flight::String::from_utf8(${name}.utf8_str());`);
    }
  }
  const arguments_ = binding.parsed.parameters.map(({ name, type }) => {
    const cppName = safeCppName(name);
    return type === 'String' ? `flight_${cppName}` : cppName;
  });
  lines.push(`  const auto result = ${binding.native}(${arguments_.join(', ')});`);
  lines.push('  if (!result.has_value()) return null();');
  lines.push('  const std::string result_utf8 = result->to_utf8();');
  lines.push(...haxeStringCopyLines('result_utf8'));
  lines.push('}', '');
}

function haxeStringCopyLines(name) {
  return [
    `  if (${name}.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {`,
    '    throw std::length_error("Flight String exceeds the hxcpp String length limit");',
    '  }',
    `  return ::String::create(${name}.data(), static_cast<int>(${name}.size()));`,
  ];
}

function emitInternalSignature(binding) {
  const parameters = bridgeParameters(binding)
    .map(({ name, type }) => `${name}:${type}`)
    .join(', ');
  return `function ${binding.declaration.name}(${parameters}):${binding.parsed.result}`;
}

function createBindingAttemptReport(attempts) {
  const declarations = attempts.sort(compareAttempts).map(({ cpp, haxeCpp, package: packageName, publicHaxe, source }) => ({
    carrierFamilies: classifyAttemptCarriers(publicHaxe),
    externClass: `flight._cpp._attempt.${attemptExternClass({ publicHaxe })}`,
    header: cpp.locator.include,
    kind: publicHaxe.kind,
    nativeName: `${cpp.locator.namespace}::${cpp.locator.spelling}`,
    package: packageName,
    publicName: publicHaxe.qualifiedName,
    refusal: haxeCpp.refusal,
    source,
    status: 'materialized-unproven',
    transport: 'isolated-extern-inline',
  }));
  const carrierFamilies = Object.entries(
    declarations.flatMap(({ carrierFamilies: families }) => families).reduce((counts, family) => {
      counts[family] = (counts[family] ?? 0) + 1;
      return counts;
    }, {}),
  )
    .sort(([left], [right]) => compareText(left, right))
    .map(([name, count]) => ({ count, name }));
  return {
    compileProbes: [],
    declarations,
    pins: planning.pins,
    schema: 'flight-hx-native-binding-attempts/1',
    summary: {
      functions: declarations.filter(({ kind }) => kind === 'function').length,
      carrierFamilies,
      holders: new Set(attempts.map(({ publicHaxe }) => publicHaxe.owner)).size,
      isolatedExterns: declarations.length,
      total: declarations.length,
      values: declarations.filter(({ kind }) => kind === 'value').length,
    },
  };
}

function classifyAttemptCarriers(publicHaxe) {
  const source = publicHaxe.kind === 'function' ? publicHaxe.signature : publicHaxe.typeIdentity;
  const families = [];
  if (/^function\s+[A-Za-z_][A-Za-z0-9_]*</u.test(source)) families.push('generic-function');
  if (source.includes('Array<')) families.push('array');
  if (/flight\._internal\._(?:UInt|Int|Float|ArrayBuffer)/u.test(source)) families.push('typed-array');
  if (source.includes('Null<')) families.push('nullable');
  if (source.includes('Dynamic')) families.push('dynamic');
  if (source.includes('->')) families.push('callback');
  if (/\{[^}]*:/u.test(source)) families.push('anonymous-structure');
  const namedTokens = [...source.matchAll(/\b(?:flight\.)?([A-Z][A-Za-z0-9_]*)\b/gu)]
    .map((match) => match[1])
    .filter((name) => !new Set(['Array', 'Bool', 'Dynamic', 'Float', 'Int', 'Null', 'String', 'Void']).has(name));
  if (namedTokens.length > 0) {
    families.push('named');
  }
  if (families.length === 0) families.push(publicHaxe.kind === 'value' ? 'scalar-value' : 'scalar');
  return [...new Set(families)].sort(compareText);
}

function parseAttemptSignature(signature) {
  const nameMatch = /^function\s+([A-Za-z_][A-Za-z0-9_]*)/u.exec(signature);
  if (!nameMatch || !signature.endsWith(';')) throw new Error(`Unsupported native attempt signature: ${signature}`);
  const open = signature.indexOf('(', nameMatch[0].length);
  if (open < 0) throw new Error(`Native attempt signature has no parameter list: ${signature}`);
  const close = matchingDelimiter(signature, open, '(', ')');
  if (signature[close + 1] !== ':') throw new Error(`Native attempt signature has no result type: ${signature}`);
  const parameterSource = signature.slice(open + 1, close);
  const parameters = parameterSource
    ? splitHaxeTopLevel(parameterSource).map((parameter) => {
        const match = /^(\.\.\.)?\??([A-Za-z_][A-Za-z0-9_]*)\s*:/u.exec(parameter);
        if (!match) throw new Error(`Unsupported native attempt parameter ${parameter} in ${signature}`);
        return { call: `${match[1] ?? ''}${match[2]}`, name: match[2] };
      })
    : [];
  return { parameters, result: signature.slice(close + 2, -1) };
}

function matchingDelimiter(source, start, open, close) {
  let depth = 0;
  for (let index = start; index < source.length; index += 1) {
    if (source[index] === open) depth += 1;
    else if (source[index] === close) depth -= 1;
    if (depth === 0) return index;
  }
  throw new Error(`Unterminated ${open}${close} group in ${source}`);
}

function splitHaxeTopLevel(source) {
  const result = [];
  let start = 0;
  const depth = { angle: 0, brace: 0, bracket: 0, parenthesis: 0 };
  for (let index = 0; index < source.length; index += 1) {
    const character = source[index];
    if (character === '<') depth.angle += 1;
    else if (character === '>' && source[index - 1] !== '-') depth.angle -= 1;
    else if (character === '{') depth.brace += 1;
    else if (character === '}') depth.brace -= 1;
    else if (character === '[') depth.bracket += 1;
    else if (character === ']') depth.bracket -= 1;
    else if (character === '(') depth.parenthesis += 1;
    else if (character === ')') depth.parenthesis -= 1;
    else if (character === ',' && Object.values(depth).every((value) => value === 0)) {
      result.push(source.slice(start, index).trim());
      start = index + 1;
    }
  }
  result.push(source.slice(start).trim());
  return result;
}

function genericNames(arity) {
  return Array.from({ length: arity }, (_, index) => `T${String(index)}`);
}

function compareAttempts(left, right) {
  return compareText(left.publicHaxe.qualifiedName, right.publicHaxe.qualifiedName);
}

function attemptExternClass(attempt) {
  const holder = attempt.publicHaxe.owner.replace(/^flight\./u, '');
  const { name } = attempt.publicHaxe;
  if (!/^[A-Za-z_][A-Za-z0-9_]*$/u.test(holder) || !/^[A-Za-z_][A-Za-z0-9_]*$/u.test(name)) {
    throw new Error(`Unsupported attempted extern identity ${attempt.publicHaxe.qualifiedName}`);
  }
  return `Attempt_${holder}_${name}`;
}

function normalizeNativeHaxeType(source) {
  return source
    .replaceAll('js.html.audio.AudioBuffer', 'flight.AudioBuffer')
    .replaceAll('js.html.AbortSignal', 'flight.AbortSignal')
    .replaceAll('js.html.Blob', 'flight.Blob');
}

function haxeZero(type) {
  if (type === 'Bool') return 'false';
  if (type === 'Float') return '0.0';
  if (type === 'Array<Float>') return '([] : Array<Float>)';
  if (type === 'Array<Array<Float>>') return '([] : Array<Array<Float>>)';
  throw new Error(`Unsupported optional native Haxe carrier ${type}`);
}

function parseSignature(signature) {
  const typePattern = '(?:Array<Array<Float>>|Array<Float>|Null<String>|Null<flight\\.[A-Z][A-Za-z0-9_]*>|Bool|Float|String|Void|flight\\.[A-Z][A-Za-z0-9_]*)';
  const match = new RegExp(`^function ([A-Za-z_][A-Za-z0-9_]*)\\((.*)\\):(${typePattern})$`, 'u').exec(signature);
  if (!match) throw new Error(`Native function has unsupported Haxe signature: ${signature}`);
  const parameters = match[2]
    ? match[2].split(', ').map((parameter) => {
        const parsed = new RegExp(`^(\\??)([A-Za-z_][A-Za-z0-9_]*):(${typePattern})$`, 'u').exec(parameter);
        if (!parsed) throw new Error(`Native function has unsupported parameter: ${parameter}`);
        return { name: parsed[2], optional: parsed[1] === '?', type: parsed[3] };
      })
    : [];
  return { name: match[1], parameters, result: match[3] };
}

function cppType(type) {
  if (type === 'Array<Array<Float>>') return '::Array<::Array<double>>';
  if (type === 'Array<Float>') return '::Array<double>';
  if (type === 'Bool') return 'bool';
  if (type === 'Float') return 'double';
  if (type === 'Null<String>' || type === 'String') return '::String';
  if (type === 'Void') return 'void';
  if (nullableReferenceInner(type)) {
    return nativeReferenceTypes.get(nullableReferenceInner(type)).nativeName.replace(/^flight::Ref</u, 'flight_hx::Ref<');
  }
  if (nativeReferenceTypes.has(type)) return nativeReferenceTypes.get(type).nativeName;
  throw new Error(`Unsupported native C++ carrier ${type}`);
}

function flightCppType(type) {
  if (type === 'Array<Array<Float>>') return 'flight::Array<flight::Array<double>>';
  if (type === 'Array<Float>') return 'flight::Array<double>';
  if (type === 'String') return 'flight::String';
  return cppType(type);
}

function safeCppName(name) {
  return new Set(['alignas', 'alignof', 'and', 'asm', 'auto', 'bool', 'break', 'case', 'catch', 'char', 'class', 'const', 'continue', 'default', 'delete', 'do', 'double', 'else', 'enum', 'explicit', 'export', 'extern', 'false', 'float', 'for', 'friend', 'goto', 'if', 'inline', 'int', 'long', 'namespace', 'new', 'not', 'operator', 'or', 'private', 'protected', 'public', 'register', 'return', 'short', 'signed', 'sizeof', 'static', 'struct', 'switch', 'template', 'this', 'throw', 'true', 'try', 'typedef', 'typename', 'union', 'unsigned', 'using', 'virtual', 'void', 'volatile', 'while']).has(name)
    ? `${name}_`
    : name;
}

function readJson(filename) {
  return JSON.parse(readFileSync(filename, 'utf8'));
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
