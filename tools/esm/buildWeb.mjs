import { spawnSync } from 'node:child_process';
import { mkdirSync } from 'node:fs';
import path from 'node:path';
import { bundleFlightJs } from './bundle.mjs';

const root = path.resolve(import.meta.dirname, '../..');
export async function buildWebBundle({ main, classpaths, outDir, flightRoot, platform }) {
  mkdirSync(outDir, { recursive: true });
  const entry = path.join(outDir, 'consumer.mjs');
  const bundle = path.join(outDir, 'bundle.mjs');
  const compile = spawnSync(process.execPath, ['tools/haxe.mjs',
    ...classpaths.flatMap((cp) => ['-cp', cp]), '--macro', 'flight_hx.Package.configure()',
    '-D', 'flight_esm', '-dce', 'full', '--macro', 'EsmGenerator.use()', '-main', main, '-js', entry,
  ], { cwd: root, encoding: 'utf8' });
  if (compile.status !== 0) throw new Error(`Haxe ESM compilation failed:\n${compile.error ?? ''}${compile.stdout}${compile.stderr}`);
  const metafile = await bundleFlightJs({ entry, outfile: bundle, flightRoot, platform });
  return { entry, bundle, metafile };
}
