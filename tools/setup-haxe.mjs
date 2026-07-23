import { createHash } from 'node:crypto';
import { existsSync, mkdirSync, readFileSync, readdirSync, renameSync, rmSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import os from 'node:os';
import path from 'node:path';
import process from 'node:process';

const version = '4.3.7';
const workspace = process.cwd();
const installDirectory = path.join(workspace, '.haxe', version);
const executable = path.join(installDirectory, process.platform === 'win32' ? 'haxe.exe' : 'haxe');

if (!existsSync(executable)) {
  installCompiler();
} else {
  process.stdout.write(`Haxe ${version} is already installed in ${path.relative(workspace, installDirectory)}.\n`);
}

const lix = path.join(workspace, 'node_modules', '.bin', process.platform === 'win32' ? 'lix.cmd' : 'lix');
if (!existsSync(lix)) throw new Error('Local npm dependencies are missing. Run npm ci first.');
downloadLibraries(lix);
ensureHxcppRunner();
process.stdout.write('Repository-local Haxe libraries are ready.\n');

function downloadLibraries(lixExecutable) {
  const directory = path.join(workspace, 'haxe_libraries');
  for (const file of readdirSync(directory)
    .filter((name) => name.endsWith('.hxml'))
    .sort()) {
    const specification = readFileSync(path.join(directory, file), 'utf8');
    const install = /# @install: lix --silent download "([^"]+)" into ([^\s]+)/u.exec(specification);
    if (!install) continue;
    run(lixExecutable, ['--silent', 'download', install[1], 'into', install[2]]);
  }
}

function installCompiler() {
  const release = selectRelease();
  const cacheDirectory = path.join(workspace, '.cache', 'haxe-download');
  const archive = path.join(cacheDirectory, release.file);
  const temporaryDirectory = path.join(workspace, '.haxe', `.install-${version}`);
  mkdirSync(cacheDirectory, { recursive: true });
  mkdirSync(path.dirname(installDirectory), { recursive: true });

  if (!existsSync(archive) || sha256(archive) !== release.sha256) {
    rmSync(archive, { force: true });
    run('curl', ['-fL', '--retry', '3', release.url, '-o', archive]);
  }

  const actualChecksum = sha256(archive);
  if (actualChecksum !== release.sha256) {
    throw new Error(`Haxe archive checksum mismatch: expected ${release.sha256}, received ${actualChecksum}`);
  }

  rmSync(temporaryDirectory, { force: true, recursive: true });
  mkdirSync(temporaryDirectory, { recursive: true });
  run('tar', ['-xzf', archive, '--strip-components=1', '-C', temporaryDirectory]);
  rmSync(installDirectory, { force: true, recursive: true });
  renameSync(temporaryDirectory, installDirectory);
  process.stdout.write(`Installed Haxe ${version} in ${path.relative(workspace, installDirectory)}.\n`);
}

function ensureHxcppRunner() {
  const specification = readFileSync(path.join(workspace, 'haxe_libraries', 'hxcpp.hxml'), 'utf8');
  const relativeCachePath = / into (hxcpp\/[^\s"]+)/u.exec(specification)?.[1];
  if (!relativeCachePath) throw new Error('Could not resolve the pinned hxcpp cache path.');
  const libraryCache = process.env.HAXE_LIBCACHE ?? path.join(os.homedir(), 'haxe', 'haxe_libraries');
  const hxcppDirectory = path.join(libraryCache, relativeCachePath);
  const runner = path.join(hxcppDirectory, process.platform === 'win32' ? 'hxcpp.exe' : 'hxcpp.n');
  if (existsSync(runner)) return;
  if (!existsSync(hxcppDirectory)) throw new Error(`Pinned hxcpp was not downloaded to ${hxcppDirectory}`);
  process.stdout.write('Building the pinned hxcpp command runner.\n');
  run(executable, ['compile.hxml'], {
    cwd: path.join(hxcppDirectory, 'tools', 'hxcpp'),
    env: { ...process.env, HAXE_STD_PATH: path.join(installDirectory, 'std') },
  });
}

function run(command, args, options = {}) {
  const result = spawnSync(command, args, { stdio: 'inherit', ...options });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${command} exited with status ${String(result.status)}`);
}

function selectRelease() {
  if (process.platform === 'linux' && process.arch === 'x64') {
    const file = `haxe-${version}-linux64.tar.gz`;
    return {
      file,
      sha256: 'a156b3d039daa572f1f9329870ee753e3c39b7514fe8c818069323579659acca',
      url: `https://github.com/HaxeFoundation/haxe/releases/download/${version}/${file}`,
    };
  }
  throw new Error(
    `The proxy-safe compiler fallback does not yet support ${process.platform}/${process.arch}; use npx lix download.`,
  );
}

function sha256(file) {
  return createHash('sha256').update(readFileSync(file)).digest('hex');
}
