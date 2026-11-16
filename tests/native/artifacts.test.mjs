import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { test } from 'node:test';
import { nativePayload } from '../../tools/native/artifacts.mjs';
import { digest } from '../../tools/flight-source.mjs';
function fixture(t, platform = 'Linux64', hashLink = true) {
  const root = mkdtempSync(path.join(tmpdir(), 'flight-artifacts-'));
  t.after(() => rmSync(root, { recursive: true, force: true }));
  function write(relative, content) { const name = path.join(root, relative); mkdirSync(path.dirname(name), { recursive: true }); writeFileSync(name, content); }
  const source = { commit: 'a'.repeat(40), patches: [] };
  const provenance = JSON.stringify({ source });
  write('generated/externs/provenance.json', provenance);
  const elf = Buffer.alloc(64); elf.write('7f454c46', 0, 'hex'); elf[4] = 2; elf[5] = 1; elf.writeUInt16LE(62, 18);
  write('native/include/flight_ffi.h', '/* fixture header */');
  const windows = platform === 'Windows64';
  const binaries = windows ? ['native/bin/Windows64/flight_ffi.dll', 'native/lib/Windows64/flight_ffi.dll.lib'] : ['native/bin/Linux64/libflight_ffi.so'];
  if (hashLink) {
    binaries.push(`ndll/${platform}/flight.hdll`);
    if (windows) binaries.push('ndll/Windows64/flight.lib');
  }
  for (const name of binaries) write(name, windows ? 'fixture Windows binary' : elf);
  const manifest = { schema: 'flight-native-artifacts/1', platform, triple: windows ? 'x86_64-pc-windows-msvc' : 'x86_64-unknown-linux-gnu',
    source, hashLink, externProvenanceSha256: digest(provenance), files: ['native/include/flight_ffi.h', ...binaries].map((name) => {
      const bytes = readFileSync(path.join(root, name)); return { path: name, sha256: digest(bytes), size: bytes.length };
    }) };
  const save = () => write(`native/artifacts/${platform}.json`, JSON.stringify(manifest)); save();
  return { root, manifest, write, save };
}
test('release payload contains only the selected verified files and manifest', (t) => {
  const f = fixture(t); assert.equal(nativePayload(f.root).length, 4);
});
test('Windows HashLink payload includes the adapter import library required by Lime', (t) => {
  const f = fixture(t, 'Windows64');
  const complete = f.manifest.files;
  f.manifest.files = f.manifest.files.filter((file) => file.path !== 'ndll/Windows64/flight.lib'); f.save();
  assert.throws(() => nativePayload(f.root), /Incomplete/u);
  f.manifest.files = complete; f.save();
  assert.ok(nativePayload(f.root).includes('ndll/Windows64/flight.lib'));
});
test('Windows packages without HashLink need only the core import library', (t) => {
  const f = fixture(t, 'Windows64', false);
  const payload = nativePayload(f.root);
  assert.ok(payload.includes('native/lib/Windows64/flight_ffi.dll.lib'));
  assert.ok(!payload.some((name) => name.startsWith('ndll/')));
});
test('missing, modified and incomplete native artifacts cannot be released', (t) => {
  const f = fixture(t); f.write('ndll/Linux64/flight.hdll', 'wrong');
  assert.throws(() => nativePayload(f.root), /Changed native artifact/u);
  f.manifest.files.pop(); f.save(); assert.throws(() => nativePayload(f.root), /Incomplete/u);
});
test('stale binary provenance cannot be mixed with a new extern copy', (t) => {
  const f = fixture(t); f.write('generated/externs/provenance.json', '{"source":{"commit":"new"}}');
  assert.throws(() => nativePayload(f.root), /Stale Flight binaries/u);
});
test('even a matching checksum cannot relabel an ARM library as Linux x64', (t) => {
  const f = fixture(t); const name = 'native/bin/Linux64/libflight_ffi.so'; const bytes = readFileSync(path.join(f.root, name));
  bytes.writeUInt16LE(183, 18); f.write(name, bytes); f.manifest.files.find((file) => file.path === name).sha256 = digest(bytes); f.save();
  assert.throws(() => nativePayload(f.root), /Wrong Linux binary architecture/u);
});
test('no native payload requires explicit extern-only packaging', (t) => {
  const f = fixture(t); rmSync(path.join(f.root, 'native/artifacts'), { recursive: true });
  assert.throws(() => nativePayload(f.root), /No staged Flight binaries/u); assert.deepEqual(nativePayload(f.root, { allowEmpty: true }), []);
});
