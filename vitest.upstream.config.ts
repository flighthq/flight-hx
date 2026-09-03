import { existsSync } from 'node:fs';
import path from 'node:path';
import { defineConfig, type Plugin } from 'vitest/config';
import { REGISTRY_ISOLATED_TEST_FILES } from './upstream/scripts/registryIsolatedTests';

const repositoryRoot = path.resolve('.');
const packagesDirectory = path.join(repositoryRoot, 'upstream/packages');
const bridgesDirectory = path.join(repositoryRoot, 'tests/bridges');
const selectedPackage = process.env.FLIGHT_UPSTREAM_PACKAGE;

// Files that assert a PROCESS-global invariant (e.g. `packages/shape` asserts importing the module
// registers nothing) cannot share a module registry with their siblings. Upstream routes them to an
// `isolate: true` project in its own vitest config; the parity harness must do the same, or the
// import-time assertion is decided by file scheduling under the shared `isolate: false` worker rather
// than by the code. Paths in the list are relative to `upstream/`; prefix them to this config's root.
const isolatedTestFiles = REGISTRY_ISOLATED_TEST_FILES.map((file) => `upstream/${file}`);
// The harness runs one package per invocation, so only carve out the isolated project when the selected
// package actually owns an isolated file — otherwise the isolated project would match nothing and error.
const selectedIsolatedTestFiles = isolatedTestFiles.filter(
  (file) => !selectedPackage || file.startsWith(`upstream/packages/${selectedPackage}/`),
);
export const bridgeHookTimeoutMs = 30_000;
export const bridgeTestTimeoutMs = 30_000;

export function packageBridge(specifier: string): string | undefined {
  const match = /^@flighthq\/([^/]+)(?:\/(.+))?$/u.exec(specifier);
  if (!match) return undefined;
  const [, packageName, exportPath] = match;
  if (exportPath) {
    const source = path.join(bridgesDirectory, 'sources', packageName!, `${exportPath}.mjs`);
    if (existsSync(source)) return source;
  }
  const bridge = path.join(bridgesDirectory, `${packageName}.mjs`);
  return existsSync(bridge) ? bridge : undefined;
}

function sourceBridge(file: string): string | undefined {
  const relative = path.relative(packagesDirectory, file);
  if (relative.startsWith('..') || path.isAbsolute(relative)) return undefined;
  const [packageName, sourceDirectory, ...sourceParts] = relative.split(path.sep);
  if (sourceDirectory !== 'src' || sourceParts.length !== 1) return undefined;
  const sourceName = sourceParts[0]?.replace(/\.tsx?$/u, '');
  if (!sourceName) return undefined;
  const bridge = path.join(bridgesDirectory, 'sources', packageName!, `${sourceName}.mjs`);
  return existsSync(bridge) ? bridge : undefined;
}

function packageFromSourceFile(file: string): string | undefined {
  const relative = path.relative(packagesDirectory, file);
  if (relative.startsWith('..') || path.isAbsolute(relative)) return undefined;
  const [packageName, sourceDirectory] = relative.split(path.sep);
  return sourceDirectory === 'src' ? packageName : undefined;
}

function resolveTypeScriptSource(specifier: string, importer: string): string | undefined {
  const base = path.resolve(path.dirname(importer), specifier);
  const candidates = [base, `${base}.ts`, `${base}.tsx`, base.replace(/\.m?js$/u, '.ts'), path.join(base, 'index.ts')];
  return candidates.find((candidate) => existsSync(candidate));
}

function isTypeScriptTestFixture(file: string): boolean {
  const base = path.basename(file);
  return /(?:^|\.)test\.[cm]?tsx?$/iu.test(base) || /test(?:helper|util)/iu.test(base);
}

function compiledFlightBridge(): Plugin {
  return {
    enforce: 'pre',
    name: 'compiled-flight-haxe-bridge',
    resolveId(source, importer) {
      const packageImport = packageBridge(source);
      if (packageImport) return packageImport;

      if (!importer || !source.startsWith('.')) return undefined;
      const [importerFile] = importer.split('?', 1);
      if (!importerFile || !packageFromSourceFile(importerFile)) return undefined;

      const target = resolveTypeScriptSource(source, importerFile);
      if (!target || isTypeScriptTestFixture(target)) return undefined;

      return sourceBridge(target);
    },
  };
}

const packageInclude = selectedPackage
  ? [`upstream/packages/${selectedPackage}/src/**/*.test.ts`]
  : ['upstream/packages/*/src/**/*.test.ts'];
const commonExclude = ['**/.claude/**', '**/node_modules/**', '**/surfaceWasm.test.ts'];
// The shared tier trades hermeticity for speed (`isolate: false`, one module registry per worker).
// A file that leaks module state — a populated registry, an unrestored namespace spy — can then change
// a later file's result. The harness's isolation-retry sets FLIGHT_UPSTREAM_ISOLATE=1 to re-run a
// failed package's files hermetically and tell a real port failure from shared-worker pollution.
const sharedIsolate = process.env.FLIGHT_UPSTREAM_ISOLATE === '1';

export default defineConfig({
  plugins: [compiledFlightBridge()],
  test: {
    environment: 'jsdom',
    globals: true,
    // A resetModules() partial-mock hook can require Vite to transform and
    // evaluate the 13 MB compiled Haxe bundle again. Keep the ordinary test
    // timeout bounded, but give bridge-backed setup and stress tests enough time.
    hookTimeout: bridgeHookTimeoutMs,
    testTimeout: bridgeTestTimeoutMs,
    setupFiles: [
      path.join(repositoryRoot, 'upstream/vitest.setup.ts'),
      path.join(repositoryRoot, 'tests/upstream/reset.setup.ts'),
    ],
    unstubGlobals: true,
    exclude: commonExclude,
    // Mirror upstream's isolation split: the shared tier reuses one module registry per worker
    // (`isolate: false`, the large speedup), while process-global-invariant files run in their own
    // process (`isolate: true`). The shared tier must exclude the isolated files or they run twice —
    // once vacuously in the shared worker where the invariant is already violated by a sibling.
    projects: [
      {
        extends: true,
        test: {
          name: 'shared',
          isolate: sharedIsolate,
          include: packageInclude,
          exclude: [...commonExclude, ...isolatedTestFiles],
        },
      },
      ...(selectedIsolatedTestFiles.length > 0
        ? [
            {
              extends: true,
              test: {
                name: 'isolated',
                isolate: true,
                include: selectedIsolatedTestFiles,
                exclude: commonExclude,
              },
            },
          ]
        : []),
    ],
  },
});
