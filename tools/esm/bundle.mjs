import { build } from 'esbuild';
import { spawnSync } from 'node:child_process';
import { existsSync, readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import { pathToFileURL } from 'node:url';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const root = path.resolve(import.meta.dirname, '../..');

// Resolve real TypeScript ESM from the same pinned Flight checkout as the Rust
// extern producer. esbuild compiles those sources; no substitute runtime is emitted.
export async function bundleFlightJs({ entry, outfile, flightRoot, platform = 'browser' }) {
  const source = pinnedFlightSource(flightRoot);
  const result = await build({
    entryPoints: [entry], outfile, bundle: true, format: 'esm', platform,
    treeShaking: true, metafile: true, logLevel: 'silent',
    plugins: [flightResolver(source)],
  });
  // Namespace imports otherwise let a missing export degrade to undefined.
  if (result.warnings.length) throw new Error(result.warnings.map((warning) => warning.text).join('\n'));
  return result.metafile;
}

// Independently link every package entry to check the generated names. The clean
// source checkout has WASM declarations and wrappers; their compiled payloads are
// supplied by the published WASM packages. Audit the wrappers without loading those payloads.
export async function inspectFlightExports() {
  const source = pinnedFlightSource();
  const packages = path.join(source, 'packages');
  const specifiers = [];
  for (const name of readdirSync(packages).sort()) {
    const filename = path.join(packages, name, 'package.json');
    if (!existsSync(filename)) continue;
    const manifest = JSON.parse(readFileSync(filename, 'utf8'));
    if (manifest.private || manifest.flight?.environment === 'node' || !manifest.name?.startsWith('@flighthq/')) continue;
    for (const [entry, conditions] of Object.entries(manifest.exports ?? {})) {
      if (typeof conditions === 'string' || conditions.import || conditions.default) {
        specifiers.push(entry === '.' ? manifest.name : manifest.name + entry.slice(1));
      }
    }
  }
  const result = await build({
    entryPoints: specifiers.map((specifier, index) => ({ in: specifier, out: `entry-${index}` })),
    outdir: path.join(root, '.artifacts', 'esm-export-audit'),
    bundle: true, splitting: true, format: 'esm', platform: 'browser', write: false,
    external: ['./wasm/*'], metafile: true, logLevel: 'silent',
    plugins: [flightResolver(source)],
  });
  if (result.warnings.length) throw new Error(result.warnings.map(warning => warning.text).join('\n'));
  const exports = new Map();
  for (const [filename, module] of Object.entries(result.metafile.outputs)) {
    const match = /\bentry-(\d+)\.js$/u.exec(filename);
    if (match) exports.set(specifiers[Number(match[1])], module.exports);
  }
  return exports;
}

function pinnedFlightSource(flightRoot) {
  const pinned = resolveDependency(root, 'flight');
  const source = flightRoot ?? pinned.directory;
  const revision = spawnSync('git', ['rev-parse', 'HEAD'], { cwd: source, encoding: 'utf8' });
  const status = spawnSync('git', ['status', '--porcelain'], { cwd: source, encoding: 'utf8' });
  if (revision.status !== 0 || revision.stdout.trim() !== pinned.commit || status.status !== 0 || status.stdout.trim()) {
    throw new Error('Flight ESM source must be a clean checkout matching dependencies.lock.json');
  }
  return source;
}

function flightResolver(source) {
  const manifests = new Map();
  return { name: 'pinned-flight-esm', setup(builder) {
    builder.onResolve({ filter: /^@flighthq\// }, ({ path: specifier }) => {
      const match = /^@flighthq\/([a-z0-9-]+)(?:\/([a-zA-Z0-9_./-]+))?$/u.exec(specifier);
      if (!match || match[2]?.split('/').includes('..')) throw new Error(`Invalid Flight import: ${specifier}`);
      const [, name, subpath] = match;
      const directory = path.join(source, 'packages', name);
      if (!manifests.has(name)) {
        const manifest = JSON.parse(readFileSync(path.join(directory, 'package.json'), 'utf8'));
        manifests.set(name, manifest.exports ?? {});
      }
      const entry = manifests.get(name)[subpath ? './' + subpath : '.'];
      const runtime = typeof entry === 'string' ? entry : entry?.import ?? entry?.default;
      const sourceFile = runtime?.replace(/^\.\/dist\//u, '').replace(/\.js$/u, '.ts') ?? `${subpath ?? 'index'}.ts`;
      const filename = path.join(directory, 'src', sourceFile);
      if (!existsSync(filename)) throw new Error(`Missing pinned Flight ESM entry: ${specifier} (${filename})`);
      return { path: filename };
    });
  } };
}

if (process.argv[1] && import.meta.url === pathToFileURL(path.resolve(process.argv[1])).href) {
  const [entry, outfile] = process.argv.slice(2);
  if (!entry || !outfile) throw new Error('Usage: node tools/esm/bundle.mjs <consumer.mjs> <bundle.mjs>');
  await bundleFlightJs({ entry, outfile });
}
