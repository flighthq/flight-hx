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
import { buildTranspiledBackendSurface, collectExternSurface } from './haxeSurface.mjs';

// flight-hx owns the reproducible integration edge around flight-compiler: checkout discovery,
// compiler installation/build, output layout, manifests, refusal ledgers, and write/check modes.
// TypeScript analysis, package-graph semantics, Haxe lowering, and both Haxe emitters remain entirely
// compiler-owned. This driver intentionally contains no TypeScript parser or target lowering rules.

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
const inputFailure = validateInput(flight, compiler);
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

const { compileTypeScriptPackageGraph, createHaxeCompilerBackend, parseTypeScriptSource } = await import(
  pathToFileURL(compilerEntry)
);
for (const mode of modes) {
  const input = createSdkInput(flight, parseTypeScriptSource, mode);
  const temporaryRoot = mkdtempSync(path.join(tmpdir(), `flight-hx-${mode}-generation-`));
  const candidateRoot = path.join(temporaryRoot, mode);
  const generatedRoot = path.join(root, 'generated', mode === 'extern' ? 'js' : 'hx');
  let preserveTemporaryRoot = false;
  try {
    const generation = generateMode(candidateRoot, mode, input, flight, compiler, {
      compileTypeScriptPackageGraph,
      createHaxeCompilerBackend,
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
      sources: filesUnder(path.join(packageRoot, 'src')).filter((filename) => {
        if (!filename.endsWith('.ts') || filename.endsWith('.d.ts') || filename.endsWith('.test.ts')) return false;
        if (mode !== 'extern' || !/testhelper\.ts$/iu.test(filename)) return true;
        return portable(path.relative(flightDependency.directory, filename)) ===
          'packages/render-wgpu/src/wgpuTestHelper.ts';
      }),
    };
  });
  const sourceInputs = packages.flatMap((package_) =>
    package_.sources.map((sourcePath) => {
      const contents = readFileSync(sourcePath, 'utf8');
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

function collectCompilerContractExports(facade, packages) {
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
    throw new Error(`Compiler public facade has no emitted contract lane for ${missingPackages.join(', ')}`);
  }
  return { typeNames, typesByPackage, valuesByPackage };
}

function generateMode(outputRoot, mode, input, flightDependency, compilerDependency, compilerApi) {
  const compatibilityCorrections = [];
  const backend = createNormalizedHaxeBackend(compilerApi.createHaxeCompilerBackend(), (contents) => contents);
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
  const publicExports = collectCompilerContractExports(compilation.report.exports, input.packages);
  const contractFiltered =
    mode === 'extern'
      ? filterExternContractMembers(compilation.compilation.files, publicExports.valuesByPackage)
      : { files: compilation.compilation.files, removedFunctions: 0, removedValues: 0 };
  for (const file of contractFiltered.files) {
    const target = path.join(outputRoot, file.path);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(target, file.contents);
  }
  const transpiledPublicBackend =
    mode === 'transpile' ? emitTranspiledPublicBackend(outputRoot, contractFiltered.files) : undefined;
  const compatibilityFiles =
    mode === 'extern'
      ? emitMissingExternPublicAliases(
          outputRoot,
          contractFiltered.files,
          publicExports.typeNames,
          flightDependency,
          compilerDependency,
        )
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
    summary.filteredContractFunctions = contractFiltered.removedFunctions;
    summary.filteredContractValues = contractFiltered.removedValues;
    const publicSurface = externContractCoverage(contractFiltered.files, publicExports);
    summary.publicRuntimeSurface = publicSurface.summary;
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

function emitMissingExternPublicAliases(
  outputRoot,
  compilerFiles,
  publicTypeNames,
  flightDependency,
  compilerDependency,
) {
  let emitted = 0;
  for (const file of compilerFiles) {
    const match = /^flight\/_js\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (!match) continue;
    const typeName = match[1];
    if (!publicTypeNames.has(typeName)) continue;
    const parameters = haxeTypeParameters(file.contents, typeName);
    const arguments_ = haxeTypeArguments(parameters);
    const target = path.join(outputRoot, 'flight', `${typeName}.hx`);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(
      target,
      `// Generated by tools/backend-hx from flight@${flightDependency.commit.slice(0, 12)} and flight-compiler@${compilerDependency.commit.slice(0, 12)}. Do not edit.\n#if (js && flight_esm)\npackage flight;\n\ntypedef ${typeName}${parameters} = flight._js.${typeName}${arguments_};\n#end\n`,
    );
    emitted += 1;
  }
  return emitted;
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
  const declaration = new RegExp(`^(?:typedef|class|interface|enum abstract) ${typeName}(?=[<{( =])`, 'mu').exec(
    contents,
  );
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
  const normalizeFiles = (files) => files.map((file) => ({ ...file, contents: normalize(file.contents) }));
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

// No target rewrites live here: compiler output must pass the downstream Haxe smoke unchanged.
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
      ? ` The flight-hx integration added ${manifest.summary.compatibilityFiles} public type aliases so the extern tree is self-contained.`
      : ` The flight-hx integration added ${manifest.summary.compatibilityFiles} derived public/backend files so the supported transpiled surface is consumer-ready.`
    : '';
  const filtered = manifest.summary.filteredContractFunctions
    ? ` The contract filter removed ${manifest.summary.filteredContractFunctions} functions and ${manifest.summary.filteredContractValues} values that the package source does not re-export from \`/contract\`.`
    : '';
  const publicSurface =
    manifest.compiler.emissionMode === 'extern'
      ? ` Public runtime-export coverage and the compiler-emitted type inventory are recorded in \`public-surface.json\`.`
      : ` The exact supported and unavailable public \`flight.*\` partitions are recorded in \`public-surface.json\`.`;
  return `# Generated ${backend} SDK\n\nThis tree is generated from \`${manifest.source.package}\` ${manifest.source.version} at\n\`${manifest.source.revision}\` by \`flight-compiler\` at \`${manifest.compiler.revision}\`.\nDo not edit it by hand.\n\nThe compiler emitted ${manifest.summary.emittedModules} of ${manifest.summary.sourceModules} dependency-closed source modules\nfrom ${manifest.summary.packages} SDK packages into ${manifest.summary.emittedFiles} Haxe files.${compatibility}${filtered} It refused\n${manifest.summary.refusedModules} modules; every refusal is recorded in \`refusals.json\`.${publicSurface}\n\nRegenerate this mode from the flight-hx repository root:\n\n\`\`\`sh\nnpm run generate -- --${manifest.compiler.emissionMode}\nnpm run generate:check -- --${manifest.compiler.emissionMode}\n\`\`\`\n`;
}

function validateInput(flightDependency, compilerDependency) {
  for (const dependency of [flightDependency, compilerDependency]) {
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

function label(mode) {
  return mode === 'extern' ? 'Haxe extern' : 'Transpiled Haxe';
}

function formatSummary(prefix, summary) {
  const compatibility = summary.compatibilityFiles ? ` plus ${String(summary.compatibilityFiles)} integration files` : '';
  return `${prefix}: ${String(summary.emittedModules)}/${String(summary.sourceModules)} modules and ${String(summary.emittedFiles)} compiler files${compatibility} across ${String(summary.packages)} packages; ${String(summary.refusedModules)} refusals recorded.\n`;
}
