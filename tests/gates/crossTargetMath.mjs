// One Haxe source must compile and execute through both production backends: the complete Flight
// ESM extern surface on web and the manifest-recorded direct flight-cpp subset on hxcpp. This is the
// representative native behavioral gate; the manifest keeps partial native coverage fail-loud.
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
const expectedFunctionsByModule = new Map([
  ['flight.Color', ['linearChannelToSrgb', 'srgbChannelToLinear']],
  ['flight.Math', ['clamp', 'inRange', 'inverseLerp', 'lerp', 'remap', 'saturate', 'smoothStep', 'step']],
]);
const expectedCorrections = [
  'flight-hx-flight-cpp-null-namespace-collision/1',
  'flight-hx-hxcpp-cpp11-override/1',
];
const temporaryRoot = mkdtempSync(path.join(tmpdir(), 'flight-hx-cross-target-math-'));

try {
  const flightCpp = resolveDependency(repoRoot, 'flight-cpp');
  validateHaxelibMetadata();
  const bindings = validateNativeManifest(flightCpp);
  const consumer = createHaxelibConsumer();
  runNative(flightCpp, bindings, consumer);
  runFallback(consumer);
  await runWeb(bindings, consumer);
  process.stdout.write(
    `cross-target scalar gate: an isolated -lib flight consumer ran ${String(bindings.length)} ` +
      `manifest-recorded Color/Math functions on Flight ESM and direct flight-cpp; the optional ` +
      `pure-Haxe backend ran the same source.\n`,
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

  const generatedManifest = JSON.parse(
    readFileSync(path.join(flightCpp.directory, 'generated', 'manifest.json'), 'utf8'),
  );
  for (const [field, actual, expected] of [
    ['compiler revision', manifest.generatedSdk?.compilerRevision, generatedManifest.compiler?.revision],
    ['source revision', manifest.generatedSdk?.sourceRevision, generatedManifest.source?.revision],
    ['emitted module count', manifest.generatedSdk?.emittedModules, generatedManifest.summary?.emittedModules],
  ]) {
    if (actual !== expected) fail(`native generated-SDK ${field} is ${String(actual)}, expected ${String(expected)}`);
  }

  const moduleNames = manifest.modules.map(({ module }) => module).sort();
  const expectedModuleNames = [...expectedFunctionsByModule.keys()].sort();
  if (JSON.stringify(moduleNames) !== JSON.stringify(expectedModuleNames)) {
    fail(`native manifest modules drifted: ${moduleNames.join(', ')}`);
  }

  const bindings = [];
  for (const module of manifest.modules) {
    const holder = module.module.replace(/^flight\./u, '');
    const expectedFunctions = expectedFunctionsByModule.get(module.module);
    const names = module.functions.map(({ name }) => name).sort();
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
    const bridge = readFileSync(
      path.join(repoRoot, 'src-cpp', 'include', 'flight_hx', `${holder.toLowerCase()}.hpp`),
      'utf8',
    );
    const facadeMembers = byName(parseModuleMembers(facade).functions);
    const nativeMembers = byName(
      parseModuleMembers(nativeExtern.replace(/^  @:/gmu, '@:').replace(/^  static /gmu, '')).functions,
    );
    const jsMembers = byName(parseModuleMembers(jsExtern, '  static ').functions);
    for (const binding of module.functions) {
      const header = path.join(flightCpp.directory, 'generated', 'include', binding.header);
      if (!existsSync(header)) fail(`${binding.name} header is missing from pinned flight-cpp: ${binding.header}`);
      const jsMember = jsMembers.get(binding.name);
      const facadeMember = facadeMembers.get(binding.name);
      const nativeMember = nativeMembers.get(binding.name);
      if (!jsMember) fail(`${module.module}.${binding.name} is absent from the current JS extern surface`);
      if (!facadeMember) fail(`${module.module}.${binding.name} is absent from the native public facade`);
      if (!nativeMember) fail(`${module.module}.${binding.name} is absent from the hxcpp extern`);
      if (facadeMember.signature !== jsMember.signature || nativeMember.signature !== jsMember.signature) {
        fail(
          `${module.module}.${binding.name} signature differs: JS=${jsMember.signature}, ` +
            `facade=${facadeMember.signature}, native=${nativeMember.signature}`,
        );
      }
      const adapter = binding.native.replace(/^flight::/u, 'flight_hx::');
      if (nativeMember.sourceName !== adapter) {
        fail(`${module.module}.${binding.name} binds ${nativeMember.sourceName}, expected ${adapter}`);
      }
      if (!bridge.includes(`${binding.native}(`)) {
        fail(`${module.module}.${binding.name} bridge does not call ${binding.native}`);
      }
      bindings.push({ ...binding, adapter, module: module.module });
    }
  }
  return bindings;
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
      fail(`generated C++ has no direct ${binding.module}.${binding.name} call`);
    }
  }
}

function runFallback(consumer) {
  const output = path.join(temporaryRoot, 'fallback.js');
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
  if (run.status !== 0 || !transcript.includes(marker)) {
    fail(`packaged pure-Haxe run did not reach ${marker}:\n${transcript}`);
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
  process.stderr.write(`cross-target scalar gate: ${message}\n`);
  process.exit(1);
}
