import { build } from 'esbuild';
import { spawnSync } from 'node:child_process';
import { existsSync } from 'node:fs';
import path from 'node:path';
import { pathToFileURL } from 'node:url';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const root = path.resolve(import.meta.dirname, '../..');

// Resolve real TypeScript ESM from the same pinned Flight checkout as the Rust
// extern producer. esbuild compiles those sources; no substitute runtime is emitted.
export async function bundleFlightJs({ entry, outfile, flightRoot, platform = 'browser' }) {
  const pinned = resolveDependency(root, 'flight');
  const source = flightRoot ?? pinned.directory;
  const revision = spawnSync('git', ['rev-parse', 'HEAD'], { cwd: source, encoding: 'utf8' });
  const status = spawnSync('git', ['status', '--porcelain'], { cwd: source, encoding: 'utf8' });
  if (revision.status !== 0 || revision.stdout.trim() !== pinned.commit || status.status !== 0 || status.stdout.trim())
    throw new Error('Flight ESM source must be a clean checkout matching dependencies.lock.json');
  const result = await build({
    entryPoints: [entry], outfile, bundle: true, format: 'esm', platform,
    treeShaking: true, metafile: true, logLevel: 'silent',
    plugins: [{ name: 'pinned-flight-esm', setup(builder) {
      builder.onResolve({ filter: /^@flighthq\// }, ({ path: specifier }) => {
        const match = /^@flighthq\/([a-z0-9-]+)(?:\/([a-zA-Z0-9_./-]+))?$/u.exec(specifier);
        if (!match || match[2]?.split('/').includes('..')) throw new Error(`Invalid Flight import: ${specifier}`);
        const filename = path.join(source, 'packages', match[1], 'src', `${match[2] ?? 'index'}.ts`);
        if (!existsSync(filename)) throw new Error(`Missing pinned Flight ESM entry: ${specifier} (${filename})`);
        return { path: filename };
      });
    } }],
  });
  // Namespace imports otherwise let a missing export degrade to undefined.
  if (result.warnings.length) throw new Error(result.warnings.map((warning) => warning.text).join('\n'));
  return result.metafile;
}

if (process.argv[1] && import.meta.url === pathToFileURL(path.resolve(process.argv[1])).href) {
  const [entry, outfile] = process.argv.slice(2);
  if (!entry || !outfile) throw new Error('Usage: node tools/esm/bundle.mjs <consumer.mjs> <bundle.mjs>');
  await bundleFlightJs({ entry, outfile });
}
