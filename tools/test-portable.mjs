import { existsSync, mkdirSync, rmSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import path from 'node:path';
import process from 'node:process';

const workspace = process.cwd();
const selected = process.argv[2];
const supported = ['eval', 'js', 'python', 'cpp'];
const targets = selected ? [selected] : supported;
if (targets.some((target) => !supported.includes(target))) {
  throw new Error(`Unknown portability target ${selected}; expected ${supported.join(', ')}`);
}

for (const target of targets) {
  process.stdout.write(`\n[portable:${target}] compiling and running CoreSmoke\n`);
  runTarget(target);
}

function runTarget(target) {
  const buildDirectory = path.join(workspace, 'build', 'portable', target);
  rmSync(buildDirectory, { force: true, recursive: true });
  mkdirSync(buildDirectory, { recursive: true });
  const common = ['-cp', 'src', '-cp', 'generated', '-cp', 'tests/haxe', '--main', 'CoreSmoke'];
  if (target === 'eval') {
    runHaxe([...common, '--interp']);
    return;
  }
  if (target === 'js') {
    const output = path.join(buildDirectory, 'core-smoke.cjs');
    runHaxe([...common, '--js', output, '-D', 'js-es=6']);
    run(process.execPath, [output]);
    return;
  }
  if (target === 'python') {
    const output = path.join(buildDirectory, 'core_smoke.py');
    runHaxe([...common, '--python', output]);
    const python = commandExists('python3') ? 'python3' : commandExists('python') ? 'python' : undefined;
    if (!python) throw new Error('Python portability requires python3 or python on PATH.');
    run(python, [output]);
    return;
  }
  if (!commandExists('g++') && !commandExists('clang++')) {
    throw new Error('C++ portability requires g++ or clang++ on PATH.');
  }
  runHaxe([...common, '--cpp', buildDirectory]);
  const executable = path.join(buildDirectory, process.platform === 'win32' ? 'CoreSmoke.exe' : 'CoreSmoke');
  if (!existsSync(executable)) throw new Error(`hxcpp did not produce ${executable}`);
  run(executable, []);
}

function runHaxe(arguments_) {
  run(process.execPath, [path.join(workspace, 'tools', 'haxe.mjs'), ...arguments_]);
}

function commandExists(command) {
  const probe = spawnSync(
    process.platform === 'win32' ? 'where' : 'sh',
    process.platform === 'win32' ? [command] : ['-c', `command -v ${command}`],
    {
      stdio: 'ignore',
    },
  );
  return probe.status === 0;
}

function run(command, arguments_) {
  const result = spawnSync(command, arguments_, { cwd: workspace, stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${command} exited with status ${String(result.status)}`);
}
