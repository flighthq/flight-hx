// Web behavioral gate: the GENERATED flight.* bindings, compiled through the vendored ESM generator
// and bundled with the real Flight ESM, must run and produce the right answer. The only check that
// proves the bindings bind to *real* Flight, not a stand-in. Skips (labeled) without built deps.
//
// Tree-shaking / pay-per-use is the SEPARATE assertion in tests/gates/webDce.mjs.
import { spawnSync } from 'node:child_process';
import process from 'node:process';
import { buildWebBundle, webBuildBlockedReason } from '../../tools/esm/buildWeb.mjs';

const blocked = webBuildBlockedReason();
if (blocked) {
  process.stdout.write(`web-behavioral gate: SKIPPED — ${blocked}\n`);
  process.exit(0);
}

const built = await buildWebBundle({
  main: 'WebGeometry',
  classpaths: ['generated', 'generated/js', 'examples/web-geometry'],
  tag: 'web-behavioral',
});
if (!built.ok) {
  process.stderr.write(`web-behavioral gate: ${built.stage} failed:\n${built.message}\n`);
  process.exit(1);
}

const run = spawnSync('node', [built.bundlePath], { encoding: 'utf8' });
if (!(run.stdout + run.stderr).includes('WEB_GEOMETRY_OK')) {
  process.stderr.write(`web-behavioral gate: run did not reach WEB_GEOMETRY_OK:\n${run.stdout}${run.stderr}\n`);
  process.exit(1);
}
process.stdout.write('web-behavioral gate: generated flight.* ran against real @flighthq/geometry ESM (static-import bundle).\n');
