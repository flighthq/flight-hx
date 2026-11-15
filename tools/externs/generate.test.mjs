import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { test } from 'node:test';
import { generate } from './generate.mjs';

// Exercise orchestration and failure isolation without claiming these fixture externs prove the
// actual Rust generator or ABI. Those require the upstream checkout and Haxe/Cargo toolchains.
function fixture(t) {
  const repoRoot = mkdtempSync(path.join(tmpdir(), 'flight-extern-driver-'));
  t.after(() => rmSync(repoRoot, { recursive: true, force: true }));
  const flightRoot = path.join(repoRoot, 'flight');
  const out = path.join(flightRoot, 'target/build/current/out');
  mkdirSync(out, { recursive: true });
  writeFileSync(path.join(flightRoot, 'Cargo.toml'), '[workspace]\n');
  for (const crate of ['flight-ffi', 'flight-bindgen']) {
    mkdirSync(path.join(flightRoot, 'crates', crate), { recursive: true });
    writeFileSync(path.join(flightRoot, 'crates', crate, 'Cargo.toml'), `[package]\nname = "${crate}"\n`);
  }
  writeFileSync(path.join(out, 'ffi_generated.rs'), 'pub fn flight_z() {}\npub fn flight_a() {}\nfn flight_z() {}\n');
  const calls = [];
  let fail = false;
  let dirty = false;
  let noBuildMessage = false;
  let invalidOffsets = false;
  const execute = (command, args, cwd) => {
    calls.push({ command, args, cwd });
    assert.equal(cwd, flightRoot);
    if (command === 'git') return args[0] === 'rev-parse' ? `${'a'.repeat(40)}\n` : dirty ? ' M Cargo.toml\n' : '';
    assert.equal(command, 'cargo');
    assert.ok(args.includes('--offline'));
    if (args[0] === 'build') return noBuildMessage ? '' : `${JSON.stringify({ reason: 'build-script-executed', out_dir: out })}\n`;
    if (args.includes('flight-offsets')) return invalidOffsets ? 'not JSON' : '{"Vector2":{"x":0,"y":8}}\n';
    assert.deepEqual(args.slice(0, 7), ['run', '-p', 'flight-bindgen', '--offline', '--', '--target', 'haxe']);
    const readArgument = (flag) => args[args.indexOf(flag) + 1];
    assert.equal(readFileSync(readArgument('--ffi-names'), 'utf8'), 'flight_a\nflight_z\n');
    assert.deepEqual(JSON.parse(readFileSync(readArgument('--offsets'), 'utf8')), { Vector2: { x: 0, y: 8 } });
    const target = path.join(readArgument('--out'), 'flight');
    mkdirSync(target, { recursive: true });
    writeFileSync(path.join(target, 'Vector2.hx'), 'package flight; extern class Vector2 {}\n');
    if (fail) throw new Error('bindgen failed after partial emission');
    return '';
  };
  return {
    options: { repoRoot, flightRoot, execute }, calls, out,
    output: path.join(repoRoot, 'generated/externs'),
    fail() { fail = true; }, dirty() { dirty = true; },
    noBuildMessage() { noBuildMessage = true; }, invalidOffsets() { invalidOffsets = true; },
  };
}

test('copies upstream bytes with provenance, checks drift without writing, and removes stale files on regeneration', (t) => {
  const state = fixture(t);
  assert.deepEqual(generate(state.options), { revision: 'a'.repeat(40), files: 1, ffiFunctions: 2 });
  const hx = path.join(state.output, 'flight/Vector2.hx');
  assert.equal(readFileSync(hx, 'utf8'), 'package flight; extern class Vector2 {}\n');
  const provenance = JSON.parse(readFileSync(path.join(state.output, 'provenance.json'), 'utf8'));
  assert.equal(provenance.files[0].path, 'flight/Vector2.hx');
  assert.equal(provenance.source.commit, 'a'.repeat(40));
  generate({ ...state.options, check: true });
  writeFileSync(hx, 'changed\n');
  writeFileSync(path.join(state.output, 'stale.hx'), 'obsolete\n');
  assert.throws(() => generate({ ...state.options, check: true }), /changed: flight\/Vector2.hx[\s\S]*unexpected: stale.hx/u);
  assert.equal(readFileSync(hx, 'utf8'), 'changed\n');
  generate(state.options);
  assert.deepEqual(readdirSync(state.output).sort(), ['flight', 'provenance.json']);
  assert.deepEqual(readdirSync(path.join(state.options.repoRoot, '.artifacts')), []);
});

test('partial generator failure preserves the previous checked-in output', (t) => {
  const state = fixture(t);
  generate(state.options);
  const before = readFileSync(path.join(state.output, 'provenance.json'), 'utf8');
  state.fail();
  assert.throws(() => generate(state.options), /bindgen failed/u);
  assert.equal(readFileSync(path.join(state.output, 'provenance.json'), 'utf8'), before);
  assert.deepEqual(readdirSync(path.join(state.options.repoRoot, '.artifacts')), []);
});

test('does not accept a stale ffi_generated.rs when Cargo reports no current build script', (t) => {
  const state = fixture(t);
  state.noBuildMessage();
  assert.throws(() => generate(state.options), /found 0/u);
});

test('rejects empty symbols and invalid offsets before invoking bindgen', (t) => {
  const state = fixture(t);
  writeFileSync(path.join(state.out, 'ffi_generated.rs'), '// no exports\n');
  assert.throws(() => generate(state.options), /no flight_\* FFI/u);
  writeFileSync(path.join(state.out, 'ffi_generated.rs'), 'fn flight_a() {}\nfn flight_z() {}\n');
  state.invalidOffsets();
  assert.throws(() => generate(state.options), /valid JSON/u);
  assert.equal(state.calls.some(({ args }) => args.includes('flight-bindgen')), false);
});

test('check fails when no copied tree exists', (t) => {
  const state = fixture(t);
  assert.throws(() => generate({ ...state.options, check: true }), /missing: flight\/Vector2.hx/u);
});

test('rejects unrecorded source changes before building', (t) => {
  const state = fixture(t);
  state.dirty();
  assert.throws(() => generate(state.options), /checkout is dirty/u);
  assert.equal(state.calls.some(({ command }) => command === 'cargo'), false);
});


test('rejects a Rust Flight snapshot without the requested binding crates before building', (t) => {
  const state = fixture(t);
  rmSync(path.join(state.options.flightRoot, 'crates/flight-bindgen'), { recursive: true });
  assert.throws(() => generate(state.options), /missing flight-bindgen/u);
  assert.equal(state.calls.length, 0);
});
