// Pinned-corpus coverage contract. Improvements are allowed; regressions, inconsistent manifests,
// unclassified compiler failures, and growth in downstream compatibility corrections are not.
import { existsSync, readFileSync } from 'node:fs';
import process from 'node:process';

const budgets = {
  extern: {
    compatibilityCorrections: 29,
    dependencyRefusals: 1146,
    emittedDeclarations: 3093,
    emittedTypes: 2016,
    expectedDeclarations: 7082,
    fullyCoveredPackages: 59,
    internalErrors: 20,
    rootRefusals: 74,
    missingDeclarations: 3989,
    sourceModules: 2855,
    totalRefusals: 1220,
  },
  transpile: {
    compatibilityCorrections: 25,
    dependencyRefusals: 922,
    internalErrors: 20,
    rootRefusals: 834,
    sourceModules: 2866,
    supportedFunctions: 175,
    supportedTypes: 2016,
    supportedValues: 345,
    totalRefusals: 1756,
  },
};
const failures = [];

for (const [mode, directory] of [
  ['extern', 'js'],
  ['transpile', 'hx'],
]) {
  const manifest = readJson(`generated/${directory}/manifest.json`);
  const ledger = readJson(`generated/${directory}/refusals.json`);
  const initialization = readJson(`generated/${directory}/initialization.json`);
  const budget = budgets[mode];
  const refusedModules = new Set(ledger.refusals.map((refusal) => `${refusal.package}\0${refusal.module}`));
  const dependencyModules = new Set(
    ledger.refusals
      .filter((refusal) => refusal.code === 'dependency-refused')
      .map((refusal) => `${refusal.package}\0${refusal.module}`),
  );
  const rootModules = new Set(
    ledger.refusals
      .filter((refusal) => refusal.code !== 'dependency-refused')
      .map((refusal) => `${refusal.package}\0${refusal.module}`),
  );
  const internalErrors = ledger.refusals.filter((refusal) => refusal.code === 'internal-error').length;
  const packageTotals = manifest.packages.reduce(
    (total, package_) => ({
      emitted: total.emitted + package_.emittedModules,
      refused: total.refused + package_.refusedModules,
      source: total.source + package_.sourceModules,
    }),
    { emitted: 0, refused: 0, source: 0 },
  );

  equal(`${mode} emission mode`, manifest.compiler.emissionMode, mode);
  equal(`${mode} ledger mode`, ledger.emissionMode, mode);
  equal(`${mode} compiler revision`, ledger.compilerRevision, manifest.compiler.revision);
  equal(`${mode} source revision`, ledger.sourceRevision, manifest.source.revision);
  equal(`${mode} initialization schema`, initialization.schema, 'flight-compiler-module-evaluation/1');
  equal(`${mode} initialization entries`, initialization.entries.length, manifest.summary.emittedModules);
  equal(`${mode} initialization modules`, initialization.modules.length, manifest.summary.emittedModules);
  equal(
    `${mode} initialization grouped modules`,
    initialization.groups.reduce((total, group) => total + group.modules.length, 0),
    manifest.summary.emittedModules,
  );
  equal(
    `${mode} unique initialization modules`,
    new Set(initialization.modules.map((entry) => moduleKey(entry.module))).size,
    manifest.summary.emittedModules,
  );
  equal(`${mode} package source total`, packageTotals.source, manifest.summary.sourceModules);
  equal(`${mode} package emitted total`, packageTotals.emitted, manifest.summary.emittedModules);
  equal(`${mode} package refused total`, packageTotals.refused, manifest.summary.refusedModules);
  equal(`${mode} emitted + refused`, manifest.summary.emittedModules + manifest.summary.refusedModules, manifest.summary.sourceModules);
  equal(`${mode} unique refused modules`, refusedModules.size, manifest.summary.refusedModules);
  equal(`${mode} source modules`, manifest.summary.sourceModules, budget.sourceModules);
  atMost(`${mode} total refusals`, refusedModules.size, budget.totalRefusals);
  atMost(`${mode} root refusals`, rootModules.size, budget.rootRefusals);
  atMost(`${mode} dependency refusals`, dependencyModules.size, budget.dependencyRefusals);
  atMost(`${mode} internal errors`, internalErrors, budget.internalErrors);
  atMost(
    `${mode} compatibility corrections`,
    manifest.compiler.compatibilityCorrections.length,
    budget.compatibilityCorrections,
  );

  if (mode === 'extern') {
    const publicSurface = readJson('generated/js/public-surface.json');
    const runtimeTotals = publicSurface.packages.reduce(
      (total, package_) => ({
        emittedDeclarations: total.emittedDeclarations + package_.emitted.length,
        expectedDeclarations: total.expectedDeclarations + package_.expected.length,
        fullyCoveredPackages: total.fullyCoveredPackages + (package_.missing.length === 0 ? 1 : 0),
        missingDeclarations: total.missingDeclarations + package_.missing.length,
        packages: total.packages + 1,
        unexpectedDeclarations: total.unexpectedDeclarations + package_.unexpected.length,
      }),
      {
        emittedDeclarations: 0,
        expectedDeclarations: 0,
        fullyCoveredPackages: 0,
        missingDeclarations: 0,
        packages: 0,
        unexpectedDeclarations: 0,
      },
    );
    for (const [name, actual] of Object.entries(runtimeTotals)) {
      equal(`extern public runtime ${name}`, publicSurface.summary[name], actual);
    }
    equal('extern public surface manifest summary', JSON.stringify(manifest.summary.publicRuntimeSurface), JSON.stringify(publicSurface.summary));
    equal('extern unexpected public runtime declarations', publicSurface.summary.unexpectedDeclarations, 0);
    equal('extern reported type count', publicSurface.types.length, publicSurface.summary.emittedTypes);
    equal('extern expected public runtime declarations', publicSurface.summary.expectedDeclarations, budget.expectedDeclarations);
    atLeast('extern emitted public runtime declarations', publicSurface.summary.emittedDeclarations, budget.emittedDeclarations);
    atLeast('extern fully covered packages', publicSurface.summary.fullyCoveredPackages, budget.fullyCoveredPackages);
    atMost('extern missing public runtime declarations', publicSurface.summary.missingDeclarations, budget.missingDeclarations);
    atLeast('extern emitted public types', publicSurface.summary.emittedTypes, budget.emittedTypes);
    const uniqueTypes = new Set(publicSurface.types.map((entry) => entry.name));
    equal('extern unique public types', uniqueTypes.size, publicSurface.types.length);
    for (const type of publicSurface.types) {
      if (!existsSync(`generated/js/flight/${type.name}.hx`)) {
        failures.push(`extern public type ${type.name} has no generated alias`);
      }
    }
    for (const package_ of publicSurface.packages) validateRuntimePartition(package_);
  } else {
    const publicSurface = readJson('generated/hx/public-surface.json');
    atLeast('transpile supported functions', publicSurface.summary.supportedFunctions, budget.supportedFunctions);
    atLeast('transpile supported types', publicSurface.summary.supportedTypes, budget.supportedTypes);
    atLeast('transpile supported values', publicSurface.summary.supportedValues, budget.supportedValues);
  }
}

if (failures.length > 0) {
  process.stderr.write(`compiler-coverage gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write(
  'compiler-coverage gate: manifests are internally complete and pinned refusal/correction budgets did not regress.\n',
);

function readJson(filename) {
  return JSON.parse(readFileSync(filename, 'utf8'));
}

function equal(label, actual, expected) {
  if (actual !== expected) failures.push(`${label}: ${String(actual)} != ${String(expected)}`);
}

function atMost(label, actual, maximum) {
  if (actual > maximum) failures.push(`${label}: ${String(actual)} exceeds ${String(maximum)}`);
}

function atLeast(label, actual, minimum) {
  if (actual < minimum) failures.push(`${label}: ${String(actual)} is below ${String(minimum)}`);
}

function validateRuntimePartition(package_) {
  const expected = new Set(package_.expected);
  const emitted = new Set(package_.emitted);
  const missing = new Set(package_.missing);
  const unexpected = new Set(package_.unexpected);
  equal(`${package_.package} unique expected runtime declarations`, expected.size, package_.expected.length);
  equal(`${package_.package} unique emitted runtime declarations`, emitted.size, package_.emitted.length);
  for (const name of expected) {
    const partitions = Number(emitted.has(name)) + Number(missing.has(name));
    equal(`${package_.package} runtime declaration ${name} partition count`, partitions, 1);
  }
  for (const name of emitted) {
    equal(`${package_.package} runtime declaration ${name} unexpected status`, unexpected.has(name), !expected.has(name));
  }
}

function moduleKey(module) {
  return `${module.packageName}\0${module.source}`;
}
