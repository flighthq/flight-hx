import { createHash } from 'node:crypto';
import { existsSync, readFileSync, readdirSync, statSync } from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import ts from 'typescript';

import type {
  ExportConflict,
  ExportKind,
  ExportRecord,
  PackageExportCondition,
  PackageExportLane,
  PackageInventory,
  SdkExposure,
  UpstreamInventory,
} from '../model/inventory.ts';
import { derivePackageExclusions } from './exclusions.ts';
import { upstreamTypeScriptProgram } from './program.ts';
import { runtimeExportsForSource, type RuntimeExportDecision } from './runtime-values.ts';

interface PackageDescriptor {
  directory: string;
  name: string;
  version: string;
}

export interface PackageExportDescriptor {
  conditions: PackageExportCondition[];
  entry: string;
  source: string;
  specifier: string;
}

interface ParsedSource {
  directExports: Map<string, ExportRecord>;
  exportDeclarations: ts.ExportDeclaration[];
  localDeclarations: Map<string, ExportRecord>;
  localImports: Map<string, { importedName: string; specifier: string }>;
}

const printer = ts.createPrinter({ removeComments: true });

// npm package names are lowercase slugs, so fused words and numbered dimensions
// cannot be recovered safely with a casing heuristic. Keep the reviewed Flight
// vocabulary explicit; hyphen-delimited suffixes still compose mechanically.
const haxePackageStemOverrides: Readonly<Record<string, string>> = {
  bitmapfont: 'bitmapFont',
  bitmaptext: 'bitmapText',
  camera2d: 'camera2D',
  displayobject: 'displayObject',
  filesystem: 'fileSystem',
  flowstates: 'flowStates',
  glyphatlas: 'glyphAtlas',
  importdiagnostics: 'importDiagnostics',
  mediasession: 'mediaSession',
  motionpath: 'motionPath',
  movieclip: 'movieClip',
  particleemitter: 'particleEmitter',
  physics2d: 'physics2D',
  physics3d: 'physics3D',
  quadbatch: 'quadBatch',
  scene2d: 'scene2D',
  scene3d: 'scene3D',
  skeleton2d: 'skeleton2D',
  skeleton3d: 'skeleton3D',
  statusbar: 'statusBar',
  textbidi: 'textBidi',
  textinput: 'textInput',
  textlayout: 'textLayout',
  textsegment: 'textSegment',
  textshaper: 'textShaper',
  textureatlas: 'textureAtlas',
  useragent: 'userAgent',
};

export function packageNameToModule(packageName: string): string {
  const packageSegment = packageNameToSegment(packageName);
  return `${packageSegment.slice(0, 1).toUpperCase()}${packageSegment.slice(1)}`;
}

export function packageNameToHaxePackage(_packageName: string): string {
  // Per-source IR modules are folded into one root-level `_Package`
  // implementation module before emission, so their staging package is root too.
  return 'flight';
}

function packageNameToSegment(packageName: string): string {
  const bareName = packageName.replace(/^@flighthq\//u, '');
  const parts = bareName.split(/[-_]/u).filter(Boolean);
  if (parts.length === 0) throw new Error(`Cannot map empty npm package name: ${packageName}`);
  const segment = parts
    .map((part, index) => {
      const reviewed = haxePackageStemOverrides[part];
      const normalized = reviewed ?? part.toLowerCase();
      return index === 0 ? normalized : `${normalized.slice(0, 1).toUpperCase()}${normalized.slice(1)}`;
    })
    .join('');
  return segment;
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
  return filename.toLowerCase() === 'internal' || /test(?:helper|support|util)/iu.test(filename);
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
  const { checker, program } = upstreamTypeScriptProgram(workspaceDirectory);
  const packageByName = new Map(packages.map((item) => [item.name, item]));
  const parsedSources = new Map<string, ParsedSource>();
  const resolvedExports = new Map<string, Map<string, ExportRecord>>();
  const exportDescriptors = new Map(
    packages.map((descriptor) => [descriptor.name, readPackageExportDescriptors(descriptor)]),
  );

  const packageInventories: PackageInventory[] = packages.map((descriptor): PackageInventory => {
    const sourceDirectory = path.join(descriptor.directory, 'src');
    const sourceFiles = walkFiles(sourceDirectory, (file) => isSourceFile(file));
    const testFiles = walkFiles(sourceDirectory, (file) => isTestFile(file));
    const packageJson = readJson(path.join(descriptor.directory, 'package.json'));
    const exportLanes = (exportDescriptors.get(descriptor.name) ?? []).map((entry) => {
      const resolved = [
        ...resolveExports(entry.source, packageByName, parsedSources, resolvedExports, new Set()).values(),
      ];
      const source = program.getSourceFile(entry.source);
      if (!source) throw new Error(`Cannot resolve upstream TypeScript source: ${entry.source}`);
      const runtimeExports = runtimeExportsForSource(source, checker, program.getCompilerOptions());
      const exports = resolved.map((record) => applyRuntimeExportDecision(record, runtimeExports.get(record.name)));
      const { conflicts, uniqueExports } = deduplicateExports(exports);
      const unresolved = uniqueExports.filter((record) => record.kind === 'unknown');
      if (unresolved.length > 0) {
        throw new Error(
          `Unresolved public exports in ${entry.specifier}: ${unresolved.map((record) => record.name).join(', ')}`,
        );
      }
      return {
        conditions: entry.conditions,
        entry: entry.entry,
        exportConflicts: conflicts,
        exports: uniqueExports.sort(compareExports),
        source: path.relative(process.cwd(), entry.source),
        specifier: entry.specifier,
      } satisfies PackageExportLane;
    });

    return {
      dependencies: collectDependencies(packageJson),
      directory: path.relative(workspaceDirectory, descriptor.directory),
      exclusion: null,
      exportLanes,
      haxeModule: `flight.${packageNameToModule(descriptor.name)}`,
      name: descriptor.name,
      sdkExposures: [],
      sdkIncluded: false,
      sourceFiles: sourceFiles.length,
      testFiles: testFiles.length,
      version: descriptor.version,
    };
  });

  packageInventories.sort((left, right) => left.name.localeCompare(right.name));
  const inventoryByName = new Map(packageInventories.map((item) => [item.name, item]));
  const sdkExposures = readSdkExposures(
    packageByName.get('@flighthq/sdk'),
    inventoryByName,
    parsedSources,
    exportDescriptors,
  );
  for (const item of packageInventories) {
    item.sdkExposures = sdkExposures.get(item.name) ?? [];
    item.sdkIncluded = item.sdkExposures.length > 0;
  }
  const exclusions = derivePackageExclusions(workspaceDirectory, packageInventories);
  for (const item of packageInventories) item.exclusion = exclusions.get(item.name) ?? null;

  return {
    packages: packageInventories,
    schemaVersion: 4,
    summary: {
      excludedPackages: exclusions.size,
      exportConflicts: sum(packageInventories, (item) => sum(item.exportLanes, (lane) => lane.exportConflicts.length)),
      exportLanes: sum(packageInventories, (item) => item.exportLanes.length),
      exports: sum(packageInventories, (item) => sum(item.exportLanes, (lane) => lane.exports.length)),
      packages: packageInventories.length,
      rootExports: sum(packageInventories, (item) => packageRootExportLane(item).exports.length),
      sourceFiles: sum(packageInventories, (item) => item.sourceFiles),
      testFiles: sum(packageInventories, (item) => item.testFiles),
    },
    upstreamCommit: readUpstreamCommit(upstreamDirectory),
  };
}

export function packageRootExportLane(inventory: PackageInventory): PackageExportLane {
  const lane = inventory.exportLanes.find((candidate) => candidate.entry === '.');
  if (!lane) throw new Error(`Package manifest has no root export lane: ${inventory.name}`);
  return lane;
}

export function resolvePackageExportLane(
  inventoryByName: ReadonlyMap<string, PackageInventory>,
  specifier: string,
): PackageExportLane {
  const match = /^(@flighthq\/[^/]+)(?<subpath>\/.*)?$/u.exec(specifier);
  const packageName = match?.[1];
  if (!packageName) throw new Error(`Unsupported Flight package specifier: ${specifier}`);
  const inventory = inventoryByName.get(packageName);
  if (!inventory) throw new Error(`Unknown Flight package in public import: ${packageName}`);
  const entry = match.groups?.subpath ? `.${match.groups.subpath}` : '.';
  const lane = inventory.exportLanes.find((candidate) => candidate.entry === entry);
  if (!lane) throw new Error(`Package import uses an unaccounted export lane: ${specifier}`);
  return lane;
}

export function readPackageExportManifest(packageDirectory: string): PackageExportDescriptor[] {
  const packageJson = readJson(path.join(packageDirectory, 'package.json'));
  if (typeof packageJson.name !== 'string' || typeof packageJson.version !== 'string') {
    throw new Error(`Invalid package metadata: ${path.relative(process.cwd(), packageDirectory)}`);
  }
  return readPackageExportDescriptors({
    directory: packageDirectory,
    name: packageJson.name,
    version: packageJson.version,
  });
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
      setDeclarationRecord(localDeclarations, statement.name.text, record);
      setDeclarationRecord(directExports, statement.name.text, record);
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
      setDeclarationRecord(
        localDeclarations,
        statement.name.text,
        makeRecord(statement.name.text, kind, statement, sourceFile),
      );
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
    runtime: false,
    source: path.relative(process.cwd(), sourceFile.fileName),
  };
}

function setDeclarationRecord(target: Map<string, ExportRecord>, name: string, record: ExportRecord): void {
  const existing = target.get(name);
  if (
    record.kind === 'namespace' &&
    (existing?.kind === 'class' || existing?.kind === 'enum' || existing?.kind === 'function')
  )
    return;
  target.set(name, record);
}

function applyRuntimeExportDecision(record: ExportRecord, decision: RuntimeExportDecision | undefined): ExportRecord {
  if (!decision) throw new Error(`Cannot classify runtime export ${record.name} from ${record.source}`);
  if (!decision.runtime || !decision.declaration) {
    const erased = { ...record };
    delete erased.runtimeBinding;
    return { ...erased, runtime: false };
  }
  const binding = runtimeBindingRecord(record.name, decision.declaration);
  if (binding.fingerprint === record.fingerprint && binding.kind === record.kind && binding.source === record.source) {
    return { ...record, runtime: true };
  }
  return {
    ...record,
    runtime: true,
    runtimeBinding: {
      fingerprint: binding.fingerprint,
      kind: binding.kind,
      source: binding.source,
    },
  };
}

function runtimeBindingRecord(name: string, declaration: ts.Declaration | ts.SourceFile): ExportRecord {
  if (ts.isSourceFile(declaration)) return makeRecord(name, 'namespace', declaration, declaration);
  let node: ts.Node = declaration;
  if (ts.isVariableDeclaration(declaration)) {
    const statement = declaration.parent.parent;
    if (ts.isVariableStatement(statement)) node = statement;
  }
  return makeRecord(name, declarationKind(node), node, declaration.getSourceFile());
}

function readJson(file: string): Record<string, unknown> {
  return JSON.parse(readFileSync(file, 'utf8')) as Record<string, unknown>;
}

function readPackageExportDescriptors(descriptor: PackageDescriptor): PackageExportDescriptor[] {
  const packageJson = readJson(path.join(descriptor.directory, 'package.json'));
  const manifestExports = packageJson.exports;
  if (!manifestExports || typeof manifestExports !== 'object' || Array.isArray(manifestExports)) {
    throw new Error(`Package manifest has no export map: ${descriptor.name}`);
  }
  const descriptors = Object.entries(manifestExports).map(([entry, rawConditions]) => {
    if (entry !== '.' && !/^\.\/[A-Za-z0-9][A-Za-z0-9._/-]*$/u.test(entry)) {
      throw new Error(`Unsupported package export lane '${entry}' in ${descriptor.name}`);
    }
    if (!rawConditions || typeof rawConditions !== 'object' || Array.isArray(rawConditions)) {
      throw new Error(`Package export lane ${descriptor.name}${entry.slice(1)} has no condition map`);
    }
    const conditionEntries = Object.entries(rawConditions);
    const typesTarget = rawConditions.types;
    const defaultTarget = rawConditions.default;
    if (typeof typesTarget !== 'string' || typeof defaultTarget !== 'string') {
      throw new Error(`Package export lane ${descriptor.name}${entry.slice(1)} needs types and default targets`);
    }
    const conditions = conditionEntries
      .map(([condition, target]) => {
        if (typeof target !== 'string') {
          throw new Error(
            `Package export condition ${descriptor.name}${entry.slice(1)} [${condition}] is not a string target`,
          );
        }
        return {
          condition,
          source: path.relative(process.cwd(), sourceForExportTarget(descriptor, entry, condition, target)),
          target,
        } satisfies PackageExportCondition;
      })
      .sort((left, right) => left.condition.localeCompare(right.condition));
    const source = sourceForExportTarget(descriptor, entry, 'types', typesTarget);
    return {
      conditions,
      entry,
      source,
      specifier: entry === '.' ? descriptor.name : `${descriptor.name}${entry.slice(1)}`,
    } satisfies PackageExportDescriptor;
  });
  if (!descriptors.some((entry) => entry.entry === '.')) {
    throw new Error(`Package manifest has no root export lane: ${descriptor.name}`);
  }
  return descriptors.sort((left, right) => left.entry.localeCompare(right.entry));
}

function readSdkExposures(
  sdk: PackageDescriptor | undefined,
  inventoryByName: ReadonlyMap<string, PackageInventory>,
  parsedSources: Map<string, ParsedSource>,
  exportDescriptors: ReadonlyMap<string, PackageExportDescriptor[]>,
): Map<string, SdkExposure[]> {
  if (!sdk) throw new Error('Expected @flighthq/sdk package while deriving SDK exposure');
  const exposures = new Map<string, SdkExposure[]>();
  for (const sdkLane of exportDescriptors.get(sdk.name) ?? []) {
    const parsed = parseSource(sdkLane.source, parsedSources);
    for (const declaration of parsed.exportDeclarations) {
      if (!declaration.moduleSpecifier || !ts.isStringLiteral(declaration.moduleSpecifier)) continue;
      const target = declaration.moduleSpecifier.text;
      if (!target.startsWith('@flighthq/')) {
        throw new Error(`SDK export lane ${sdkLane.specifier} has unsupported external target: ${target}`);
      }
      resolvePackageExportLane(inventoryByName, target);
      const targetPackage = /^(@flighthq\/[^/]+)/u.exec(target)?.[1];
      if (!targetPackage) throw new Error(`Cannot identify SDK target package: ${target}`);
      const packageExposures = exposures.get(targetPackage) ?? [];
      packageExposures.push({ sdkLane: sdkLane.specifier, target });
      exposures.set(targetPackage, packageExposures);
    }
  }
  for (const [packageName, packageExposures] of exposures) {
    const unique = new Map(packageExposures.map((exposure) => [`${exposure.sdkLane}\0${exposure.target}`, exposure]));
    exposures.set(
      packageName,
      [...unique.values()].sort(
        (left, right) => left.sdkLane.localeCompare(right.sdkLane) || left.target.localeCompare(right.target),
      ),
    );
  }
  return exposures;
}

function sourceForExportTarget(
  descriptor: PackageDescriptor,
  entry: string,
  condition: string,
  target: string,
): string {
  const match = /^\.\/dist\/(?<stem>.+?)\.(?:d\.ts|[cm]?js)$/u.exec(target);
  const stem = match?.groups?.stem;
  if (!stem || stem.split('/').some((segment) => segment === '.' || segment === '..' || segment === '')) {
    throw new Error(
      `Package export condition ${descriptor.name}${entry.slice(1)} [${condition}] has an unaccounted target: ${target}`,
    );
  }
  const sourceBase = path.join(descriptor.directory, 'src', ...stem.split('/'));
  for (const source of [`${sourceBase}.ts`, `${sourceBase}.tsx`]) {
    if (existsSync(source) && statSync(source).isFile()) return source;
  }
  throw new Error(
    `Package export condition ${descriptor.name}${entry.slice(1)} [${condition}] has no source barrel for ${target}`,
  );
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
