// The web (hostWeb / ESM) build recipe, in one place: compile a Haxe consumer of the generated
// flight.* bindings through the vendored ESM generator with full DCE, then bundle it against the real
// Flight ESM. `--macro EsmGenerator.use()` makes Haxe emit static `import { … }` (tree-shakeable);
// `-dce full` drops the unused inline forwarders so the bundler can strip the Flight functions the
// program never calls. Both web gates build through this so they can't drift from each other.
import { spawnSync } from 'node:child_process';
import { existsSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { bundleFlightJs } from './bundle.mjs';

const repoRoot = join(import.meta.dirname, '..', '..');

// Why the web build can't run yet, or null if it can. Lets gates SKIP (labeled) on a fresh clone
// without the rehydrated + built dependencies, rather than fail.
export function webBuildBlockedReason() {
  let flight, compiler;
  try {
    flight = resolveDependency(repoRoot, 'flight');
    compiler = resolveDependency(repoRoot, 'flight-compiler');
  } catch {
    return 'dependencies not rehydrated (run `npm run rehydrate`)';
  }
  if (!existsSync(join(compiler.directory, 'packages/tool-compiler/dist/packages/tool-compiler/src/index.js')))
    return 'flight-compiler not built (cd .dependencies/flight-compiler && npm i && npm run build)';
  if (!existsSync(join(flight.directory, 'packages/geometry/dist/index.js')))
    return 'flight geometry not built (cd .dependencies/flight && npm i && npx tsc -b packages/geometry)';
  if (!existsSync(join(repoRoot, 'generated/flight/Geometry.hx')))
    return 'bindings not generated (run `npm run generate`)';
  return null;
}

export async function buildWebBundle({ main, classpaths, tag = 'web' }) {
  const jsPath = join(tmpdir(), `flight-hx-${tag}.js`);
  const bundlePath = join(tmpdir(), `flight-hx-${tag}.bundle.mjs`);
  const cpArgs = [];
  for (const cp of classpaths) cpArgs.push('-cp', cp);

  const compile = spawnSync('node', [
    'tools/haxe.mjs', ...cpArgs, '-cp', 'tools/esm',
    '--main', main, '-D', 'flight_esm', '-dce', 'full',
    '--macro', 'EsmGenerator.use()', '-js', jsPath,
  ], { cwd: repoRoot, encoding: 'utf8' });
  if (compile.status !== 0) {
    return { ok: false, stage: 'compile', message: compile.stdout + compile.stderr };
  }

  try {
    const { inputCount } = await bundleFlightJs({ entry: jsPath, outfile: bundlePath, format: 'esm', platform: 'neutral' });
    return { ok: true, jsPath, bundlePath, inputCount };
  } catch (error) {
    return { ok: false, stage: 'bundle', message: (error?.errors ?? []).map((e) => e.text).join('\n') };
  }
}
