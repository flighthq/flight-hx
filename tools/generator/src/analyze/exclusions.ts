import { readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import type { PackageExclusion, PackageInventory, UpstreamInventory } from '../model/inventory.ts';

interface ExclusionFacts {
  hostDependencies: string[];
  hostImports: string[];
  nodeImports: string[];
  playwrightDependencies: string[];
  playwrightImports: string[];
  sdkExposures: string[];
  toolingBins: string[];
  unsupportedHostDependencies: string[];
  unsupportedHostImports: string[];
}

interface ExclusionClaim {
  exclusion?: PackageExclusion | undefined;
  missing: string[];
  packageName: string;
}

export function derivePackageExclusions(
  workspaceDirectory: string,
  packages: readonly PackageInventory[],
): ReadonlyMap<string, PackageExclusion> {
  const claims = packages
    .map((item) => exclusionClaim(workspaceDirectory, item))
    .filter((claim) => claim !== undefined);
  const partial = claims.filter((claim) => claim.missing.length > 0);
  if (partial.length > 0) {
    throw new Error(
      `Partial package exclusion matches:\n${partial
        .map((claim) => `- ${claim.packageName}: ${claim.missing.join(', ')}`)
        .join('\n')}`,
    );
  }
  const exclusions = claims.flatMap((claim) =>
    claim.exclusion ? ([[claim.packageName, claim.exclusion]] as const) : [],
  );
  if (exclusions.length !== 1) {
    throw new Error(
      `Package exclusion derivation changed: expected exactly one node-playwright-tooling exclusion, found ${String(exclusions.length)}${
        exclusions.length > 0 ? ` (${exclusions.map(([packageName]) => packageName).join(', ')})` : ''
      }`,
    );
  }
  return new Map(exclusions);
}

export function excludedPackageDirectories(inventory: UpstreamInventory): ReadonlySet<string> {
  return new Set(
    inventory.packages.filter((item) => item.exclusion !== null).map((item) => path.basename(item.directory)),
  );
}

function exclusionClaim(workspaceDirectory: string, item: PackageInventory): ExclusionClaim | undefined {
  const packageDirectory = path.resolve(workspaceDirectory, item.directory);
  const packageJson = JSON.parse(readFileSync(path.join(packageDirectory, 'package.json'), 'utf8')) as Record<
    string,
    unknown
  >;
  const toolingBins = manifestBins(packageJson.bin);
  const dependencyNames = manifestDependencyNames(packageJson);
  const imports = productionImports(path.join(packageDirectory, 'src'));
  const playwrightDependencies = dependencyNames.filter(isPlaywrightModule);
  const playwrightImports = imports.filter(isPlaywrightModule);
  const nodeImports = imports.filter((specifier) => specifier.startsWith('node:'));
  const hostDependencies = dependencyNames.filter(isHostModule);
  const hostImports = imports.filter(isHostModule);
  const facts: ExclusionFacts = {
    hostDependencies,
    hostImports,
    nodeImports,
    playwrightDependencies,
    playwrightImports,
    sdkExposures: item.sdkExposures.map((exposure) => `${exposure.sdkLane} -> ${exposure.target}`).sort(),
    toolingBins,
    unsupportedHostDependencies: hostDependencies.filter((specifier) => !isNodeOrPlaywrightModule(specifier)),
    unsupportedHostImports: hostImports.filter((specifier) => !isNodeOrPlaywrightModule(specifier)),
  };
  if (toolingBins.length === 0 && playwrightDependencies.length === 0 && playwrightImports.length === 0) {
    return undefined;
  }
  const missing: string[] = [];
  if (toolingBins.length === 0) missing.push('missing tooling bin lane');
  if (facts.sdkExposures.length > 0) missing.push(`present in SDK barrels (${facts.sdkExposures.join(', ')})`);
  if (nodeImports.length === 0) missing.push('missing production node:* import');
  if (playwrightDependencies.length === 0) missing.push('missing Playwright production dependency');
  if (playwrightImports.length === 0) missing.push('missing production Playwright import');
  if (facts.unsupportedHostDependencies.length > 0) {
    missing.push(`unsupported host dependencies (${facts.unsupportedHostDependencies.join(', ')})`);
  }
  if (facts.unsupportedHostImports.length > 0) {
    missing.push(`unsupported host imports (${facts.unsupportedHostImports.join(', ')})`);
  }
  return {
    ...(missing.length === 0
      ? {
          exclusion: {
            evidence: {
              hostDependencies,
              hostImports,
              nodeImports,
              playwrightDependencies,
              playwrightImports,
              sdkExposures: facts.sdkExposures,
              toolingBins,
            },
            reason: `Tooling CLI (${String(toolingBins.length)} bin), absent from SDK barrels, with production host dependencies/imports limited to Node built-ins and Playwright (${String(hostDependencies.length)} dependency, ${String(hostImports.length)} imports).`,
            rule: 'node-playwright-tooling',
          } satisfies PackageExclusion,
        }
      : {}),
    missing,
    packageName: item.name,
  };
}

function manifestBins(value: unknown): string[] {
  if (typeof value === 'string') return [`default -> ${value}`];
  if (!value || typeof value !== 'object' || Array.isArray(value)) return [];
  return Object.entries(value)
    .filter((entry): entry is [string, string] => typeof entry[1] === 'string')
    .map(([name, target]) => `${name} -> ${target}`)
    .sort();
}

function manifestDependencyNames(packageJson: Record<string, unknown>): string[] {
  const names = new Set<string>();
  for (const key of ['dependencies', 'optionalDependencies', 'peerDependencies']) {
    const dependencies = packageJson[key];
    if (!dependencies || typeof dependencies !== 'object' || Array.isArray(dependencies)) continue;
    Object.keys(dependencies).forEach((name) => names.add(name));
  }
  return [...names].sort();
}

function productionImports(sourceDirectory: string): string[] {
  const imports = new Set<string>();
  for (const file of walkSourceFiles(sourceDirectory)) {
    const source = ts.createSourceFile(
      file,
      readFileSync(file, 'utf8'),
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const visit = (node: ts.Node): void => {
      if (
        (ts.isImportDeclaration(node) || ts.isExportDeclaration(node)) &&
        node.moduleSpecifier &&
        ts.isStringLiteral(node.moduleSpecifier)
      ) {
        imports.add(node.moduleSpecifier.text);
      } else if (
        ts.isCallExpression(node) &&
        node.expression.kind === ts.SyntaxKind.ImportKeyword &&
        node.arguments.length === 1 &&
        ts.isStringLiteral(node.arguments[0]!)
      ) {
        imports.add(node.arguments[0].text);
      }
      ts.forEachChild(node, visit);
    };
    visit(source);
  }
  return [...imports].sort();
}

function walkSourceFiles(directory: string): string[] {
  const files: string[] = [];
  for (const entry of readdirSync(directory, { withFileTypes: true })) {
    const target = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...walkSourceFiles(target));
    else if (
      /\.tsx?$/u.test(entry.name) &&
      !/\.(?:test|spec)\.tsx?$/u.test(entry.name) &&
      !entry.name.endsWith('.d.ts')
    ) {
      files.push(target);
    }
  }
  return files.sort();
}

function isHostModule(specifier: string): boolean {
  return (
    isNodeOrPlaywrightModule(specifier) ||
    specifier === 'electron' ||
    specifier.startsWith('@capacitor/') ||
    specifier.startsWith('@tauri-apps/')
  );
}

function isNodeOrPlaywrightModule(specifier: string): boolean {
  return specifier.startsWith('node:') || isPlaywrightModule(specifier);
}

function isPlaywrightModule(specifier: string): boolean {
  return specifier === '@playwright/test' || specifier.startsWith('@playwright/');
}
