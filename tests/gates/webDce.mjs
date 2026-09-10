// Web-DCE gate (STUB). Once the ESM backend + vendored generator (tools/esm) exist,
// this must: build a sample Haxe consumer to JS, bundle it, and assert (1) Flight
// imports are static `import { … }` and (2) a Flight function the sample never calls
// is ABSENT from the bundle. This is the executable definition of "the ESM generator
// preserves pay-per-use." Fails loud until implemented so it is never a false green.
process.stderr.write('web-DCE gate: not implemented yet (blocked on tools/esm + a JS/ESM backend).\n');
process.exit(1);
