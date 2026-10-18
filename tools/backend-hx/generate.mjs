import { spawnSync } from 'node:child_process';
import {
  cpSync,
  existsSync,
  lstatSync,
  mkdirSync,
  mkdtempSync,
  readFileSync,
  readdirSync,
  rmSync,
  writeFileSync,
} from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { pathToFileURL } from 'node:url';

import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import {
  buildExternDefaultPublicApi,
  buildTranspiledBackendSurface,
  collectExternSurface,
} from './haxeSurface.mjs';

// flight-hx owns the reproducible integration edge around flight-compiler: checkout discovery,
// compiler installation/build, narrow fail-loud target corrections, output layout, manifests,
// refusal ledgers, and write/check modes. TypeScript analysis, package-graph semantics, Haxe
// lowering, and both Haxe emitters remain compiler-owned. This driver intentionally contains no
// TypeScript parser or general-purpose target lowering rules.

// Current flight-compiler output needs no downstream syntax corrections. Keep this inventory
// explicit so any future integration workaround remains named, counted, and ratcheted.
const compatibilityCorrectionSpecs = [
  {
    expectedApplications: [
      { path: 'flight/_js/_fn/RenderGl.hx', replacements: 1 },
      { path: 'flight/_js/_fn/RenderWgpu.hx', replacements: 1 },
    ],
    id: 'flight-hx-private-texture-resolver-owner/1',
    modes: new Set(['extern']),
    pattern: /flight\.Resolve(Gl|Wgpu)ImageTexture/gu,
    replacement: 'flight.$1TextureResolver',
  },
];

// GPUCanvasAlphaMode is a WebGPU string-literal union. The Haxe backend already represents the
// neighboring GPU*Mode ambient types as String, but its current external-symbol table omits this
// newly used name. Correct the two exact source references before lowering; the counted patch must
// drift loudly when Flight moves either use, and can disappear when flight-compiler owns the binding.
const sourceCompatibilityCorrectionSpecs = [
  {
    expectedApplications: [
      { path: 'packages/types/src/WgpuHost.ts', replacements: 1 },
      { path: 'packages/types/src/WgpuRenderTarget.ts', replacements: 1 },
    ],
    id: 'flight-hx-gpu-canvas-alpha-mode-string-binding/1',
    modes: new Set(['extern', 'transpile']),
    pattern: /\bGPUCanvasAlphaMode\b/gu,
    replacement: 'string',
  },
];

const root = path.resolve(import.meta.dirname, '..', '..');
const options = process.argv.slice(2);
const check = options.includes('--check');
const selectedModes = options.filter((option) => option === '--extern' || option === '--transpile');
const unknown = options.filter((option) => option !== '--check' && option !== '--extern' && option !== '--transpile');
if (unknown.length > 0) {
  process.stderr.write(`Unknown generation option(s): ${unknown.join(', ')}\n`);
  process.exit(2);
}
if (selectedModes.length > 1) {
  process.stderr.write('--extern and --transpile are mutually exclusive; omit both to generate both.\n');
  process.exit(2);
}

const modes =
  selectedModes[0] === '--extern'
    ? ['extern']
    : selectedModes[0] === '--transpile'
      ? ['transpile']
      : ['extern', 'transpile'];
const flight = resolveDependency(root, 'flight');
const compiler = resolveDependency(root, 'flight-compiler');
const flightCpp = resolveDependency(root, 'flight-cpp');
const inputFailure = validateInput(flight, compiler, flightCpp);
if (inputFailure !== undefined) {
  const message = `${inputFailure} Run \`npm run rehydrate\` and \`npm install --prefix .dependencies/flight-compiler\`.\n`;
  if (check) {
    process.stdout.write(`Haxe generation check skipped: ${message}`);
    process.exit(0);
  }
  process.stderr.write(message);
  process.exit(1);
}

runCompilerBuild(compiler.directory);
const compilerEntry = path.join(
  compiler.directory,
  'packages',
  'tool-compiler',
  'dist',
  'packages',
  'tool-compiler',
  'src',
  'index.js',
);
if (!existsSync(compilerEntry)) {
  process.stderr.write(`Pinned compiler build did not produce ${compilerEntry}\n`);
  process.exit(1);
}

const {
  compileTypeScriptPackageGraph,
  createCompilerHaxeCppExternPlan,
  createCompilerHaxeDualBindingPlan,
  createCppCompilerPublicBindingPlan,
  createHaxeCompilerBackend,
  emitCompilerHaxeCppExternPlan,
  parseTypeScriptSource,
} = await import(pathToFileURL(compilerEntry));
for (const mode of modes) {
  const input = createSdkInput(flight, parseTypeScriptSource, mode);
  const temporaryRoot = mkdtempSync(path.join(tmpdir(), `flight-hx-${mode}-generation-`));
  const candidateRoot = path.join(temporaryRoot, mode);
  const generatedRoot = path.join(root, 'generated', mode === 'extern' ? 'js' : 'hx');
  let preserveTemporaryRoot = false;
  try {
    const generation = generateMode(candidateRoot, mode, input, flight, compiler, flightCpp, {
      compileTypeScriptPackageGraph,
      createCompilerHaxeCppExternPlan,
      createCompilerHaxeDualBindingPlan,
      createCppCompilerPublicBindingPlan,
      createHaxeCompilerBackend,
      emitCompilerHaxeCppExternPlan,
    });
    const { summary } = generation;
    if (mode === 'extern') {
      const failure = validateExternCandidate(candidateRoot, temporaryRoot);
      if (failure !== undefined) {
        preserveTemporaryRoot = true;
        process.stderr.write(`Failed extern smoke preserved outside the repository at ${temporaryRoot}\n`);
        throw new Error(`Generated Haxe extern surface did not compile:\n${failure}`);
      }
    }
    if (check) {
      const drift = compareTrees(candidateRoot, generatedRoot);
      if (drift.length > 0) {
        process.stderr.write(`${label(mode)} output differs in ${String(drift.length)} path(s):\n`);
        for (const filename of drift.slice(0, 20)) process.stderr.write(`- ${filename}\n`);
        if (drift.length > 20) process.stderr.write(`- … and ${String(drift.length - 20)} more\n`);
        process.stderr.write(
          `Run \`npm run generate -- --${mode}\` and commit generated/${mode === 'extern' ? 'js' : 'hx'}/.\n`,
        );
        process.exitCode = 1;
      } else {
        process.stdout.write(formatSummary(`${label(mode)} output is current`, summary));
      }
    } else {
      rmSync(generatedRoot, { force: true, recursive: true });
      mkdirSync(path.dirname(generatedRoot), { recursive: true });
      cpSync(candidateRoot, generatedRoot, { recursive: true });
      if (mode === 'extern') synchronizeExternPublicFacades(generation.compilerFiles, true);
      process.stdout.write(formatSummary(`${label(mode)} output updated`, summary));
    }
  } finally {
    if (!preserveTemporaryRoot) rmSync(temporaryRoot, { force: true, recursive: true });
  }
}

function createSdkInput(flightDependency, parseTypeScript, mode) {
  const packagesRoot = path.join(flightDependency.directory, 'packages');
  const directoryByName = new Map();
  for (const directory of readdirSync(packagesRoot).sort(compareText)) {
    const manifestPath = path.join(packagesRoot, directory, 'package.json');
    if (!existsSync(manifestPath)) continue;
    const manifest = JSON.parse(readFileSync(manifestPath, 'utf8'));
    if (manifest.name?.startsWith('@flighthq/')) {
      directoryByName.set(manifest.name, path.join(packagesRoot, directory));
    }
  }
  const sdkRoot = directoryByName.get('@flighthq/sdk');
  if (!sdkRoot) throw new Error('Pinned Flight checkout has no @flighthq/sdk package');
  const sdkManifest = JSON.parse(readFileSync(path.join(sdkRoot, 'package.json'), 'utf8'));
  const packageNames = Object.keys(sdkManifest.dependencies ?? {})
    .filter((name) => directoryByName.has(name))
    .sort(compareText);
  const includedPackages = new Set(packageNames);
  const packages = packageNames.map((name) => {
    const packageRoot = directoryByName.get(name);
    const manifest = JSON.parse(readFileSync(path.join(packageRoot, 'package.json'), 'utf8'));
    return {
      dependencies: Object.keys(manifest.dependencies ?? {})
        .filter((dependency) => includedPackages.has(dependency))
        .sort(compareText),
      name,
      root: packageRoot,
      // Test-helper modules exported by a package contract are part of that public contract. Keep
      // them unless they depend on the Vitest runner itself; a public contract that ever imports one
      // of those excluded modules will fail dependency-closed initialization rather than disappear.
      sources: filesUnder(path.join(packageRoot, 'src')).filter((filename) => {
        if (!filename.endsWith('.ts') || filename.endsWith('.d.ts') || filename.endsWith('.test.ts')) return false;
        return !/\bfrom\s+['"]vitest['"]/u.test(readFileSync(filename, 'utf8'));
      }),
    };
  });
  const sourceCorrectionApplications = new Map();
  const sourceInputs = packages.flatMap((package_) =>
    package_.sources.map((sourcePath) => {
      const relativeSourcePath = portable(path.relative(flightDependency.directory, sourcePath));
      const contents = applyCorrectionSpecs(
        readFileSync(sourcePath, 'utf8'),
        relativeSourcePath,
        mode,
        sourceCorrectionApplications,
        sourceCompatibilityCorrectionSpecs,
      );
      return {
        contents,
        compilerSource: {
          packageName: package_.name,
          packageRoot: package_.root,
          sourceFile: parseTypeScript(sourcePath, contents),
          upstreamDirectory: flightDependency.directory,
        },
      };
    }),
  );
  const sourceCompatibilityCorrectionApplications = validateCompatibilityCorrections(
    mode,
    sourceCorrectionApplications,
    sourceInputs.map(({ contents, compilerSource }) => ({ contents, path: compilerSource.sourceFile.fileName })),
    sourceCompatibilityCorrectionSpecs,
  );
  return {
    graph: {
      entries: [],
      moduleDependencies: [],
      packages: packages.map(({ dependencies, name, root: packageRoot }) => ({
        dependencies,
        name,
        root: packageRoot,
      })),
      schema: 'flight-compiler-package-graph/1',
    },
    moduleResolution: createModuleResolutionPlan(packages, flightDependency.directory),
    packages,
    sdkManifest,
    sourceCompatibilityCorrectionApplications,
    sources: sourceInputs.map(({ compilerSource }) => compilerSource),
  };
}

function createModuleResolutionPlan(packages, upstreamDirectory) {
  const edges = packages
    .flatMap((package_) =>
      [
        { filename: 'index.ts', specifier: package_.name },
        { filename: 'contract.ts', specifier: `${package_.name}/contract` },
      ].map((lane) => ({ ...lane, package_ })),
    )
    .filter(({ filename, package_ }) => existsSync(path.join(package_.root, 'src', filename)))
    .map(({ filename, package_, specifier }) => ({
      specifier,
      target: {
        packageName: package_.name,
        source: portable(path.relative(upstreamDirectory, path.join(package_.root, 'src', filename))),
      },
    }))
    .sort((left, right) => compareText(left.specifier, right.specifier));
  return { edges, schema: 'flight-compiler-module-resolution/1' };
}

function collectCompilerContractExports(facade, packages, report) {
  if (facade?.schema !== 'flight-compiler-module-facade/1' || !Array.isArray(facade.modules)) {
    throw new Error('Pinned flight-compiler did not publish its public module-facade plan');
  }
  const packageNames = new Set(packages.map((package_) => package_.name));
  const valuesByPackage = new Map([...packageNames].sort(compareText).map((name) => [name, new Set()]));
  const typesByPackage = new Map([...packageNames].sort(compareText).map((name) => [name, new Set()]));
  const typeNames = new Set();
  const contractPackages = new Set();
  for (const module of facade.modules) {
    if (!/(?:^|\/)contract\.[cm]?tsx?$/u.test(module.module.source)) continue;
    if (!packageNames.has(module.module.packageName)) continue;
    contractPackages.add(module.module.packageName);
    for (const slot of module.slots) {
      if (slot.lane === 'type') {
        typeNames.add(slot.exportName);
        typesByPackage.get(module.module.packageName).add(slot.exportName);
      } else valuesByPackage.get(module.module.packageName).add(slot.exportName);
    }
  }
  const missingPackages = [...packageNames].filter((name) => !contractPackages.has(name)).sort(compareText);
  if (missingPackages.length > 0) {
    const directRefusals = report.modules
      .flatMap((module) =>
        module.refusals
          .filter((refusal) => refusal.code !== 'dependency-refused')
          .map((refusal) => ({
            code: refusal.code,
            module: `${module.module.packageName}/${module.module.source}`,
            reason: refusal.message,
            stage: refusal.stage,
          })),
      )
      .sort((left, right) => compareText(left.module, right.module) || compareText(left.code, right.code));
    const causes = directRefusals
      .slice(0, 20)
      .map(({ code, module, reason, stage }) => `${module} (${stage}/${code}): ${reason}`)
      .join('\n- ');
    throw new Error(
      `Compiler public facade has no emitted contract lane for ${missingPackages.join(', ')}` +
        `\nDirect compiler refusals (${String(directRefusals.length)} total, first 20):` +
        (causes ? `\n- ${causes}` : ' none'),
    );
  }
  return { typeNames, typesByPackage, valuesByPackage };
}

function generateMode(
  outputRoot,
  mode,
  input,
  flightDependency,
  compilerDependency,
  flightCppDependency,
  compilerApi,
) {
  const correctionApplications = new Map();
  const normalizedBackend = createNormalizedHaxeBackend(
    compilerApi.createHaxeCompilerBackend(),
    (contents, filename) => applyCompatibilityCorrections(contents, filename, mode, correctionApplications),
  );
  const nativePlanning =
    mode === 'extern'
      ? createNativeBindingPlanner(normalizedBackend, input, flightCppDependency, compilerDependency, compilerApi)
      : undefined;
  const backend = nativePlanning?.backend ?? normalizedBackend;
  const compilation = compilerApi.compileTypeScriptPackageGraph({
    backend,
    backendOptions: {
      emissionMode: mode,
      rootPackage: mode === 'extern' ? 'flight' : 'flight._hx',
      runtimeModule: 'flight._internal',
      structuralRecords: 'anonymous',
      upstreamCommit: flightDependency.commit,
    },
    graph: input.graph,
    moduleResolution: input.moduleResolution,
    sources: input.sources,
    ...(mode === 'transpile' ? { targetCompilationSmoke: createHaxeCompilationSmoke() } : {}),
  });
  if (!compilation.report.runtimeAbi) {
    throw new Error('Pinned flight-compiler did not publish its Haxe runtime ABI manifest');
  }
  const nativeBindingArtifacts = nativePlanning?.finish(compilation.report.publicBindings);
  const compatibilityCorrectionApplications = input.sourceCompatibilityCorrectionApplications.concat(
    validateCompatibilityCorrections(
      mode,
      correctionApplications,
      compilation.compilation.files,
      compatibilityCorrectionSpecs,
    ),
  );
  const compatibilityCorrections = compatibilityCorrectionApplications.map(({ id }) => id);
  const publicExports = collectCompilerContractExports(compilation.report.exports, input.packages, compilation.report);
  const contractFiltered =
    mode === 'extern'
      ? filterExternContractMembers(compilation.compilation.files, publicExports.valuesByPackage)
      : { files: compilation.compilation.files, removedFunctions: 0, removedValues: 0 };
  for (const file of contractFiltered.files) {
    const target = path.join(outputRoot, file.path);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(target, file.contents);
  }
  const externDefaultPublicApi =
    mode === 'extern'
      ? buildExternDefaultPublicApi(
          contractFiltered.files,
          publicExports.typeNames,
          publicExports.typesByPackage,
        )
      : undefined;
  if (externDefaultPublicApi) {
    reconcileNativePlanningWithDefaultApi(nativeBindingArtifacts, externDefaultPublicApi.report);
    for (const file of externDefaultPublicApi.files) {
      const target = path.join(outputRoot, file.path);
      mkdirSync(path.dirname(target), { recursive: true });
      writeFileSync(target, file.contents);
    }
    writeFileSync(
      path.join(outputRoot, 'default-api.json'),
      `${JSON.stringify(externDefaultPublicApi.report, undefined, 2)}\n`,
    );
    writeFileSync(
      path.join(outputRoot, 'native-planning.json'),
      `${JSON.stringify(nativeBindingArtifacts.report, undefined, 2)}\n`,
    );
  }
  const transpiledPublicBackend =
    mode === 'transpile' ? emitTranspiledPublicBackend(outputRoot, contractFiltered.files) : undefined;
  const compatibilityFiles =
    mode === 'extern'
      ? externDefaultPublicApi.files.length
      : transpiledPublicBackend.files;
  const publicFacades =
    mode === 'extern' ? synchronizeExternPublicFacades(compilation.compilation.files, false) : { files: 0, drift: [] };
  if (publicFacades.drift.length > 0 && check) {
    process.stderr.write(`Haxe extern public facade differs in ${String(publicFacades.drift.length)} path(s):\n`);
    for (const filename of publicFacades.drift.slice(0, 20)) process.stderr.write(`- ${filename}\n`);
    if (publicFacades.drift.length > 20) {
      process.stderr.write(`- … and ${String(publicFacades.drift.length - 20)} more\n`);
    }
    process.exitCode = 1;
  }

  const packages = compilation.report.packages.map((package_) => ({
    emittedModules: package_.modules.filter((module) => module.status === 'emitted').length,
    package: package_.name,
    refusedModules: package_.modules.filter((module) => module.status === 'refused').length,
    sourceModules: package_.modules.length,
  }));
  const summary = packages.reduce(
    (result, package_) => ({
      emittedFiles: contractFiltered.files.length,
      emittedModules: result.emittedModules + package_.emittedModules,
      packages: packages.length,
      refusedModules: result.refusedModules + package_.refusedModules,
      sourceModules: result.sourceModules + package_.sourceModules,
    }),
    { emittedFiles: 0, emittedModules: 0, packages: 0, refusedModules: 0, sourceModules: 0 },
  );
  summary.compatibilityFiles = compatibilityFiles;
  summary.generatedFiles = summary.emittedFiles + compatibilityFiles;
  summary.publicFacadeFiles = publicFacades.files;
  if (mode === 'extern') {
    summary.defaultPublicApi = externDefaultPublicApi.report.summary;
    summary.filteredContractFunctions = contractFiltered.removedFunctions;
    summary.filteredContractValues = contractFiltered.removedValues;
    const publicSurface = externContractCoverage(contractFiltered.files, publicExports);
    summary.publicRuntimeSurface = publicSurface.summary;
    summary.nativePlanning = nativeBindingArtifacts.report.summary;
    writeFileSync(path.join(outputRoot, 'public-surface.json'), `${JSON.stringify(publicSurface, undefined, 2)}\n`);
  } else {
    summary.publicRuntimeSurface = transpiledPublicBackend.summary;
  }
  const refusals = compilation.report.modules.flatMap((module) =>
    module.refusals.map((refusal) => ({
      code: refusal.code,
      ...(refusal.column === undefined ? {} : { column: refusal.column }),
      ...(refusal.line === undefined ? {} : { line: refusal.line }),
      module: module.module.source,
      package: module.module.packageName,
      reason: refusal.message,
      stage: refusal.stage,
    })),
  );
  const manifest = {
    schema: 'flight-hx-generated-sdk/1',
    compiler: {
      compatibilityCorrectionApplications,
      compatibilityCorrections,
      emissionMode: mode,
      repository: compilerDependency.repository,
      revision: compilerDependency.commit,
      target: 'haxe',
    },
    packages,
    runtime: {
      abi: compilation.report.runtimeAbi,
      constructorAbi: 'flight-runtime-constructor-abi/1',
      externalSymbols: 'flight-runtime-contract/2',
      profiles: {
        javascript: {
          coverage: 'complete',
          implementation: 'native-ecmascript',
        },
        portable: {
          capabilities: ['float32-array', 'map', 'set', 'symbol', 'task'],
          coverage: 'host-free-subset',
          taskDelivery: 'immediate-no-portable-microtask-queue',
          weakMapRetention: 'strong-fallback',
        },
      },
      taskAbi: 'flight-runtime-task-capability-abi/1',
    },
    source: {
      package: String(input.sdkManifest.name),
      repository: flightDependency.repository,
      revision: flightDependency.commit,
      version: String(input.sdkManifest.version),
    },
    summary,
  };
  const refusalLedger = {
    schema: 'flight-hx-generated-sdk-refusals/1',
    compilerRevision: compilerDependency.commit,
    emissionMode: mode,
    refusals,
    sourceRevision: flightDependency.commit,
  };

  mkdirSync(outputRoot, { recursive: true });
  writeFileSync(path.join(outputRoot, 'manifest.json'), `${JSON.stringify(manifest, undefined, 2)}\n`);
  writeFileSync(path.join(outputRoot, 'refusals.json'), `${JSON.stringify(refusalLedger, undefined, 2)}\n`);
  writeFileSync(
    path.join(outputRoot, 'initialization.json'),
    `${JSON.stringify(compilation.report.initialization, undefined, 2)}\n`,
  );
  writeFileSync(path.join(outputRoot, 'README.md'), generatedReadme(manifest));
  return {
    compilerFiles: mode === 'extern' ? compilation.compilation.files : [],
    summary,
  };
}

// Ask the compiler's target-neutral facade and target-owned planners for the same source graph the
// JavaScript extern run just lowered. The callback is deliberately attached to the Haxe backend:
// orchestration supplies it the canonical IR modules, final public facade, and exact refusal set,
// avoiding a second parser or a flight-hx-owned identity join. flight-cpp's committed refusal ledger
// is folded in because a syntactically valid C++ locator is not evidence that its owning module was
// emitted successfully at the pinned native SDK revision.
function createNativeBindingPlanner(backend, input, flightCppDependency, compilerDependency, compilerApi) {
  const refusalArtifact = JSON.parse(
    readFileSync(path.join(flightCppDependency.directory, 'generated', 'refusals.json'), 'utf8'),
  );
  const headerStatusArtifact = JSON.parse(
    readFileSync(path.join(flightCppDependency.directory, 'generated', 'header-status.json'), 'utf8'),
  );
  if (
    !['flight-generated-sdk-refusals/2', 'flight-generated-sdk-refusals/3'].includes(refusalArtifact.schema) ||
    !Array.isArray(refusalArtifact.refusals)
  ) {
    throw new Error('Pinned flight-cpp refusal ledger is not a supported flight-generated-sdk-refusals artifact');
  }
  if (headerStatusArtifact.schema !== 'flight-cpp-header-status/1' || !Array.isArray(headerStatusArtifact.headers)) {
    throw new Error('Pinned flight-cpp header status is not flight-cpp-header-status/1');
  }
  const refusalSourceRevisions =
    refusalArtifact.schema === 'flight-generated-sdk-refusals/3'
      ? refusalArtifact.sourceRevisions
      : [refusalArtifact.sourceRevision];
  if (
    refusalArtifact.compilerRevision !== headerStatusArtifact.compiler?.revision ||
    !Array.isArray(refusalSourceRevisions) ||
    !refusalSourceRevisions.includes(headerStatusArtifact.sourceRevision)
  ) {
    throw new Error('Pinned flight-cpp refusal ledger does not describe the pinned generated SDK');
  }

  let artifacts;
  const plannedBackend = {
    ...backend,
    createPublicBindingPlan(request) {
      const facade = {
        ...request.facade,
        modules: request.facade.modules.filter(({ module }) => /(?:^|\/)contract\.[cm]?tsx?$/u.test(module.source)),
      };
      const modulesBySource = new Map(
        request.modules.map((module) => [`${module.packageName}\0${portable(module.source)}`, module]),
      );
      const cppRefusals = refusalArtifact.refusals.flatMap((refusal) => {
        const module = modulesBySource.get(`${refusal.package}\0${portable(refusal.module)}`);
        return module ? [{ code: refusal.code, message: refusal.reason, module }] : [];
      });
      const packageTargets = Object.fromEntries(
        input.packages.map(({ name }) => {
          const targetName = name.slice('@flighthq/'.length).replaceAll('-', '_');
          return [name, { includePrefix: `flight/${targetName}`, namespace: `flight::${targetName}` }];
        }),
      );
      const cpp = compilerApi.createCppCompilerPublicBindingPlan({
        facade,
        modules: request.modules,
        options: { packageTargets, runtimeProfile: 'flight-cpp' },
        refusals: cppRefusals,
      });
      const plan = compilerApi.createCompilerHaxeDualBindingPlan({
        cpp,
        facade,
        javascriptRefusals: request.refusals,
        modules: request.modules,
        options: { emissionMode: 'extern', rootPackage: 'flight', runtimeModule: 'flight._internal' },
        packageSpecifiers: Object.fromEntries(
          input.packages.map(({ name }) => [name, `${name}/contract`]),
        ),
      });
      const cppExternPlan = compilerApi.createCompilerHaxeCppExternPlan({ bindings: plan, modules: request.modules });
      const cppExternEmission = compilerApi.emitCompilerHaxeCppExternPlan(cppExternPlan);
      artifacts = {
        cppExternEmission,
        cppExternPlan,
        plan,
        report: createNativeBindingPlanningReport(
          plan,
          cppExternPlan,
          cppExternEmission,
          headerStatusArtifact,
          refusalArtifact,
          flightCppDependency,
          compilerDependency,
        ),
      };
      return plan;
    },
  };
  return {
    backend: plannedBackend,
    finish(publicBindings) {
      if (!artifacts || publicBindings?.schema !== 'flight-haxe-dual-binding-plan/1') {
        throw new Error('Pinned flight-compiler did not publish its Haxe dual-binding plan');
      }
      return artifacts;
    },
  };
}

function createNativeBindingPlanningReport(
  plan,
  cppExternPlan,
  cppExternEmission,
  headerStatusArtifact,
  refusalArtifact,
  flightCppDependency,
  compilerDependency,
) {
  const headerStatuses = new Map(headerStatusArtifact.headers.map(({ header, status }) => [header, status]));
  const bindingsByKey = new Map(plan.bindings.map((binding) => [binding.key, binding]));
  const emittedFilesByPath = new Map(cppExternEmission.files.map((file) => [file.path, file]));
  const declarations = cppExternPlan.declarations.map((declaration) => {
    let adapter;
    if (declaration.kind === 'function' && declaration.adapter) {
      const emittedFile = emittedFilesByPath.get(declaration.adapter.headerPath);
      if (!emittedFile) {
        throw new Error(`Compiler Haxe-C++ adapter emission is missing ${declaration.adapter.headerPath}`);
      }
      adapter = {
        emittedFile,
        headerPath: declaration.adapter.headerPath,
        nativeName: declaration.adapter.nativeName,
        semantics: declaration.adapter.semantics,
        targetNativeName: declaration.targetNativeName,
      };
    }
    return {
      ...(adapter ? { adapter } : {}),
      headerStatus: headerStatuses.get(declaration.include) ?? 'missing',
      include: declaration.include,
      kind: declaration.kind,
      nativeName:
        declaration.kind === 'type'
          ? declaration.nativeName
          : declaration.adapter?.nativeName ?? declaration.targetNativeName,
      package: bindingsByKey.get(declaration.key)?.identity.packageName,
      publicName: bindingsByKey.get(declaration.key)?.publicHaxe.qualifiedName,
      transport:
        declaration.kind === 'function'
          ? declaration.adapter
            ? 'adapter'
            : 'direct'
          : declaration.ownership,
    };
  });
  const cppAvailability = countBy(plan.bindings, ({ cpp }) => cpp.availability);
  const javascriptAvailability = countBy(plan.bindings, ({ javascript }) => javascript.availability);
  const declarationKinds = countBy(cppExternPlan.declarations, ({ kind }) => kind);
  const headerStatusesByDeclaration = countBy(declarations, ({ headerStatus }) => headerStatus);
  const externRefusalsByKey = new Map(cppExternPlan.refusals.map((refusal) => [refusal.key, refusal]));
  const refusalCodes = countBy(cppExternPlan.refusals, ({ code, detailCode }) => `${code}${detailCode ? `/${detailCode}` : ''}`);
  const namingDivergences = plan.bindings
    .filter(
      ({ javascript, publicHaxe }) =>
        javascript.availability === 'available' && javascript.locator.exportedName !== publicHaxe.name,
    )
    .map(({ identity, javascript, publicHaxe }) => ({
      exportedName: javascript.locator.exportedName,
      package: identity.packageName,
      publicName: publicHaxe.qualifiedName,
      source: identity.source,
    }));
  const packages = [...new Set(plan.bindings.map(({ identity }) => identity.packageName))]
    .sort(compareText)
    .map((packageName) => {
      const bindings = plan.bindings.filter(({ identity }) => identity.packageName === packageName);
      const keys = new Set(bindings.map(({ key }) => key));
      const packageDeclarations = declarations.filter(({ package: declarationPackage }) => declarationPackage === packageName);
      return {
        bindings: bindings.length,
        cppAvailable: bindings.filter(({ cpp }) => cpp.availability === 'available').length,
        cppExternDeclarations: packageDeclarations.length,
        cppExternRefusals: [...keys].filter((key) => externRefusalsByKey.has(key)).length,
        headerPassingDeclarations: packageDeclarations.filter(({ headerStatus }) => headerStatus === 'pass').length,
        package: packageName,
      };
    });
  return {
    declarations,
    namingDivergences,
    packages,
    pins: {
      flightCompiler: compilerDependency.commit,
      flightCpp: flightCppDependency.commit,
      flightCppCompiler: headerStatusArtifact.compiler?.revision,
      flightCppSource: headerStatusArtifact.sourceRevision,
    },
    refusalLedger: {
      diagnostics: refusalArtifact.refusals.length,
      schema: refusalArtifact.schema,
    },
    schemas: {
      cppExternEmission: cppExternEmission.schema,
      cppExternPlan: cppExternPlan.schema,
      dualBindingPlan: plan.schema,
    },
    schema: 'flight-hx-native-binding-plan/1',
    summary: {
      bindings: plan.bindings.length,
      cppAvailability: Object.fromEntries(sortedCounts(cppAvailability).map(({ count, name }) => [name, count])),
      cppExternDeclarations: cppExternPlan.declarations.length,
      cppExternEmissionFiles: cppExternEmission.files.length,
      cppExternRefusals: cppExternEmission.refusals.length,
      declarationKinds: Object.fromEntries(sortedCounts(declarationKinds).map(({ count, name }) => [name, count])),
      headerStatuses: Object.fromEntries(
        sortedCounts(headerStatusesByDeclaration).map(({ count, name }) => [name, count]),
      ),
      javascriptAvailability: Object.fromEntries(
        sortedCounts(javascriptAvailability).map(({ count, name }) => [name, count]),
      ),
      namingDivergences: namingDivergences.length,
      refusalCodes: Object.fromEntries(sortedCounts(refusalCodes).map(({ count, name }) => [name, count])),
    },
  };
}

function reconcileNativePlanningWithDefaultApi(nativeBindingArtifacts, defaultApi) {
  const rows = defaultApi.packages.reduce(
    (total, package_) => total + package_.functions.length + package_.types.length + package_.values.length,
    0,
  );
  if (nativeBindingArtifacts.plan.bindings.length !== rows) {
    throw new Error(
      `Compiler dual-binding plan has ${String(nativeBindingArtifacts.plan.bindings.length)} contract bindings; ` +
        `the generated default API has ${String(rows)} rows`,
    );
  }
  const typePackages = new Map();
  for (const package_ of defaultApi.packages) {
    for (const type of package_.types) {
      typePackages.set(type, [...(typePackages.get(type) ?? []), package_.package]);
    }
  }
  const typeNameCollisions = [...typePackages]
    .filter(([, packages]) => packages.length > 1)
    .map(([name, packages]) => ({ name, packages }))
    .sort((left, right) => compareText(left.name, right.name));
  nativeBindingArtifacts.report.publicContract = {
    bindings: rows,
    typeNameCollisions,
    uniqueDefaultTypes: defaultApi.summary.types,
  };
}

function emitTranspiledPublicBackend(outputRoot, transpiledFiles) {
  const externRoot = path.join(root, 'generated', 'js');
  if (!existsSync(path.join(externRoot, 'manifest.json'))) {
    throw new Error('Transpiled public backend requires generated/js; run extern generation first');
  }
  const externFiles = filesUnder(externRoot)
    .filter((filename) => filename.endsWith('.hx'))
    .map((filename) => ({
      contents: readFileSync(filename, 'utf8'),
      path: portable(path.relative(externRoot, filename)),
    }));
  const surface = buildTranspiledBackendSurface(externFiles, transpiledFiles);
  for (const file of surface.files) {
    const target = path.join(outputRoot, file.path);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(target, file.contents);
  }
  writeFileSync(path.join(outputRoot, 'public-surface.json'), `${JSON.stringify(surface.report, undefined, 2)}\n`);
  return { files: surface.files.length, summary: surface.report.summary };
}

function externContractCoverage(files, publicExports) {
  const surface = collectExternSurface(files, publicExports.typeNames);
  const emittedByPackage = new Map();
  const emittedTypeNames = new Set(surface.types.map((entry) => entry.publicName));
  for (const declaration of [...surface.functions, ...surface.values]) {
    const names = emittedByPackage.get(declaration.sourcePackage) ?? new Set();
    names.add(declaration.sourceName);
    emittedByPackage.set(declaration.sourcePackage, names);
  }
  const packages = [...publicExports.valuesByPackage]
    .map(([packageName, names]) => {
      const expected = [...names].sort(compareText);
      const holderDeclarations = emittedByPackage.get(packageName) ?? new Set();
      const inlined = [...(publicExports.typesByPackage.get(packageName) ?? new Set())]
        .filter((name) => names.has(name) && emittedTypeNames.has(name) && !holderDeclarations.has(name))
        .sort(compareText);
      const emitted = [...new Set([...holderDeclarations, ...inlined])].sort(compareText);
      const expectedSet = new Set(expected);
      const emittedSet = new Set(emitted);
      return {
        emitted,
        expected,
        inlined,
        missing: expected.filter((name) => !emittedSet.has(name)),
        package: packageName,
        unexpected: emitted.filter((name) => !expectedSet.has(name)),
      };
    })
    .sort((left, right) => compareText(left.package, right.package));
  return {
    packages,
    schema: 'flight-hx-extern-public-runtime-surface/1',
    summary: packages.reduce(
      (summary, package_) => ({
        emittedDeclarations: summary.emittedDeclarations + package_.emitted.length,
        emittedTypes: summary.emittedTypes,
        expectedDeclarations: summary.expectedDeclarations + package_.expected.length,
        fullyCoveredPackages: summary.fullyCoveredPackages + (package_.missing.length === 0 ? 1 : 0),
        missingDeclarations: summary.missingDeclarations + package_.missing.length,
        packages: packages.length,
        unexpectedDeclarations: summary.unexpectedDeclarations + package_.unexpected.length,
      }),
      {
        emittedDeclarations: 0,
        emittedTypes: surface.types.length,
        expectedDeclarations: 0,
        fullyCoveredPackages: 0,
        missingDeclarations: 0,
        packages: 0,
        unexpectedDeclarations: 0,
      },
    ),
    types: surface.types.map((entry) => ({ name: entry.publicName, source: entry.externPath })),
  };
}

function filterExternContractMembers(files, valueExportsByPackage) {
  let removedFunctions = 0;
  let removedValues = 0;
  return {
    files: files.map((file) => {
      if (!/^flight\/_js\/_fn\/[A-Za-z_][A-Za-z0-9_]*\.hx$/u.test(file.path)) return file;
      const specifier = /@:jsImport\("(@flighthq\/[^/]+)\/contract"\)/u.exec(file.contents);
      if (!specifier) return file;
      const publicNames = valueExportsByPackage.get(specifier[1]) ?? new Set();
      const lines = file.contents.split('\n');
      const kept = [];
      for (let index = 0; index < lines.length; index += 1) {
        const native = /^  @:native\("([^"]+)"\)$/u.exec(lines[index]);
        const declarationLine = native ? lines[index + 1] : lines[index];
        const declaration = /^  static (function|var) ([A-Za-z_][A-Za-z0-9_]*)/u.exec(declarationLine ?? '');
        if (!declaration) {
          kept.push(lines[index]);
          continue;
        }
        const sourceName = native?.[1] ?? declaration[2];
        if (publicNames.has(sourceName)) {
          if (native) {
            kept.push(lines[index]);
            index += 1;
          }
          kept.push(declarationLine);
          continue;
        }
        if (declaration[1] === 'function') removedFunctions += 1;
        else removedValues += 1;
        if (native) index += 1;
      }
      return { ...file, contents: kept.join('\n') };
    }),
    removedFunctions,
    removedValues,
  };
}

function synchronizeExternPublicFacades(compilerFiles, write) {
  const publicRoot = path.join(root, 'generated', 'flight');
  const drift = [];
  let files = 0;
  for (const file of compilerFiles) {
    const pathMatch = /^flight\/_js\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (!pathMatch) continue;
    const typeName = pathMatch[1];
    const publicFile = path.join(publicRoot, `${typeName}.hx`);
    if (!existsSync(publicFile)) continue;
    const parameters = haxeTypeParameters(file.contents, typeName);
    const arguments_ = haxeTypeArguments(parameters);
    const alias = `typedef ${typeName}${parameters} = flight._js.${typeName}${arguments_};`;
    const contents = readFileSync(publicFile, 'utf8');
    const existing = new RegExp(`^typedef ${typeName}(?:<[^;]+>)? = flight\\._js\\.${typeName}(?:<[^;]+>)?;$`, 'mu');
    const updated = existing.test(contents)
      ? contents.replace(existing, alias)
      : contents.replace('package flight;\n', `package flight;\n\n#if (js && flight_esm)\n${alias}\n#end\n`);
    files += 1;
    if (updated === contents) continue;
    drift.push(portable(path.relative(root, publicFile)));
    if (write) writeFileSync(publicFile, updated);
  }
  return { drift, files };
}

function haxeTypeParameters(contents, typeName) {
  const declaration = new RegExp(
    `^(?:typedef|extern class|class|interface|enum abstract) ${typeName}(?=[<{( =])`,
    'mu',
  ).exec(contents);
  if (!declaration) throw new Error(`Compiler extern ${typeName}.hx has no matching declaration`);
  const start = declaration.index + declaration[0].length;
  if (contents[start] !== '<') return '';
  const end = findTypeParameterEnd(contents, start);
  if (end === -1) throw new Error(`Compiler extern ${typeName}.hx has unclosed type parameters`);
  return contents.slice(start, end + 1);
}

function haxeTypeArguments(parameters) {
  return parameters
    ? `<${splitTypeParameters(parameters.slice(1, -1))
        .map((parameter) => /^[A-Za-z_][A-Za-z0-9_]*/u.exec(parameter.trim())?.[0])
        .join(', ')}>`
    : '';
}

function createNormalizedHaxeBackend(backend, normalize) {
  const normalizeFiles = (files) =>
    files.map((file) => ({ ...file, contents: normalize(file.contents, file.path) }));
  return {
    emitModule(module, context) {
      return normalizeFiles(backend.emitModule(module, context));
    },
    name: backend.name,
    ...(backend.runtimeAbi ? { runtimeAbi: backend.runtimeAbi } : {}),
    ...(backend.createEmissionSession
      ? {
          createEmissionSession(context) {
            const session = backend.createEmissionSession(context);
            return { emitModule: (module) => normalizeFiles(session.emitModule(module)) };
          },
        }
      : {}),
  };
}

function applyCompatibilityCorrections(contents, filename, mode, applications) {
  return applyCorrectionSpecs(contents, filename, mode, applications, compatibilityCorrectionSpecs);
}

function applyCorrectionSpecs(contents, filename, mode, applications, specs) {
  let corrected = contents;
  for (const spec of specs) {
    if (!spec.modes.has(mode)) continue;
    const matches = [...corrected.matchAll(new RegExp(spec.pattern.source, spec.pattern.flags))];
    if (matches.length === 0) continue;
    const files = applications.get(spec.id) ?? new Map();
    files.set(filename, (files.get(filename) ?? 0) + matches.length);
    applications.set(spec.id, files);
    corrected = corrected.replace(new RegExp(spec.pattern.source, spec.pattern.flags), spec.replacement);
  }
  return corrected;
}

function validateCompatibilityCorrections(mode, applications, emittedFiles, specs) {
  const reports = [];
  for (const spec of specs.filter(({ modes }) => modes.has(mode))) {
    const actual = [...(applications.get(spec.id) ?? new Map())]
      .map(([filename, replacements]) => ({ path: filename, replacements }))
      .sort((left, right) => compareText(left.path, right.path));
    const expected = [...spec.expectedApplications].sort((left, right) => compareText(left.path, right.path));
    if (JSON.stringify(actual) !== JSON.stringify(expected)) {
      throw new Error(
        `Compatibility correction ${spec.id} application drifted:\n` +
          `expected ${JSON.stringify(expected)}\n` +
          `actual ${JSON.stringify(actual)}`,
      );
    }
    const remaining = emittedFiles.flatMap((file) => {
      const matches = [...file.contents.matchAll(new RegExp(spec.pattern.source, spec.pattern.flags))];
      return matches.length === 0 ? [] : [{ path: file.path, replacements: matches.length }];
    });
    if (remaining.length > 0) {
      throw new Error(`Compatibility correction ${spec.id} left matching output: ${JSON.stringify(remaining)}`);
    }
    reports.push({
      files: actual,
      id: spec.id,
      replacements: actual.reduce((total, file) => total + file.replacements, 0),
    });
  }
  if (applications.size !== reports.length) {
    throw new Error(`Unreported compatibility corrections: ${[...applications.keys()].join(', ')}`);
  }
  return reports;
}

function createHaxeCompilationSmoke() {
  return {
    compileEmittedSources(files) {
      const temporaryRoot = mkdtempSync(path.join(tmpdir(), 'flight-hx-compiler-smoke-'));
      let passed = false;
      try {
        for (const file of files) {
          const target = path.join(temporaryRoot, file.path);
          mkdirSync(path.dirname(target), { recursive: true });
          writeFileSync(target, file.contents);
        }
        writeFileSync(
          path.join(temporaryRoot, 'FlightCompilerTranspileSmoke.hx'),
          'class FlightCompilerTranspileSmoke { static function main():Void {} }\n',
        );
        const result = spawnSync(
          process.execPath,
          [
            'tools/haxe.mjs',
            '-cp',
            temporaryRoot,
            '-cp',
            'src',
            '--main',
            'FlightCompilerTranspileSmoke',
            '-js',
            path.join(temporaryRoot, 'smoke.js'),
            '-D',
            'flight_hx',
            '--macro',
            "include('flight._hx')",
          ],
          { cwd: root, encoding: 'utf8' },
        );
        if (result.status === 0) {
          passed = true;
          return [];
        }
        throw new Error(`Haxe ${String(result.status)}:\n${result.stdout}${result.stderr}`);
      } finally {
        if (passed) rmSync(temporaryRoot, { force: true, recursive: true });
        else process.stderr.write(`Failed compiler smoke preserved outside the repository at ${temporaryRoot}\n`);
      }
    },
    name: 'Haxe 4.3.7 complete generated-source compilation',
    supportsEmittedSource: ({ path: filename }) => filename.endsWith('.hx'),
  };
}

function validateExternCandidate(candidateRoot, temporaryRoot) {
  const result = spawnSync(
    process.execPath,
    [
      'tools/haxe.mjs',
      '-cp',
      candidateRoot,
      '-cp',
      'src',
      '-D',
      'flight_esm',
      '-js',
      path.join(temporaryRoot, 'extern-smoke.js'),
      '--macro',
      "include('flight')",
      '--macro',
      "include('flight._js')",
    ],
    { cwd: root, encoding: 'utf8' },
  );
  if (result.status === 0) return undefined;
  return `${result.stdout ?? ''}${result.stderr ?? ''}`;
}

function findTypeParameterEnd(line, start) {
  let depth = 0;
  for (let index = start; index < line.length; index += 1) {
    if (line[index] === '<') depth += 1;
    else if (line[index] === '>' && line[index - 1] !== '-' && line[index - 1] !== '=') {
      depth -= 1;
      if (depth === 0) return index;
    }
  }
  return -1;
}

function splitTypeParameters(parameters) {
  const result = [];
  let start = 0;
  let depth = 0;
  for (let index = 0; index < parameters.length; index += 1) {
    if ('<([{'.includes(parameters[index])) depth += 1;
    else if ('>)]}'.includes(parameters[index]) && parameters[index - 1] !== '-' && parameters[index - 1] !== '=')
      depth -= 1;
    else if (parameters[index] === ',' && depth === 0) {
      result.push(parameters.slice(start, index));
      start = index + 1;
    }
  }
  result.push(parameters.slice(start));
  return result;
}

function generatedReadme(manifest) {
  const backend = manifest.compiler.emissionMode === 'extern' ? 'JavaScript extern' : 'transpiled Haxe';
  const compatibility = manifest.summary.compatibilityFiles
    ? manifest.compiler.emissionMode === 'extern'
      ? ` The flight-hx integration added ${manifest.summary.compatibilityFiles} complete default-public-API modules so every current type, function, and value is available through \`flight.*\` on the ESM backend.`
      : ` The flight-hx integration added ${manifest.summary.compatibilityFiles} derived public/backend files so the supported transpiled surface is consumer-ready.`
    : '';
  const filtered = manifest.summary.filteredContractFunctions
    ? ` The contract filter removed ${manifest.summary.filteredContractFunctions} functions and ${manifest.summary.filteredContractValues} values that the package source does not re-export from \`/contract\`.`
    : '';
  const publicSurface =
    manifest.compiler.emissionMode === 'extern'
      ? ` Public runtime-export coverage and the compiler-emitted type inventory are recorded in \`public-surface.json\`; the exact default \`flight.*\` facade is recorded in \`default-api.json\`. The compiler-owned JS/C++ identity fold, Haxe-C++ carrier candidates, refusals, and flight-cpp header status are recorded in \`native-planning.json\`.`
      : ` The exact supported and unavailable public \`flight.*\` partitions are recorded in \`public-surface.json\`.`;
  return `# Generated ${backend} SDK\n\nThis tree is generated from \`${manifest.source.package}\` ${manifest.source.version} at\n\`${manifest.source.revision}\` by \`flight-compiler\` at \`${manifest.compiler.revision}\`.\nDo not edit it by hand.\n\nThe compiler emitted ${manifest.summary.emittedModules} of ${manifest.summary.sourceModules} dependency-closed source modules\nfrom ${manifest.summary.packages} SDK packages into ${manifest.summary.emittedFiles} Haxe files.${compatibility}${filtered} It refused\n${manifest.summary.refusedModules} modules; every refusal is recorded in \`refusals.json\`.${publicSurface}\n\nRegenerate this mode from the flight-hx repository root:\n\n\`\`\`sh\nnpm run generate -- --${manifest.compiler.emissionMode}\nnpm run generate:check -- --${manifest.compiler.emissionMode}\n\`\`\`\n`;
}

function validateInput(flightDependency, compilerDependency, flightCppDependency) {
  for (const dependency of [flightDependency, compilerDependency, flightCppDependency]) {
    if (!existsSync(path.join(dependency.directory, '.git'))) return `${dependency.name} is not rehydrated.`;
    const head = spawnSync('git', ['rev-parse', 'HEAD'], { cwd: dependency.directory, encoding: 'utf8' });
    if (head.status !== 0 || head.stdout.trim() !== dependency.commit) {
      return `${dependency.name} is not at pinned revision ${dependency.commit.slice(0, 7)}.`;
    }
    const status = spawnSync('git', ['status', '--porcelain'], {
      cwd: dependency.directory,
      encoding: 'utf8',
    });
    if (status.status !== 0 || status.stdout.length > 0) return `${dependency.name} has uncommitted changes.`;
  }
  if (!existsSync(path.join(compilerDependency.directory, 'node_modules', 'typescript'))) {
    return 'flight-compiler dependencies are not installed.';
  }
  if (!existsSync(path.join(flightDependency.directory, 'packages', 'sdk', 'package.json'))) {
    return 'the pinned Flight checkout has no @flighthq/sdk package.';
  }
  for (const artifact of ['generated/refusals.json', 'generated/header-status.json']) {
    if (!existsSync(path.join(flightCppDependency.directory, artifact))) {
      return `the pinned flight-cpp checkout has no ${artifact}.`;
    }
  }
  return undefined;
}

function runCompilerBuild(directory) {
  const npm = process.platform === 'win32' ? 'npm.cmd' : 'npm';
  const result = spawnSync(npm, ['run', 'build', '--silent'], { cwd: directory, encoding: 'utf8' });
  if (result.status !== 0) {
    process.stderr.write(result.stdout ?? '');
    process.stderr.write(result.stderr ?? '');
    process.stderr.write('Pinned flight-compiler build failed.\n');
    process.exit(1);
  }
}

function filesUnder(directory) {
  if (!existsSync(directory)) return [];
  const files = [];
  for (const entry of readdirSync(directory).sort(compareText)) {
    const filename = path.join(directory, entry);
    const status = lstatSync(filename);
    if (status.isDirectory()) files.push(...filesUnder(filename));
    else if (!status.isSymbolicLink()) files.push(filename);
  }
  return files;
}

function compareTrees(expectedRoot, actualRoot) {
  if (!existsSync(actualRoot)) {
    return filesUnder(expectedRoot).map((filename) => portable(path.relative(expectedRoot, filename)));
  }
  const expected = new Map(
    filesUnder(expectedRoot).map((filename) => [
      portable(path.relative(expectedRoot, filename)),
      readFileSync(filename),
    ]),
  );
  const actual = new Map(
    filesUnder(actualRoot).map((filename) => [portable(path.relative(actualRoot, filename)), readFileSync(filename)]),
  );
  const filenames = [...new Set([...expected.keys(), ...actual.keys()])].sort(compareText);
  return filenames.filter(
    (filename) =>
      !expected.has(filename) || !actual.has(filename) || !expected.get(filename).equals(actual.get(filename)),
  );
}

function portable(filename) {
  return filename.split(path.sep).join('/');
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}

function countBy(values, select) {
  const result = new Map();
  for (const value of values) {
    const key = select(value);
    result.set(key, (result.get(key) ?? 0) + 1);
  }
  return result;
}

function sortedCounts(counts) {
  return [...counts].map(([name, count]) => ({ count, name })).sort((left, right) => compareText(left.name, right.name));
}

function label(mode) {
  return mode === 'extern' ? 'Haxe extern' : 'Transpiled Haxe';
}

function formatSummary(prefix, summary) {
  const compatibility = summary.compatibilityFiles ? ` plus ${String(summary.compatibilityFiles)} integration files` : '';
  return `${prefix}: ${String(summary.emittedModules)}/${String(summary.sourceModules)} modules and ${String(summary.emittedFiles)} compiler files${compatibility} across ${String(summary.packages)} packages; ${String(summary.refusedModules)} refusals recorded.\n`;
}
