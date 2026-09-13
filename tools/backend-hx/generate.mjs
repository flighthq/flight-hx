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
  try {
    const summary = generateMode(candidateRoot, mode, input, flight, compiler, {
      compileTypeScriptPackageGraph,
      createHaxeCompilerBackend,
    });
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
      process.stdout.write(formatSummary(`${label(mode)} output updated`, summary));
    }
  } finally {
    rmSync(temporaryRoot, { force: true, recursive: true });
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
      contractValueExports: collectModuleValueExports(path.join(packageRoot, 'src', 'contract.ts')),
      dependencies: Object.keys(manifest.dependencies ?? {})
        .filter((dependency) => includedPackages.has(dependency))
        .sort(compareText),
      name,
      root: packageRoot,
      sources: filesUnder(path.join(packageRoot, 'src')).filter(
        (filename) =>
          filename.endsWith('.ts') &&
          !filename.endsWith('.d.ts') &&
          !filename.endsWith('.test.ts') &&
          (mode !== 'extern' || !filename.endsWith('TestHelper.ts')),
      ),
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
    defaultGenericDeclarations: new Set(sourceInputs.flatMap(({ contents }) => typeDeclarationsWithDefaults(contents))),
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
    contractValueExports: new Map(packages.map((package_) => [package_.name, package_.contractValueExports])),
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

function collectModuleValueExports(filename, cache = new Map(), active = new Set()) {
  if (!existsSync(filename)) return new Set();
  const normalized = path.resolve(filename);
  if (cache.has(normalized)) return cache.get(normalized);
  if (active.has(normalized)) return new Set();
  const nextActive = new Set(active).add(normalized);
  const contents = readFileSync(normalized, 'utf8');
  const exports = new Set();
  for (const match of contents.matchAll(
    /\bexport\s+(?:(?:declare|async)\s+)*(?:function|const|let|var|class|enum)\s+([A-Za-z_][A-Za-z0-9_]*)/gu,
  )) {
    exports.add(match[1]);
  }
  for (const match of contents.matchAll(/\bexport\s+(?!type\b)\{([\s\S]*?)\}\s*(?:from\s+['"]([^'"]+)['"])?\s*;/gu)) {
    for (const item of match[1].split(',')) {
      const clean = item
        .replace(/\/\*[\s\S]*?\*\//gu, '')
        .replace(/\/\/.*$/gu, '')
        .trim();
      if (!clean || clean.startsWith('type ')) continue;
      const parts = clean.split(/\s+as\s+/u);
      const exported = parts.at(-1)?.trim();
      if (/^[A-Za-z_][A-Za-z0-9_]*$/u.test(exported ?? '')) exports.add(exported);
    }
  }
  for (const match of contents.matchAll(/\bexport\s+\*\s+from\s+['"]([^'"]+)['"]\s*;/gu)) {
    const target = resolveTypeScriptModule(normalized, match[1]);
    if (!target) continue;
    for (const name of collectModuleValueExports(target, cache, nextActive)) exports.add(name);
  }
  cache.set(normalized, exports);
  return exports;
}

function resolveTypeScriptModule(importer, specifier) {
  if (!specifier.startsWith('.')) return undefined;
  const unresolved = path.resolve(path.dirname(importer), specifier);
  const candidates = [
    unresolved,
    `${unresolved}.ts`,
    path.join(unresolved, 'index.ts'),
    ...(unresolved.endsWith('.js') ? [`${unresolved.slice(0, -3)}.ts`] : []),
  ];
  return candidates.find((candidate) => existsSync(candidate));
}

function generateMode(outputRoot, mode, input, flightDependency, compilerDependency, compilerApi) {
  const backend = createNormalizedHaxeBackend(compilerApi.createHaxeCompilerBackend(), (contents) =>
    normalizeCompilerHaxe(contents, input.defaultGenericDeclarations, mode),
  );
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
  const contractFiltered =
    mode === 'extern'
      ? filterExternContractMembers(compilation.compilation.files, input.contractValueExports)
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
      ? emitMissingExternPublicAliases(outputRoot, contractFiltered.files, flightDependency, compilerDependency)
      : transpiledPublicBackend.files;
  const publicFacades =
    mode === 'extern' ? synchronizeExternPublicFacades(compilation.compilation.files, !check) : { files: 0, drift: [] };
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
    const publicSurface = externContractCoverage(contractFiltered.files, input.contractValueExports);
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
      compatibilityCorrections: [
        'flight-hx-runtime-module-member-prefix/1',
        'flight-hx-nested-callback-return-parentheses/1',
        'flight-hx-enum-abstract-member-identifiers/1',
        'flight-hx-ipc-target-default-type-parameter/1',
        'flight-hx-optional-call-lowering/1',
        'flight-hx-enum-value-type-collision/1',
        'flight-hx-type-alias-value-collision/1',
        'flight-hx-source-default-type-parameters/1',
        'flight-hx-unique-symbol-void-brand/1',
        'flight-hx-symbol-runtime-shim/1',
        'flight-hx-standard-library-spellings/1',
        'flight-hx-constant-default-arguments/1',
        'flight-hx-array-api/1',
        'flight-hx-dynamic-access-keys/1',
        'flight-hx-optional-backend-arguments/1',
        'flight-hx-webgl-static-constants/1',
        'flight-hx-assignment-expression-parentheses/1',
        'flight-hx-parameter-dependent-defaults/1',
        'flight-hx-structural-cast/1',
        'flight-hx-empty-void-function/1',
        'flight-hx-typed-array-integer-write/1',
        'flight-hx-callable-generic-constraint/1',
        'flight-hx-erased-entity-constraint/1',
        'flight-hx-promise-void-carrier/1',
        ...(mode === 'extern' ? ['flight-hx-extern-type-alias-inlining/1'] : []),
        ...(mode === 'extern' ? ['flight-hx-refused-extern-type-carriers/1'] : []),
        ...(mode === 'extern' ? ['flight-hx-contract-export-filter/1'] : []),
        ...(mode === 'extern' ? ['flight-hx-public-extern-aliases/1'] : []),
        ...(mode === 'extern' ? ['flight-hx-public-extern-generics/1'] : []),
        ...(mode === 'transpile' ? ['flight-hx-transpiled-public-backend/1'] : []),
      ],
      emissionMode: mode,
      repository: compilerDependency.repository,
      revision: compilerDependency.commit,
      target: 'haxe',
    },
    packages,
    runtime: {
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
  return summary;
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

function externContractCoverage(files, valueExportsByPackage) {
  const surface = collectExternSurface(files);
  const emittedByPackage = new Map();
  for (const declaration of [...surface.functions, ...surface.values]) {
    const names = emittedByPackage.get(declaration.sourcePackage) ?? new Set();
    names.add(declaration.sourceName);
    emittedByPackage.set(declaration.sourcePackage, names);
  }
  const packages = [...valueExportsByPackage]
    .map(([packageName, names]) => {
      const expected = [...names].sort(compareText);
      const emitted = [...(emittedByPackage.get(packageName) ?? new Set())].sort(compareText);
      const expectedSet = new Set(expected);
      const emittedSet = new Set(emitted);
      return {
        emitted,
        expected,
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

function emitMissingExternPublicAliases(outputRoot, compilerFiles, flightDependency, compilerDependency) {
  let emitted = 0;
  for (const file of compilerFiles) {
    const match = /^flight\/_js\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (!match) continue;
    const typeName = match[1];
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
        if (result.status === 0) return [];
        throw new Error(`Haxe ${String(result.status)}:\n${result.stdout}${result.stderr}`);
      } finally {
        rmSync(temporaryRoot, { force: true, recursive: true });
      }
    },
    name: 'Haxe 4.3.7 complete generated-source compilation',
    supportsEmittedSource: ({ path: filename }) => filename.endsWith('.hx'),
  };
}

// These are narrow integration corrections for compiler output already represented correctly in
// neutral IR. Keep them named and byte-stable until flight-compiler emits the same spellings:
// - ambient member routes currently retain the compiler's default runtime prefix despite the
//   runtimeModule option;
// - a callback returning another zero-argument callback needs parentheses around the return type in
//   Haxe (`()->(()->Void)`), while the compiler currently emits the unparsable `()->()->Void`.
// - string-literal enum members need valid Haxe identifiers when their values are empty, numeric,
//   symbolic, or contain punctuation. The string representation itself is left byte-for-byte intact.
// - IpcTargetedSendBackend's source default (`Target = never`) is absent from emitted Haxe even
//   though HostIpcCapabilities consumes its bare form; Dynamic is the usable Haxe default carrier.
// - Haxe supports optional field access but not JavaScript's `callee?.()` grammar. Evaluate the
//   callee once and call it only when present, preserving optional-call semantics.
// - TypeScript's common `const X = {...} as const; type X = ...` pattern occupies both namespaces.
//   Haxe enum abstracts represent both at once; merge the duplicate value object into the abstract,
//   retaining its declared public member names and exact backing strings.
// - The same value/type pattern may lower its type side to a primitive typedef. Promote that pair
//   to an enum abstract too, inferring Dynamic's concrete backing from the constant values.
// - The compiler currently omits source generic defaults. Restore defaults only for declarations
//   that have them in the pinned TypeScript, using Dynamic as Haxe's constraint-compatible carrier.
// - Optional unique-symbol branding fields carry TypeScript `void`, which Haxe forbids for structure
//   fields. Dynamic retains the non-runtime marker without inventing a callable/value contract.
// - TypeScript symbols route through the maintained runtime shim so entity brands compile on JS
//   and remain opaque, stable keys on host-free Haxe targets.
// - ECMAScript Math methods and zero-argument Array.slice use maintained Haxe equivalents.
// - Haxe requires default arguments to be literal constants, so inline the two emitted SDK constants.
function normalizeCompilerHaxe(contents, defaultGenericDeclarations, mode) {
  const normalized = normalizeArrayPushCalls(
    normalizeTypeAliasValueObjects(
      normalizeEnumValueObjects(
        contents
          .replaceAll('flighthq._internal.', 'flight._internal.')
          .replaceAll('->()->Void', '->(()->Void)')
          .replaceAll('js.lib.Symbol.for_(', 'flight._internal._Symbol.for_(')
          .replaceAll('js.lib.Symbol(', 'flight._internal._Symbol.create(')
          .replaceAll('Math.log2(', 'flight._internal._Math.log2(')
          .replaceAll('Math.sign(', 'flight._internal._Math.sign(')
          .replaceAll('Math.trunc(', 'flight._internal._Math.trunc(')
          .replaceAll('.slice()', '.copy()')
          .replaceAll(':Float = EPSILON', ':Float = 0.000001')
          .replaceAll(':Float = defaultEpsilon', ':Float = 0.000001')
          .replace(/^([ \t]*)([A-Za-z_][A-Za-z0-9_]*)\.length = (.+);$/gmu, '$1$2.resize(Std.int($3));')
          .replace(/^([ \t]*)([A-Za-z_][A-Za-z0-9_]*)\.length -= (.+);$/gmu, '$1$2.resize($2.length - Std.int($3));')
          .replaceAll('styles[Std.int(className)]', 'styles[className]')
          .replaceAll('RENDER_EFFECT_INPUTS[Std.int(effect.kind)]', 'RENDER_EFFECT_INPUTS[effect.kind]')
          .replaceAll('formatBlockInfo[Std.int(format)]', 'formatBlockInfo[cast format]')
          .replaceAll('host.dialog.photoCapture.capture()', 'host.dialog.photoCapture.capture(null)')
          .replaceAll('host.dialog.videoCapture.capture()', 'host.dialog.videoCapture.capture(null)')
          .replaceAll('host.dialog.imageOpen.open()', 'host.dialog.imageOpen.open(null)')
          .replace(/\bgl\.([A-Z][A-Z0-9_]*)\b/gu, 'js.html.webgl.WebGL2RenderingContext.$1')
          .replaceAll('Math.max(r, g, b)', 'Math.max(Math.max(r, g), b)')
          .replaceAll('Math.min(r, g, b)', 'Math.min(Math.min(r, g), b)')
          .replaceAll('source[Std.int(EntityRuntimeKey)]', 'source.EntityRuntimeKey')
          .replaceAll('cast(cast(state, Dynamic))', 'cast state')
          .replaceAll(
            'function defaultComputeLocalBoundsRectangle(_out:Rectangle, _source:BoundsNodeAny):Dynamic',
            'function defaultComputeLocalBoundsRectangle(_out:Rectangle, _source:BoundsNodeAny):Void',
          )
          .replaceAll('if (t *= 2 < 1)', 'if ((t *= 2) < 1)')
          .replaceAll('Math.pow(2, (10 * t -= 1))', 'Math.pow(2, (10 * (t -= 1)))')
          .replaceAll('Math.pow(2, (- 10 * t -= 1))', 'Math.pow(2, (-10 * (t -= 1)))')
          .replaceAll(
            'final easeInOutBack:EasingFunction = function(t:Float) return ((t *= 2 < 1) ? (0.5 * ((t * t) * (((s2 + 1) * t) - s2))) : (0.5 * (((t -= 2 * t) * (((s2 + 1) * t) + s2)) + 2)));',
            'final easeInOutBack:EasingFunction = function(t:Float) return (((t *= 2) < 1) ? (0.5 * ((t * t) * (((s2 + 1) * t) - s2))) : (0.5 * ((((t -= 2) * t) * (((s2 + 1) * t) + s2)) + 2)));',
          )
          .replaceAll(
            'final easeOutBack:EasingFunction = function(t:Float) return (((t -= 1 * t) * (((s + 1) * t) + s)) + 1);',
            'final easeOutBack:EasingFunction = function(t:Float) return ((((t -= 1) * t) * (((s + 1) * t) + s)) + 1);',
          )
          .replaceAll('width:Float = bitmap.width', '?width:Float')
          .replaceAll('height:Float = bitmap.height', '?height:Float')
          .replaceAll(
            '{ bitmap: bitmap, x: x, y: y, width: width, height: height }',
            '{ bitmap: bitmap, x: x, y: y, width: width ?? bitmap.width, height: height ?? bitmap.height }',
          )
          .replaceAll('out.width = width;', 'out.width = width ?? bitmap.width;')
          .replaceAll('out.height = height;', 'out.height = height ?? bitmap.height;')
          .replace(/^([ \t]*)out\[(Std\.int\([^\n]+\))\] = ([rgba]);$/gmu, '$1out[$2] = Std.int($3);')
          .replaceAll('T:(Array<Dynamic>)->Void', 'T')
          .replaceAll('<Type:Entity', '<Type')
          .replaceAll('flight._internal._Promise<Void>', 'flight._internal._Promise<Dynamic>')
          .replace(/^(\s*(?:@:optional )?)var operator:/gmu, '$1@:native("operator") var operator_:')
          .replace(/\boperator:/gu, 'operator_:')
          .replace(/\?([A-Za-z_][A-Za-z0-9_]*TypeKey):Void/gu, '?$1:Dynamic')
          .replace(/@:optional var ([A-Za-z_][A-Za-z0-9_]*TypeKey):Void;/gu, '@:optional var $1:Dynamic;')
          .replaceAll('typedef IpcTargetedSendBackend<Target> =', 'typedef IpcTargetedSendBackend<Target = Dynamic> ='),
      ),
    ),
  ).replace(/(?<![A-Za-z0-9_.])Math\./gu, 'flight._internal._Math.');
  const normalizedDefaults = addDefaultTypeParameters(
    mode === 'extern' ? normalizeExternTypeAliases(normalized) : normalized,
    defaultGenericDeclarations,
  );
  let inEnumAbstract = false;
  let optionalCallIndex = 0;
  return normalizedDefaults
    .split('\n')
    .map((line) => {
      if (line.startsWith('enum abstract ')) inEnumAbstract = true;
      const member = inEnumAbstract ? /^(\s*var )(.*?)( = .*;)$/.exec(line) : undefined;
      let result = member ? `${member[1]}${enumMemberIdentifier(member[2])}${member[3]}` : line;
      const optionalCall = /^(\s*)(.+?)\?\.\((.*)\);$/u.exec(result);
      if (optionalCall) {
        const temporary = `__flightOptionalCall${String(optionalCallIndex)}`;
        optionalCallIndex += 1;
        result = `${optionalCall[1]}final ${temporary} = ${optionalCall[2]};\n${optionalCall[1]}if (${temporary} != null) ${temporary}(${optionalCall[3]});`;
      }
      if (inEnumAbstract && line === '}') inEnumAbstract = false;
      return result;
    })
    .join('\n');
}

function normalizeExternTypeAliases(contents) {
  const stringAliases = [
    'AudioResourceFailureKind',
    'AudioResourceReferenceKind',
    'CompressionFraming',
    'EmissiveModifierFacing',
    'FlightDocumentRefusalReason',
    'FogModifierMode',
    'ImageResourceFailureKind',
    'ImageResourceReferenceKind',
    'ImportDiagnosticSeverity',
    'LayoutResolutionFailureKind',
    'NodeInteractiveStateRefusalReason',
    'RenderCacheKind',
    'RiveAnimationLoop',
    'RiveWeightedPointKind',
    'Skeleton2DConstraintKind',
    'Skeleton2DPathPositionMode',
    'Skeleton2DPathRotateMode',
    'Skeleton2DPathSpacingMode',
    'Skeleton2DSlotAnimationPath',
    'StandardMaterialKind',
    'StatechartComparison',
    'StatechartInputKind',
    'StatechartTransitionStatus',
    'TimelineFrameEntryCause',
    'VertexDisplaceModifierSource',
  ];
  let normalized = contents;
  for (const alias of stringAliases) normalized = normalized.replaceAll(`flight.${alias}`, 'String');
  normalized = normalized.replace(/flight\.ApplicationRenderView<[^>\n]+>/gu, 'Dynamic');
  for (const alias of [
    'ApplicationRenderView',
    'GlMeshMaterialRenderer',
    'GlModifierSnippet',
    'GlRenderEffectContext',
    'GlRenderState',
    'RenderState',
  ]) {
    normalized = normalized.replaceAll(`flight.${alias}`, 'Dynamic');
  }
  return normalized
    .replaceAll('flight.Kind', 'String')
    .replaceAll('flight.RenderRegistry', 'Int')
    .replaceAll('flight.RiveFieldType', 'Float')
    .replaceAll(
      'flight.CatalogEntry',
      '{ kind:String, registrations:Array<{ module:String, registrar:String }>, registry:Int }',
    );
}

function normalizeArrayPushCalls(contents) {
  return contents
    .split('\n')
    .map((line) => {
      const push = /^([ \t]*)([A-Za-z_][A-Za-z0-9_]*)\.push\((.*)\);$/u.exec(line);
      if (!push || !hasTopLevelComma(push[3])) return line;
      return `${push[1]}flight._internal._ArrayTools.pushMany(${push[2]}, [${push[3]}]);`;
    })
    .join('\n');
}

function hasTopLevelComma(value) {
  let quote;
  let escaped = false;
  let depth = 0;
  for (const character of value) {
    if (quote) {
      if (escaped) escaped = false;
      else if (character === '\\') escaped = true;
      else if (character === quote) quote = undefined;
    } else if (character === '"' || character === "'") quote = character;
    else if ('<([{'.includes(character)) depth += 1;
    else if ('>)]}'.includes(character)) depth -= 1;
    else if (character === ',' && depth === 0) return true;
  }
  return false;
}

function typeDeclarationsWithDefaults(contents) {
  const declarations = [];
  for (const match of contents.matchAll(
    /\bexport\s+(?:(?:abstract\s+)?class|interface|type)\s+([A-Za-z_][A-Za-z0-9_]*)\s*</gu,
  )) {
    const start = contents.indexOf('<', match.index);
    const end = findTypeParameterEnd(contents, start);
    if (end !== -1 && splitTypeParameters(contents.slice(start + 1, end)).some(hasTopLevelEquals)) {
      declarations.push(match[1]);
    }
  }
  return declarations;
}

function addDefaultTypeParameters(contents, declarationNames) {
  return contents
    .split('\n')
    .map((line) => {
      const declaration = /^(?:typedef|class|interface|enum abstract) ([A-Za-z_][A-Za-z0-9_]*)</u.exec(line);
      if (!declaration || !declarationNames.has(declaration[1])) return line;
      const start = line.indexOf('<', declaration[0].length - 1);
      const end = findTypeParameterEnd(line, start);
      if (end === -1) return line;
      const parameters = splitTypeParameters(line.slice(start + 1, end));
      const withDefaults = parameters
        .map((parameter) => (hasTopLevelEquals(parameter) ? parameter : `${parameter} = Dynamic`))
        .join(',');
      return `${line.slice(0, start + 1)}${withDefaults}${line.slice(end)}`;
    })
    .join('\n');
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

function hasTopLevelEquals(parameter) {
  let depth = 0;
  for (let index = 0; index < parameter.length; index += 1) {
    if ('<([{'.includes(parameter[index])) depth += 1;
    else if ('>)]}'.includes(parameter[index]) && parameter[index - 1] !== '-' && parameter[index - 1] !== '=')
      depth -= 1;
    else if (parameter[index] === '=' && parameter[index + 1] !== '>' && depth === 0) return true;
  }
  return false;
}

function normalizeTypeAliasValueObjects(contents) {
  const aliases = new Map(
    [...contents.matchAll(/^typedef ([A-Za-z_][A-Za-z0-9_]*)_2 = (String|Float|Dynamic);$/gmu)].map((match) => [
      match[1],
      match[2],
    ]),
  );
  if (aliases.size === 0) return contents;

  const valuesByType = new Map();
  for (const line of contents.split('\n')) {
    const valueObject = /^final ([A-Za-z_][A-Za-z0-9_]*):\{.*\} = \{ (.*) \};$/u.exec(line);
    if (valueObject && aliases.has(valueObject[1])) {
      valuesByType.set(
        valueObject[1],
        [...valueObject[2].matchAll(/([A-Za-z_][A-Za-z0-9_]*): ("(?:\\.|[^"])*"|[-+]?\d+(?:\.\d+)?)/gu)].map(
          (member) => ({ name: member[1], value: member[2] }),
        ),
      );
      continue;
    }
    const scalar = /^final ([A-Za-z_][A-Za-z0-9_]*):(String|Float) = (.+);$/u.exec(line);
    if (scalar && aliases.has(scalar[1])) {
      valuesByType.set(scalar[1], [{ name: scalar[1], value: scalar[3] }]);
    }
  }

  return contents
    .split('\n')
    .flatMap((line) => {
      const declaration = /^typedef ([A-Za-z_][A-Za-z0-9_]*)_2 = (String|Float|Dynamic);$/u.exec(line);
      if (declaration) {
        const members = valuesByType.get(declaration[1]);
        if (!members || members.length === 0) return [line];
        const backing =
          declaration[2] === 'Dynamic'
            ? members.every(({ value }) => value.startsWith('"'))
              ? 'String'
              : members.every(({ value }) => /^[-+]?\d+(?:\.\d+)?$/u.test(value))
                ? 'Float'
                : 'Dynamic'
            : declaration[2];
        return [
          `enum abstract ${declaration[1]}(${backing}) from ${backing} to ${backing} {`,
          ...members.map(({ name, value }) => `  var ${name} = ${value};`),
          '}',
        ];
      }
      const value = /^final ([A-Za-z_][A-Za-z0-9_]*)(?::\{|:(?:String|Float) =)/u.exec(line);
      if (value && aliases.has(value[1]) && valuesByType.has(value[1])) return [];
      return [line];
    })
    .join('\n');
}

function normalizeEnumValueObjects(contents) {
  const collisionNames = new Set(
    [...contents.matchAll(/^enum abstract ([A-Za-z_][A-Za-z0-9_]*)_2\b/gmu)].map((match) => match[1]),
  );
  if (collisionNames.size === 0) return contents;

  const membersByType = new Map();
  for (const line of contents.split('\n')) {
    const valueObject = /^final ([A-Za-z_][A-Za-z0-9_]*):\{.*\} = \{ (.*) \};$/u.exec(line);
    if (!valueObject || !collisionNames.has(valueObject[1])) continue;
    const membersByValue = new Map();
    for (const member of valueObject[2].matchAll(/([A-Za-z_][A-Za-z0-9_]*): ("(?:\\.|[^"])*"|[-+]?\d+(?:\.\d+)?)/gu)) {
      membersByValue.set(member[2], member[1]);
    }
    membersByType.set(valueObject[1], membersByValue);
  }

  let currentType;
  return contents
    .split('\n')
    .flatMap((line) => {
      const declaration = /^enum abstract ([A-Za-z_][A-Za-z0-9_]*)_2\b/u.exec(line);
      if (declaration && collisionNames.has(declaration[1])) {
        currentType = declaration[1];
        return [line.replace(`${currentType}_2`, currentType)];
      }
      const valueObject = /^final ([A-Za-z_][A-Za-z0-9_]*):\{/u.exec(line);
      if (valueObject && collisionNames.has(valueObject[1])) return [];
      const member = currentType ? /^(\s*var )(.+?)( = (.+);)$/u.exec(line) : undefined;
      if (member) {
        const publicName = membersByType.get(currentType)?.get(member[4]);
        if (publicName) return [`${member[1]}${publicName}${member[3]}`];
      }
      if (currentType && line === '}') currentType = undefined;
      return [line];
    })
    .join('\n');
}

function enumMemberIdentifier(name) {
  if (/^[A-Za-z_][A-Za-z0-9_]*$/u.test(name)) return name;
  const operatorNames = new Map([
    ['!=', 'NotEqual'],
    ['<', 'LessThan'],
    ['<=', 'LessThanOrEqual'],
    ['==', 'Equal'],
    ['>', 'GreaterThan'],
    ['>=', 'GreaterThanOrEqual'],
  ]);
  if (operatorNames.has(name)) return operatorNames.get(name);
  if (name.length === 0) return 'Empty';
  const identifier = name
    .split(/[^A-Za-z0-9]+/u)
    .filter(Boolean)
    .map((part) => `${part[0].toUpperCase()}${part.slice(1)}`)
    .join('');
  return /^[0-9]/u.test(identifier) ? `Value${identifier}` : identifier;
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
