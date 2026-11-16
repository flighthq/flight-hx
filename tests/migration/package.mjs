import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { inflateRawSync } from 'node:zlib';
import { nativePayload } from '../../tools/native/artifacts.mjs';

const root = path.resolve(import.meta.dirname, '../..');
mkdirSync(path.join(root, '.artifacts'), { recursive: true });
const work = mkdtempSync(path.join(root, '.artifacts/package-'));
try {
  const archive = path.join(work, 'flight.zip');
  run(process.execPath, ['tools/package-haxelib.mjs', '--out', archive]);
  const bytes = readFileSync(archive);
  const archiveAgain = path.join(work, 'flight-again.zip');
  run(process.execPath, ['tools/package-haxelib.mjs', '--out', archiveAgain]);
  assert.deepEqual(bytes, readFileSync(archiveAgain), 'package is not deterministic');
  const installed = path.join(work, 'installed');
  const entries = unpack(bytes, installed);
  assert.ok(entries.includes('generated/externs/provenance.json'));
  assert.ok(entries.includes('lib/flight_hx/Package.hx'));
  for (const filename of ['include.xml', 'project/Build.xml', 'lib/flight_hx/Native.hx', ...nativePayload(root)]) {
    assert.ok(entries.includes(filename), `missing native integration file: ${filename}`);
    assert.deepEqual(readFileSync(path.join(installed, filename)), readFileSync(path.join(root, filename)));
  }
  for (const name of entries) {
    assert.ok(!/^(?:src(?:-cpp)?\/|generated\/(?:hx|js|flight)\/|tools\/backend-hx\/)/u.test(name), `legacy source in archive: ${name}`);
  }
  const provenance = JSON.parse(readFileSync(path.join(installed, 'generated/externs/provenance.json'), 'utf8'));
  for (const file of provenance.files) {
    assert.deepEqual(readFileSync(path.join(installed, 'generated/externs', file.path)), readFileSync(path.join(root, 'generated/externs', file.path)));
  }
  const haxelib = JSON.parse(readFileSync(path.join(installed, 'haxelib.json'), 'utf8'));
  assert.equal(haxelib.classPath, 'lib');
  assert.equal(readFileSync(path.join(installed, 'extraParams.hxml'), 'utf8').trim(), '--macro flight_hx.Package.configure()');
  // Apply the exact metadata/extraParams contract from the extracted consumer archive. This
  // exercises package-relative resolution without requiring Neko just to launch haxelib.
  const consumer = ['-cp', path.join(installed, haxelib.classPath), '--macro', 'flight_hx.Package.configure()',
    '-cp', 'examples/ffi-smoke', '--main', 'Smoke'];
  for (const target of ['hl', 'cpp', 'js']) {
    run(process.execPath, ['tools/haxe.mjs', ...consumer, '--no-output', `--${target}`, path.join(work, target),
      ...(target === 'js' ? ['-D', 'flight_esm'] : [])]);
  }
  for (const [args, expected] of [
    [['--interp'], 'no backend'],
    [['--js', path.join(work, 'bare.js')], 'requires flight_esm'],
    [['--js', path.join(work, 'fallback.js'), '-D', 'flight_hx'], 'implementation sources have been retired'],
  ]) {
    const result = spawnSync(process.execPath, ['tools/haxe.mjs', ...consumer, ...args], { cwd: root, encoding: 'utf8' });
    assert.notEqual(result.status, 0);
    assert.ok(`${result.stdout}${result.stderr}`.includes(expected), `${result.stdout}${result.stderr}`);
  }
  const esm = path.join(work, 'smoke.mjs');
  run(process.execPath, ['tools/haxe.mjs', ...consumer, '-D', 'flight_esm', '-dce', 'full', '--macro', 'EsmGenerator.use()', '--js', esm]);
  const javascript = readFileSync(esm, 'utf8');
  assert.match(javascript, /import \* as \w+ from "flight"/u);
  assert.match(javascript, /flight_lerp/u);
  assert.match(javascript, /flight_create_vector2/u);
  assert.doesNotMatch(javascript, /\brequire\s*\(/u);
  process.stdout.write(`Consumer archive: ${entries.length} files; HL/cpp/JS type-checks and static ESM codegen passed. Runtime linking is a separate check.\n`);
} finally {
  rmSync(work, { recursive: true, force: true });
}

function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
  assert.equal(result.status, 0, `${command} ${args.join(' ')}\n${result.error ?? ''}${result.stdout}${result.stderr}`);
}

// Read the deterministic ZIP32 container emitted by our package writer. Reject traversal and
// unsupported compression instead of depending on an OS-specific archive utility.
function unpack(bytes, directory) {
  const entries = [];
  let offset = 0;
  while (bytes.readUInt32LE(offset) === 0x04034b50) {
    assert.equal(bytes.readUInt16LE(offset + 6), 0x0800);
    assert.equal(bytes.readUInt16LE(offset + 8), 8);
    const size = bytes.readUInt32LE(offset + 18);
    const uncompressedSize = bytes.readUInt32LE(offset + 22);
    const nameSize = bytes.readUInt16LE(offset + 26);
    const extraSize = bytes.readUInt16LE(offset + 28);
    const name = bytes.subarray(offset + 30, offset + 30 + nameSize).toString('utf8');
    assert.ok(!name.startsWith('/') && !name.includes('\\') && !name.split('/').includes('..'));
    assert.ok(!entries.includes(name), `duplicate archive path: ${name}`);
    const start = offset + 30 + nameSize + extraSize;
    const contents = inflateRawSync(bytes.subarray(start, start + size));
    assert.equal(contents.length, uncompressedSize);
    const target = path.join(directory, name);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(target, contents);
    entries.push(name);
    offset = start + size;
  }
  assert.equal(bytes.readUInt32LE(offset), 0x02014b50);
  return entries;
}
