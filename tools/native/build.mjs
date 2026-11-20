import { copyFileSync, existsSync, mkdirSync, readFileSync, statSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { prepareFlight, patchIdentity, digest } from '../flight-source.mjs';
import { run, toolEnvironment } from '../externs/generate.mjs';

const root = path.resolve(import.meta.dirname, '../..');
const platforms = JSON.parse(readFileSync(path.join(import.meta.dirname, 'platforms.json'), 'utf8'));
const args = process.argv.slice(2);
const value = (flag, fallback) => args.includes(flag) ? args[args.indexOf(flag) + 1] : fallback;
const hostPlatform = ({ linux: { x64: 'Linux64', arm64: 'LinuxArm64' }, darwin: { x64: 'Mac64', arm64: 'MacArm64' }, win32: { x64: 'Windows64' } })[process.platform]?.[process.arch];
const platform = value('--platform', hostPlatform);
const profile = value('--profile', 'release');
const sdk = process.env.HL_INCLUDE ?? path.join(process.env.FLIGHT_LIME_ROOT ?? path.join(root, '.haxelib/lime/8,3,2'), 'templates/bin/hl/include');
const hlInclude = args.includes('--without-hl') || platforms[platform]?.static ? undefined : value('--hl-include', sdk);
const known = new Set(['--platform', '--profile', '--hl-include', '--allow-network', '--without-hl']);
for (let i = 0; i < args.length; i++) {
  if (!known.has(args[i])) throw new Error(`Unknown native build option: ${args[i]}`);
  if (!['--allow-network', '--without-hl'].includes(args[i]) && !args[++i]) throw new Error('Missing native build option value');
}
if (!platforms[platform] || !['dev', 'release'].includes(profile)) throw new Error('Select a supported --platform and --profile dev|release');
const target = platforms[platform];
if (hlInclude && platform !== hostPlatform) throw new Error('HL adapter cross-compilation requires a platform-specific C toolchain; build on the target host');
const flight = resolveDependency(root, 'flight');
const source = prepareFlight(root, flight.directory, run);
const externs = JSON.parse(readFileSync(path.join(root, 'generated/externs/provenance.json'), 'utf8'));
const producer = patchIdentity(root);
if (externs.source.commit !== producer.commit || JSON.stringify(externs.source.patches) !== JSON.stringify(producer.patches))
  throw new Error('Regenerate externs from the current producer patch before staging binaries');
const buildDirectory = path.join(source, 'target');
const crossTarget = platform === hostPlatform ? [] : ['--target', target.triple];
const environment = { ...toolEnvironment(), CARGO_TARGET_DIR: buildDirectory };
const cargo = spawnSync('cargo', ['build', '-p', 'flight-ffi', '--locked', ...(args.includes('--allow-network') ? [] : ['--offline']),
  '--profile', profile, ...crossTarget, '--message-format=json'], { cwd: source, env: environment, encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
if (cargo.stderr) process.stderr.write(cargo.stderr);
if (cargo.status !== 0) throw new Error(`Native Cargo build failed: ${cargo.error ?? cargo.stdout}`);
const messages = cargo.stdout.split(/\r?\n/u).filter(Boolean).map((line) => JSON.parse(line));
const outputs = messages.filter((m) => m.reason === 'build-script-executed' && existsSync(path.join(m.out_dir, 'flight_ffi.h')));
if (outputs.length !== 1) throw new Error('Expected one native producer output');
const emitted = outputs[0].out_dir;
if (digest(readFileSync(path.join(emitted, 'flight_ffi.h'))) !== externs.nativeHeaderSha256)
  throw new Error('Native C header differs from the checked-in extern ABI; regenerate matching externs before staging');
const coreDirectory = path.join(buildDirectory, ...(crossTarget.length ? [target.triple] : []), profile === 'dev' ? 'debug' : 'release');
const files = [];
function stage(from, relative) {
  const destination = path.join(root, relative);
  mkdirSync(path.dirname(destination), { recursive: true });
  copyFileSync(from, destination);
  files.push(relative);
  return destination;
}
const header = stage(path.join(emitted, 'flight_ffi.h'), 'native/include/flight_ffi.h');
if (target.static) stage(path.join(coreDirectory, target.static), `native/lib/${platform}/${target.static}`);
else {
  stage(path.join(coreDirectory, target.shared), `native/bin/${platform}/${target.shared}`);
  if (platform === hostPlatform && process.platform !== 'win32') {
    const strip = spawnSync('strip', ['-S', path.join(root, `native/bin/${platform}/${target.shared}`)], { encoding: 'utf8' });
    if (strip.status !== 0) throw new Error(`Could not strip staged runtime: ${strip.stderr}`);
  }
  if (target.importLibrary) stage(path.join(coreDirectory, target.importLibrary), `native/lib/${platform}/${target.importLibrary}`);
}
if (process.platform === 'darwin' && target.shared && platform === hostPlatform) {
  const fix = spawnSync('install_name_tool', ['-id', `@rpath/${target.shared}`, path.join(root, `native/bin/${platform}/${target.shared}`)], { encoding: 'utf8' });
  if (fix.status !== 0) throw new Error(`Could not set dylib install name: ${fix.stderr}`);
}
if (hlInclude) {
  if (!existsSync(path.join(hlInclude, 'hl.h'))) throw new Error('--hl-include must contain hl.h from the target HashLink SDK');

  const destination = path.join(root, `ndll/${platform}/flight.hdll`);
  mkdirSync(path.dirname(destination), { recursive: true });
  const rpath = process.platform === 'darwin' ? '@loader_path' : '$ORIGIN';
  const compile = process.platform === 'win32'
    ? spawnSync(process.env.CC ?? 'cl', ['/nologo', '/LD', '/O2', '/bigobj', '/std:c11', `/I${path.dirname(header)}`, `/I${path.resolve(hlInclude)}`,
      path.join(emitted, 'flight_hl.c'), path.join(root, `native/lib/${platform}/${target.importLibrary}`), '/link', `/OUT:${destination}`,
      `/IMPLIB:${path.join(coreDirectory, 'flight_hl.lib')}`], { cwd: coreDirectory, encoding: 'utf8' })
    : spawnSync(process.env.CC ?? 'cc', ['-shared', '-fPIC', '-I', path.dirname(header), '-I', path.resolve(hlInclude),
      path.join(emitted, 'flight_hl.c'), '-L', path.join(root, `native/bin/${platform}`), '-lflight_ffi', `-Wl,-rpath,${rpath}`, '-o', destination], { encoding: 'utf8' });
  if (compile.status !== 0) throw new Error(`HL adapter build failed: ${compile.error ?? ''}${compile.stderr}`);
  files.push(`ndll/${platform}/flight.hdll`);
  // Lime copies the adapter import library alongside the hdll on Windows,
  // including for bytecode consumers. This is distinct from the core FFI lib.
  if (target.importLibrary) stage(path.join(coreDirectory, 'flight_hl.lib'), `ndll/${platform}/flight.lib`);
}
const names = [...new Set([...readFileSync(path.join(emitted, 'ffi_generated.rs'), 'utf8').matchAll(/\bfn (flight_[a-z0-9_]+)\b/gu)].map((m) => m[1]))].sort();
if (digest(`${names.join('\n')}\n`) !== externs.ffiNamesSha256) throw new Error('Native ABI names differ from extern generation');
if (hlInclude) {
  const offsetsProgram = messages.find((m) => m.reason === 'compiler-artifact' &&
    m.target?.name === 'flight-offsets' && typeof m.executable === 'string')?.executable;
  if (!offsetsProgram) throw new Error('Native producer did not build the flight-offsets executable');
  const offsets = spawnSync(offsetsProgram, [], { cwd: source, env: environment, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
  if (offsets.status !== 0 || digest(offsets.stdout) !== externs.offsetsSha256) throw new Error('HashLink native layout differs from the checked-in offsets; regenerate for the matching ABI before staging');
}
const manifest = {
  schema: 'flight-native-artifacts/1', platform, triple: target.triple, profile,
  source: externs.source,
  toolchain: { rustc: run('rustc', ['--version'], source).trim(), cargo: run('cargo', ['--version'], source).trim(),
    platform: process.platform, architecture: process.arch },
  externProvenanceSha256: digest(readFileSync(path.join(root, 'generated/externs/provenance.json'))),
  hashLink: Boolean(hlInclude),
  ...(hlInclude ? { hashLinkSdkHeaderSha256: digest(readFileSync(path.join(hlInclude, 'hl.h'))) } : {}),
  files: files.map((filename) => ({ path: filename, size: statSync(path.join(root, filename)).size, sha256: digest(readFileSync(path.join(root, filename))) })),
};
mkdirSync(path.join(root, 'native/artifacts'), { recursive: true });
writeFileSync(path.join(root, `native/artifacts/${platform}.json`), `${JSON.stringify(manifest, null, 2)}\n`);
process.stdout.write(`Staged ${platform} ${profile}: ${files.length} files${hlInclude ? ', including flight.hdll' : ''}. Binaries are ignored by Git.\n`);
