// Reconcile the complete default web API with flight-cpp's generated inventory and flight-hx's
// exact compile-proven native partition. This does not infer native support from header presence:
// header-confirmed scalar functions are only probe candidates until src-cpp/manifest.json records
// them and the cross-target gate compiles and executes them.
import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';

import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const root = path.resolve(import.meta.dirname, '..', '..');
const check = process.argv.includes('--check');
const unknown = process.argv.slice(2).filter((option) => option !== '--check');
if (unknown.length > 0) {
  process.stderr.write(`Unknown native reconciliation option(s): ${unknown.join(', ')}\n`);
  process.exit(2);
}

const flight = resolveDependency(root, 'flight');
const compiler = resolveDependency(root, 'flight-compiler');
const flightCpp = resolveDependency(root, 'flight-cpp');
const defaultApi = readJson(path.join(root, 'generated', 'js', 'default-api.json'));
const webManifest = readJson(path.join(root, 'generated', 'js', 'manifest.json'));
const nativeManifest = readJson(path.join(root, 'src-cpp', 'manifest.json'));
const cppManifest = readJson(path.join(flightCpp.directory, 'generated', 'manifest.json'));
const bestEffort = readJson(path.join(flightCpp.directory, 'generated', 'best-effort.json'));
const refusalLedger = readJson(path.join(flightCpp.directory, 'generated', 'refusals.json'));

validatePins();
validateCppInventory();

const cppModulesByPackage = groupBy(bestEffort.modules, ({ module }) => module.packageName);
const refusalsByPackage = groupBy(refusalLedger.refusals, ({ package: packageName }) => packageName);
const cppHeaderIndex = buildCppHeaderIndex(bestEffort.modules);
const nativeFunctionIndex = buildNativeFunctionIndex();
const nativeTypeIndex = buildNativeTypeIndex();
const allScalarCandidates = [];

const packages = defaultApi.packages.map((package_) => {
  const cppModules = cppModulesByPackage.get(package_.package) ?? [];
  const refusals = refusalsByPackage.get(package_.package) ?? [];
  const nativeFunctions = nativeFunctionIndex.get(package_.package) ?? [];
  const nativeTypes = [...(nativeTypeIndex.get(package_.package) ?? [])].sort(compareText);
  const scalarCandidates = package_.functions
    .filter(({ signature }) => isDirectScalarSignature(signature))
    .map((entry) => headerConfirmedCandidate(package_.package, entry))
    .filter(Boolean)
    .sort(compareApiEntry);
  allScalarCandidates.push(...scalarCandidates.map((entry) => ({ ...entry, package: package_.package })));
  const boundKeys = new Set(nativeFunctions.map(({ holder, name }) => `${holder}\0${name}`));
  const unboundScalarCandidates = scalarCandidates.filter(({ holder, name }) => !boundKeys.has(`${holder}\0${name}`));
  const statusCounts = countBy(cppModules, ({ status }) => status);
  const refusalCodes = countBy(refusals, ({ code }) => code);
  const complexFunctions = package_.functions.length - package_.functions.filter(({ signature }) => isDirectScalarSignature(signature)).length;
  const issues = [
    issue('flight-cpp-refused-modules', statusCounts['refused-placeholder'] ?? 0),
    issue('flight-cpp-dependency-incomplete-modules', statusCounts['dependency-incomplete'] ?? 0),
    issue('native-function-gap', package_.functions.length - nativeFunctions.length),
    issue('native-value-gap', package_.values.length),
    issue('native-type-gap', package_.types.filter((name) => !nativeTypes.includes(name)).length),
    issue('non-scalar-signature-review', complexFunctions),
    issue('header-confirmed-scalar-probe-candidates', unboundScalarCandidates.length),
  ].filter(({ count }) => count > 0);
  const webDeclarations = package_.functions.length + package_.types.length + package_.values.length;
  const nativeDeclarations = nativeFunctions.length + nativeTypes.length;
  const completeCppModules = statusCounts.emitted ?? 0;
  const dependencyIncompleteCppModules = statusCounts['dependency-incomplete'] ?? 0;
  const status =
    webDeclarations === 0
      ? 'empty-web-contract'
      : nativeDeclarations > 0
        ? 'partial-native'
        : completeCppModules + dependencyIncompleteCppModules > 0
          ? 'emitted-unbound'
          : 'compiler-blocked';
  return {
    flightCpp: {
      completeModules: completeCppModules,
      dependencyIncompleteModules: dependencyIncompleteCppModules,
      refusalCodes: sortedCounts(refusalCodes),
      refusedModules: statusCounts['refused-placeholder'] ?? 0,
      sourceModules: cppModules.length,
    },
    issues,
    nativeDefault: {
      functions: nativeFunctions,
      types: nativeTypes,
      values: [],
    },
    package: package_.package,
    scalarProbeCandidates: unboundScalarCandidates,
    status,
    webDefault: {
      functions: package_.functions.length,
      types: package_.types.length,
      values: package_.values.length,
    },
  };
});

const nativeFunctions = [...nativeFunctionIndex.values()].flat();
const nativeUpstreamTypes = new Set([...nativeTypeIndex.values()].flatMap((names) => [...names]));
const extensionTypeNames = nativeManifest.extensions
  .flatMap(({ publicTypes }) => publicTypes)
  .map(shortPublicName)
  .filter((name) => !defaultApi.packages.some((package_) => package_.types.includes(name)))
  .sort(compareText);
const bestEffortStatus = countBy(bestEffort.modules, ({ status }) => status);
const statusCounts = countBy(packages, ({ status }) => status);
const boundScalarKeys = new Set(nativeFunctions.map(({ holder, name }) => `${holder}\0${name}`));
const boundScalarCandidates = allScalarCandidates.filter(({ holder, name }) => boundScalarKeys.has(`${holder}\0${name}`));
const report = {
  limitations: [
    {
      code: 'target-specific-facade-roots',
      reason:
        'Haxe resolves every signature in a loaded module, so one mixed facade would let an unsupported native type poison otherwise supported declarations. Package.configure selects complete target-specific roots behind flight_hx, js+flight_esm, or cpp defines.',
    },
    {
      code: 'native-representation-and-ownership',
      reason:
        'Non-scalar types and signatures require an explicit identity, lifetime, nullable/union, callback, and structural-owner mapping; generated C++ header presence alone is not a safe Haxe binding contract.',
    },
    {
      code: 'native-runtime-values',
      reason:
        'The current compile-proven native partition binds functions and Scene2D handles but no mutable/default runtime value exports.',
    },
    {
      code: 'host-specific-extensions',
      reason:
        'SDL3/OpenGL hosting and the Scene2D ownership session are manifest-recorded flight-hx extensions, not claims of package-wide portable API parity.',
    },
  ],
  nativeExtensions: {
    extensions: nativeManifest.extensions.map((extension) => ({
      module: extension.module,
      nativeBridge: extension.nativeBridge,
      profile: extension.profile,
      upstreamTypes: extension.publicTypes
        .map(shortPublicName)
        .filter((name) => defaultApi.packages.some((package_) => package_.types.includes(name)))
        .sort(compareText),
      integrationTypes: extension.publicTypes
        .map(shortPublicName)
        .filter((name) => !defaultApi.packages.some((package_) => package_.types.includes(name)))
        .sort(compareText),
    })),
    hosts: nativeManifest.hosts,
  },
  packages,
  pins: {
    flight: flight.commit,
    flightCompiler: compiler.commit,
    flightCpp: flightCpp.commit,
  },
  schema: 'flight-hx-native-public-api-reconciliation/1',
  summary: {
    flightCpp: {
      completeModules: bestEffortStatus.emitted ?? 0,
      dependencyIncompleteModules: bestEffortStatus['dependency-incomplete'] ?? 0,
      refusalDiagnostics: refusalLedger.refusals.length,
      refusedModules: bestEffortStatus['refused-placeholder'] ?? 0,
      sourceModules: bestEffort.modules.length,
    },
    nativeDefault: {
      boundHeaderConfirmedScalarFunctions: boundScalarCandidates.length,
      extensionTypes: extensionTypeNames.length,
      functions: nativeFunctions.length,
      packages: new Set([...nativeFunctionIndex.keys(), ...nativeTypeIndex.keys()]).size,
      types: nativeUpstreamTypes.size,
      values: 0,
    },
    packageStatus: Object.fromEntries(sortedCounts(statusCounts).map(({ count, name }) => [name, count])),
    scalarExpansion: {
      headerConfirmedFunctions: allScalarCandidates.length,
      packages: new Set(allScalarCandidates.map(({ package: packageName }) => packageName)).size,
      unboundProbeCandidates: allScalarCandidates.length - boundScalarCandidates.length,
    },
    webDefault: {
      functions: defaultApi.summary.functions,
      packages: defaultApi.summary.packages,
      types: defaultApi.summary.types,
      values: defaultApi.summary.values,
    },
  },
};

const output = `${JSON.stringify(report, undefined, 2)}\n`;
const outputPath = path.join(root, 'src-cpp', 'reconciliation.json');
if (check) {
  if (!existsSync(outputPath) || readFileSync(outputPath, 'utf8') !== output) {
    process.stderr.write('Native public API reconciliation is stale; run `npm run reconcile:native`.\n');
    process.exit(1);
  }
  process.stdout.write(formatSummary('Native public API reconciliation is current'));
} else {
  writeFileSync(outputPath, output);
  process.stdout.write(formatSummary('Native public API reconciliation updated'));
}

function buildNativeFunctionIndex() {
  const result = new Map();
  for (const module of nativeManifest.modules) {
    const holder = shortPublicName(module.module);
    for (const binding of module.functions) {
      const matches = defaultApi.packages.filter((package_) =>
        package_.functions.some(({ holder: functionHolder, name }) => functionHolder === holder && name === binding.name),
      );
      if (matches.length !== 1) {
        throw new Error(`Native binding ${holder}.${binding.name} matched ${String(matches.length)} web packages`);
      }
      const values = result.get(matches[0].package) ?? [];
      values.push({ header: binding.header, holder, name: binding.name, native: binding.native });
      result.set(matches[0].package, values);
    }
  }
  for (const values of result.values()) values.sort(compareApiEntry);
  return result;
}

function buildNativeTypeIndex() {
  const result = new Map();
  for (const extension of nativeManifest.extensions) {
    for (const publicType of extension.publicTypes) {
      const name = shortPublicName(publicType);
      const matches = defaultApi.packages.filter((package_) => package_.types.includes(name));
      if (matches.length > 1) throw new Error(`Native type ${name} matched multiple web packages`);
      if (matches.length === 0) continue;
      const names = result.get(matches[0].package) ?? new Set();
      names.add(name);
      result.set(matches[0].package, names);
    }
  }
  return result;
}

function buildCppHeaderIndex(modules) {
  const result = new Map();
  for (const module of modules) {
    if (module.status === 'refused-placeholder') continue;
    const filename = path.join(flightCpp.directory, 'generated', 'include', module.path);
    if (!existsSync(filename)) continue;
    const headers = result.get(module.module.packageName) ?? [];
    headers.push({ contents: readFileSync(filename, 'utf8'), path: module.path, status: module.status });
    result.set(module.module.packageName, headers);
  }
  return result;
}

function headerConfirmedCandidate(packageName, entry) {
  const cppName = camelToSnake(entry.sourceName);
  const declaration = new RegExp(`\\binline\\s+[^\\n{;]*\\b${escapeRegExp(cppName)}\\s*\\(`, 'u');
  const headers = (cppHeaderIndex.get(packageName) ?? [])
    .filter(({ contents }) => declaration.test(contents))
    .map(({ path: headerPath, status }) => ({ path: headerPath, status }));
  if (headers.length === 0) return undefined;
  return {
    cppName,
    headers,
    holder: entry.holder,
    name: entry.name,
    signature: entry.signature,
  };
}

function isDirectScalarSignature(signature) {
  const match = /^function [A-Za-z_][A-Za-z0-9_]*(?:<[^>]*>)?\((.*)\):(Float|Int|Bool|Void)$/u.exec(signature);
  if (!match) return false;
  return (
    match[1] === '' ||
    match[1].split(', ').every((parameter) => /^\??[A-Za-z_][A-Za-z0-9_]*:(Float|Int|Bool)$/u.test(parameter))
  );
}

function validatePins() {
  equal('web Flight pin', webManifest.source.revision, flight.commit);
  equal('web compiler pin', webManifest.compiler.revision, compiler.commit);
  equal('native flight-cpp pin', nativeManifest.flightCppRevision, flightCpp.commit);
  equal('native generated Flight pin', nativeManifest.generatedSdk.sourceRevision, cppManifest.source.revision);
  equal('native generated compiler pin', nativeManifest.generatedSdk.compilerRevision, cppManifest.compiler.revision);
  equal('web/native Flight source pin', cppManifest.source.revision, webManifest.source.revision);
  equal('web/native compiler pin', cppManifest.compiler.revision, webManifest.compiler.revision);
}

function validateCppInventory() {
  const status = countBy(bestEffort.modules, ({ status: moduleStatus }) => moduleStatus);
  equal('flight-cpp source modules', bestEffort.modules.length, cppManifest.summary.sourceModules);
  equal('flight-cpp complete + dependency-incomplete modules', (status.emitted ?? 0) + (status['dependency-incomplete'] ?? 0), cppManifest.summary.emittedModules);
  equal('flight-cpp refused modules', status['refused-placeholder'] ?? 0, cppManifest.summary.refusedModules);
  equal('flight-cpp package count', cppManifest.packages.length, cppManifest.summary.packages);
  equal('web/native package count', defaultApi.packages.length, cppManifest.packages.length);
  equal(
    'web/native packages',
    JSON.stringify(defaultApi.packages.map(({ package: packageName }) => packageName)),
    JSON.stringify(cppManifest.packages.map(({ package: packageName }) => packageName)),
  );
}

function issue(code, count) {
  return { code, count };
}

function countBy(values, key) {
  const counts = {};
  for (const value of values) {
    const name = key(value);
    counts[name] = (counts[name] ?? 0) + 1;
  }
  return counts;
}

function sortedCounts(counts) {
  return Object.entries(counts)
    .sort(([left], [right]) => compareText(left, right))
    .map(([name, count]) => ({ count, name }));
}

function groupBy(values, key) {
  const groups = new Map();
  for (const value of values) {
    const name = key(value);
    const group = groups.get(name) ?? [];
    group.push(value);
    groups.set(name, group);
  }
  return groups;
}

function shortPublicName(name) {
  return name.replace(/^flight\./u, '');
}

function camelToSnake(name) {
  return name
    .replace(/([A-Z]+)([A-Z][a-z])/gu, '$1_$2')
    .replace(/([a-z0-9])([A-Z])/gu, '$1_$2')
    .toLowerCase();
}

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
}

function compareApiEntry(left, right) {
  return compareText(`${left.holder}\0${left.name}`, `${right.holder}\0${right.name}`);
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}

function readJson(filename) {
  return JSON.parse(readFileSync(filename, 'utf8'));
}

function equal(label, actual, expected) {
  if (actual !== expected) throw new Error(`${label}: ${String(actual)} != ${String(expected)}`);
}

function formatSummary(prefix) {
  return (
    `${prefix}: ${String(report.summary.nativeDefault.functions)} functions and ` +
    `${String(report.summary.nativeDefault.types)} upstream types are compile-proven; ` +
    `${String(report.summary.scalarExpansion.unboundProbeCandidates)} header-confirmed scalar candidates remain.\n`
  );
}
