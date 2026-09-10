// Bundle a Haxe-emitted JS entry together with the Flight ESM it imports, resolving @flighthq/*
// from the rehydrated Flight workspace. esbuild is the bundler the web pipeline relies on (Flight's
// dist is bundler-targeted ESM with extensionless imports — not Node-native-runnable on its own).
//
// This is the *bundler* half of the web pipeline. The other half — making Haxe emit static named
// `import { … }` instead of `require()` so this bundle tree-shakes — is the vendored generator this
// directory is named for, and is not built yet. Until then a require()-based entry bundles correctly
// but pulls the whole package (no pay-per-use); see tests/gates/webDce.mjs.
import { build } from 'esbuild';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';

const repoRoot = join(dirname(fileURLToPath(import.meta.url)), '..', '..');

export async function bundleFlightJs({ entry, outfile, format = 'cjs', platform = 'node' }) {
  const flight = resolveDependency(repoRoot, 'flight');
  const result = await build({
    entryPoints: [entry],
    outfile,
    bundle: true,
    format,
    platform,
    mainFields: ['module', 'main'],
    conditions: ['import', 'default'],
    nodePaths: [join(flight.directory, 'node_modules')], // resolve @flighthq/* from Flight's workspace
    treeShaking: true,
    metafile: true,
    logLevel: 'silent',
  });
  return { inputCount: Object.keys(result.metafile.inputs).length, metafile: result.metafile };
}

// CLI: node tools/esm/bundle.mjs <entry.js> <outfile.js>
if (import.meta.url === `file://${process.argv[1]}`) {
  const [entry, outfile] = process.argv.slice(2);
  if (!entry || !outfile) {
    console.error('usage: node tools/esm/bundle.mjs <entry.js> <outfile.js>');
    process.exit(2);
  }
  try {
    const { inputCount } = await bundleFlightJs({ entry, outfile });
    console.log(`bundled ${outfile} (${inputCount} input modules)`);
  } catch (error) {
    for (const message of error?.errors ?? []) console.error('esbuild:', message.text);
    process.exit(1);
  }
}
