import { createHash } from 'node:crypto';
import { spawnSync } from 'node:child_process';
import {
  existsSync, lstatSync, mkdirSync, mkdtempSync, readFileSync, readdirSync,
  renameSync, rmSync, writeFileSync,
} from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { prepareFlight, preparedIdentity } from '../flight-source.mjs';
import { assertPortablePaths } from './portable-paths.mjs';

const root = path.resolve(import.meta.dirname, '../..');
const usage = `Usage: node tools/externs/generate.mjs [--flight-root <path>] [--check] [--validate-upstream] [--allow-network]

Uses the Rust workspace in FLIGHT_ROOT or .dependencies/flight.
Copies unmodified flight-bindgen output to generated/externs, with provenance.json.
--check regenerates in a temporary directory and rejects any file/content drift.
--validate-upstream runs Flight's scripts/check-haxe-bindings.sh instead of copying.
Cargo runs offline unless --allow-network is explicitly supplied.
`;

export function run(command, args, cwd) {
  const result = spawnSync(command, args, {
    cwd, env: toolEnvironment(), encoding: 'utf8', maxBuffer: 64 * 1024 * 1024,
  });
  if (result.stderr) process.stderr.write(result.stderr);
  if (result.error) throw new Error(`Cannot run ${command}: ${result.error.message}`);
  if (result.status !== 0) {
    throw new Error(`${command} ${args.join(' ')} failed (${result.signal ?? result.status}):\n${result.stdout}`);
  }
  return result.stdout;
}

export function toolEnvironment() {
  const localRust = path.join(root, '.artifacts/rust');
  const localCargo = path.join(localRust, 'cargo');
  const localHaxe = path.join(root, '.haxe/4.3.7');
  const environment = { ...process.env };
  const paths = [];
  if (existsSync(path.join(localCargo, 'bin/cargo'))) {
    environment.CARGO_HOME ??= localCargo;
    environment.RUSTUP_HOME ??= path.join(localRust, 'rustup');
    paths.push(path.join(environment.CARGO_HOME, 'bin'));
  }
  if (existsSync(path.join(localHaxe, 'haxe'))) {
    paths.push(localHaxe);
    environment.HAXE_STD_PATH ??= path.join(localHaxe, 'std');
  }
  environment.PATH = [...paths, process.env.PATH].join(path.delimiter);
  return environment;
}

// This driver owns transport/provenance only. All Haxe emission belongs to Flight's Rust tooling.
export function generate({ repoRoot = root, flightRoot, check = false, offline = true, execute = run }) {
  requireWorkspace(flightRoot);
  const revision = execute('git', ['rev-parse', 'HEAD'], flightRoot).trim();
  if (!/^[a-f0-9]{40}$/u.test(revision)) throw new Error('Flight has no full Git revision');
  const dirty = execute('git', ['status', '--porcelain', '--untracked-files=normal'], flightRoot).trim();
  const patches = dirty ? preparedIdentity(flightRoot, execute).patches : [];
  const toolchain = {
    rustc: execute('rustc', ['--version'], flightRoot).trim(),
    cargo: execute('cargo', ['--version'], flightRoot).trim(),
    platform: process.platform, architecture: process.arch,
  };

  const artifactRoot = path.join(repoRoot, '.artifacts');
  mkdirSync(artifactRoot, { recursive: true });
  const temporary = mkdtempSync(path.join(artifactRoot, 'flight-externs-'));
  const output = path.join(repoRoot, 'generated/externs');
  const cargo = (args) => execute('cargo', [...args, '--locked', ...(offline ? ['--offline'] : [])], flightRoot);
  try {
    const messages = cargo(['build', '-p', 'flight-ffi', '--message-format=json']);
    const ffiFiles = new Set();
    for (const line of messages.split(/\r?\n/u).filter(Boolean)) {
      let message;
      try { message = JSON.parse(line); } catch { throw new Error(`Invalid Cargo JSON message: ${line}`); }
      if (message.reason === 'build-script-executed' && typeof message.out_dir === 'string') {
        const filename = path.resolve(flightRoot, message.out_dir, 'ffi_generated.rs');
        if (existsSync(filename)) ffiFiles.add(filename);
      }
    }
    // Never glob target/debug/build: stale builds can silently contribute obsolete FFI symbols.
    if (ffiFiles.size !== 1) {
      throw new Error(`Expected one current Cargo build-script ffi_generated.rs, found ${ffiFiles.size}`);
    }
    const ffiSource = readFileSync([...ffiFiles][0], 'utf8');
    const nativeHeaderPath = path.join(path.dirname([...ffiFiles][0]), 'flight_ffi.h');
    const nativeHeader = existsSync(nativeHeaderPath) ? readFileSync(nativeHeaderPath) : undefined;
    const copiedHeader = path.join(repoRoot, 'native/include/flight_ffi.h');
    if (patches.length && !nativeHeader) throw new Error('Patched native producer did not emit flight_ffi.h');
    if (check && nativeHeader && (!existsSync(copiedHeader) || !nativeHeader.equals(readFileSync(copiedHeader)))) {
      throw new Error('Generated native C header drift: native/include/flight_ffi.h');
    }

    const names = [...new Set([...ffiSource.matchAll(/\bfn (flight_[a-z0-9_]+)\b/gu)].map((match) => match[1]))].sort();
    if (names.length === 0) throw new Error('Flight generated no flight_* FFI function names');
    const ffiNames = `${names.join('\n')}\n`;
    const offsets = cargo(['run', '--bin', 'flight-offsets']);
    try { JSON.parse(offsets); } catch { throw new Error('flight-offsets did not emit valid JSON'); }
    const offsetsFile = path.join(temporary, 'offsets.json');
    const namesFile = path.join(temporary, 'ffi-names.txt');
    writeFileSync(offsetsFile, offsets);
    writeFileSync(namesFile, ffiNames);
    const staged = path.join(temporary, 'bindings');
    execute('cargo', [
      'run', '-p', 'flight-bindgen', '--locked', ...(offline ? ['--offline'] : []), '--',
      '--target', 'haxe', '--out', staged, '--offsets', offsetsFile, '--ffi-names', namesFile,
    ], flightRoot);
    const files = inventory(staged);
    assertPortablePaths(files.map((file) => file.path));
    if (!files.some(({ path: filename }) => filename.endsWith('.hx'))) {
      throw new Error('flight-bindgen produced no Haxe bindings');
    }
    if (existsSync(path.join(staged, 'provenance.json'))) {
      throw new Error('Upstream output uses the downstream-reserved provenance.json filename');
    }
    const provenance = {
      schema: 'flight-hx-rust-externs/1',
      source: { repository: 'https://github.com/flighthq/flight', commit: revision, ...(patches.length ? { patches } : {}) },
      generator: 'flight-bindgen --target haxe',
      toolchain,
      ...(nativeHeader ? { nativeHeaderSha256: sha256(nativeHeader) } : {}),
      offsetsSha256: sha256(offsets), ffiNamesSha256: sha256(ffiNames),
      ffiFunctionCount: names.length, files,
    };
    writeFileSync(path.join(staged, 'provenance.json'), `${JSON.stringify(provenance, null, 2)}\n`);
    if (check) {
      const changes = compareTrees(staged, output);
      if (changes.length) throw new Error(`Generated extern drift:\n${changes.join('\n')}`);
    } else {
      // Preserve the previous tree until generation and inventory both succeed. Roll back if
      // the final rename fails; all temporary paths stay on the repository's filesystem.
      mkdirSync(path.dirname(output), { recursive: true });
      if (existsSync(output) && lstatSync(output).isSymbolicLink()) throw new Error('Refusing symlink output');
      const backup = path.join(temporary, 'previous');
      const hadOutput = existsSync(output);
      if (hadOutput) renameSync(output, backup);
      try { renameSync(staged, output); } catch (error) {
        if (hadOutput) renameSync(backup, output);
        throw error;
      }
    }
    if (!check && nativeHeader) {
      mkdirSync(path.dirname(copiedHeader), { recursive: true });
      writeFileSync(copiedHeader, nativeHeader);
    }
    return { revision, files: files.length, ffiFunctions: names.length };
  } finally {
    rmSync(temporary, { recursive: true, force: true });
  }
}

function requireWorkspace(flightRoot) {
  if (!flightRoot || !existsSync(path.join(flightRoot, 'Cargo.toml'))) {
    throw new Error(`No Rust Flight workspace at ${flightRoot ?? '(unset)'}. Set --flight-root or FLIGHT_ROOT to the new Flight checkout.`);
  }

  for (const crate of ['flight-ffi', 'flight-bindgen']) {
    if (!existsSync(path.join(flightRoot, 'crates', crate, 'Cargo.toml'))) {
      throw new Error(`Flight workspace is missing ${crate}. The supplied Haxe recipe is on Flight's develop branch, not the inspected main snapshot.`);
    }
  }
}

function inventory(directory, prefix = '') {
  if (!existsSync(directory)) return [];
  return readdirSync(directory, { withFileTypes: true }).sort((a, b) => a.name < b.name ? -1 : a.name > b.name ? 1 : 0)
    .flatMap((entry) => {
      const relative = prefix ? `${prefix}/${entry.name}` : entry.name;
      const filename = path.join(directory, entry.name);
      if (entry.isSymbolicLink()) throw new Error(`Refusing symlink in generated externs: ${relative}`);
      if (entry.isDirectory()) return inventory(filename, relative);
      if (!entry.isFile()) throw new Error(`Non-file in generated externs: ${relative}`);
      return [{ path: relative, sha256: sha256(readFileSync(filename)) }];
    });
}

function sha256(contents) { return createHash('sha256').update(contents).digest('hex'); }

function compareTrees(expected, actual) {
  const left = new Map(inventory(expected).map((file) => [file.path, file.sha256]));
  const right = new Map(inventory(actual).map((file) => [file.path, file.sha256]));
  const changes = [];
  for (const [filename, hash] of left) {
    if (!right.has(filename)) changes.push(`missing: ${filename}`);
    else if (right.get(filename) !== hash) changes.push(`changed: ${filename}`);
  }
  for (const filename of right.keys()) if (!left.has(filename)) changes.push(`unexpected: ${filename}`);
  return changes;
}

export function main(args) {
  if (args.includes('--help')) { process.stdout.write(usage); return; }
  let flightRoot = process.env.FLIGHT_ROOT ?? path.join(root, '.dependencies/flight');
  for (let index = 0; index < args.length; index += 1) {
    if (args[index] === '--flight-root') {
      if (!args[index + 1] || args[index + 1].startsWith('--')) throw new Error('--flight-root requires a path');
      flightRoot = args[++index];
    } else if (!['--check', '--validate-upstream', '--allow-network'].includes(args[index])) {
      throw new Error(`Unknown option ${args[index]}\n${usage}`);
    }
  }
  flightRoot = path.resolve(flightRoot);
  requireWorkspace(flightRoot);
  flightRoot = prepareFlight(root, flightRoot, run);
  if (args.includes('--validate-upstream')) {
    if (args.includes('--check')) throw new Error('--validate-upstream and --check are separate operations');
    const script = path.join(flightRoot, 'scripts/check-haxe-bindings.sh');
    if (!existsSync(script)) throw new Error(`Missing upstream validation script: ${script}`);
    // Preserve offline policy for any Cargo invocations made inside the upstream script.
    const result = spawnSync('bash', [script], {
      cwd: flightRoot, stdio: 'inherit',
      env: { ...toolEnvironment(), CARGO_NET_OFFLINE: args.includes('--allow-network') ? 'false' : 'true' },
    });
    if (result.error) throw result.error;
    if (result.status !== 0) throw new Error(`Upstream Haxe binding check failed (${result.signal ?? result.status})`);
    return;
  }
  const result = generate({ flightRoot, check: args.includes('--check'), offline: !args.includes('--allow-network') });
  process.stdout.write(`Rust externs ${args.includes('--check') ? 'match' : 'copied'}: ${result.files} files, ${result.ffiFunctions} FFI functions, Flight ${result.revision}.\n`);
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try { main(process.argv.slice(2)); } catch (error) {
    process.stderr.write(`${error.message}\n`);
    process.exitCode = 1;
  }
}
