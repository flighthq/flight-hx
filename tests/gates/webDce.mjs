// Web-DCE gate: the executable definition of "pay-per-use survives the web binding." It builds the
// generated flight.* bindings through the vendored ESM generator (static named imports) + a bundler,
// then asserts (1) a Flight function the program USES is present in the bundle and (2) a Flight
// function it NEVER uses is ABSENT — i.e. the bundler tree-shook it away. If the second held only
// because imports were `require()` namespaces, this gate would fail, which is the point.
//
// Skips (labeled) without the rehydrated + built dependencies; a skip is never a false green.
import { readFileSync } from 'node:fs';
import process from 'node:process';
import { buildWebBundle, webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';

const USED = 'createVector2';       // WebGeometry calls this
const UNUSED = 'reflectVector2';    // a real @flighthq/geometry export WebGeometry never calls

const blocked = webBuildBlockedReason();
if (blocked) {
  process.stdout.write(`web-DCE gate: SKIPPED — ${blocked}\n`);
  process.exit(0);
}

const built = await buildWebBundle({
  main: 'WebGeometry',
  classpaths: ['generated', 'generated/js', 'examples/web-geometry'],
  tag: 'web-dce',
});
if (!built.ok) {
  process.stderr.write(`web-DCE gate: ${built.stage} failed:\n${built.message}\n`);
  process.exit(1);
}

const bundle = readFileSync(built.bundlePath, 'utf8');
const present = new RegExp(`\\b${USED}\\b`).test(bundle);
const absent = !new RegExp(`\\b${UNUSED}\\b`).test(bundle);
const failures = [];
if (!present) failures.push(`used function ${USED} is missing from the bundle (binding broken?)`);
if (!absent) failures.push(`unused function ${UNUSED} is present in the bundle — NOT tree-shaken (pay-per-use lost)`);

if (failures.length) {
  process.stderr.write(`web-DCE gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write(`web-DCE gate: ${USED} present, ${UNUSED} tree-shaken away (bundle ${bundle.length} bytes) — pay-per-use holds.\n`);
