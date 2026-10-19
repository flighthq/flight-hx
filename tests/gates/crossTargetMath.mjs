// Installed consumers must cross both production backends: the complete Flight ESM extern surface
// on web and the manifest-recorded flight-cpp subset/extensions on hxcpp. Direct scalars,
// compiler-emitted String adapters, optional-scalar adapters, recursive Array<Float> copy
// adapters, nullable String adapters, host creation, and a Scene2D GL framebuffer each have an
// explicit oracle here.
import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, mkdtempSync, readFileSync, readdirSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { parseModuleMembers } from '../../tools/backend-hx/haxeSurface.mjs';
import { webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';
import { bundleFlightJs } from '../../tools/esm/bundle.mjs';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const marker = 'CROSS_TARGET_MATH_OK';
const scalarOverrideProvenance = 'flight-hx/header-confirmed-scalar/1';
const optionalScalarOverrideProvenance = 'flight-hx/header-confirmed-optional-scalar/1';
const arrayFloatAdapterProvenance = 'flight-hx/array-float-copy-adapter/1';
const nullableStringAdapterProvenance = 'flight-hx/nullable-string-copy-adapter/1';
const nativePlanning = JSON.parse(readFileSync(path.join(repoRoot, 'generated', 'js', 'native-planning.json'), 'utf8'));
const plannedFunctions = new Map(
  nativePlanning.declarations
    .filter(({ kind }) => kind === 'function')
    .map((declaration) => [declaration.publicName, declaration]),
);
const expectedFunctionsByModule = new Map();
for (const declaration of plannedFunctions.values()) {
  if (
    (declaration.transport !== 'direct' && declaration.transport !== 'adapter') ||
    declaration.headerStatus !== 'pass'
  ) {
    continue;
  }
  const separator = declaration.publicName.lastIndexOf('.');
  const module = declaration.publicName.slice(0, separator);
  const functions = expectedFunctionsByModule.get(module) ?? [];
  functions.push(declaration.publicName.slice(separator + 1));
  expectedFunctionsByModule.set(module, functions);
}
for (const functions of expectedFunctionsByModule.values()) functions.sort();
const expectedCorrections = [
  'flight-hx-hxcpp-flight-namespace-isolation/1',
  'flight-hx-hxcpp-cpp11-override/1',
  'flight-hx-hxcpp-array-float-copy-adapter/1',
  'flight-hx-hxcpp-nullable-string-copy-adapter/1',
];
const expectedNativeHost = {
  module: 'flight.HostSdlGl',
  function: 'runHostSdlGlSmoke',
  profile: 'sdl-gl',
  target: 'Flight::HostSdlGl',
  requiresBuildDefine: 'flight_cpp_build',
};
const expectedNativeExtension = {
  module: 'flight.Scene2dApp',
  nativeBridge: 'flight._cpp.Camera2dScene',
  publicTypes: ['flight.DisplayObject', 'flight.Scene2dNode', 'flight.Shape', 'flight.Sprite'],
  profile: 'scene2d-gl',
  target: 'Flight::HostSdlGl+Flight::SdkPreview',
  requiresBuildDefine: 'flight_cpp_build',
  includeRoots: ['include', 'overrides/include', 'generated/include'],
  example: 'examples/camera2d',
};
const temporaryRoot = mkdtempSync(path.join(tmpdir(), 'flight-hx-cross-target-math-'));

try {
  const flightCpp = resolveDependency(repoRoot, 'flight-cpp');
  validateHaxelibMetadata();
  const { bindings, nativeExtension, nativeHost } = validateNativeManifest(flightCpp);
  const consumer = createHaxelibConsumer();
  runNative(flightCpp, bindings, consumer);
  rejectUnsupportedNative(flightCpp, consumer);
  runNativeHost(flightCpp, nativeHost, consumer);
  runNativeCamera2d(flightCpp, nativeExtension, consumer);
  runFallback(consumer);
  await runWeb(bindings, consumer);
  await buildWebCamera2d(nativeExtension, consumer);
  process.stdout.write(
    `cross-target gate: an isolated -lib flight consumer ran ${String(bindings.length)} ` +
      `manifest-recorded functions on Flight ESM and flight-cpp; the optional legacy-pinned ` +
      `pure-Haxe backend passed its focused facade proof; the packaged native extensions also created and ` +
      `presented a real flight-cpp SDL3/GL surface, and the Haxe-authored Camera2D scene passed ` +
      `the upstream-control and native framebuffer oracles while linking against current Flight ESM.\n`,
  );
} finally {
  rmSync(temporaryRoot, { force: true, recursive: true });
}

function validateHaxelibMetadata() {
  const haxelib = JSON.parse(readFileSync(path.join(repoRoot, 'haxelib.json'), 'utf8'));
  const nodePackage = JSON.parse(readFileSync(path.join(repoRoot, 'package.json'), 'utf8'));
  const externManifest = JSON.parse(readFileSync(path.join(repoRoot, 'generated', 'js', 'manifest.json'), 'utf8'));
  if (haxelib.name !== 'flight') fail(`unexpected haxelib name ${String(haxelib.name)}`);
  if (haxelib.classPath !== 'lib') fail(`unexpected haxelib classPath ${String(haxelib.classPath)}`);
  if (haxelib.version !== nodePackage.version || haxelib.version !== externManifest.source.version) {
    fail(
      `package versions differ: haxelib=${String(haxelib.version)}, node=${String(nodePackage.version)}, ` +
        `Flight=${String(externManifest.source.version)}`,
    );
  }
  const extraParameters = readFileSync(path.join(repoRoot, 'extraParams.hxml'), 'utf8').trim();
  if (extraParameters !== '--macro flight_hx.Package.configure()') {
    fail(`unexpected installed-package parameters: ${extraParameters}`);
  }
}

function validateNativeManifest(flightCpp) {
  const manifest = JSON.parse(readFileSync(path.join(repoRoot, 'src-cpp', 'manifest.json'), 'utf8'));
  if (manifest.schema !== 'flight-hx-cpp-bindings/1') fail(`unknown native manifest schema ${manifest.schema}`);
  if (manifest.flightCppRevision !== flightCpp.commit) {
    fail(`native manifest pins ${manifest.flightCppRevision}, lock pins ${flightCpp.commit}`);
  }
  if (manifest.cppStandard !== 20) fail(`native manifest requires unexpected C++${manifest.cppStandard}`);
  if (JSON.stringify(manifest.corrections) !== JSON.stringify(expectedCorrections)) {
    fail(`native correction inventory drifted: ${manifest.corrections?.join(', ')}`);
  }
  if (manifest.hosts?.length !== 1 || JSON.stringify(manifest.hosts[0]) !== JSON.stringify(expectedNativeHost)) {
    fail(`native host inventory drifted: ${JSON.stringify(manifest.hosts)}`);
  }
  if (
    manifest.extensions?.length !== 1 ||
    JSON.stringify(manifest.extensions[0]) !== JSON.stringify(expectedNativeExtension)
  ) {
    fail(`native extension inventory drifted: ${JSON.stringify(manifest.extensions)}`);
  }
  for (const includeRoot of expectedNativeExtension.includeRoots) {
    if (!existsSync(path.join(flightCpp.directory, includeRoot))) {
      fail(`native extension include root is missing from pinned flight-cpp: ${includeRoot}`);
    }
  }
  const cameraSource = readFileSync(path.join(repoRoot, expectedNativeExtension.example, 'Camera2d.hx'), 'utf8');
  for (const backendDetail of [
    '#if',
    'flight._js',
    'flight._cpp',
    'Camera2dScene',
    'NativeCamera2dSceneSink',
    'WebCamera2dSceneSink',
  ]) {
    if (cameraSource.includes(backendDetail)) {
      fail(`Camera2D public sample exposes backend detail ${backendDetail}`);
    }
  }
  if (
    !cameraSource.includes('import flight.Scene2dApp;') ||
    !cameraSource.includes('import flight.Sprite;') ||
    !cameraSource.includes('final sprite:Sprite = app.createSolidSprite')
  ) {
    fail('Camera2D public sample does not exercise the unified Scene2dApp/Sprite API');
  }
  for (const typeName of expectedNativeExtension.publicTypes) {
    const holder = typeName.replace(/^flight\./u, '');
    const selector = path.join(
      repoRoot,
      holder === 'Scene2dNode' ? 'src' : 'src-cpp',
      'flight',
      `${holder}.hx`,
    );
    const implementation = path.join(repoRoot, 'src-cpp', 'flight', '_cpp', `${holder}.hx`);
    if (!existsSync(selector) || !existsSync(implementation)) {
      fail(`native public Scene2D type selector or implementation is missing: ${typeName}`);
    }
    if (!readFileSync(selector, 'utf8').includes(`typedef ${holder} = flight._cpp.${holder};`)) {
      fail(`native public Scene2D type selector lost its ${typeName} alias`);
    }
  }

  const generatedManifest = JSON.parse(
    readFileSync(path.join(flightCpp.directory, 'generated', 'manifest.json'), 'utf8'),
  );
  const generatedSourceRevisions = Array.isArray(generatedManifest.source?.revisions)
    ? generatedManifest.source.revisions
    : [generatedManifest.source?.revision].filter(Boolean);
  if (!generatedSourceRevisions.includes(manifest.generatedSdk?.sourceRevision)) {
    fail(
      `native generated-SDK source revision is ${String(manifest.generatedSdk?.sourceRevision)}, ` +
        `expected one of ${generatedSourceRevisions.join(', ')}`,
    );
  }
  for (const [field, actual, expected] of [
    ['compiler revision', manifest.generatedSdk?.compilerRevision, generatedManifest.compiler?.revision],
    ['emitted module count', manifest.generatedSdk?.emittedModules, generatedManifest.summary?.emittedModules],
  ]) {
    if (actual !== expected) fail(`native generated-SDK ${field} is ${String(actual)}, expected ${String(expected)}`);
  }

  const moduleNames = manifest.modules
    .filter(({ functions }) => functions.some(({ provenance }) => provenance === undefined))
    .map(({ module }) => module)
    .sort();
  const expectedModuleNames = [...expectedFunctionsByModule.keys()].sort();
  if (JSON.stringify(moduleNames) !== JSON.stringify(expectedModuleNames)) {
    fail(`native manifest modules drifted: ${moduleNames.join(', ')}`);
  }

  const bindings = [];
  for (const module of manifest.modules) {
    const holder = module.module.replace(/^flight\./u, '');
    const expectedFunctions = expectedFunctionsByModule.get(module.module) ?? [];
    const names = module.functions.filter(({ provenance }) => provenance === undefined).map(({ name }) => name).sort();
    if (JSON.stringify(names) !== JSON.stringify(expectedFunctions)) {
      fail(`${module.module} native functions drifted: ${names.join(', ')}`);
    }
    const facade = readFileSync(path.join(repoRoot, 'src-cpp', 'flight', `${holder}.hx`), 'utf8');
    const nativeExtern = readFileSync(
      path.join(repoRoot, 'src', 'flight', '_cpp', '_fn', `${holder}.hx`),
      'utf8',
    );
    const jsExtern = readFileSync(
      path.join(repoRoot, 'generated', 'js', 'flight', '_js', '_fn', `${holder}.hx`),
      'utf8',
    );
    const directBindings = module.functions.filter(
      ({ name, provenance }) =>
        provenance === scalarOverrideProvenance ||
        provenance === optionalScalarOverrideProvenance ||
        provenance === arrayFloatAdapterProvenance ||
        provenance === nullableStringAdapterProvenance ||
        plannedFunctions.get(`${module.module}.${name}`)?.transport === 'direct',
    );
    const directBridge =
      directBindings.length === 0
        ? ''
        : [
            path.join(repoRoot, 'src-cpp', 'include', 'flight_hx', `${holder.toLowerCase()}.hpp`),
            path.join(repoRoot, 'src-cpp', 'src', `${holder.toLowerCase()}.cpp`),
          ]
            .map((filename) => readFileSync(filename, 'utf8'))
            .join('\n');
    const facadeMembers = byName(parseModuleMembers(facade).functions);
    const nativeMembers = byName(
      parseModuleMembers(nativeExtern.replace(/^  @:/gmu, '@:').replace(/^  static /gmu, '')).functions,
    );
    const jsMembers = byName(parseModuleMembers(jsExtern, '  static ').functions);
    for (const binding of module.functions) {
      const publicName = `${module.module}.${binding.name}`;
      let plan = plannedFunctions.get(publicName);
      if (binding.provenance === scalarOverrideProvenance) {
        if (plan) fail(`${publicName} downstream override now overlaps the compiler native plan`);
        plan = { transport: 'override' };
      } else if (binding.provenance === optionalScalarOverrideProvenance) {
        if (plan) fail(`${publicName} downstream optional override now overlaps the compiler native plan`);
        plan = { transport: 'optional-override' };
      } else if (binding.provenance === arrayFloatAdapterProvenance) {
        if (plan) fail(`${publicName} downstream Array<Float> adapter now overlaps the compiler native plan`);
        plan = { transport: 'array-float-adapter' };
      } else if (binding.provenance === nullableStringAdapterProvenance) {
        if (plan) fail(`${publicName} downstream Null<String> adapter now overlaps the compiler native plan`);
        plan = { transport: 'nullable-string-adapter' };
      } else if (binding.provenance !== undefined) {
        fail(`${publicName} has unknown native provenance ${String(binding.provenance)}`);
      } else if (!plan) {
        fail(`${publicName} is absent from the compiler native plan`);
      }
      const header = path.join(flightCpp.directory, 'generated', 'include', binding.header);
      if (!existsSync(header)) fail(`${binding.name} header is missing from pinned flight-cpp: ${binding.header}`);
      const jsMember = jsMembers.get(binding.name);
      const facadeMember = facadeMembers.get(binding.name);
      const nativeMember = nativeMembers.get(binding.name);
      if (!jsMember) fail(`${module.module}.${binding.name} is absent from the current JS extern surface`);
      if (!facadeMember) fail(`${module.module}.${binding.name} is absent from the native public facade`);
      if (!nativeMember) fail(`${module.module}.${binding.name} is absent from the hxcpp extern`);
      const expectedNativeSignature =
        plan.transport === 'optional-override' ||
        (plan.transport === 'array-float-adapter' && jsMember.signature.includes('?'))
          ? optionalBridgeSignature(jsMember.signature)
          : jsMember.signature;
      if (facadeMember.signature !== jsMember.signature || nativeMember.signature !== expectedNativeSignature) {
        fail(
          `${module.module}.${binding.name} signature differs: JS=${jsMember.signature}, ` +
            `facade=${facadeMember.signature}, native=${nativeMember.signature}, ` +
            `expected native=${expectedNativeSignature}`,
        );
      }
      const adapter = binding.native.replace(/^flight::/u, 'flight_hx::');
      if (nativeMember.sourceName !== adapter) {
        fail(`${module.module}.${binding.name} binds ${nativeMember.sourceName}, expected ${adapter}`);
      }
      if (
        plan.transport === 'direct' ||
        plan.transport === 'override' ||
        plan.transport === 'optional-override' ||
        plan.transport === 'array-float-adapter' ||
        plan.transport === 'nullable-string-adapter'
      ) {
        if (!directBridge.includes(`${binding.native}(`)) {
          fail(`${publicName} direct bridge does not call ${binding.native}`);
        }
      } else if (plan.transport === 'adapter') {
        const identity = binding.native.slice(binding.native.lastIndexOf('::') + 2);
        const adapterHeader = readFileSync(
          path.join(repoRoot, 'src-cpp', 'include', 'flight_hx', 'adapters', `${identity}.hpp`),
          'utf8',
        );
        const adapterSource = readFileSync(
          path.join(repoRoot, 'src-cpp', 'src', 'adapters', `${identity}.cpp`),
          'utf8',
        );
        if (!adapterHeader.includes(`${identity}(`) || !adapterHeader.includes('namespace flight_hx::haxe::_cpp')) {
          fail(`${publicName} has no declaration-only isolated adapter boundary`);
        }
        if (
          !adapterSource.includes(`${identity}(`) ||
          !adapterSource.includes(`${plan.adapter?.targetNativeName}(`) ||
          !adapterSource.includes('namespace flight_hx::haxe::_cpp')
        ) {
          fail(`${publicName} adapter does not preserve the compiler-emitted target call`);
        }
      } else {
        fail(`${publicName} uses unsupported compiler transport ${String(plan.transport)}`);
      }
      bindings.push({ ...binding, adapter, module: module.module, transport: plan.transport });
    }
  }
  return {
    bindings,
    nativeExtension: manifest.extensions[0],
    nativeHost: manifest.hosts[0],
  };
}

function createHaxelibConsumer() {
  const work = path.join(temporaryRoot, 'consumer');
  const haxelibRepository = path.join(work, '.haxelib');
  const archive = path.join(temporaryRoot, 'flight.zip');
  const localHaxe = path.join(repoRoot, '.haxe', '4.3.7');
  const haxelib = path.join(localHaxe, process.platform === 'win32' ? 'haxelib.exe' : 'haxelib');
  const haxe = path.join(localHaxe, process.platform === 'win32' ? 'haxe.exe' : 'haxe');
  const hxcpp = readFileSync(path.join(repoRoot, '.haxelib', 'hxcpp', '.dev'), 'utf8').trim();
  mkdirSync(haxelibRepository, { recursive: true });
  const environment = {
    ...process.env,
    HAXELIB_PATH: haxelibRepository,
    HAXE_STD_PATH: path.join(localHaxe, 'std'),
    PATH: `${localHaxe}${path.delimiter}${process.env.PATH ?? ''}`,
  };
  const packaging = spawnSync(
    process.execPath,
    [path.join(repoRoot, 'tools', 'package-haxelib.mjs'), '--out', archive],
    { cwd: repoRoot, encoding: 'utf8' },
  );
  if (packaging.status !== 0) fail(`could not build haxelib archive:\n${packaging.stdout}${packaging.stderr}`);
  const install = spawnSync(haxelib, ['install', archive, '--always', '--skip-dependencies'], {
    cwd: work,
    encoding: 'utf8',
    env: environment,
  });
  if (install.status !== 0) fail(`could not install isolated flight haxelib:\n${install.stdout}${install.stderr}`);
  const hxcppRegistration = spawnSync(haxelib, ['dev', 'hxcpp', hxcpp], {
    cwd: work,
    encoding: 'utf8',
    env: environment,
  });
  if (hxcppRegistration.status !== 0) {
    fail(`could not register isolated hxcpp haxelib:\n${hxcppRegistration.stdout}${hxcppRegistration.stderr}`);
  }
  const resolution = spawnSync(haxelib, ['path', 'flight'], { cwd: work, encoding: 'utf8', env: environment });
  if (
    resolution.status !== 0 ||
    !resolution.stdout.includes('flight_hx.Package.configure()') ||
    !resolution.stdout.includes(`${path.sep}lib${path.sep}`)
  ) {
    fail(`isolated haxelib did not resolve package metadata:\n${resolution.stdout}${resolution.stderr}`);
  }
  return { environment, haxe, work };
}

function runNative(flightCpp, bindings, consumer) {
  const output = path.join(temporaryRoot, 'native');
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, 'examples', 'cross-target-math'),
      '--main',
      'CrossTargetMath',
      '-cpp',
      output,
      '-D',
      `flight_cpp_root=${flightCpp.directory}`,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  if (compile.status !== 0) {
    fail(`native compile failed (run npm run setup first):\n${compile.stdout}${compile.stderr}`);
  }

  const executable = path.join(output, process.platform === 'win32' ? 'CrossTargetMath.exe' : 'CrossTargetMath');
  const run = spawnSync(executable, [], { encoding: 'utf8' });
  const transcript = `${run.stdout ?? ''}${run.stderr ?? ''}`;
  if (run.status !== 0 || !transcript.includes(marker)) {
    fail(`native run did not reach ${marker}:\n${transcript}`);
  }

  const generated = filesUnder(path.join(output, 'src'))
    .filter((filename) => filename.endsWith('.cpp'))
    .map((filename) => readFileSync(filename, 'utf8'))
    .join('\n');
  for (const binding of bindings) {
    if (!generated.includes(`${binding.adapter}(`)) {
      fail(`generated C++ has no ${binding.transport} ${binding.module}.${binding.name} call`);
    }
  }
}

function rejectUnsupportedNative(flightCpp, consumer) {
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, 'tests', 'haxe'),
      '--main',
      'NativeUnsupportedApi',
      '-cpp',
      path.join(temporaryRoot, 'unsupported-native'),
      '-D',
      `flight_cpp_root=${flightCpp.directory}`,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  const transcript = `${compile.stdout ?? ''}${compile.stderr ?? ''}`;
  if (compile.status === 0 || !transcript.includes('resolve_color_adjustments_color_matrix')) {
    fail(`unbound native API did not fail loudly at the exact public facade:\n${transcript}`);
  }
}

function optionalBridgeSignature(signature) {
  const match = /^function ([A-Za-z_][A-Za-z0-9_]*)\((.*)\):(.+)$/u.exec(signature);
  if (!match) fail(`optional scalar signature is not recognized: ${signature}`);
  const parameters = match[2]
    ? match[2].split(', ').flatMap((parameter) => {
        const parsed = /^(\??)([A-Za-z_][A-Za-z0-9_]*):(.+)$/u.exec(parameter);
        if (!parsed) fail(`optional scalar parameter is not recognized: ${parameter}`);
        return parsed[1] === '?' ? [`${parsed[2]}Present:Bool`, `${parsed[2]}:${parsed[3]}`] : [parameter];
      })
    : [];
  return `function ${match[1]}(${parameters.join(', ')}):${match[3]}`;
}

function runNativeHost(flightCpp, nativeHost, consumer) {
  const cmake = process.platform === 'win32' ? 'cmake.exe' : 'cmake';
  const configure = spawnSync(
    cmake,
    [
      '--preset',
      'development',
      '-DFLIGHT_CPP_BUILD_HOST_SDL=ON',
      '-DFLIGHT_CPP_BUILD_HOST_SDL_VULKAN=OFF',
    ],
    { cwd: flightCpp.directory, encoding: 'utf8', env: consumer.environment },
  );
  if (configure.status !== 0) {
    fail(
      `could not configure ${nativeHost.target}; install CMake, Ninja, and SDL 3.2+ development files:\n` +
        `${configure.stdout}${configure.stderr}`,
    );
  }
  const build = spawnSync(cmake, ['--build', '--preset', 'development', '--target', 'flight_host_sdl_gl'], {
    cwd: flightCpp.directory,
    encoding: 'utf8',
    env: consumer.environment,
  });
  if (build.status !== 0) fail(`could not build ${nativeHost.target}:\n${build.stdout}${build.stderr}`);

  const flightCppBuild = path.join(flightCpp.directory, 'out', 'cmake', 'development');
  const output = path.join(temporaryRoot, 'window-native');
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, 'examples', 'window-native'),
      '--main',
      'WindowNative',
      '-cpp',
      output,
      '-D',
      `flight_cpp_root=${flightCpp.directory}`,
      '-D',
      `${nativeHost.requiresBuildDefine}=${flightCppBuild}`,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  if (compile.status !== 0) fail(`packaged native-host compile failed:\n${compile.stdout}${compile.stderr}`);

  const executable = path.join(output, process.platform === 'win32' ? 'WindowNative.exe' : 'WindowNative');
  const runEnvironment = { ...consumer.environment };
  if (process.platform === 'linux') {
    runEnvironment.LIBGL_ALWAYS_SOFTWARE = '1';
    runEnvironment.SDL_VIDEODRIVER = 'offscreen';
  }
  const run = spawnSync(executable, [], {
    encoding: 'utf8',
    env: runEnvironment,
  });
  const transcript = `${run.stdout ?? ''}${run.stderr ?? ''}`;
  if (run.status !== 0 || !transcript.includes('WINDOW_NATIVE_OK')) {
    fail(`native host did not create and present its SDL3/GL surface:\n${transcript}`);
  }
}

function runNativeCamera2d(flightCpp, nativeExtension, consumer) {
  const cmake = process.platform === 'win32' ? 'cmake.exe' : 'cmake';
  const build = spawnSync(
    cmake,
    ['--build', '--preset', 'development', '--target', 'flight_cpp_upstream_camera2d'],
    { cwd: flightCpp.directory, encoding: 'utf8', env: consumer.environment },
  );
  if (build.status !== 0) {
    fail(`could not build the pinned flight-cpp Camera2D control:\n${build.stdout}${build.stderr}`);
  }

  const flightCppBuild = path.join(flightCpp.directory, 'out', 'cmake', 'development');
  const runEnvironment = offscreenEnvironment(consumer.environment);
  const upstreamExecutable = path.join(
    flightCppBuild,
    'examples',
    'upstream',
    process.platform === 'win32' ? 'flight_cpp_upstream_camera2d.exe' : 'flight_cpp_upstream_camera2d',
  );
  const upstreamRun = spawnSync(upstreamExecutable, ['--smoke'], {
    encoding: 'utf8',
    env: runEnvironment,
  });
  const upstreamTranscript = `${upstreamRun.stdout ?? ''}${upstreamRun.stderr ?? ''}`;
  if (upstreamRun.status !== 0 || !upstreamTranscript.includes('rendered 3 verified frames')) {
    fail(`pinned flight-cpp Camera2D control failed:\n${upstreamTranscript}`);
  }

  const output = path.join(temporaryRoot, 'camera2d-native');
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, nativeExtension.example),
      '--main',
      'Camera2d',
      '-debug',
      '-cpp',
      output,
      '-D',
      `flight_cpp_root=${flightCpp.directory}`,
      '-D',
      `${nativeExtension.requiresBuildDefine}=${flightCppBuild}`,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  if (compile.status !== 0) fail(`packaged Camera2D native compile failed:\n${compile.stdout}${compile.stderr}`);

  const executable = path.join(output, process.platform === 'win32' ? 'Camera2d-debug.exe' : 'Camera2d-debug');
  const run = spawnSync(executable, [], { encoding: 'utf8', env: runEnvironment });
  const transcript = `${run.stdout ?? ''}${run.stderr ?? ''}`;
  if (
    run.status !== 0 ||
    !/CAMERA2D_NATIVE_OK nodes=116 shapes=66 sprites=44 coverage=[1-9][0-9]*/u.test(transcript)
  ) {
    fail(
      `packaged Camera2D native framebuffer proof failed ` +
        `(status=${String(run.status)}, signal=${String(run.signal)}, error=${String(run.error ?? 'none')}):\n` +
        transcript,
    );
  }
}

function runFallback(consumer) {
  const output = path.join(temporaryRoot, 'fallback.js');
  const fallbackMarker = 'CROSS_TARGET_FALLBACK_OK';
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, 'examples', 'cross-target-math'),
      '--main',
      'CrossTargetFallback',
      '-D',
      'flight_hx',
      '-dce',
      'full',
      '-js',
      output,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  if (compile.status !== 0) fail(`packaged pure-Haxe compile failed:\n${compile.stdout}${compile.stderr}`);
  const run = spawnSync(process.execPath, [output], { encoding: 'utf8' });
  const transcript = `${run.stdout ?? ''}${run.stderr ?? ''}`;
  if (run.status !== 0 || !transcript.includes(fallbackMarker)) {
    fail(`packaged pure-Haxe run did not reach ${fallbackMarker}:\n${transcript}`);
  }
}

async function runWeb(bindings, consumer) {
  const blocked = webBuildBlockedReason();
  if (blocked) fail(`web build is unavailable: ${blocked}`);
  const jsPath = path.join(temporaryRoot, 'cross-target-math.js');
  const bundlePath = path.join(temporaryRoot, 'cross-target-math.bundle.mjs');
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, 'examples', 'cross-target-math'),
      '--main',
      'CrossTargetMath',
      '-D',
      'flight_esm',
      '-dce',
      'full',
      '--macro',
      'EsmGenerator.use()',
      '-js',
      jsPath,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  if (compile.status !== 0) fail(`packaged web compile failed:\n${compile.stdout}${compile.stderr}`);
  try {
    await bundleFlightJs({ entry: jsPath, format: 'esm', outfile: bundlePath, platform: 'neutral' });
  } catch (error) {
    fail(`packaged web bundle failed:\n${(error?.errors ?? [error]).map((entry) => entry.text ?? entry).join('\n')}`);
  }

  const generated = readFileSync(jsPath, 'utf8');
  for (const binding of bindings) {
    if (!new RegExp(`\\b${binding.name}\\b`, 'u').test(generated)) {
      fail(`generated web module has no ${binding.module}.${binding.name} binding`);
    }
  }
  const run = spawnSync(process.execPath, [bundlePath], { encoding: 'utf8' });
  const transcript = `${run.stdout ?? ''}${run.stderr ?? ''}`;
  if (run.status !== 0 || !transcript.includes(marker)) {
    fail(`web run did not reach ${marker}:\n${transcript}`);
  }
}

async function buildWebCamera2d(nativeExtension, consumer) {
  const jsPath = path.join(temporaryRoot, 'camera2d.js');
  const bundlePath = path.join(temporaryRoot, 'camera2d.bundle.mjs');
  const compile = spawnSync(
    consumer.haxe,
    [
      '-lib',
      'flight',
      '-cp',
      path.join(repoRoot, nativeExtension.example),
      '--main',
      'Camera2d',
      '-D',
      'flight_esm',
      '-dce',
      'full',
      '--macro',
      'EsmGenerator.use()',
      '-js',
      jsPath,
    ],
    { cwd: consumer.work, encoding: 'utf8', env: consumer.environment },
  );
  if (compile.status !== 0) fail(`packaged Camera2D web compile failed:\n${compile.stdout}${compile.stderr}`);
  try {
    await bundleFlightJs({ entry: jsPath, format: 'esm', outfile: bundlePath, platform: 'browser' });
  } catch (error) {
    fail(
      `packaged Camera2D web bundle failed:\n${(error?.errors ?? [error])
        .map((entry) => entry.text ?? entry)
        .join('\n')}`,
    );
  }

  const generated = readFileSync(jsPath, 'utf8');
  for (const packageName of [
    '@flighthq/bitmap',
    '@flighthq/node',
    '@flighthq/path',
    '@flighthq/render',
    '@flighthq/render-gl',
    '@flighthq/scene2d',
    '@flighthq/scene2d-gl',
    '@flighthq/shape',
    '@flighthq/types',
    '@flighthq/texture',
  ]) {
    if (!generated.includes(`from \"${packageName}`)) {
      fail(`Camera2D web output has no static import from ${packageName}`);
    }
  }
  if (!readFileSync(bundlePath, 'utf8').includes('CAMERA2D_WEB_OK')) {
    fail('Camera2D web bundle does not contain its completion marker');
  }
}

function offscreenEnvironment(environment) {
  if (process.platform !== 'linux') return environment;
  return {
    ...environment,
    LIBGL_ALWAYS_SOFTWARE: '1',
    SDL_VIDEODRIVER: 'offscreen',
  };
}

function byName(entries) {
  return new Map(entries.map((entry) => [entry.name, entry]));
}

function filesUnder(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const filename = path.join(directory, entry.name);
    return entry.isDirectory() ? filesUnder(filename) : [filename];
  });
}

function fail(message) {
  process.stderr.write(`cross-target gate: ${message}\n`);
  process.exit(1);
}
