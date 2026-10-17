// Bundle a Haxe-emitted JS entry together with the Flight ESM it imports, resolving @flighthq/*
// from the rehydrated Flight workspace. esbuild is the bundler the web pipeline relies on (Flight's
// dist is bundler-targeted ESM with extensionless imports — not Node-native-runnable on its own).
//
// This is the *bundler* half of the web pipeline. The other half — making Haxe emit static named
// `import { … }` instead of `require()` so this bundle tree-shakes — is the vendored generator this
// directory is named for. The web behavior and DCE gates exercise both halves together and reject
// require()-based output that would pull whole packages instead of preserving pay-per-use imports.
import { build } from 'esbuild';
import { existsSync } from 'node:fs';
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
    plugins: [flightWorkspacePackages(flight.directory)],
    treeShaking: true,
    metafile: true,
    logLevel: 'silent',
  });
  return { inputCount: Object.keys(result.metafile.inputs).length, metafile: result.metafile };
}

function flightWorkspacePackages(flightDirectory) {
  return {
    name: 'flight-workspace-packages',
    setup(build_) {
      build_.onResolve({ filter: /^@flighthq\// }, ({ path: specifier }) => {
        const match = /^@flighthq\/([^/]+)(?:\/(.+))?$/u.exec(specifier);
        if (!match) return undefined;
        const entry = join(flightDirectory, 'packages', match[1], 'dist', `${match[2] ?? 'index'}.js`);
        return existsSync(entry) ? { path: entry } : undefined;
      });
    },
  };
}

// CLI: node tools/esm/bundle.mjs <entry.js> <outfile.js> [--browser]
if (import.meta.url === `file://${process.argv[1]}`) {
  const [entry, outfile, ...flags] = process.argv.slice(2);
  const unknown = flags.filter((flag) => flag !== '--browser');
  if (!entry || !outfile || unknown.length > 0) {
    console.error('usage: node tools/esm/bundle.mjs <entry.js> <outfile.js> [--browser]');
    process.exit(2);
  }
  try {
    const browser = flags.includes('--browser');
    const { inputCount } = await bundleFlightJs({
      entry,
      outfile,
      format: browser ? 'esm' : 'cjs',
      platform: browser ? 'browser' : 'node',
    });
    console.log(`bundled ${outfile} (${inputCount} input modules)`);
  } catch (error) {
    for (const message of error?.errors ?? []) console.error('esbuild:', message.text);
    process.exit(1);
  }
}
