import { spawnSync } from 'node:child_process';
import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import { fileURLToPath } from 'node:url';

const fixture = path.dirname(fileURLToPath(import.meta.url));
const repo = path.resolve(fixture, '../../..');
const haxeVersion = JSON.parse(readFileSync(path.join(repo, '.haxerc'), 'utf8')).version;
const localHaxe = path.join(repo, '.haxe', haxeVersion);
const env = {
  ...process.env,
  HAXELIB_PATH: path.join(repo, '.haxelib'),
  HAXE_STD_PATH: path.join(localHaxe, 'std'),
  LIBGL_ALWAYS_SOFTWARE: '1',
  PATH: `${localHaxe}:${path.join(repo, 'node_modules', '.bin')}:${process.env.PATH}`,
  SDL_AUDIODRIVER: 'dummy',
  SDL_VIDEODRIVER: 'x11',
};

run(
  path.join(localHaxe, process.platform === 'win32' ? 'haxelib.exe' : 'haxelib'),
  ['run', 'lime', 'build', 'linux', '-Dnoaa'],
  {
    cwd: fixture,
    timeout: 10 * 60_000,
  },
);

const binary = path.join(repo, 'build', 'host-lime-native-smoke', 'linux', 'bin', 'HostLimeNativeSmoke');
if (!existsSync(binary)) throw new Error(`Lime did not produce ${path.relative(repo, binary)}`);
run('xvfb-run', ['-a', '-s', '-screen 0 320x240x24 -ac', binary], { cwd: repo, timeout: 30_000 });

function run(command, args, options) {
  const result = spawnSync(command, args, { ...options, env, stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${path.basename(command)} exited with status ${String(result.status)}`);
}
