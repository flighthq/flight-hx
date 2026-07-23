import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import patches from '../../patches/manifest.ts';
import { portConfig } from '../../port.config.ts';
import {
  analyzeUpstream,
  packageNameToHaxePackage,
  packageNameToModule,
  sourcePathToHaxePackage,
  sourcePathToImplementationModule,
  sourcePathToModule,
} from '../analyze/inventory.ts';
import { lowerTypeScriptSource } from '../lower/typescript.ts';
import type {
  IrDeclaration,
  IrExpression,
  IrModule,
  IrStatement,
  IrType,
  IrTypeField,
  LoweringDiagnostic,
} from '../model/ir.ts';
import { applySemanticPatches } from '../patch/apply.ts';
import { emitHaxeModule, setShadowedTypeNames } from './haxe.ts';
import { stableJson, writeOrCheck } from './reports.ts';

export interface CoreGenerationReport {
  modules: Array<{
    declarations: number;
    diagnostics: LoweringDiagnostic[];
    module: string;
  }>;
  schemaVersion: 1;
}

interface LoweredSource {
  declarations: IrDeclaration[];
  diagnostics: LoweringDiagnostic[];
  file: string;
}

interface LoweredPackageEntry {
  directoryName: string;
  lowered: ReturnType<typeof lowerPackage>;
  moduleName: string;
  packageName: string;
}

export function generateCoreModules(workspaceDirectory: string, check: boolean): CoreGenerationReport {
  const inventory = analyzeUpstream(workspaceDirectory);
  const inventoryByName = new Map(inventory.packages.map((item) => [item.name, item]));
  const packagesDirectory = path.join(workspaceDirectory, 'upstream', 'packages');
  const loweredPackages = readdirSync(packagesDirectory, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => {
      const packageName = `@flighthq/${entry.name}`;
      const publicSourceNames = new Set(
        (inventoryByName.get(packageName)?.exports ?? []).map((record) => path.basename(record.source)),
      );
      return {
        directoryName: entry.name,
        lowered: lowerPackage(workspaceDirectory, entry.name, packageName, publicSourceNames),
        moduleName: packageNameToModule(packageName),
        packageName,
      };
    })
    .sort((a, b) => a.packageName.localeCompare(b.packageName));
  const types = loweredPackages.find((item) => item.packageName === '@flighthq/types');
  if (!types) throw new Error('Expected @flighthq/types');
  const canonicalTypeNames = new Set(
    types.lowered.declarations
      .filter(
        (declaration) => declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type',
      )
      .map((declaration) => declaration.name),
  );
  const canonicalValueAliases = new Map<string, string>();
  for (const declaration of types.lowered.declarations) {
    if (
      declaration.exported &&
      declaration.kind === 'variable' &&
      !declaration.name.endsWith('RuntimeKey') &&
      !declaration.name.endsWith('TraitsKey')
    ) {
      canonicalValueAliases.set(
        declaration.name,
        canonicalTypeNames.has(declaration.name) ? `${declaration.name}Value` : declaration.name,
      );
    }
  }
  rewriteCanonicalValueReferences(types.lowered.declarations, canonicalValueAliases, false);
  for (const declaration of types.lowered.declarations) {
    if (declaration.kind === 'variable') {
      declaration.name = canonicalValueAliases.get(declaration.name) ?? declaration.name;
    }
  }
  fillGenericArguments(loweredPackages.flatMap((item) => item.lowered.declarations));
  flattenStructuralTypes(types.lowered.declarations);
  for (const item of loweredPackages) inlineDefaultConstants(item.lowered.declarations);
  const declarationsBeforePatches = loweredPackages.flatMap((item) => item.lowered.declarations);
  const patchAudit = applySemanticPatches(declarationsBeforePatches, patches, workspaceDirectory);
  const retainedDeclarations = new Set(declarationsBeforePatches);
  for (const item of loweredPackages) {
    item.lowered.declarations = item.lowered.declarations.filter((declaration) =>
      retainedDeclarations.has(declaration),
    );
    for (const source of item.lowered.sources) {
      source.declarations = source.declarations.filter((declaration) => retainedDeclarations.has(declaration));
    }
  }
  const modules = loweredPackages.flatMap((item) =>
    item.lowered.sources.flatMap((source) => buildSourceModules(item.packageName, source, workspaceDirectory)),
  );
  for (const item of loweredPackages) {
    const haxePackage = packageNameToHaxePackage(item.packageName);
    const existing = modules.find((module) => module.haxePackage === haxePackage && module.name === item.moduleName);
    if (!existing) {
      modules.push({
        declarations: [],
        haxePackage,
        imports: [],
        name: item.moduleName,
        packageName: item.packageName,
      });
    }
  }
  const shadowedTypeNames = markShadowedSecondaryTypes(modules);
  populateSourceImports(
    modules,
    loweredPackages,
    inventoryByName,
    canonicalValueAliases,
    workspaceDirectory,
    shadowedTypeNames,
  );
  buildPublicFacades(modules, inventoryByName, canonicalValueAliases, shadowedTypeNames);
  // Facades exist now, so their namespace class names are known: fold in generic data types
  // shadowed by a like-named namespace/facade class, then drop any import that binds a shadowed
  // name (references to them are emitted as `Dynamic`).
  addGenericShadowCollisions(modules, shadowedTypeNames);
  for (const module of modules) {
    module.imports = module.imports.filter((imported) => !importBindsShadowedName(imported, shadowedTypeNames));
  }
  setShadowedTypeNames(shadowedTypeNames);
  validateHaxeModuleIdentities(modules);
  const maintainedDirectory = path.join(workspaceDirectory, 'src');
  const conflicts = modules.map(moduleRelativePath).filter((file) => existsSync(path.join(maintainedDirectory, file)));
  if (conflicts.length > 0) {
    throw new Error(`Maintained and generated Haxe modules overlap: ${conflicts.join(', ')}`);
  }
  const generatedDirectory = path.join(workspaceDirectory, portConfig.generatedDirectory);
  mkdirSync(generatedDirectory, { recursive: true });
  removeStaleGeneratedModules(generatedDirectory, new Set(modules.map(moduleRelativePath)), check);
  for (const module of modules) {
    const output = path.join(generatedDirectory, moduleRelativePath(module));
    mkdirSync(path.dirname(output), { recursive: true });
    writeOrCheck(output, emitHaxeModule(module), check);
  }
  mkdirSync(path.join(workspaceDirectory, 'tests', 'bridges'), { recursive: true });
  for (const item of loweredPackages) {
    const packageInventory = inventoryByName.get(item.packageName);
    const facade = modules.find(
      (module) =>
        module.haxePackage === packageNameToHaxePackage(item.packageName) &&
        module.name === packageNameToModule(item.packageName),
    );
    if (!facade) throw new Error(`Expected generated facade for ${item.packageName}`);
    const externalExports = (packageInventory?.exports ?? []).flatMap((record) => {
      const sourcePackage = /^upstream\/packages\/([^/]+)\//u.exec(record.source)?.[1];
      if (!sourcePackage || sourcePackage === item.directoryName) return [];
      if (
        (record.kind === 'interface' || record.kind === 'type') &&
        !(sourcePackage === 'types' && canonicalValueAliases.has(record.name))
      )
        return [];
      const originInventory = inventoryByName.get(`@flighthq/${sourcePackage}`);
      const originName =
        originInventory?.exports.find(
          (candidate) => candidate.fingerprint === record.fingerprint && candidate.source === record.source,
        )?.name ?? record.name;
      return [{ originDirectory: sourcePackage, originName, publicName: record.name }];
    });
    writeOrCheck(
      path.join(workspaceDirectory, 'tests', 'bridges', `${item.directoryName}.mjs`),
      emitJavaScriptBridge(
        modulePath(facade),
        item.lowered.declarations,
        packageInventory?.exports ?? [],
        modules,
        item.packageName === '@flighthq/types' ? canonicalValueAliases : undefined,
        externalExports,
      ),
      check,
    );
  }
  const sourceBridgesDirectory = path.join(workspaceDirectory, 'tests', 'bridges', 'sources');
  if (!check) rmSync(sourceBridgesDirectory, { force: true, recursive: true });
  for (const item of loweredPackages) {
    const packageSourceBridgesDirectory = path.join(sourceBridgesDirectory, item.directoryName);
    mkdirSync(packageSourceBridgesDirectory, { recursive: true });
    for (const file of item.lowered.files) {
      const sourceName = path.basename(file).replace(/\.tsx?$/u, '');
      writeOrCheck(
        path.join(packageSourceBridgesDirectory, `${sourceName}.mjs`),
        emitJavaScriptSourceBridge(
          workspaceDirectory,
          modules,
          item.packageName,
          item.lowered.declarations,
          file,
          canonicalValueAliases,
        ),
        check,
      );
    }
  }
  const report: CoreGenerationReport = {
    modules: modules
      .map((module) => ({
        declarations: module.declarations.length,
        diagnostics: module.source
          ? (loweredPackages
              .find((item) => item.packageName === module.packageName)
              ?.lowered.sources.find(
                (source) => path.relative(workspaceDirectory, source.file).split(path.sep).join('/') === module.source,
              )?.diagnostics ?? [])
          : [],
        module: modulePath(module),
      }))
      .sort((left, right) => left.module.localeCompare(right.module)),
    schemaVersion: 1,
  };
  writeOrCheck(path.join(workspaceDirectory, 'reports', 'core.json'), stableJson(report), check);
  writeOrCheck(path.join(workspaceDirectory, 'reports', 'patches.json'), stableJson(patchAudit), check);
  return report;
}

function buildSourceModules(packageName: string, source: LoweredSource, workspaceDirectory: string): IrModule[] {
  const relativeSource = path.relative(workspaceDirectory, source.file).split(path.sep).join('/');
  const haxePackage = sourcePathToHaxePackage(packageName, relativeSource);
  const name = sourcePathToImplementationModule(relativeSource);
  const typeDeclarations = source.declarations.filter(
    (declaration) => declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type',
  );
  const valueDeclarations = source.declarations.filter(
    (declaration) => declaration.kind === 'function' || declaration.kind === 'variable',
  );
  const mainType = typeDeclarations.some((declaration) => declaration.name === name);
  if (!mainType || valueDeclarations.length === 0) {
    return [{ declarations: source.declarations, haxePackage, imports: [], name, packageName, source: relativeSource }];
  }
  if (!sourcePathToModule(relativeSource)) {
    throw new Error(`Hidden implementation module has a conflicting main type: ${relativeSource}`);
  }
  return [
    { declarations: typeDeclarations, haxePackage, imports: [], name, packageName, source: relativeSource },
    {
      declarations: valueDeclarations,
      haxePackage: `${packageNameToHaxePackage(packageName)}._internal`,
      imports: [],
      name: `_${name}Values`,
      packageName,
      source: relativeSource,
    },
  ];
}

function populateSourceImports(
  modules: IrModule[],
  loweredPackages: LoweredPackageEntry[],
  inventoryByName: ReadonlyMap<string, ReturnType<typeof analyzeUpstream>['packages'][number]>,
  canonicalValueAliases: ReadonlyMap<string, string>,
  workspaceDirectory: string,
  shadowedTypeNames: ReadonlySet<string>,
): void {
  const modulesBySource = new Map<string, IrModule[]>();
  for (const module of modules) {
    if (!module.source) continue;
    const owners = modulesBySource.get(module.source) ?? [];
    owners.push(module);
    modulesBySource.set(module.source, owners);
  }
  const resolveRecord = (record: { fingerprint: string; source: string }) => {
    for (const module of modulesBySource.get(record.source) ?? []) {
      const declaration = module.declarations.find(
        (candidate) => candidate.origin.fingerprint === record.fingerprint && candidate.origin.source === record.source,
      );
      if (declaration) return { declaration, module };
    }
    throw new Error(`Cannot resolve Haxe owner for ${record.source}`);
  };
  const resolvePackageImport = (packageName: string, importedName: string) => {
    const record = inventoryByName.get(packageName)?.exports.find((candidate) => candidate.name === importedName);
    if (!record) throw new Error(`Cannot resolve imported export ${packageName}.${importedName}`);
    return resolveRecord(record);
  };
  const resolveRelativeImport = (file: string, packageName: string, specifier: string, importedName: string) => {
    const unresolved = path.resolve(path.dirname(file), specifier.replace(/\.m?js$/u, ''));
    const candidates = [unresolved, `${unresolved}.ts`, `${unresolved}.tsx`, path.join(unresolved, 'index.ts')];
    const target = candidates.find((candidate) => existsSync(candidate));
    if (!target)
      throw new Error(`Cannot resolve source import ${specifier} from ${path.relative(workspaceDirectory, file)}`);
    if (path.basename(target) === 'index.ts') return resolvePackageImport(packageName, importedName);
    const relativeTarget = path.relative(workspaceDirectory, target).split(path.sep).join('/');
    const generatedName = canonicalValueAliases.get(importedName) ?? importedName;
    for (const module of modulesBySource.get(relativeTarget) ?? []) {
      const declaration = module.declarations.find(
        (candidate) => candidate.name === generatedName || candidate.name === importedName,
      );
      if (declaration) return { declaration, module };
    }
    const reexport = inventoryByName
      .get(packageName)
      ?.exports.find((candidate) => candidate.name === importedName && candidate.source !== relativeTarget);
    if (reexport) return resolveRecord(reexport);
    throw new Error(`Cannot resolve imported declaration ${importedName} from ${relativeTarget}`);
  };
  // Names that Haxe already makes visible in each package without an import: every
  // module's own top-level type. Importing a secondary type by a bare name that
  // collides with one of these (the owner's own type, or a sibling module in the
  // same package) is rejected by Haxe as a redefinition — and is redundant, since
  // the same-package type is auto-imported and shadows it. Such imports are dropped.
  const moduleNamesByPackage = new Map<string, Set<string>>();
  for (const module of modules) {
    const pkg = module.haxePackage ?? 'flighthq';
    const names = moduleNamesByPackage.get(pkg) ?? new Set<string>();
    names.add(module.name);
    moduleNamesByPackage.set(pkg, names);
  }
  for (const item of loweredPackages) {
    for (const loweredSource of item.lowered.sources) {
      const relativeSource = path.relative(workspaceDirectory, loweredSource.file).split(path.sep).join('/');
      const owners = modulesBySource.get(relativeSource) ?? [];
      const source = ts.createSourceFile(
        loweredSource.file,
        readFileSync(loweredSource.file, 'utf8'),
        ts.ScriptTarget.Latest,
        true,
        ts.ScriptKind.TS,
      );
      for (const statement of source.statements) {
        if (!ts.isImportDeclaration(statement) || !ts.isStringLiteral(statement.moduleSpecifier)) continue;
        const bindings = statement.importClause?.namedBindings;
        if (!bindings || !ts.isNamedImports(bindings)) continue;
        for (const element of bindings.elements) {
          const importedName = element.propertyName?.text ?? element.name.text;
          const resolved = statement.moduleSpecifier.text.startsWith('.')
            ? resolveRelativeImport(loweredSource.file, item.packageName, statement.moduleSpecifier.text, importedName)
            : statement.moduleSpecifier.text.startsWith('@flighthq/')
              ? resolvePackageImport(statement.moduleSpecifier.text, importedName)
              : undefined;
          if (!resolved) continue;
          // Shadowed types (package-private secondaries, or generic types shadowed by a
          // namespace class) are emitted as `Dynamic` and must not be imported by name.
          if (isPackagePrivateDeclaration(resolved.declaration) || shadowedTypeNames.has(resolved.declaration.name)) continue;
          const alias = element.name.text === resolved.declaration.name ? '' : ` as ${element.name.text}`;
          const importPath = `${declarationImportPath(resolved.module, resolved.declaration)}${alias}`;
          const bindingName = element.name.text;
          const importedPackage = resolved.module.haxePackage ?? 'flighthq';
          for (const owner of owners) {
            if (owner === resolved.module) continue;
            // Drop a same-package import whose bound name collides with a top-level
            // module in that package (the owner itself or a sibling): Haxe rejects it
            // as a redefinition, and the colliding same-package type is already visible.
            const ownerPackage = owner.haxePackage ?? 'flighthq';
            if (ownerPackage === importedPackage && moduleNamesByPackage.get(ownerPackage)?.has(bindingName)) continue;
            owner.imports.push(importPath);
          }
        }
      }
    }
  }
  for (const module of modules) module.imports = [...new Set(module.imports)].sort();
}

function modulePath(module: IrModule): string {
  return `${module.haxePackage ?? 'flighthq'}.${module.name}`;
}

function declarationImportPath(module: IrModule, declaration: IrDeclaration): string {
  const isMainType =
    declaration.name === module.name &&
    (declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type');
  return isMainType ? modulePath(module) : `${modulePath(module)}.${declaration.name}`;
}

function moduleRelativePath(module: IrModule): string {
  return `${(module.haxePackage ?? 'flighthq').split('.').join(path.sep)}${path.sep}${module.name}.hx`;
}

/**
 * A `create<Type>` namespace module and a like-named secondary type declared in a sibling
 * module of the same package both claim the package-level Haxe identity `pkg.Name`. Haxe
 * rejects the duplicate whenever both load (e.g. `import pkg.SiblingModule` surfaces the
 * secondary type by its bare name). The namespace module owns the identity; the secondary
 * type is marked `private` so it no longer pollutes the package namespace, and references to
 * the bare name shadow-resolve to the module (all such values flow through `Dynamic`).
 */
function markShadowedSecondaryTypes(modules: IrModule[]): Set<string> {
  const moduleIdentities = new Set(modules.map((module) => modulePath(module)));
  const shadowedTypeNames = new Set<string>();
  // (a) A secondary type colliding with a same-package module: make it private and shadow-route.
  for (const module of modules) {
    const pkg = module.haxePackage ?? 'flighthq';
    for (const declaration of module.declarations) {
      if (declaration.kind !== 'type' && declaration.kind !== 'class' && declaration.kind !== 'enum') continue;
      if (declaration.name === module.name) continue;
      if (moduleIdentities.has(`${pkg}.${declaration.name}`)) {
        declaration.packagePrivate = true;
        shadowedTypeNames.add(declaration.name);
      }
    }
  }
  return shadowedTypeNames;
}

/**
 * Fold in generic data types whose name is also a non-generic namespace/facade class (the
 * `create<Type>` API named after its module). The class shadows the type but cannot accept its
 * type parameters ("too many type parameters"), so such references are emitted as `Dynamic` —
 * every value of these types already flows through `Dynamic` in generated code. Runs after
 * `buildPublicFacades` so facade class names are included among the namespace names.
 */
function addGenericShadowCollisions(modules: IrModule[], shadowedTypeNames: Set<string>): void {
  const genericTypeNames = new Set<string>();
  const namespaceModuleNames = new Set<string>();
  for (const module of modules) {
    if (module.declarations.some((declaration) => declaration.kind === 'function' || declaration.kind === 'variable')) {
      namespaceModuleNames.add(module.name);
    }
    for (const declaration of module.declarations) {
      if ((declaration.kind === 'type' || declaration.kind === 'class') && declaration.typeParameters.length > 0) {
        genericTypeNames.add(declaration.name);
      }
    }
  }
  for (const name of genericTypeNames) if (namespaceModuleNames.has(name)) shadowedTypeNames.add(name);
}

/** The Haxe name an import statement binds into scope: the alias, or the trailing path segment. */
function importBindsShadowedName(imported: string, shadowedTypeNames: ReadonlySet<string>): boolean {
  const aliasMatch = / as (\w+)$/u.exec(imported);
  const bound = aliasMatch?.[1] ?? imported.split('.').pop() ?? imported;
  return shadowedTypeNames.has(bound);
}

/** Whether a declaration was marked package-private (only type/class/enum declarations can be). */
function isPackagePrivateDeclaration(declaration: IrDeclaration): boolean {
  return (
    (declaration.kind === 'type' || declaration.kind === 'class' || declaration.kind === 'enum') &&
    declaration.packagePrivate === true
  );
}

export function validateHaxeModuleIdentities(modules: IrModule[]): void {
  const ownersByIdentity = new Map<string, string[]>();
  const ownersByModulePath = new Map<string, string[]>();
  const addOwner = (identity: string, owner: string): void => {
    const owners = ownersByIdentity.get(identity) ?? [];
    owners.push(owner);
    ownersByIdentity.set(identity, owners);
  };
  for (const module of modules) {
    const moduleIdentity = modulePath(module);
    const moduleOwners = ownersByModulePath.get(moduleIdentity) ?? [];
    moduleOwners.push(module.source ?? `${module.packageName} barrel`);
    ownersByModulePath.set(moduleIdentity, moduleOwners);
    if (!/^_*[A-Z][A-Za-z0-9_]*$/u.test(module.name)) {
      throw new Error(`Invalid Haxe module name ${module.name} from ${module.source ?? module.packageName}`);
    }
    if (module.declarations.some((declaration) => declaration.kind === 'function' || declaration.kind === 'variable')) {
      addOwner(moduleIdentity, `${module.source ?? `${module.packageName} barrel`} namespace`);
    }
    for (const declaration of module.declarations) {
      if (declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type') {
        // Package-private shadowed secondaries do not occupy the package namespace.
        if (declaration.packagePrivate) continue;
        addOwner(
          `${module.haxePackage ?? 'flighthq'}.${declaration.name}`,
          `${module.source ?? `${module.packageName} barrel`} declaration ${declaration.name}`,
        );
      }
    }
  }
  const collisions = [...ownersByIdentity]
    .filter(([, owners]) => owners.length > 1)
    .sort(([left], [right]) => left.localeCompare(right));
  const moduleCollisions = [...ownersByModulePath]
    .filter(([, owners]) => owners.length > 1)
    .sort(([left], [right]) => left.localeCompare(right));
  // A collision whose identity is also a real module path is handled mechanically:
  // that module (a `create<Type>` namespace) owns the Haxe type name, and a like-named
  // secondary type declared elsewhere in the same package resolves to it. The same-package
  // import of the secondary type is dropped during emission (see `populateSourceImports`),
  // so references shadow-resolve to the owning module rather than triggering a redefinition.
  const moduleIdentities = new Set(ownersByModulePath.keys());
  const handledCollisions = collisions.filter(([identity]) => moduleIdentities.has(identity));
  const unresolvedCollisions = collisions.filter(([identity]) => !moduleIdentities.has(identity));
  if (handledCollisions.length > 0) {
    process.stderr.write(
      `Note: ${handledCollisions.length} Haxe module/secondary-type name collision(s) resolved by same-package import elision:\n${handledCollisions
        .map(([identity, owners]) => `- ${identity}: ${owners.join('; ')}`)
        .join('\n')}\n`,
    );
  }
  if (unresolvedCollisions.length === 0 && moduleCollisions.length === 0) return;
  throw new Error(
    `Haxe module/type identity collisions require upstream source reorganization:\n${[
      ...moduleCollisions.map(([identity, owners]) => `- duplicate module ${identity}: ${owners.join('; ')}`),
      ...unresolvedCollisions.map(([identity, owners]) => `- ${identity}: ${owners.join('; ')}`),
    ].join('\n')}`,
  );
}

/** Haxe classes cannot re-export another class's static fields. */
function buildPublicFacades(
  modules: IrModule[],
  inventoryByName: ReadonlyMap<string, ReturnType<typeof analyzeUpstream>['packages'][number]>,
  _canonicalValueAliases: ReadonlyMap<string, string>,
  shadowedTypeNames: ReadonlySet<string>,
): void {
  const facadeForPackage = (packageName: string): IrModule | undefined => {
    const haxePackage = packageNameToHaxePackage(packageName);
    const name = packageNameToModule(packageName);
    return modules.find((module) => module.haxePackage === haxePackage && module.name === name);
  };
  const sdk = facadeForPackage('@flighthq/sdk');
  const sdkInventory = inventoryByName.get('@flighthq/sdk');
  if (!sdk || !sdkInventory) throw new Error('Expected @flighthq/sdk module and inventory');
  const typeOwnerByName = new Map<string, IrModule>();
  for (const module of modules) {
    for (const declaration of module.declarations) {
      if (declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type') {
        typeOwnerByName.set(declaration.name, module);
      }
    }
  }

  const resolveDeclaration = (
    record: (typeof sdkInventory.exports)[number],
  ): { declaration: IrDeclaration; module: IrModule } | undefined => {
    for (const module of modules) {
      const declaration = module.declarations.find(
        (candidate) => candidate.origin.fingerprint === record.fingerprint && candidate.origin.source === record.source,
      );
      if (declaration) return { declaration, module };
    }
    return undefined;
  };
  const resolveDirectDeclaration = (record: (typeof sdkInventory.exports)[number]) => {
    const resolved = resolveDeclaration(record);
    return resolved && (resolved.declaration.kind === 'function' || resolved.declaration.kind === 'variable')
      ? {
          declaration: resolved.declaration as Extract<IrDeclaration, { kind: 'function' | 'variable' }>,
          module: resolved.module,
        }
      : undefined;
  };

  const addFacade = (
    target: IrModule,
    publicName: string,
    originModule: IrModule,
    origin: Extract<IrDeclaration, { kind: 'function' | 'variable' }>,
  ): void => {
    if (target === originModule && origin.name === publicName) return;
    const ownerToken = modulePath(originModule).replace(/[^A-Za-z0-9]/gu, '_');
    const ownerAlias = `Facade_${target.name}_${ownerToken}`;
    const alias = `${ownerAlias}.${origin.name}`;
    target.imports.push(`${modulePath(originModule)} as ${ownerAlias}`);
    if (origin.kind === 'variable') {
      target.declarations.push({
        ...origin,
        exported: true,
        initializer: { kind: 'identifier', name: alias },
        mutable: false,
        name: publicName,
      });
      return;
    }
    const call: IrExpression = {
      arguments: origin.parameters.map((parameter) =>
        parameter.rest
          ? { expression: { kind: 'identifier', name: parameter.name }, kind: 'spread' }
          : { kind: 'identifier', name: parameter.name },
      ),
      callee: { kind: 'identifier', name: alias },
      kind: 'call',
      typeArguments: [],
    };
    target.declarations.push({
      ...origin,
      async: false,
      body: [
        origin.returns.kind === 'primitive' && origin.returns.name === 'Void'
          ? { expression: call, kind: 'expression' }
          : { expression: call, kind: 'return' },
      ],
      exported: true,
      haxeBody: undefined,
      name: publicName,
      parameters: origin.parameters.map((parameter) => ({
        ...parameter,
        initializer: undefined,
        optional: parameter.optional || parameter.initializer !== undefined,
      })),
    });
  };

  const addEnumFacade = (
    target: IrModule,
    publicName: string,
    originModule: IrModule,
    origin: Extract<IrDeclaration, { kind: 'enum' }>,
  ): void => {
    if (target.declarations.some((declaration) => declaration.name === `__enum_${publicName}`)) return;
    const ownerAlias = `Facade_${target.name}_${modulePath(originModule).replace(/[^A-Za-z0-9]/gu, '_')}_${origin.name}`;
    target.imports.push(`${declarationImportPath(originModule, origin)} as ${ownerAlias}`);
    target.declarations.push({
      exported: false,
      initializer: {
        kind: 'object',
        properties: origin.members.map((member) => ({
          kind: 'property',
          name: member.name,
          value: { kind: 'identifier', name: `${ownerAlias}.${member.name}` },
        })),
      },
      kind: 'variable',
      mutable: false,
      name: `__enum_${publicName}`,
      origin: origin.origin,
      type: { kind: 'dynamic' },
    });
  };

  // Match granular package barrels before building the broad SDK facade.
  for (const packageInventory of inventoryByName.values()) {
    if (packageInventory.name === '@flighthq/sdk') continue;
    const target = facadeForPackage(packageInventory.name);
    if (!target) throw new Error(`Expected facade module for ${packageInventory.name}`);
    for (const record of packageInventory.exports) {
      if (!sourcePathToModule(record.source)) continue;
      const resolvedDeclaration = resolveDeclaration(record);
      if (resolvedDeclaration?.declaration.kind === 'enum') {
        const resolved = resolvedDeclaration as {
          declaration: Extract<IrDeclaration, { kind: 'enum' }>;
          module: IrModule;
        };
        addEnumFacade(target, record.name, resolved.module, resolved.declaration);
        continue;
      }
      if (record.kind !== 'function' && record.kind !== 'variable') continue;
      const resolved = resolveDirectDeclaration(record);
      if (!resolved) {
        throw new Error(`Cannot resolve package facade export ${target.packageName}.${record.name}`);
      }
      addFacade(target, record.name, resolved.module, resolved.declaration);
    }
    target.imports = [...new Set(target.imports)].sort();
    target.declarations.sort((left, right) => left.name.localeCompare(right.name));
  }

  // Mirror the SDK from public package names, retaining renamed re-exports.
  sdk.declarations = [];
  sdk.imports = [];
  for (const record of sdkInventory.exports) {
    if (!sourcePathToModule(record.source)) continue;
    const resolvedDeclaration = resolveDeclaration(record);
    if (resolvedDeclaration?.declaration.kind === 'enum') {
      const resolved = resolvedDeclaration as {
        declaration: Extract<IrDeclaration, { kind: 'enum' }>;
        module: IrModule;
      };
      addEnumFacade(sdk, record.name, resolved.module, resolved.declaration);
      continue;
    }
    if (record.kind !== 'function' && record.kind !== 'variable') continue;
    const resolved = resolveDirectDeclaration(record);
    if (!resolved) throw new Error(`Cannot resolve SDK facade export ${record.name} from ${record.source}`);
    addFacade(sdk, record.name, resolved.module, resolved.declaration);
  }
  sdk.declarations.sort((left, right) => left.name.localeCompare(right.name));
  // Names Haxe makes visible in a package without an import (each module's own top-level
  // type). A referenced type whose name matches one of these in the target's own package is
  // already in scope; importing it by that bare name (when it is actually a secondary type
  // declared in a sibling module) is rejected by Haxe as a redefinition, so the import is
  // elided and the reference shadow-resolves to the same-package module.
  const moduleNamesByPackage = new Map<string, Set<string>>();
  for (const module of modules) {
    const pkg = module.haxePackage ?? 'flighthq';
    const names = moduleNamesByPackage.get(pkg) ?? new Set<string>();
    names.add(module.name);
    moduleNamesByPackage.set(pkg, names);
  }
  for (const target of modules) {
    const referencedTypes = new Set<string>();
    collectReferencedNamedTypes(target.declarations, new Set(typeOwnerByName.keys()), referencedTypes);
    const targetPackage = target.haxePackage ?? 'flighthq';
    for (const typeName of referencedTypes) {
      const owner = typeOwnerByName.get(typeName);
      const declaration = owner?.declarations.find(
        (candidate) =>
          candidate.name === typeName &&
          (candidate.kind === 'class' || candidate.kind === 'enum' || candidate.kind === 'type'),
      );
      if (!owner || owner === target || !declaration) continue;
      // Shadowed types (package-private secondaries, or generic types shadowed by a namespace
      // class) are emitted as `Dynamic` and must not be imported by name.
      if (isPackagePrivateDeclaration(declaration) || shadowedTypeNames.has(typeName)) continue;
      const ownerPackage = owner.haxePackage ?? 'flighthq';
      if (ownerPackage === targetPackage && moduleNamesByPackage.get(targetPackage)?.has(typeName)) continue;
      target.imports.push(declarationImportPath(owner, declaration));
    }
    target.imports = [...new Set(target.imports)].sort();
  }
}

function rewriteCanonicalValueReferences(
  value: unknown,
  aliases: ReadonlyMap<string, string>,
  _qualify: boolean,
): void {
  if (Array.isArray(value)) {
    value.forEach((item) => rewriteCanonicalValueReferences(item, aliases, false));
    return;
  }
  if (!value || typeof value !== 'object') return;
  const record = value as Record<string, unknown>;
  if (record.kind === 'identifier' && typeof record.name === 'string') {
    const alias = aliases.get(record.name);
    if (alias) record.name = alias;
  }
  Object.values(record).forEach((item) => rewriteCanonicalValueReferences(item, aliases, false));
}

function collectReferencedNamedTypes(value: unknown, canonicalNames: ReadonlySet<string>, output: Set<string>): void {
  if (Array.isArray(value)) {
    value.forEach((item) => collectReferencedNamedTypes(item, canonicalNames, output));
    return;
  }
  if (!value || typeof value !== 'object') return;
  const record = value as Record<string, unknown>;
  if (record.kind === 'named' && typeof record.name === 'string' && canonicalNames.has(record.name)) {
    output.add(record.name);
  }
  Object.values(record).forEach((item) => collectReferencedNamedTypes(item, canonicalNames, output));
}

function removeStaleGeneratedModules(directory: string, expected: ReadonlySet<string>, check: boolean): void {
  const generatedFiles = (current: string): string[] =>
    readdirSync(current, { withFileTypes: true }).flatMap((entry) => {
      const file = path.join(current, entry.name);
      return entry.isDirectory() ? generatedFiles(file) : [path.relative(directory, file)];
    });
  const stale = generatedFiles(directory)
    .filter((file) => file.endsWith('.hx') && !expected.has(file))
    .filter((file) => readFileSync(path.join(directory, file), 'utf8').startsWith('// Generated by flight-hx.'));
  if (stale.length > 0 && check) throw new Error(`Stale generated modules: ${stale.join(', ')}`);
  for (const file of stale) rmSync(path.join(directory, file));
}

function flattenStructuralTypes(declarations: IrDeclaration[]): void {
  const definitions = new Map(
    declarations
      .filter((declaration) => declaration.kind === 'type')
      .map((declaration) => [declaration.name, declaration]),
  );
  const substitute = (type: IrType, substitutions: ReadonlyMap<string, IrType>): IrType => {
    switch (type.kind) {
      case 'anonymous':
        return {
          extends: type.extends.map((item) => substitute(item, substitutions)),
          fields: type.fields.map((field) => ({ ...field, type: substitute(field.type, substitutions) })),
          kind: 'anonymous',
        };
      case 'array':
        return { element: substitute(type.element, substitutions), kind: 'array' };
      case 'function':
        return {
          kind: 'function',
          parameters: type.parameters.map((item) => substitute(item, substitutions)),
          returns: substitute(type.returns, substitutions),
        };
      case 'named': {
        const replacement = type.arguments.length === 0 ? substitutions.get(type.name) : undefined;
        if (replacement?.kind === 'named' && replacement.name === type.name && replacement.arguments.length === 0) {
          return replacement;
        }
        return replacement
          ? substitute(replacement, substitutions)
          : {
              arguments: type.arguments.map((item) => substitute(item, substitutions)),
              kind: 'named',
              name: type.name,
            };
      }
      case 'nullable':
        return { inner: substitute(type.inner, substitutions), kind: 'nullable' };
      case 'dynamic':
      case 'primitive':
        return type;
    }
  };
  const expand = (
    type: IrType,
    substitutions: ReadonlyMap<string, IrType>,
    stack: ReadonlySet<string>,
  ): IrTypeField[] => {
    const resolved = substitute(type, substitutions);
    if (resolved.kind === 'anonymous') {
      return [
        ...resolved.extends.flatMap((parent) => expand(parent, substitutions, stack)),
        ...resolved.fields.map((field) => ({ ...field, type: substitute(field.type, substitutions) })),
      ];
    }
    if (resolved.kind !== 'named' || stack.has(resolved.name)) return [];
    const definition = definitions.get(resolved.name);
    if (!definition || definition.kind !== 'type' || definition.type.kind !== 'anonymous') return [];
    const nestedSubstitutions = new Map(substitutions);
    definition.typeParameters.forEach((name, index) => {
      nestedSubstitutions.set(name, resolved.arguments[index] ?? { kind: 'dynamic' });
    });
    return expand(definition.type, nestedSubstitutions, new Set([...stack, resolved.name]));
  };
  const resolvesToDynamic = (type: IrType, stack: ReadonlySet<string>): boolean => {
    if (type.kind === 'dynamic') return true;
    if (type.kind !== 'named' || stack.has(type.name)) return false;
    const definition = definitions.get(type.name);
    return Boolean(
      definition?.kind === 'type' &&
      (definition.type.kind === 'dynamic' ||
        (definition.type.kind === 'anonymous' &&
          definition.type.fields.length === 0 &&
          definition.type.extends.some((parent) => resolvesToDynamic(parent, new Set([...stack, type.name]))))),
    );
  };
  for (const declaration of declarations) {
    if (declaration.kind !== 'type' || declaration.type.kind !== 'anonymous') continue;
    const fields = expand(declaration.type, new Map(), new Set([declaration.name]));
    if (
      fields.length === 0 &&
      declaration.type.fields.length === 0 &&
      declaration.type.extends.some((parent) => resolvesToDynamic(parent, new Set([declaration.name])))
    ) {
      declaration.type = { kind: 'dynamic' };
      continue;
    }
    const merged = new Map<string, IrTypeField>();
    for (const field of fields) {
      const existing = merged.get(field.name);
      if (!existing || typeSpecificity(field.type) > typeSpecificity(existing.type)) merged.set(field.name, field);
    }
    declaration.type.extends = [];
    declaration.type.fields = [...merged.values()];
  }
}

function typeSpecificity(type: IrType): number {
  switch (type.kind) {
    case 'anonymous':
      return 4 + type.fields.length + type.extends.reduce((total, item) => total + typeSpecificity(item), 0);
    case 'array':
      return 2 + typeSpecificity(type.element);
    case 'function':
      return 3 + type.parameters.length + typeSpecificity(type.returns);
    case 'named':
      return 2 + type.arguments.length * 2;
    case 'nullable':
      return 1 + typeSpecificity(type.inner);
    case 'primitive':
      return 1;
    case 'dynamic':
      return 0;
  }
}

function fillGenericArguments(declarations: IrDeclaration[]): void {
  const arities = new Map<string, number>();
  for (const declaration of declarations) {
    if (declaration.kind === 'type' && declaration.typeParameters.length > 0) {
      arities.set(declaration.name, declaration.typeParameters.length);
    }
  }
  const visit = (type: IrType): void => {
    switch (type.kind) {
      case 'anonymous':
        type.extends.forEach(visit);
        type.fields.forEach((field) => visit(field.type));
        break;
      case 'array':
        visit(type.element);
        break;
      case 'function':
        type.parameters.forEach(visit);
        visit(type.returns);
        break;
      case 'named': {
        type.arguments.forEach(visit);
        const arity = arities.get(type.name) ?? 0;
        while (type.arguments.length < arity) type.arguments.push({ kind: 'dynamic' });
        break;
      }
      case 'nullable':
        visit(type.inner);
        break;
      case 'dynamic':
      case 'primitive':
        break;
    }
  };
  const visitAll = (value: unknown): void => {
    if (Array.isArray(value)) {
      value.forEach(visitAll);
      return;
    }
    if (!value || typeof value !== 'object') return;
    const record = value as Record<string, unknown>;
    if (record.kind === 'named' && typeof record.name === 'string' && Array.isArray(record.arguments)) {
      const arity = arities.get(record.name) ?? 0;
      while (record.arguments.length < arity) record.arguments.push({ kind: 'dynamic' });
    }
    Object.values(record).forEach(visitAll);
  };
  const parameters = (values: Array<{ type: IrType }>): void => values.forEach((item) => visit(item.type));
  for (const declaration of declarations) {
    switch (declaration.kind) {
      case 'class':
        if (declaration.extends) visit(declaration.extends);
        declaration.fields.forEach((field) => visit(field.type));
        parameters(declaration.constructorParameters);
        declaration.methods.forEach((method) => {
          parameters(method.parameters);
          visit(method.returns);
        });
        break;
      case 'enum':
        declaration.methods.forEach((method) => {
          parameters(method.parameters);
          visit(method.returns);
        });
        break;
      case 'function':
        parameters(declaration.parameters);
        visit(declaration.returns);
        break;
      case 'type':
        visit(declaration.type);
        break;
      case 'variable':
        if (declaration.type) visit(declaration.type);
        break;
    }
  }
  visitAll(declarations);
}

function emitJavaScriptBridge(
  apiPath: string,
  declarations: IrDeclaration[],
  publicExports: Array<{ fingerprint: string; source: string }>,
  modules: IrModule[],
  publicAliases?: ReadonlyMap<string, string>,
  externalExports: Array<{ originDirectory: string; originName: string; publicName: string }> = [],
): string {
  const reverseAliases = new Map(
    [...(publicAliases?.entries() ?? [])].map(([publicName, generatedName]) => [generatedName, publicName]),
  );
  const mutableNames = new Set(
    declarations
      .filter((declaration) => declaration.kind === 'variable' && declaration.mutable && declaration.exported)
      .map((declaration) => declaration.name),
  );
  const publicIdentities = new Set(publicExports.map((record) => `${record.source}\0${record.fingerprint}`));
  const exports = declarations
    .filter(
      (declaration) =>
        declaration.exported &&
        declaration.kind !== 'type' &&
        publicIdentities.has(`${declaration.origin.source}\0${declaration.origin.fingerprint}`),
    )
    .map((declaration) => {
      const publicName = reverseAliases.get(declaration.name) ?? declaration.name;
      const owner = modules.find((module) => module.declarations.includes(declaration));
      return {
        kind: declaration.kind,
        mutable: declaration.kind === 'variable' && declaration.mutable,
        publicName,
        runtimeName: sourcePathToModule(declaration.origin.source) ? publicName : declaration.name,
        runtimePath:
          declaration.kind === 'class' && owner
            ? `${owner.haxePackage ?? 'flighthq'}.${declaration.name}`
            : declaration.kind === 'enum' || sourcePathToModule(declaration.origin.source)
              ? apiPath
              : owner
                ? modulePath(owner)
                : apiPath,
        syncMutable: declaration.kind === 'function' && mutatesAnyName(declaration.body, mutableNames),
      };
    })
    .sort((a, b) => a.publicName.localeCompare(b.publicName));
  return [
    '// Generated by flight-hx. Do not edit.',
    "import compiled from '../../build/haxe-js/flight.cjs';",
    '',
    ...(exports.length === 0 ? ['void compiled;'] : []),
    ...exports.map(({ kind, mutable, publicName, runtimeName, runtimePath }) =>
      kind === 'class'
        ? `export const ${publicName} = compiled.${runtimePath};`
        : kind === 'enum'
          ? `export const ${publicName} = compiled.${runtimePath}.__enum_${publicName};`
          : kind === 'variable' && mutable
            ? `export let ${publicName} = compiled.${runtimePath}.${runtimeName};`
            : kind === 'function' && exports.find((item) => item.publicName === publicName)?.syncMutable
              ? `export function ${publicName}(...args) { const result = compiled.${runtimePath}.${runtimeName}(...args); __syncMutableExports(); return result; }`
              : `export const ${publicName} = compiled.${runtimePath}.${runtimeName};`,
    ),
    ...(exports.some((item) => item.mutable)
      ? [
          '',
          'function __syncMutableExports() {',
          ...exports
            .filter((item) => item.mutable)
            .map((item) => `  ${item.publicName} = compiled.${item.runtimePath}.${item.runtimeName};`),
          '}',
        ]
      : []),
    ...externalExports
      .sort((a, b) => a.publicName.localeCompare(b.publicName))
      .map(
        ({ originDirectory, originName, publicName }) =>
          `export { ${originName}${originName === publicName ? '' : ` as ${publicName}`} } from './${originDirectory}.mjs';`,
      ),
    '',
  ].join('\n');
}

function emitJavaScriptSourceBridge(
  workspaceDirectory: string,
  modules: IrModule[],
  packageName: string,
  declarations: IrDeclaration[],
  file: string,
  canonicalValueAliases: ReadonlyMap<string, string>,
): string {
  const source = ts.createSourceFile(file, readFileSync(file, 'utf8'), ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const relativeSource = path.relative(workspaceDirectory, file).split(path.sep).join('/');
  const sourceModules = modules.filter((module) => module.source === relativeSource);
  const mockedSpecifiers = collectAdjacentTestMocks(file);
  const dependencies: Array<{
    generatedName: string;
    importedName: string;
    moduleName: string;
    specifier: string;
  }> = [];
  const dependencySpecifiers = new Map<string, string>();
  const reexports: string[] = [];
  const importedBindings = new Map<string, { importedName: string; specifier: string }>();
  const dependencyAlias = (specifier: string): string => {
    const existing = dependencySpecifiers.get(specifier);
    if (existing) return existing;
    const alias = `__dependency${dependencySpecifiers.size}`;
    dependencySpecifiers.set(specifier, alias);
    return alias;
  };
  for (const statement of source.statements) {
    if (
      !ts.isImportDeclaration(statement) ||
      !ts.isStringLiteral(statement.moduleSpecifier) ||
      !statement.importClause ||
      statement.importClause.isTypeOnly
    )
      continue;
    const sourceSpecifier = statement.moduleSpecifier.text;
    let bridgeSpecifier: string;
    let dependencyModuleName: string | undefined;
    let dependencySource: string | undefined;
    if (sourceSpecifier.startsWith('.')) {
      const target = path.resolve(path.dirname(file), sourceSpecifier.replace(/\.m?js$/u, ''));
      bridgeSpecifier = `./${path.basename(target)}.mjs`;
      const targetFile = [target, `${target}.ts`, `${target}.tsx`, path.join(target, 'index.ts')].find((candidate) =>
        existsSync(candidate),
      );
      dependencySource = targetFile
        ? path.relative(workspaceDirectory, targetFile).split(path.sep).join('/')
        : undefined;
      if (targetFile && path.basename(targetFile) === 'index.ts') {
        dependencyModuleName = `${packageNameToHaxePackage(packageName)}.${packageNameToModule(packageName)}`;
      }
    } else {
      const packageMatch = /^@flighthq\/([^/]+)$/u.exec(sourceSpecifier);
      if (!packageMatch) continue;
      bridgeSpecifier = sourceSpecifier;
      dependencyModuleName = `${packageNameToHaxePackage(sourceSpecifier)}.${packageNameToModule(sourceSpecifier)}`;
    }
    const bindings = statement.importClause.namedBindings;
    if (bindings && ts.isNamedImports(bindings)) {
      for (const element of bindings.elements) {
        if (element.isTypeOnly) continue;
        const importedName = element.propertyName?.text ?? element.name.text;
        importedBindings.set(element.name.text, { importedName, specifier: bridgeSpecifier });
        if (!mockedSpecifiers.has(sourceSpecifier)) continue;
        const alias = dependencyAlias(bridgeSpecifier);
        const generatedName = canonicalValueAliases.get(importedName) ?? importedName;
        const dependencyModule = dependencySource
          ? modules.find(
              (module) =>
                module.source === dependencySource &&
                module.declarations.some(
                  (declaration) => declaration.name === generatedName || declaration.name === importedName,
                ),
            )
          : undefined;
        dependencies.push({
          generatedName: dependencySource ? generatedName : importedName,
          importedName,
          moduleName: dependencyModule ? modulePath(dependencyModule) : dependencyModuleName!,
          specifier: alias,
        });
      }
    }
  }
  for (const statement of source.statements) {
    if (!ts.isExportDeclaration(statement) || !statement.exportClause || !ts.isNamedExports(statement.exportClause))
      continue;
    const sourceSpecifier =
      statement.moduleSpecifier && ts.isStringLiteral(statement.moduleSpecifier)
        ? statement.moduleSpecifier.text
        : undefined;
    const bridgeSpecifier = sourceSpecifier
      ? sourceSpecifier.startsWith('.')
        ? `./${path.basename(sourceSpecifier.replace(/\.m?js$/u, ''))}.mjs`
        : sourceSpecifier
      : undefined;
    for (const element of statement.exportClause.elements) {
      if (element.isTypeOnly) continue;
      const localName = element.propertyName?.text ?? element.name.text;
      const imported = bridgeSpecifier
        ? { importedName: localName, specifier: bridgeSpecifier }
        : importedBindings.get(localName);
      if (!imported) continue;
      const publicName = element.name.text;
      reexports.push(
        `export { ${imported.importedName}${imported.importedName === publicName ? '' : ` as ${publicName}`} } from '${imported.specifier}';`,
      );
    }
  }
  const reverseAliases = new Map(
    [...canonicalValueAliases].map(([publicName, generatedName]) => [generatedName, publicName]),
  );
  const sourceDeclarations = declarations
    .filter(
      (declaration) =>
        declaration.exported && declaration.kind !== 'type' && declaration.origin.source === relativeSource,
    )
    .sort((left, right) => left.name.localeCompare(right.name));
  const mutableNames = new Set(
    sourceDeclarations
      .filter((declaration) => declaration.kind === 'variable' && declaration.mutable)
      .map((declaration) => declaration.name),
  );
  const publicName = (declaration: IrDeclaration): string =>
    packageName === '@flighthq/types' ? (reverseAliases.get(declaration.name) ?? declaration.name) : declaration.name;
  const needsApi = sourceDeclarations.some((declaration) => declaration.kind !== 'class');
  const valueModule = sourceModules.find((module) =>
    module.declarations.some((declaration) => declaration.kind === 'function' || declaration.kind === 'variable'),
  );
  const apiModule =
    valueModule ??
    modules.find(
      (module) =>
        module.haxePackage === packageNameToHaxePackage(packageName) &&
        module.name === packageNameToModule(packageName),
    );
  const needsCompiled =
    needsApi || dependencies.length > 0 || sourceDeclarations.some((declaration) => declaration.kind === 'class');
  return [
    '// Generated by flight-hx. Do not edit.',
    ...(needsCompiled ? ["import compiled from '../../../../build/haxe-js/flight.cjs';"] : []),
    ...[...dependencySpecifiers].map(([specifier, alias]) => `import * as ${alias} from '${specifier}';`),
    '',
    ...(needsApi && apiModule ? [`const api = compiled.${modulePath(apiModule)};`] : []),
    ...(dependencies.length > 0
      ? [
          'function __syncDependencies() {',
          ...dependencies.map(
            (dependency) =>
              `  compiled.${dependency.moduleName}.${dependency.generatedName} = ${dependency.specifier}.${dependency.importedName};`,
          ),
          '}',
        ]
      : ['function __syncDependencies() {}']),
    '__syncDependencies();',
    ...(mutableNames.size > 0
      ? [
          'function __syncMutableExports() {',
          ...sourceDeclarations
            .filter((declaration) => declaration.kind === 'variable' && declaration.mutable)
            .map((declaration) => `  ${publicName(declaration)} = api.${declaration.name};`),
          '}',
        ]
      : []),
    '',
    ...sourceDeclarations.map((declaration) => {
      const exportedName = publicName(declaration);
      if (declaration.kind === 'class') {
        const owner = sourceModules.find((module) => module.declarations.includes(declaration));
        return `export const ${exportedName} = compiled.${owner?.haxePackage ?? 'flighthq'}.${declaration.name};`;
      }
      if (declaration.kind === 'enum') return `export const ${exportedName} = api.__enum_${declaration.name};`;
      if (declaration.kind === 'function') {
        return mutatesAnyName(declaration.body, mutableNames)
          ? `export function ${exportedName}(...args) { const result = api.${declaration.name}(...args); __syncMutableExports(); return result; }`
          : `export const ${exportedName} = api.${declaration.name};`;
      }
      if (declaration.kind === 'variable') {
        return declaration.mutable
          ? `export let ${exportedName} = api.${declaration.name};`
          : `export const ${exportedName} = api.${declaration.name};`;
      }
      throw new Error(`Unexpected source bridge declaration: ${declaration.kind}`);
    }),
    ...reexports.sort(),
    '',
  ].join('\n');
}

function collectAdjacentTestMocks(sourceFile: string): Set<string> {
  const testFile = sourceFile.replace(/\.tsx?$/u, '.test.ts');
  if (!existsSync(testFile)) return new Set();
  const source = ts.createSourceFile(
    testFile,
    readFileSync(testFile, 'utf8'),
    ts.ScriptTarget.Latest,
    true,
    ts.ScriptKind.TS,
  );
  const specifiers = new Set<string>();
  const visit = (node: ts.Node): void => {
    if (
      ts.isCallExpression(node) &&
      ts.isPropertyAccessExpression(node.expression) &&
      ts.isIdentifier(node.expression.expression) &&
      node.expression.expression.text === 'vi' &&
      (node.expression.name.text === 'mock' || node.expression.name.text === 'doMock') &&
      node.arguments[0] &&
      ts.isStringLiteral(node.arguments[0])
    ) {
      specifiers.add(node.arguments[0].text);
    }
    ts.forEachChild(node, visit);
  };
  visit(source);
  return specifiers;
}

function mutatesAnyName(value: unknown, names: ReadonlySet<string>): boolean {
  if (Array.isArray(value)) return value.some((item) => mutatesAnyName(item, names));
  if (!value || typeof value !== 'object') return false;
  const record = value as Record<string, unknown>;
  if (
    record.kind === 'assignment' &&
    record.left &&
    typeof record.left === 'object' &&
    (record.left as { kind?: unknown }).kind === 'identifier' &&
    names.has((record.left as { name: string }).name)
  )
    return true;
  if (
    record.kind === 'unary' &&
    record.operand &&
    typeof record.operand === 'object' &&
    (record.operand as { kind?: unknown }).kind === 'identifier' &&
    names.has((record.operand as { name: string }).name)
  )
    return true;
  return Object.values(record).some((item) => mutatesAnyName(item, names));
}

function inlineDefaultConstants(declarations: IrDeclaration[]): void {
  const constants = new Map<string, NonNullable<Extract<IrDeclaration, { kind: 'variable' }>['initializer']>>();
  for (const declaration of declarations) {
    if (declaration.kind === 'variable' && !declaration.mutable && declaration.initializer) {
      constants.set(declaration.name, declaration.initializer);
    }
  }
  for (const declaration of declarations) {
    if (
      declaration.kind === 'variable' &&
      declaration.initializer?.kind === 'identifier' &&
      constants.has(declaration.initializer.name)
    ) {
      declaration.initializer = constants.get(declaration.initializer.name);
    }
    if (declaration.kind !== 'function') continue;
    for (const parameter of declaration.parameters) {
      if (parameter.initializer?.kind !== 'identifier') continue;
      parameter.initializer = constants.get(parameter.initializer.name) ?? parameter.initializer;
    }
  }
}

function lowerFiles(workspaceDirectory: string, packageName: string, files: string[]) {
  const declarations: IrDeclaration[] = [];
  const diagnostics: LoweringDiagnostic[] = [];
  const sources: LoweredSource[] = [];
  for (const file of files) {
    const source = ts.createSourceFile(
      file,
      readFileSync(file, 'utf8'),
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    const result = lowerTypeScriptSource(source, packageName, workspaceDirectory);
    namespacePrivateDeclarations(result.declarations);
    declarations.push(...result.declarations);
    diagnostics.push(...result.diagnostics);
    sources.push({ declarations: result.declarations, diagnostics: result.diagnostics, file });
  }
  return { declarations, diagnostics, sources };
}

function namespacePrivateDeclarations(declarations: IrDeclaration[]): void {
  const suffix = declarations[0]?.origin.source
    .split('/')
    .at(-1)
    ?.replace(/\.tsx?$/u, '')
    .replace(/[^A-Za-z0-9]/gu, '_');
  if (!suffix) return;
  const valueNames = new Map(
    declarations
      .filter((declaration) => !declaration.exported && declaration.kind !== 'type')
      .map((declaration) => [declaration.name, `${declaration.name}__${suffix}`]),
  );
  const typeNames = new Map(
    declarations
      .filter(
        (declaration) =>
          !declaration.exported &&
          (declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type'),
      )
      .map((declaration) => [declaration.name, `${declaration.name}__${suffix}`]),
  );
  if (valueNames.size === 0 && typeNames.size === 0) return;
  let boundNames = new Set<string>();
  const collectBindings = (value: unknown): void => {
    if (Array.isArray(value)) {
      value.forEach(collectBindings);
      return;
    }
    if (!value || typeof value !== 'object') return;
    const record = value as Record<string, unknown>;
    if (record.kind === 'variable' && Array.isArray(record.declarations)) {
      for (const declaration of record.declarations) {
        if (
          declaration &&
          typeof declaration === 'object' &&
          typeof (declaration as { name?: unknown }).name === 'string'
        ) {
          boundNames.add((declaration as { name: string }).name);
        }
      }
    }
    if (record.kind === 'function' && Array.isArray(record.parameters)) {
      for (const parameter of record.parameters) {
        if (parameter && typeof parameter === 'object' && typeof (parameter as { name?: unknown }).name === 'string') {
          boundNames.add((parameter as { name: string }).name);
        }
      }
    }
    if (record.kind === 'forOf' && typeof record.variable === 'string') boundNames.add(record.variable);
    if (typeof record.catchName === 'string') boundNames.add(record.catchName);
    Object.values(record).forEach(collectBindings);
  };
  const type = (value: IrType): void => {
    switch (value.kind) {
      case 'anonymous':
        value.extends.forEach(type);
        value.fields.forEach((field) => type(field.type));
        break;
      case 'array':
        type(value.element);
        break;
      case 'function':
        value.parameters.forEach(type);
        type(value.returns);
        break;
      case 'named':
        value.name = typeNames.get(value.name) ?? value.name;
        value.arguments.forEach(type);
        break;
      case 'nullable':
        type(value.inner);
        break;
      case 'dynamic':
      case 'primitive':
        break;
    }
  };
  const parameters = (values: Array<{ initializer?: IrExpression | undefined; type: IrType }>): void =>
    values.forEach((item) => {
      type(item.type);
      if (item.initializer) expression(item.initializer);
    });
  const expression = (value: IrExpression): void => {
    switch (value.kind) {
      case 'array':
        value.elements.forEach(expression);
        break;
      case 'await':
        expression(value.expression);
        break;
      case 'assignment':
      case 'binary':
        expression(value.left);
        expression(value.right);
        break;
      case 'call':
        expression(value.callee);
        value.arguments.forEach(expression);
        break;
      case 'cast':
        expression(value.expression);
        type(value.type);
        break;
      case 'conditional':
        expression(value.condition);
        expression(value.whenTrue);
        expression(value.whenFalse);
        break;
      case 'element':
        expression(value.object);
        expression(value.index);
        break;
      case 'function':
        parameters(value.parameters);
        if (value.returns) type(value.returns);
        value.body.forEach(statement);
        if (value.expression) expression(value.expression);
        break;
      case 'identifier':
        if (!boundNames.has(value.name)) value.name = valueNames.get(value.name) ?? value.name;
        break;
      case 'new':
        expression(value.callee);
        value.arguments.forEach(expression);
        break;
      case 'object':
        value.properties.forEach((property) => {
          if (property.kind === 'spread') expression(property.expression);
          else {
            if (property.kind === 'computedProperty') expression(property.key);
            expression(property.value);
          }
        });
        break;
      case 'property':
        expression(value.object);
        break;
      case 'spread':
        expression(value.expression);
        break;
      case 'template':
        value.parts.forEach((part) => {
          if (typeof part !== 'string') expression(part);
        });
        break;
      case 'unary':
        expression(value.operand);
        break;
      case 'regexp':
      case 'literal':
        break;
    }
  };
  const statement = (value: IrStatement): void => {
    switch (value.kind) {
      case 'block':
        value.statements.forEach(statement);
        break;
      case 'do':
      case 'while':
        expression(value.condition);
        statement(value.body);
        break;
      case 'expression':
      case 'throw':
        expression(value.expression);
        break;
      case 'for':
        if (Array.isArray(value.initializer)) {
          value.initializer.forEach((item) => {
            if (item.type) type(item.type);
            if (item.initializer) expression(item.initializer);
          });
        } else if (value.initializer) expression(value.initializer);
        if (value.condition) expression(value.condition);
        if (value.increment) expression(value.increment);
        statement(value.body);
        break;
      case 'forOf':
        expression(value.iterable);
        value.bindings.forEach((item) => {
          if (item.type) type(item.type);
          if (item.initializer) expression(item.initializer);
        });
        statement(value.body);
        break;
      case 'if':
        expression(value.condition);
        statement(value.consequent);
        if (value.otherwise) statement(value.otherwise);
        break;
      case 'return':
        if (value.expression) expression(value.expression);
        break;
      case 'switch':
        expression(value.expression);
        value.cases.forEach((case_) => {
          if (case_.expression) expression(case_.expression);
          case_.statements.forEach(statement);
        });
        break;
      case 'variable':
        value.declarations.forEach((item) => {
          if (item.type) type(item.type);
          if (item.initializer) expression(item.initializer);
        });
        break;
      case 'try':
        statement(value.tryBody);
        if (value.catchBody) statement(value.catchBody);
        if (value.finallyBody) statement(value.finallyBody);
        break;
      case 'break':
      case 'continue':
        break;
    }
  };
  for (const declaration of declarations) {
    boundNames = new Set<string>();
    if (declaration.kind === 'function') {
      declaration.parameters.forEach((parameter) => boundNames.add(parameter.name));
      collectBindings(declaration.body);
    } else if (declaration.kind === 'class') {
      declaration.constructorParameters.forEach((parameter) => boundNames.add(parameter.name));
      declaration.methods.forEach((method) => method.parameters.forEach((parameter) => boundNames.add(parameter.name)));
      collectBindings(declaration.constructorBody);
      declaration.methods.forEach((method) => collectBindings(method.body));
    } else if (declaration.kind === 'variable' && declaration.initializer) {
      collectBindings(declaration.initializer);
    }
    if (!declaration.exported) {
      const declarationNames = declaration.kind === 'type' ? typeNames : valueNames;
      declaration.name = declarationNames.get(declaration.name) ?? declaration.name;
    }
    switch (declaration.kind) {
      case 'class':
        if (declaration.extends) type(declaration.extends);
        declaration.fields.forEach((field) => {
          type(field.type);
          if (field.initializer) expression(field.initializer);
        });
        parameters(declaration.constructorParameters);
        declaration.constructorBody.forEach(statement);
        declaration.methods.forEach((method) => {
          parameters(method.parameters);
          type(method.returns);
          method.body.forEach(statement);
        });
        break;
      case 'enum':
        declaration.members.forEach((member) => {
          if (member.initializer) expression(member.initializer);
        });
        declaration.methods.forEach((method) => method.body.forEach(statement));
        break;
      case 'function':
        parameters(declaration.parameters);
        type(declaration.returns);
        declaration.body.forEach(statement);
        break;
      case 'variable':
        if (declaration.type) type(declaration.type);
        if (declaration.initializer) expression(declaration.initializer);
        break;
      case 'type':
        type(declaration.type);
        break;
    }
  }
}

function lowerPackage(
  workspaceDirectory: string,
  directoryName: string,
  packageName: string,
  publicSourceNames: ReadonlySet<string>,
) {
  const directory = path.join(workspaceDirectory, 'upstream', 'packages', directoryName, 'src');
  const files = readdirSync(directory)
    .filter(
      (file) =>
        file.endsWith('.ts') &&
        !file.endsWith('.test.ts') &&
        (!/test(?:helper|util)/iu.test(file) || publicSourceNames.has(file)) &&
        file !== 'index.ts',
    )
    .map((file) => path.join(directory, file))
    .sort();
  return { ...lowerFiles(workspaceDirectory, packageName, files), files };
}
