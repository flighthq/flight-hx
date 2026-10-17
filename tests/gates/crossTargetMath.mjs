// One Haxe source must compile and execute through both production backends: the complete Flight
// ESM extern surface on web and the manifest-recorded direct flight-cpp subset on hxcpp. This is the
// representative native behavioral gate; the manifest keeps partial native coverage fail-loud.
import { spawnSync } from 'node:child_process';
import { existsSync, mkdtempSync, readFileSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { buildWebBundle, webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const marker = 'CROSS_TARGET_MATH_OK';
const expectedFunctions = ['clamp', 'lerp', 'saturate'];
const temporaryRoot = mkdtempSync(path.join(tmpdir(), 'flight-hx-cross-target-math-'));

try {
  const flightCpp = resolveDependency(repoRoot, 'flight-cpp');
  validateNativeManifest(flightCpp);
  runNative(flightCpp);
  await runWeb();
  process.stdout.write(
    `cross-target Math gate: one Haxe sample ran on Flight ESM and direct flight-cpp ` +
      `(${expectedFunctions.join(', ')}).\n`,
  );
} finally {
  rmSync(temporaryRoot, { force: true, recursive: true });
}

function validateNativeManifest(flightCpp) {
  const manifest = JSON.parse(readFileSync(path.join(repoRoot, 'src-cpp', 'manifest.json'), 'utf8'));
  if (manifest.schema !== 'flight-hx-cpp-bindings/1') fail(`unknown native manifest schema ${manifest.schema}`);
  if (manifest.flightCppRevision !== flightCpp.commit) {
    fail(`native manifest pins ${manifest.flightCppRevision}, lock pins ${flightCpp.commit}`);
  }
  if (manifest.cppStandard !== 20) fail(`native manifest requires unexpected C++${manifest.cppStandard}`);

  const functions = manifest.modules.flatMap((module) => module.functions);
  const names = functions.map(({ name }) => name).sort();
  if (JSON.stringify(names) !== JSON.stringify(expectedFunctions)) {
    fail(`native manifest functions drifted: ${names.join(', ')}`);
  }

  const facade = readFileSync(path.join(repoRoot, 'src-cpp', 'flight', 'Math.hx'), 'utf8');
  const extern = readFileSync(path.join(repoRoot, 'src', 'flight', '_cpp', '_fn', 'Math.hx'), 'utf8');
  const bridge = readFileSync(path.join(repoRoot, 'src-cpp', 'include', 'flight_hx', 'math.hpp'), 'utf8');
  for (const binding of functions) {
    const header = path.join(flightCpp.directory, 'generated', 'include', binding.header);
    if (!existsSync(header)) fail(`${binding.name} header is missing from pinned flight-cpp: ${binding.header}`);
    if (!new RegExp(`function\\s+${binding.name}\\b`, 'u').test(facade)) {
      fail(`${binding.name} is absent from the native public facade`);
    }
    if (!extern.includes(`flight_hx::math::${binding.name}`)) {
      fail(`${binding.name} is absent from the hxcpp extern`);
    }
    if (!bridge.includes(`${binding.native}(`)) {
      fail(`${binding.name} bridge does not call ${binding.native}`);
    }
  }
}

function runNative(flightCpp) {
  const output = path.join(temporaryRoot, 'native');
  const localHaxe = path.join(repoRoot, '.haxe', '4.3.7');
  const environment = {
    ...process.env,
    HAXELIB_PATH: path.join(repoRoot, '.haxelib'),
    PATH: `${localHaxe}${path.delimiter}${process.env.PATH ?? ''}`,
  };
  const compile = spawnSync(
    process.execPath,
    [
      'tools/haxe.mjs',
      'examples/cross-target-math/native.hxml',
      '-cpp',
      output,
      '-D',
      `flight_cpp_root=${flightCpp.directory}`,
      '-D',
      `flight_hx_root=${repoRoot}`,
    ],
    { cwd: repoRoot, encoding: 'utf8', env: environment },
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

  const generated = filesForCalls(output)
    .map((filename) => readFileSync(filename, 'utf8'))
    .join('\n');
  for (const name of expectedFunctions) {
    if (!generated.includes(`flight_hx::math::${name}(`)) fail(`generated C++ has no direct ${name} call`);
  }
}

async function runWeb() {
  const blocked = webBuildBlockedReason();
  if (blocked) fail(`web build is unavailable: ${blocked}`);
  const built = await buildWebBundle({
    main: 'CrossTargetMath',
    classpaths: ['generated/js', 'generated', 'examples/cross-target-math'],
    tag: `cross-target-math-${process.pid}`,
  });
  if (!built.ok) fail(`web ${built.stage} failed:\n${built.message}`);

  const generated = readFileSync(built.jsPath, 'utf8');
  for (const name of expectedFunctions) {
    if (!new RegExp(`\\b${name}\\b`, 'u').test(generated)) fail(`generated web module has no ${name} binding`);
  }
  const run = spawnSync(process.execPath, [built.bundlePath], { encoding: 'utf8' });
  const transcript = `${run.stdout ?? ''}${run.stderr ?? ''}`;
  if (run.status !== 0 || !transcript.includes(marker)) {
    fail(`web run did not reach ${marker}:\n${transcript}`);
  }
}

function filesForCalls(output) {
  return [
    path.join(output, 'src', 'CrossTargetMath.cpp'),
    path.join(output, 'src', 'flight', '_Math', 'Math_Fields_.cpp'),
  ];
}

function fail(message) {
  process.stderr.write(`cross-target Math gate: ${message}\n`);
  process.exit(1);
}
