import { existsSync, mkdirSync, readdirSync, rmSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import path from 'node:path';
import process from 'node:process';

// Compile and run a Haxe example from `examples/<name>` against the generated
// `src` classpath, on any supported Haxe target. Examples are written directly
// against the Haxe surface (no TypeScript, no JS bridge), so running them on a
// native target exercises the cross-platform story end to end.
const workspace = process.cwd();
const examplesDirectory = path.join(workspace, 'examples');
const supported = ['eval', 'js', 'python', 'cpp'];

const name = process.argv[2];
const target = process.argv[3] ?? 'eval';

if (!name || name.startsWith('-')) {
  const available = existsSync(examplesDirectory)
    ? readdirSync(examplesDirectory, { withFileTypes: true })
        .filter((entry) => entry.isDirectory() && existsSync(path.join(examplesDirectory, entry.name, 'Main.hx')))
        .map((entry) => entry.name)
    : [];
  process.stderr.write(`Usage: node tooling/run-example.mjs <name> [${supported.join('|')}]\n`);
  process.stderr.write(`Available examples: ${available.join(', ') || '(none)'}\n`);
  process.exit(2);
}
if (!supported.includes(target)) {
  throw new Error(`Unknown target ${target}; expected ${supported.join(', ')}`);
}

const exampleDirectory = path.join(examplesDirectory, name);
if (!existsSync(path.join(exampleDirectory, 'Main.hx'))) {
  throw new Error(`Example not found: examples/${name}/Main.hx`);
}

const buildDirectory = path.join(workspace, 'build', 'examples', name, target);
rmSync(buildDirectory, { force: true, recursive: true });
mkdirSync(buildDirectory, { recursive: true });

const common = ['-cp', 'src', '-cp', exampleDirectory, '--main', 'Main'];
process.stdout.write(`[example:${name}:${target}] compiling and running\n`);

if (target === 'eval') {
  runHaxe([...common, '--interp']);
} else if (target === 'js') {
  const output = path.join(buildDirectory, `${name}.cjs`);
  runHaxe([...common, '--js', output, '-D', 'js-es=6']);
  run(process.execPath, [output]);
} else if (target === 'python') {
  const output = path.join(buildDirectory, `${name}.py`);
  runHaxe([...common, '--python', output]);
  const python = commandExists('python3') ? 'python3' : commandExists('python') ? 'python' : undefined;
  if (!python) throw new Error('Python target requires python3 or python on PATH.');
  run(python, [output]);
} else {
  if (!commandExists('g++') && !commandExists('clang++')) {
    throw new Error('C++ target requires g++ or clang++ on PATH.');
  }
  runHaxe([...common, '--cpp', buildDirectory]);
  const executable = path.join(buildDirectory, process.platform === 'win32' ? 'Main.exe' : 'Main');
  if (!existsSync(executable)) throw new Error(`hxcpp did not produce ${executable}`);
  run(executable, []);
}

function runHaxe(arguments_) {
  run(process.execPath, [path.join(workspace, 'tooling', 'haxe.mjs'), ...arguments_]);
}

function commandExists(command) {
  const probe = spawnSync(
    process.platform === 'win32' ? 'where' : 'sh',
    process.platform === 'win32' ? [command] : ['-c', `command -v ${command}`],
    { stdio: 'ignore' },
  );
  return probe.status === 0;
}

function run(command, arguments_) {
  const result = spawnSync(command, arguments_, { cwd: workspace, stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${command} exited with status ${String(result.status)}`);
}
