import { existsSync } from 'node:fs';
import path from 'node:path';
import { defineConfig, type Plugin } from 'vitest/config';

const repositoryRoot = path.resolve('.');
const packagesDirectory = path.join(repositoryRoot, 'upstream/packages');
const bridgesDirectory = path.join(repositoryRoot, 'tests/bridges');
const selectedPackage = process.env.FLIGHT_UPSTREAM_PACKAGE;

function packageBridge(packageName: string): string | undefined {
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
      const packageImport = /^@flighthq\/([^/]+)(?:\/.*)?$/u.exec(source);
      if (packageImport) return packageBridge(packageImport[1]);

      if (!importer || !source.startsWith('.')) return undefined;
      const importerFile = importer.split('?', 1)[0];
      if (!packageFromSourceFile(importerFile)) return undefined;

      const target = resolveTypeScriptSource(source, importerFile);
      if (!target || isTypeScriptTestFixture(target)) return undefined;

      return sourceBridge(target);
    },
  };
}

export default defineConfig({
  plugins: [compiledFlightBridge()],
  test: {
    environment: 'jsdom',
    globals: true,
    isolate: false,
    setupFiles: [path.join(repositoryRoot, 'upstream/vitest.setup.ts')],
    unstubGlobals: true,
    exclude: ['**/.claude/**', '**/node_modules/**', '**/surfaceWasm.test.ts'],
    include: selectedPackage
      ? [`upstream/packages/${selectedPackage}/src/**/*.test.ts`]
      : ['upstream/packages/*/src/**/*.test.ts'],
  },
});
