import { createHash } from 'node:crypto';
import { existsSync, readFileSync, readdirSync, statSync } from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import ts from 'typescript';

import type {
  ExportConflict,
  ExportKind,
  ExportRecord,
  PackageInventory,
  UpstreamInventory,
} from '../model/inventory.ts';

interface PackageDescriptor {
  directory: string;
  name: string;
  version: string;
}

interface ParsedSource {
  directExports: Map<string, ExportRecord>;
  exportDeclarations: ts.ExportDeclaration[];
  localDeclarations: Map<string, ExportRecord>;
  localImports: Map<string, { importedName: string; specifier: string }>;
}

const printer = ts.createPrinter({ removeComments: true });

export function packageNameToModule(packageName: string): string {
  const packageSegment = packageNameToHaxePackage(packageName).split('.').at(-1)!;
  return `${packageSegment.slice(0, 1).toUpperCase()}${packageSegment.slice(1)}`;
}

export function packageNameToHaxePackage(packageName: string): string {
  const bareName = packageName.replace(/^@flighthq\//u, '');
  const parts = bareName.split(/[-_]/u).filter(Boolean);
  if (parts.length === 0) throw new Error(`Cannot map empty npm package name: ${packageName}`);
  const segment = parts
    .map((part, index) =>
      index === 0 ? part.toLowerCase() : `${part.slice(0, 1).toUpperCase()}${part.slice(1).toLowerCase()}`,
    )
    .join('');
  return `flighthq.${segment}`;
}

export function sourcePathToModule(sourcePath: string): string | undefined {
  const filename = path.basename(sourcePath).replace(/\.tsx?$/u, '');
  if (filename.toLowerCase() === 'index' || isInternalSource(filename)) return undefined;
  return pascalCaseFilename(filename);
}

export function sourcePathToImplementationModule(sourcePath: string): string {
  const publicModule = sourcePathToModule(sourcePath);
  if (publicModule) return publicModule;
  const filename = path.basename(sourcePath).replace(/\.tsx?$/u, '');
  return `_${pascalCaseFilename(filename)}`;
}

export function sourcePathToHaxePackage(packageName: string, sourcePath: string): string {
  const packagePath = packageNameToHaxePackage(packageName);
  return sourcePathToModule(sourcePath) ? packagePath : `${packagePath}._internal`;
}

function isInternalSource(filename: string): boolean {
  return filename.toLowerCase() === 'internal' || /test(?:helper|util)/iu.test(filename);
}

function pascalCaseFilename(filename: string): string {
  const match = /^(?<prefix>_*)(?<name>.*)$/u.exec(filename);
  const prefix = match?.groups?.prefix ?? '';
  const name = match?.groups?.name ?? filename;
  return `${prefix}${name
    .split(/[-_]/u)
    .filter(Boolean)
    .map((part) => `${part.slice(0, 1).toUpperCase()}${part.slice(1)}`)
    .join('')}`;
}

export function analyzeUpstream(workspaceDirectory: string): UpstreamInventory {
  const upstreamDirectory = path.join(workspaceDirectory, 'upstream');
  const packagesDirectory = path.join(upstreamDirectory, 'packages');
  const packages = discoverPackages(packagesDirectory);
  const packageByName = new Map(packages.map((item) => [item.name, item]));
  const parsedSources = new Map<string, ParsedSource>();
  const resolvedExports = new Map<string, Map<string, ExportRecord>>();
  const sdkPackages = readSdkPackages(packageByName.get('@flighthq/sdk'));

  const packageInventories = packages.map((descriptor) => {
    const sourceDirectory = path.join(descriptor.directory, 'src');
    const sourceFiles = walkFiles(sourceDirectory, (file) => isSourceFile(file));
    const testFiles = walkFiles(sourceDirectory, (file) => isTestFile(file));
    const entry = path.join(sourceDirectory, 'index.ts');
    const exports = existsSync(entry)
      ? [...resolveExports(entry, packageByName, parsedSources, resolvedExports, new Set()).values()]
      : [];
    const { conflicts, uniqueExports } = deduplicateExports(exports);
    const packageJson = readJson(path.join(descriptor.directory, 'package.json'));

    return {
      dependencies: collectDependencies(packageJson),
      directory: path.relative(workspaceDirectory, descriptor.directory),
      exportConflicts: conflicts,
      exports: uniqueExports.sort(compareExports),
      haxeModule: `${packageNameToHaxePackage(descriptor.name)}.${packageNameToModule(descriptor.name)}`,
      name: descriptor.name,
      sdkIncluded: sdkPackages.has(descriptor.name),
      sourceFiles: sourceFiles.length,
      testFiles: testFiles.length,
      version: descriptor.version,
    } satisfies PackageInventory;
  });

  packageInventories.sort((left, right) => left.name.localeCompare(right.name));

  return {
    packages: packageInventories,
    schemaVersion: 1,
    summary: {
      exportConflicts: sum(packageInventories, (item) => item.exportConflicts.length),
      exports: sum(packageInventories, (item) => item.exports.length),
      packages: packageInventories.length,
      sourceFiles: sum(packageInventories, (item) => item.sourceFiles),
      testFiles: sum(packageInventories, (item) => item.testFiles),
    },
    upstreamCommit: readUpstreamCommit(upstreamDirectory),
  };
}

function collectDependencies(packageJson: Record<string, unknown>): string[] {
  const names = new Set<string>();
  for (const key of ['dependencies', 'peerDependencies'] as const) {
    const dependencies = packageJson[key];
    if (dependencies && typeof dependencies === 'object') {
      for (const name of Object.keys(dependencies)) names.add(name);
    }
  }
  return [...names].sort();
}

function compareExports(left: ExportRecord, right: ExportRecord): number {
  return left.name.localeCompare(right.name) || left.source.localeCompare(right.source);
}

function declarationKind(node: ts.Node): ExportKind {
  if (ts.isClassDeclaration(node)) return 'class';
  if (ts.isEnumDeclaration(node)) return 'enum';
  if (ts.isFunctionDeclaration(node)) return 'function';
  if (ts.isInterfaceDeclaration(node)) return 'interface';
  if (ts.isModuleDeclaration(node)) return 'namespace';
  if (ts.isTypeAliasDeclaration(node)) return 'type';
  if (ts.isVariableStatement(node)) return 'variable';
  return 'unknown';
}

function deduplicateExports(exports: ExportRecord[]): {
  conflicts: ExportConflict[];
  uniqueExports: ExportRecord[];
} {
  const byName = new Map<string, ExportRecord>();
  const conflictSources = new Map<string, Set<string>>();

  for (const record of exports) {
    const existing = byName.get(record.name);
    if (!existing) {
      byName.set(record.name, record);
      continue;
    }
    if (existing.source === record.source && existing.fingerprint === record.fingerprint) continue;
    const sources = conflictSources.get(record.name) ?? new Set([existing.source]);
    sources.add(record.source);
    conflictSources.set(record.name, sources);
  }

  return {
    conflicts: [...conflictSources]
      .map(([name, sources]) => ({ name, sources: [...sources].sort() }))
      .sort((left, right) => left.name.localeCompare(right.name)),
    uniqueExports: [...byName.values()],
  };
}

function discoverPackages(packagesDirectory: string): PackageDescriptor[] {
  return readdirSync(packagesDirectory, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => path.join(packagesDirectory, entry.name))
    .filter((directory) => existsSync(path.join(directory, 'package.json')))
    .map((directory) => {
      const packageJson = readJson(path.join(directory, 'package.json'));
      if (typeof packageJson.name !== 'string' || typeof packageJson.version !== 'string') {
        throw new Error(`Invalid package metadata: ${path.relative(process.cwd(), directory)}`);
      }
      return { directory, name: packageJson.name, version: packageJson.version };
    })
    .sort((left, right) => left.name.localeCompare(right.name));
}

function exportedBindingNames(name: ts.BindingName): string[] {
  if (ts.isIdentifier(name)) return [name.text];
  return name.elements.flatMap((element) =>
    ts.isOmittedExpression(element) ? [] : exportedBindingNames(element.name),
  );
}

function fingerprint(node: ts.Node, sourceFile: ts.SourceFile): string {
  const normalized = printer.printNode(ts.EmitHint.Unspecified, node, sourceFile).replace(/\s+/gu, ' ').trim();
  return `sha256:${createHash('sha256').update(normalized).digest('hex')}`;
}

function hasModifier(node: ts.Node, kind: ts.SyntaxKind): boolean {
  return ts.canHaveModifiers(node) && ts.getModifiers(node)?.some((modifier) => modifier.kind === kind) === true;
}

function isSourceFile(file: string): boolean {
  return /\.tsx?$/u.test(file) && !isTestFile(file) && !file.endsWith('.d.ts');
}

function isTestFile(file: string): boolean {
  return /\.(?:test|spec)\.tsx?$/u.test(file);
}

function parseSource(file: string, cache: Map<string, ParsedSource>): ParsedSource {
  const cached = cache.get(file);
  if (cached) return cached;

  const text = readFileSync(file, 'utf8').replace(/^\uFEFF/u, '');
  const sourceFile = ts.createSourceFile(file, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const directExports = new Map<string, ExportRecord>();
  const exportDeclarations: ts.ExportDeclaration[] = [];
  const localDeclarations = new Map<string, ExportRecord>();
  const localImports = new Map<string, { importedName: string; specifier: string }>();

  for (const statement of sourceFile.statements) {
    if (ts.isImportDeclaration(statement) && ts.isStringLiteral(statement.moduleSpecifier) && statement.importClause) {
      const specifier = statement.moduleSpecifier.text;
      if (statement.importClause.name) {
        localImports.set(statement.importClause.name.text, { importedName: 'default', specifier });
      }
      const bindings = statement.importClause.namedBindings;
      if (bindings && ts.isNamedImports(bindings)) {
        for (const element of bindings.elements) {
          localImports.set(element.name.text, {
            importedName: element.propertyName?.text ?? element.name.text,
            specifier,
          });
        }
      } else if (bindings && ts.isNamespaceImport(bindings)) {
        localImports.set(bindings.name.text, { importedName: '*', specifier });
      }
      continue;
    }
    if (ts.isExportDeclaration(statement)) {
      exportDeclarations.push(statement);
      continue;
    }
    if (ts.isExportAssignment(statement)) {
      directExports.set('default', makeRecord('default', 'default', statement, sourceFile));
      continue;
    }
    if (!hasModifier(statement, ts.SyntaxKind.ExportKeyword)) continue;

    const kind = declarationKind(statement);
    const isDefault = hasModifier(statement, ts.SyntaxKind.DefaultKeyword);
    if (isDefault) {
      directExports.set('default', makeRecord('default', 'default', statement, sourceFile));
      continue;
    }
    if (ts.isVariableStatement(statement)) {
      for (const declaration of statement.declarationList.declarations) {
        for (const name of exportedBindingNames(declaration.name)) {
          const record = makeRecord(name, kind, statement, sourceFile);
          localDeclarations.set(name, record);
          directExports.set(name, record);
        }
      }
      continue;
    }
    if (
      (ts.isClassDeclaration(statement) ||
        ts.isEnumDeclaration(statement) ||
        ts.isFunctionDeclaration(statement) ||
        ts.isInterfaceDeclaration(statement) ||
        ts.isModuleDeclaration(statement) ||
        ts.isTypeAliasDeclaration(statement)) &&
      statement.name &&
      ts.isIdentifier(statement.name)
    ) {
      const record = makeRecord(statement.name.text, kind, statement, sourceFile);
      localDeclarations.set(statement.name.text, record);
      directExports.set(statement.name.text, record);
      continue;
    }
  }

  for (const statement of sourceFile.statements) {
    if (hasModifier(statement, ts.SyntaxKind.ExportKeyword)) continue;
    const kind = declarationKind(statement);
    if (ts.isVariableStatement(statement)) {
      for (const declaration of statement.declarationList.declarations) {
        for (const name of exportedBindingNames(declaration.name)) {
          localDeclarations.set(name, makeRecord(name, kind, statement, sourceFile));
        }
      }
    } else if (
      (ts.isClassDeclaration(statement) ||
        ts.isEnumDeclaration(statement) ||
        ts.isFunctionDeclaration(statement) ||
        ts.isInterfaceDeclaration(statement) ||
        ts.isModuleDeclaration(statement) ||
        ts.isTypeAliasDeclaration(statement)) &&
      statement.name &&
      ts.isIdentifier(statement.name)
    ) {
      localDeclarations.set(statement.name.text, makeRecord(statement.name.text, kind, statement, sourceFile));
    }
  }

  const parsed = { directExports, exportDeclarations, localDeclarations, localImports };
  cache.set(file, parsed);
  return parsed;
}

function makeRecord(name: string, kind: ExportKind, node: ts.Node, sourceFile: ts.SourceFile): ExportRecord {
  return {
    fingerprint: fingerprint(node, sourceFile),
    kind,
    name,
    source: path.relative(process.cwd(), sourceFile.fileName),
  };
}

function readJson(file: string): Record<string, unknown> {
  return JSON.parse(readFileSync(file, 'utf8')) as Record<string, unknown>;
}

function readSdkPackages(sdk: PackageDescriptor | undefined): Set<string> {
  if (!sdk) return new Set();
  const index = path.join(sdk.directory, 'src', 'index.ts');
  const text = readFileSync(index, 'utf8').replace(/^\uFEFF/u, '');
  const source = ts.createSourceFile(index, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const packages = new Set<string>();
  for (const statement of source.statements) {
    if (
      !ts.isExportDeclaration(statement) ||
      !statement.moduleSpecifier ||
      !ts.isStringLiteral(statement.moduleSpecifier)
    ) {
      continue;
    }
    if (statement.moduleSpecifier.text.startsWith('@flighthq/')) packages.add(statement.moduleSpecifier.text);
  }
  return packages;
}

function readUpstreamCommit(upstreamDirectory: string): string {
  return execFileSync('git', ['-C', upstreamDirectory, 'rev-parse', 'HEAD'], { encoding: 'utf8' }).trim();
}

function resolveExports(
  file: string,
  packageByName: Map<string, PackageDescriptor>,
  parsedSources: Map<string, ParsedSource>,
  resolvedCache: Map<string, Map<string, ExportRecord>>,
  resolving: Set<string>,
): Map<string, ExportRecord> {
  const normalizedFile = path.normalize(file);
  const cached = resolvedCache.get(normalizedFile);
  if (cached) return cached;
  if (resolving.has(normalizedFile)) return new Map();
  resolving.add(normalizedFile);

  const parsed = parseSource(normalizedFile, parsedSources);
  const exports = new Map(parsed.directExports);

  for (const declaration of parsed.exportDeclarations) {
    const targetFile =
      declaration.moduleSpecifier && ts.isStringLiteral(declaration.moduleSpecifier)
        ? resolveModule(normalizedFile, declaration.moduleSpecifier.text, packageByName)
        : undefined;
    const targetExports = targetFile
      ? resolveExports(targetFile, packageByName, parsedSources, resolvedCache, resolving)
      : parsed.localDeclarations;

    if (!declaration.exportClause) {
      for (const [name, record] of targetExports) {
        if (name !== 'default' && !exports.has(name)) exports.set(name, record);
      }
      continue;
    }
    if (ts.isNamespaceExport(declaration.exportClause)) {
      const name = declaration.exportClause.name.text;
      exports.set(name, makeRecord(name, 'namespace', declaration, declaration.getSourceFile()));
      continue;
    }
    for (const element of declaration.exportClause.elements) {
      const importedName = element.propertyName?.text ?? element.name.text;
      const exportedName = element.name.text;
      let record = targetExports.get(importedName);
      if (!targetFile && !record) {
        const imported = parsed.localImports.get(importedName);
        if (imported) {
          const importedFile = resolveModule(normalizedFile, imported.specifier, packageByName);
          const importedExports = resolveExports(importedFile, packageByName, parsedSources, resolvedCache, resolving);
          record = imported.importedName === '*' ? undefined : importedExports.get(imported.importedName);
        }
      }
      exports.set(
        exportedName,
        record
          ? { ...record, name: exportedName }
          : makeRecord(exportedName, 'unknown', declaration, declaration.getSourceFile()),
      );
    }
  }

  resolving.delete(normalizedFile);
  resolvedCache.set(normalizedFile, exports);
  return exports;
}

function resolveModule(
  containingFile: string,
  specifier: string,
  packageByName: Map<string, PackageDescriptor>,
): string {
  // Strip the ESM `.js`/`.mjs` extension that TypeScript module specifiers carry; the on-disk
  // source is `.ts`/`.tsx` (matches the relative-import resolver in emit/core.ts).
  const withoutJs = specifier.replace(/\.m?js$/u, '');
  let candidate: string;
  if (withoutJs.startsWith('.')) {
    candidate = path.resolve(path.dirname(containingFile), withoutJs);
  } else {
    const match = /^(@flighthq\/[^/]+)(?:\/(.+))?$/u.exec(withoutJs);
    if (!match?.[1]) throw new Error(`Unsupported export module '${specifier}' in ${containingFile}`);
    const descriptor = packageByName.get(match[1]);
    if (!descriptor) throw new Error(`Unknown Flight package '${match[1]}' in ${containingFile}`);
    candidate = path.join(descriptor.directory, 'src', match[2] ?? 'index');
  }

  for (const resolved of [candidate, `${candidate}.ts`, `${candidate}.tsx`, path.join(candidate, 'index.ts')]) {
    if (existsSync(resolved) && statSync(resolved).isFile()) return resolved;
  }
  throw new Error(`Cannot resolve export '${specifier}' from ${containingFile}`);
}

function sum<T>(items: T[], selector: (item: T) => number): number {
  return items.reduce((total, item) => total + selector(item), 0);
}

function walkFiles(directory: string, predicate: (file: string) => boolean): string[] {
  if (!existsSync(directory)) return [];
  const files: string[] = [];
  for (const entry of readdirSync(directory, { withFileTypes: true })) {
    const target = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...walkFiles(target, predicate));
    else if (entry.isFile() && predicate(target)) files.push(target);
  }
  return files.sort();
}
