import { existsSync, readdirSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import path from 'node:path';
import process from 'node:process';

const workspace = process.cwd();
const examplesDirectory = path.join(workspace, 'examples');
const name = process.argv[2];
const target = process.argv[3] ?? 'html5';

if (!name || name.startsWith('-')) {
  const available = existsSync(examplesDirectory)
    ? readdirSync(examplesDirectory, { withFileTypes: true })
        .filter((entry) => entry.isDirectory() && existsSync(path.join(examplesDirectory, entry.name, 'project.xml')))
        .map((entry) => entry.name)
    : [];
  process.stderr.write('Usage: npm run example -- <name> [lime-target]\n');
  process.stderr.write(`Available examples: ${available.join(', ') || '(none)'}\n`);
  process.exit(2);
}

const exampleDirectory = path.join(examplesDirectory, name);
if (!existsSync(path.join(exampleDirectory, 'project.xml'))) {
  throw new Error(`Example not found: examples/${name}/project.xml`);
}

const command = commandExists('lime') ? 'lime' : commandExists('haxelib') ? 'haxelib' : undefined;
if (command === undefined) {
  throw new Error('Running examples requires Lime (the lime command, or haxelib with Lime installed).');
}

const arguments_ = command === 'lime' ? ['test', target] : ['run', 'lime', 'test', target];
process.stdout.write(`[example:${name}:${target}] ${command} ${arguments_.join(' ')}\n`);
const result = spawnSync(command, arguments_, { cwd: exampleDirectory, stdio: 'inherit' });
if (result.error) throw result.error;
if (result.status !== 0) throw new Error(`${command} exited with status ${String(result.status)}`);

function commandExists(command) {
  const probe = spawnSync(
    process.platform === 'win32' ? 'where' : 'sh',
    process.platform === 'win32' ? [command] : ['-c', `command -v ${command}`],
    { stdio: 'ignore' },
  );
  return probe.status === 0;
}
