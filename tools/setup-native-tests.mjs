import { existsSync, mkdirSync, mkdtempSync, readFileSync, renameSync, rmSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import path from 'node:path';
import { digest } from './flight-source.mjs';
import { testEnvironment } from './native/test-environment.mjs';

const root = path.resolve(import.meta.dirname, '..');
let environment = testEnvironment(root);
const probe = spawnSync(path.join(root, '.haxe/4.3.7/haxelib'), ['version'], { env: environment, encoding: 'utf8' });
if (probe.status !== 0 && !process.env.FLIGHT_NEKO_ROOT) {
  if (process.platform !== 'linux' || process.arch !== 'x64') throw new Error('Install Neko for this host or provide FLIGHT_NEKO_ROOT');
  const artifacts = path.join(root, '.artifacts'); mkdirSync(artifacts, { recursive: true });
  const archive = path.join(artifacts, 'neko-2.4.1-linux64.tar.gz');
  const checksum = '109fa2f68065b79148cff80aabdf22957b48011b8fa9ad404c2196e20d6ac32f';
  if (!existsSync(archive) || digest(readFileSync(archive)) !== checksum) {
    run('curl', ['-fL', '--retry', '3', 'https://github.com/HaxeFoundation/neko/releases/download/v2-4-1/neko-2.4.1-linux64.tar.gz', '-o', archive]);
  }
  if (digest(readFileSync(archive)) !== checksum) throw new Error('Neko archive checksum mismatch');
  if (!existsSync(path.join(artifacts, 'neko/neko'))) {
    const temporary = mkdtempSync(path.join(artifacts, 'neko-install-'));
    try { run('tar', ['-xzf', archive, '--strip-components=1', '-C', temporary]); renameSync(temporary, path.join(artifacts, 'neko')); }
    finally { if (existsSync(temporary)) rmSync(temporary, { recursive: true, force: true }); }
  }
  environment = testEnvironment(root);
}
run(process.platform === 'win32' ? 'npm.cmd' : 'npm', ['run', 'setup']);
const haxelib = path.join(root, '.haxe/4.3.7', process.platform === 'win32' ? 'haxelib.exe' : 'haxelib');
if (!existsSync(path.join(root, '.haxelib/lime/8,3,2/haxelib.json'))) run(haxelib, ['install', 'lime', '8.3.2', '--always', '--skip-dependencies']);
process.stdout.write('Native test toolchain ready: Haxe/hxcpp, Neko, and Lime 8.3.2. No system packages installed.\n');
function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, env: environment, stdio: 'inherit' });
  if (result.status !== 0) throw new Error(`${command} failed: ${result.error ?? result.status}`);
}
