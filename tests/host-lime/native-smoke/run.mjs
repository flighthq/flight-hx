import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, readFileSync } from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import process from 'node:process';
import { fileURLToPath } from 'node:url';

const fixture = path.dirname(fileURLToPath(import.meta.url));
const repo = path.resolve(fixture, '../../..');
const haxeVersion = JSON.parse(readFileSync(path.join(repo, '.haxerc'), 'utf8')).version;
const localHaxe = path.join(repo, '.haxe', haxeVersion);
const haxelib = path.join(localHaxe, process.platform === 'win32' ? 'haxelib.exe' : 'haxelib');
const haxelibRepository = path.join(repo, '.haxelib');
const libraryCache = process.env.HAXE_LIBCACHE ?? path.join(os.homedir(), 'haxe', 'haxe_libraries');
const env = {
  ...process.env,
  HAXELIB_PATH: haxelibRepository,
  HAXE_LIBCACHE: libraryCache,
  HAXE_STD_PATH: path.join(localHaxe, 'std'),
  LIBGL_ALWAYS_SOFTWARE: '1',
  PATH: `${localHaxe}:${path.join(repo, 'node_modules', '.bin')}:${process.env.PATH}`,
  SDL_AUDIODRIVER: 'dummy',
  SDL_VIDEODRIVER: 'x11',
};

// `npm run setup` downloads scoped libraries into HAXE_LIBCACHE, but Lime's
// command runner still asks classic haxelib to locate its dependencies. Create
// the ignored local repository and point those names at the exact pinned trees;
// this keeps the native smoke independent of any user/global haxelib installs.
mkdirSync(haxelibRepository, { recursive: true });
for (const name of ['format', 'hxcpp', 'hxp']) {
  const specification = readFileSync(path.join(repo, 'haxe_libraries', `${name}.hxml`), 'utf8');
  const relativeCachePath = / into ([^\s"]+)/u.exec(specification)?.[1];
  if (!relativeCachePath) throw new Error(`Could not resolve the pinned ${name} cache path`);
  const libraryDirectory = path.join(libraryCache, relativeCachePath);
  if (!existsSync(libraryDirectory))
    throw new Error(`Pinned ${name} is missing from ${libraryDirectory}; run npm run setup`);
  run(haxelib, ['dev', name, libraryDirectory], { cwd: fixture, timeout: 30_000 });
}

// The scoped Lime source archive deliberately has no prebuilt native ndll.
// Haxelib's release for the same pinned version supplies that platform binary;
// dependencies remain mapped to the exact revisions above.
const limeSpecification = readFileSync(path.join(repo, 'haxe_libraries', 'lime.hxml'), 'utf8');
const limeRelativeCachePath = / into ([^\s"]+)/u.exec(limeSpecification)?.[1];
if (!limeRelativeCachePath) throw new Error('Could not resolve the pinned Lime cache path');
const limeSource = path.join(libraryCache, limeRelativeCachePath);
if (!existsSync(limeSource)) throw new Error(`Pinned Lime is missing from ${limeSource}; run npm run setup`);
const limeVersion = JSON.parse(readFileSync(path.join(limeSource, 'haxelib.json'), 'utf8')).version;
const limeRelease = path.join(haxelibRepository, 'lime', limeVersion.replaceAll('.', ','));
if (!existsSync(path.join(limeRelease, 'ndll', 'Linux64', 'lime.ndll'))) {
  run(haxelib, ['install', 'lime', limeVersion, '--always', '--skip-dependencies'], {
    cwd: fixture,
    timeout: 5 * 60_000,
  });
}
run(haxelib, ['dev', 'lime'], { cwd: fixture, timeout: 30_000 });
run(haxelib, ['set', 'lime', limeVersion], { cwd: fixture, timeout: 30_000 });
if (!existsSync(path.join(limeRelease, 'ndll', 'Linux64', 'lime.ndll'))) {
  throw new Error(`Lime ${limeVersion} did not provide its Linux64 native library`);
}

run(haxelib, ['run', 'lime', 'build', 'linux', '-Dnoaa'], { cwd: fixture, timeout: 10 * 60_000 });

const binary = path.join(repo, 'build', 'host-lime-native-smoke', 'linux', 'bin', 'HostLimeNativeSmoke');
if (!existsSync(binary)) throw new Error(`Lime did not produce ${path.relative(repo, binary)}`);
run('xvfb-run', ['-a', '-s', '-screen 0 320x240x24 -ac', binary], { cwd: repo, timeout: 30_000 });

function run(command, args, options) {
  const result = spawnSync(command, args, { ...options, env, stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${path.basename(command)} exited with status ${String(result.status)}`);
}
