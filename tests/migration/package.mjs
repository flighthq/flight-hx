import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { unpack } from '../support/archive.mjs';
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
  const packageArgs = ['-cp', path.join(installed, haxelib.classPath), '--macro', 'flight_hx.Package.configure()'];
  const consumer = [...packageArgs, '-cp', 'examples/ffi-smoke', '--main', 'Smoke'];
  const webConsumer = [...packageArgs, '-cp', 'examples/esm-smoke', '--main', 'WebSmoke', '-D', 'flight_esm'];
  for (const target of ['hl', 'cpp', 'js']) {
    run(process.execPath, ['tools/haxe.mjs', ...(target === 'js' ? webConsumer : consumer),
      '--no-output', `--${target}`, path.join(work, target)]);
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
  run(process.execPath, ['tools/haxe.mjs', ...webConsumer, '-dce', 'full', '--macro', 'EsmGenerator.use()', '--js', esm]);
  const javascript = readFileSync(esm, 'utf8');
  assert.match(javascript, /import \* as \w+ from "@flighthq\/math"/u);
  assert.match(javascript, /import \* as \w+ from "@flighthq\/geometry"/u);
  assert.match(javascript, /\.lerp\(/u);
  assert.match(javascript, /\.createVector2\(/u);
  assert.doesNotMatch(javascript, /\brequire\s*\(/u);
  process.stdout.write(`Consumer archive: ${entries.length} files; HL/cpp/JS type-checks and static ESM codegen passed. Runtime linking is a separate check.\n`);
} finally {
  rmSync(work, { recursive: true, force: true });
}

function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
  assert.equal(result.status, 0, `${command} ${args.join(' ')}\n${result.error ?? ''}${result.stdout}${result.stderr}`);
}
