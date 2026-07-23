import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import patches from '../../patches/manifest.ts';
import { portConfig } from '../../port.config.ts';
import { analyzeUpstream, packageNameToModule } from '../analyze/inventory.ts';
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
import { emitHaxeModule } from './haxe.ts';
import { stableJson, writeOrCheck } from './reports.ts';

export interface CoreGenerationReport {
  modules: Array<{
    declarations: number;
    diagnostics: LoweringDiagnostic[];
    module: string;
  }>;
  schemaVersion: 1;
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
  const canonicalImportNames = new Set(
    types.lowered.declarations.filter((declaration) => declaration.exported).map((declaration) => declaration.name),
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
  for (const item of loweredPackages) {
    const referencedCanonicalTypes = new Set<string>();
    collectReferencedNamedTypes(item.lowered.declarations, canonicalTypeNames, referencedCanonicalTypes);
    item.lowered.imports = [
      ...new Set([
        ...item.lowered.imports.map((importPath) => {
          const match = /^flighthq\.[^.]+\.([^ ]+)(.*)$/u.exec(importPath);
          const localAlias = / as ([^ ]+)$/u.exec(match?.[2] ?? '')?.[1];
          const valueAlias = match?.[1] ? canonicalValueAliases.get(match[1]) : undefined;
          if (
            match?.[1] &&
            valueAlias &&
            localAlias &&
            (localAlias.endsWith('Values') || /^[A-Z][A-Z0-9_]*$/u.test(localAlias))
          ) {
            return `flighthq.Types.${valueAlias} as ${localAlias}`;
          }
          return match?.[1] && canonicalImportNames.has(match[1])
            ? `flighthq.Types.${match[1]}${match[2] ?? ''}`
            : importPath;
        }),
        ...(item.packageName === '@flighthq/types'
          ? []
          : [...referencedCanonicalTypes].map((name) => `flighthq.Types.${name}`)),
      ]),
    ].sort();
    if (item.packageName !== '@flighthq/types') {
      rewriteCanonicalValueReferences(item.lowered.declarations, canonicalValueAliases, true);
      item.lowered.imports = item.lowered.imports.filter((importPath) => {
        const match = /^flighthq\.Types\.([^ ]+)/u.exec(importPath);
        return (
          !match?.[1] ||
          !canonicalValueAliases.has(match[1]) ||
          canonicalTypeNames.has(match[1]) ||
          importPath.includes(' as ')
        );
      });
    }
  }
  fillGenericArguments(loweredPackages.flatMap((item) => item.lowered.declarations));
  flattenStructuralTypes(types.lowered.declarations);
  for (const item of loweredPackages) inlineDefaultConstants(item.lowered.declarations);
  const modules: IrModule[] = loweredPackages.map((item) => ({
    declarations: item.lowered.declarations,
    imports: item.lowered.imports,
    name: item.moduleName,
    packageName: item.packageName,
  }));
  const declarationsBeforePatches = modules.flatMap((module) => module.declarations);
  const patchAudit = applySemanticPatches(declarationsBeforePatches, patches, workspaceDirectory);
  const retainedDeclarations = new Set(declarationsBeforePatches);
  for (const module of modules)
    module.declarations = module.declarations.filter((item) => retainedDeclarations.has(item));
  buildPublicFacades(modules, inventoryByName, canonicalValueAliases);
  const maintainedDirectory = path.join(workspaceDirectory, 'src', 'flighthq');
  const conflicts = modules
    .map((module) => `${module.name}.hx`)
    .filter((file) => existsSync(path.join(maintainedDirectory, file)));
  if (conflicts.length > 0) {
    throw new Error(`Maintained and generated Haxe modules overlap: ${conflicts.join(', ')}`);
  }
  const generatedDirectory = path.join(workspaceDirectory, portConfig.generatedDirectory, 'flighthq');
  mkdirSync(generatedDirectory, { recursive: true });
  removeStaleGeneratedModules(generatedDirectory, new Set(modules.map((module) => `${module.name}.hx`)), check);
  for (const module of modules) {
    writeOrCheck(path.join(generatedDirectory, `${module.name}.hx`), emitHaxeModule(module), check);
  }
  mkdirSync(path.join(workspaceDirectory, 'tests', 'bridges'), { recursive: true });
  for (const item of loweredPackages) {
    const packageInventory = inventoryByName.get(item.packageName);
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
        item.moduleName,
        item.lowered.declarations,
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
          item.moduleName,
          item.lowered.declarations,
          file,
          canonicalValueAliases,
        ),
        check,
      );
    }
  }
  const report: CoreGenerationReport = {
    modules: loweredPackages.map((item) => ({
      declarations: item.lowered.declarations.length,
      diagnostics: item.lowered.diagnostics,
      module: `flighthq.${item.moduleName}`,
    })),
    schemaVersion: 1,
  };
  writeOrCheck(path.join(workspaceDirectory, 'reports', 'core.json'), stableJson(report), check);
  writeOrCheck(path.join(workspaceDirectory, 'reports', 'patches.json'), stableJson(patchAudit), check);
  return report;
}

/** Haxe classes cannot re-export another class's static fields. */
function buildPublicFacades(
  modules: IrModule[],
  inventoryByName: ReadonlyMap<string, ReturnType<typeof analyzeUpstream>['packages'][number]>,
  canonicalValueAliases: ReadonlyMap<string, string>,
): void {
  const sdk = modules.find((module) => module.packageName === '@flighthq/sdk');
  const sdkInventory = inventoryByName.get('@flighthq/sdk');
  if (!sdk || !sdkInventory) throw new Error('Expected @flighthq/sdk module and inventory');
  const modulesByDirectory = new Map(
    modules.map((module) => [module.packageName.replace('@flighthq/', ''), module] as const),
  );
  const typeOwnerByName = new Map<string, IrModule>();
  for (const module of modules) {
    for (const declaration of module.declarations) {
      if (declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type') {
        typeOwnerByName.set(declaration.name, module);
      }
    }
  }

  const resolveDirectDeclaration = (
    record: (typeof sdkInventory.exports)[number],
  ): { declaration: Extract<IrDeclaration, { kind: 'function' | 'variable' }>; module: IrModule } | undefined => {
    const sourceDirectory = /^upstream\/packages\/([^/]+)\//u.exec(record.source)?.[1];
    const originModule = sourceDirectory ? modulesByDirectory.get(sourceDirectory) : undefined;
    if (!originModule || originModule === sdk) return undefined;
    const declaration = originModule.declarations.find(
      (candidate) =>
        candidate.kind === record.kind &&
        candidate.origin.fingerprint === record.fingerprint &&
        candidate.origin.source === record.source,
    );
    return declaration && (declaration.kind === 'function' || declaration.kind === 'variable')
      ? { declaration, module: originModule }
      : undefined;
  };

  const addFacade = (
    target: IrModule,
    publicName: string,
    originModule: IrModule,
    origin: Extract<IrDeclaration, { kind: 'function' | 'variable' }>,
  ): void => {
    const alias = `facade${target.name}${originModule.name}${origin.name[0]?.toUpperCase() ?? ''}${origin.name.slice(1)}`;
    target.imports.push(`flighthq.${originModule.name}.${origin.name} as ${alias}`);
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

  // Match granular package barrels before building the broad SDK facade.
  for (const target of modules.filter((module) => module !== sdk)) {
    const packageInventory = inventoryByName.get(target.packageName);
    if (!packageInventory || target.packageName === '@flighthq/types') continue;
    for (const record of packageInventory.exports) {
      if (record.kind !== 'function' && record.kind !== 'variable') continue;
      if (target.declarations.some((candidate) => candidate.kind === record.kind && candidate.name === record.name))
        continue;
      const resolved = resolveDirectDeclaration(record);
      if (!resolved || resolved.module === target) {
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
    if (record.kind !== 'function' && record.kind !== 'variable') continue;
    const packageMatch = [...inventoryByName.values()]
      .filter((candidate) => candidate.name !== '@flighthq/sdk' && candidate.sdkIncluded)
      .find((candidate) =>
        candidate.exports.some(
          (candidateRecord) =>
            candidateRecord.kind === record.kind &&
            candidateRecord.name === record.name &&
            candidateRecord.fingerprint === record.fingerprint &&
            candidateRecord.source === record.source,
        ),
      );
    const originModule = packageMatch ? modules.find((module) => module.packageName === packageMatch.name) : undefined;
    const generatedName =
      originModule?.packageName === '@flighthq/types'
        ? (canonicalValueAliases.get(record.name) ?? record.name)
        : record.name;
    const origin = originModule?.declarations.find(
      (candidate) => candidate.kind === record.kind && candidate.name === generatedName,
    );
    const resolved =
      origin && (origin.kind === 'function' || origin.kind === 'variable')
        ? { declaration: origin, module: originModule! }
        : resolveDirectDeclaration(record);
    if (!resolved) throw new Error(`Cannot resolve SDK facade export ${record.name} from ${record.source}`);
    addFacade(sdk, record.name, resolved.module, resolved.declaration);
  }
  sdk.declarations.sort((left, right) => left.name.localeCompare(right.name));
  for (const target of modules) {
    const referencedTypes = new Set<string>();
    collectReferencedNamedTypes(target.declarations, new Set(typeOwnerByName.keys()), referencedTypes);
    for (const typeName of referencedTypes) {
      const owner = typeOwnerByName.get(typeName);
      if (owner && owner !== target) target.imports.push(`flighthq.${owner.name}.${typeName}`);
    }
    target.imports = [...new Set(target.imports)].sort();
  }
}

function rewriteCanonicalValueReferences(value: unknown, aliases: ReadonlyMap<string, string>, qualify: boolean): void {
  if (Array.isArray(value)) {
    value.forEach((item) => rewriteCanonicalValueReferences(item, aliases, qualify));
    return;
  }
  if (!value || typeof value !== 'object') return;
  const record = value as Record<string, unknown>;
  if (record.kind === 'identifier' && typeof record.name === 'string') {
    const alias = aliases.get(record.name);
    if (alias) record.name = qualify ? `Types.${alias}` : alias;
  }
  Object.values(record).forEach((item) => rewriteCanonicalValueReferences(item, aliases, qualify));
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
  const stale = readdirSync(directory)
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
  moduleName: string,
  declarations: IrDeclaration[],
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
  const exports = declarations
    .filter((declaration) => declaration.exported && declaration.kind !== 'type')
    .map((declaration) => ({
      generatedName: declaration.name,
      kind: declaration.kind,
      mutable: declaration.kind === 'variable' && declaration.mutable,
      publicName: reverseAliases.get(declaration.name) ?? declaration.name,
      syncMutable: declaration.kind === 'function' && mutatesAnyName(declaration.body, mutableNames),
    }))
    .sort((a, b) => a.publicName.localeCompare(b.publicName));
  return [
    '// Generated by flight-hx. Do not edit.',
    "import compiled from '../../build/haxe-js/flight.cjs';",
    '',
    ...(exports.length > 0 ? [`const api = compiled.flighthq.${moduleName};`] : ['void compiled;']),
    ...exports.map(({ generatedName, kind, mutable, publicName }) =>
      kind === 'class'
        ? `export const ${publicName} = compiled.flighthq.${generatedName};`
        : kind === 'enum'
          ? `export const ${publicName} = api.__enum_${generatedName};`
          : kind === 'variable' && mutable
            ? `export let ${publicName} = api.${generatedName};`
            : kind === 'function' && exports.find((item) => item.publicName === publicName)?.syncMutable
              ? `export function ${publicName}(...args) { const result = api.${generatedName}(...args); __syncMutableExports(); return result; }`
              : `export const ${publicName} = api.${generatedName};`,
    ),
    ...(exports.some((item) => item.mutable)
      ? [
          '',
          'function __syncMutableExports() {',
          ...exports.filter((item) => item.mutable).map((item) => `  ${item.publicName} = api.${item.generatedName};`),
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
  moduleName: string,
  declarations: IrDeclaration[],
  file: string,
  canonicalValueAliases: ReadonlyMap<string, string>,
): string {
  const source = ts.createSourceFile(file, readFileSync(file, 'utf8'), ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
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
    let dependencyModuleName: string;
    if (sourceSpecifier.startsWith('.')) {
      const target = path.resolve(path.dirname(file), sourceSpecifier.replace(/\.m?js$/u, ''));
      bridgeSpecifier = `./${path.basename(target)}.mjs`;
      dependencyModuleName = moduleName;
    } else {
      const packageMatch = /^@flighthq\/([^/]+)$/u.exec(sourceSpecifier);
      if (!packageMatch) continue;
      bridgeSpecifier = sourceSpecifier;
      dependencyModuleName = packageNameToModule(sourceSpecifier);
    }
    const bindings = statement.importClause.namedBindings;
    if (bindings && ts.isNamedImports(bindings)) {
      for (const element of bindings.elements) {
        if (element.isTypeOnly) continue;
        const importedName = element.propertyName?.text ?? element.name.text;
        importedBindings.set(element.name.text, { importedName, specifier: bridgeSpecifier });
        if (!mockedSpecifiers.has(sourceSpecifier)) continue;
        const alias = dependencyAlias(bridgeSpecifier);
        dependencies.push({
          generatedName:
            dependencyModuleName === packageNameToModule('@flighthq/types')
              ? (canonicalValueAliases.get(importedName) ?? importedName)
              : importedName,
          importedName,
          moduleName: dependencyModuleName,
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
  const relativeSource = path.relative(workspaceDirectory, file).split(path.sep).join('/');
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
    moduleName === packageNameToModule('@flighthq/types')
      ? (reverseAliases.get(declaration.name) ?? declaration.name)
      : declaration.name;
  const needsApi = sourceDeclarations.some((declaration) => declaration.kind !== 'class');
  const needsCompiled =
    needsApi || dependencies.length > 0 || sourceDeclarations.some((declaration) => declaration.kind === 'class');
  return [
    '// Generated by flight-hx. Do not edit.',
    ...(needsCompiled ? ["import compiled from '../../../../build/haxe-js/flight.cjs';"] : []),
    ...[...dependencySpecifiers].map(([specifier, alias]) => `import * as ${alias} from '${specifier}';`),
    '',
    ...(needsApi ? [`const api = compiled.flighthq.${moduleName};`] : []),
    ...(dependencies.length > 0
      ? [
          'function __syncDependencies() {',
          ...dependencies.map(
            (dependency) =>
              `  compiled.flighthq.${dependency.moduleName}.${dependency.generatedName} = ${dependency.specifier}.${dependency.importedName};`,
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
      if (declaration.kind === 'class') return `export const ${exportedName} = compiled.flighthq.${declaration.name};`;
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
  const imports = new Set<string>();
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
    collectHaxeImports(source, imports, packageName);
  }
  return { declarations, diagnostics, imports: [...imports].sort() };
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

function collectHaxeImports(source: ts.SourceFile, imports: Set<string>, packageName: string): void {
  for (const statement of source.statements) {
    if (!ts.isImportDeclaration(statement) || !ts.isStringLiteral(statement.moduleSpecifier)) continue;
    const specifier = statement.moduleSpecifier.text;
    if (!specifier.startsWith('@flighthq/') || !statement.importClause) continue;
    if (specifier === packageName) continue;
    const moduleName = packageNameToModule(specifier);
    if (statement.importClause.name) {
      imports.add(`flighthq.${moduleName}.default as ${statement.importClause.name.text}`);
    }
    const bindings = statement.importClause.namedBindings;
    if (!bindings || !ts.isNamedImports(bindings)) continue;
    for (const element of bindings.elements) {
      const importedName = element.propertyName?.text ?? element.name.text;
      const alias = element.name.text === importedName ? '' : ` as ${element.name.text}`;
      imports.add(`flighthq.${moduleName}.${importedName}${alias}`);
    }
  }
}
