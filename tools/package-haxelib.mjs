import {
  cpSync,
  createWriteStream,
  existsSync,
  mkdirSync,
  readFileSync,
  readdirSync,
  rmSync,
  writeFileSync,
} from 'node:fs';
import { spawnSync } from 'node:child_process';
import { finished } from 'node:stream/promises';
import os from 'node:os';
import path from 'node:path';
import process from 'node:process';
import yazl from 'yazl';

const workspace = process.cwd();
const metadata = JSON.parse(readFileSync(path.join(workspace, 'haxelib.json'), 'utf8'));
const packageRoot = path.join(workspace, 'build', 'package');
const stage = path.join(packageRoot, 'stage');
const artifact = path.join(packageRoot, `${metadata.name}-${metadata.version}.zip`);
const haxeDirectory = path.join(workspace, '.haxe', '4.3.7');
const haxe = path.join(haxeDirectory, process.platform === 'win32' ? 'haxe.exe' : 'haxe');
const haxelib = path.join(haxeDirectory, process.platform === 'win32' ? 'haxelib.exe' : 'haxelib');

if (!existsSync(haxe) || !existsSync(haxelib)) throw new Error('Repository-local Haxe is missing. Run npm run setup.');

rmSync(packageRoot, { force: true, recursive: true });
mkdirSync(stage, { recursive: true });
for (const file of ['haxelib.json', 'extraParams.hxml', 'README.md', 'LICENSE.md'])
  cpSync(path.join(workspace, file), path.join(stage, file));
cpSync(path.join(workspace, 'src'), path.join(stage, 'src'), { recursive: true });
cpSync(path.join(workspace, 'generated'), path.join(stage, 'generated'), { recursive: true });
mkdirSync(path.join(stage, 'generation'), { recursive: true });
for (const file of ['api.json', 'inventory.json', 'core.json', 'patches.json', 'upstream-parity.json']) {
  cpSync(path.join(workspace, 'reports', file), path.join(stage, 'generation', file));
}
const upstreamRevision = capture('git', ['-C', path.join(workspace, 'upstream'), 'rev-parse', 'HEAD']).trim();
writeFileSync(
  path.join(stage, 'generation', 'provenance.json'),
  `${JSON.stringify({ generator: 'flight-hx', haxe: '4.3.7', upstreamRevision }, null, 2)}\n`,
);

await writeZip(stage, artifact);

const isolatedHome = path.join(packageRoot, 'home');
const repository = path.join(packageRoot, 'haxelib-repository');
mkdirSync(isolatedHome, { recursive: true });
mkdirSync(repository, { recursive: true });
const environment = {
  ...process.env,
  HAXE_STD_PATH: path.join(haxeDirectory, 'std'),
  HOME: isolatedHome,
  PATH: `${haxeDirectory}${path.delimiter}${process.env.PATH ?? ''}`,
};
run(haxelib, ['setup', repository], { env: environment });
run(haxelib, ['dev', 'jsasync', resolveLibraryCachePath('jsasync')], { env: environment });
run(haxelib, ['install', artifact, '--always', '--skip-dependencies'], { env: environment });
const consumer = path.join(packageRoot, 'consumer');
mkdirSync(consumer, { recursive: true });
cpSync(path.join(workspace, 'tests', 'package', 'PackageSmoke.hx'), path.join(consumer, 'PackageSmoke.hx'));
const consumerOutput = path.join(consumer, 'package-smoke.cjs');
run(haxe, ['-cp', '.', '-lib', 'flight', '--main', 'PackageSmoke', '--js', consumerOutput, '-D', 'js-es=6'], {
  cwd: consumer,
  env: environment,
});
run(process.execPath, [consumerOutput], { cwd: consumer, env: environment });

process.stdout.write(`Built, installed, and consumed ${path.relative(workspace, artifact)}.\n`);

function resolveLibraryCachePath(name) {
  const specification = readFileSync(path.join(workspace, 'haxe_libraries', `${name}.hxml`), 'utf8');
  const relativePath = new RegExp(` into (${name}\\/[^\\s"]+)`, 'u').exec(specification)?.[1];
  if (!relativePath) throw new Error(`Could not resolve the pinned ${name} cache path.`);
  return path.join(process.env.HAXE_LIBCACHE ?? path.join(os.homedir(), 'haxe', 'haxe_libraries'), relativePath);
}

async function writeZip(directory, output) {
  const archive = new yazl.ZipFile();
  const stream = archive.outputStream.pipe(createWriteStream(output));
  const visit = (current) => {
    for (const entry of readdirSync(current, { withFileTypes: true }).sort((left, right) =>
      left.name.localeCompare(right.name),
    )) {
      const absolute = path.join(current, entry.name);
      if (entry.isDirectory()) visit(absolute);
      else archive.addFile(absolute, path.relative(directory, absolute).split(path.sep).join('/'));
    }
  };
  visit(directory);
  archive.end();
  await finished(stream);
}

function capture(command, arguments_) {
  const result = spawnSync(command, arguments_, { cwd: workspace, encoding: 'utf8' });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(result.stderr || `${command} exited with status ${String(result.status)}`);
  return result.stdout;
}

function run(command, arguments_, options = {}) {
  const result = spawnSync(command, arguments_, { cwd: workspace, stdio: 'inherit', ...options });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${command} exited with status ${String(result.status)}`);
}
