import { createHash } from 'node:crypto';
import path from 'node:path';
import ts from 'typescript';

import { auditStaticFacts } from '../analyze/static-facts.ts';
import {
  hostTypeIdentity,
  hostTypeIdentityForExpression,
  hostTypeIdentityForTypeNode,
  hostTypeIdentityForValueSymbol,
  type HostTypeIdentity,
} from '../analyze/host-types.ts';
import type { TypedStructRegistry } from '../analyze/typed-structs.ts';
import {
  hostEndpointBinding,
  hostEndpointBindingForUse,
  hostPropertyOperation,
  webGlComputedConstantDomain,
} from '../host-endpoints.ts';
import type {
  IrDeclaration,
  IrDestructuringReadEscape,
  IrDestructuringReadSource,
  IrDomRootBinding,
  IrExpression,
  IrExpressionStaticFacts,
  IrFunctionDeclaration,
  IrFunctionOverload,
  IrHostTypeBinding,
  IrHostEndpointBinding,
  IrIndexedReceiver,
  IrParameter,
  IrStatement,
  IrTypedArraySetReceiver,
  IrTypedStructBinding,
  IrType,
  IrTypeField,
  IrVariable,
  LoweringDiagnostic,
  LoweringResult,
  HostTypeUse,
  SourceOrigin,
} from '../model/ir.ts';

const fingerprintPrinter = ts.createPrinter({ removeComments: true });

interface ObjectMethodArityContext {
  expectedTypes: ts.Type[];
  methods: Map<string, ts.Signature>;
}

type ObjectMethodArityContexts = ReadonlyMap<ts.Symbol, ObjectMethodArityContext>;

const objectMethodArityContextCache = new WeakMap<ts.Program, ObjectMethodArityContexts>();

function originalSymbolAtLocation(node: ts.Node, checker: ts.TypeChecker): ts.Symbol | undefined {
  const symbol = checker.getSymbolAtLocation(node);
  return symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0 ? checker.getAliasedSymbol(symbol) : symbol;
}

function fixedAritySignature(type: ts.Type, checker: ts.TypeChecker): ts.Signature | undefined {
  return checker
    .getSignaturesOfType(checker.getNonNullableType(type), ts.SignatureKind.Call)
    .filter((signature) => !signature.getParameters().some(signatureParameterIsRest))
    .sort((left, right) => right.getParameters().length - left.getParameters().length)[0];
}

function collectObjectMethodArityContexts(program: ts.Program, checker: ts.TypeChecker): ObjectMethodArityContexts {
  const cached = objectMethodArityContextCache.get(program);
  if (cached) return cached;
  const contexts = new Map<ts.Symbol, ObjectMethodArityContext>();
  const visit = (node: ts.Node): void => {
    if (ts.isCallExpression(node)) {
      const signature = checker.getResolvedSignature(node);
      const parameters = signature?.getParameters() ?? [];
      for (let index = 0; index < node.arguments.length && index < parameters.length; index++) {
        const argument = unwrapCallTargetAssertions(node.arguments[index]!);
        if (!ts.isIdentifier(argument) && !ts.isPropertyAccessExpression(argument)) continue;
        const symbol = originalSymbolAtLocation(ts.isIdentifier(argument) ? argument : argument.name, checker);
        const declaration = symbol?.valueDeclaration;
        if (
          !symbol ||
          !declaration ||
          !ts.isVariableDeclaration(declaration) ||
          !declaration.initializer ||
          !ts.isObjectLiteralExpression(declaration.initializer)
        ) {
          continue;
        }
        const expectedType = checker.getNonNullableType(
          checker.getTypeOfSymbolAtLocation(parameters[index]!, node.arguments[index]!),
        );
        const actualType = checker.getNonNullableType(checker.getTypeAtLocation(argument));
        for (const expectedProperty of checker.getPropertiesOfType(expectedType)) {
          const actualProperty = actualType.getProperty(expectedProperty.getName());
          if (!actualProperty) continue;
          const expectedPropertyType = checker.getTypeOfSymbolAtLocation(expectedProperty, node.arguments[index]!);
          const actualPropertyType = checker.getTypeOfSymbolAtLocation(actualProperty, argument);
          const expectedSignature = fixedAritySignature(expectedPropertyType, checker);
          const actualSignature = fixedAritySignature(actualPropertyType, checker);
          if (
            !expectedSignature ||
            !actualSignature ||
            actualSignature.getParameters().length >= expectedSignature.getParameters().length
          ) {
            continue;
          }
          const context = contexts.get(symbol) ?? { expectedTypes: [], methods: new Map<string, ts.Signature>() };
          const current = context.methods.get(expectedProperty.getName());
          if (!current || current.getParameters().length < expectedSignature.getParameters().length) {
            context.methods.set(expectedProperty.getName(), expectedSignature);
          }
          if (!context.expectedTypes.includes(expectedType)) context.expectedTypes.push(expectedType);
          contexts.set(symbol, context);
        }
      }
    }
    ts.forEachChild(node, visit);
  };
  for (const sourceFile of program.getSourceFiles()) {
    if (!sourceFile.isDeclarationFile) visit(sourceFile);
  }
  objectMethodArityContextCache.set(program, contexts);
  return contexts;
}

const collectionMembers = {
  ArrayCollection: new Set(['filter', 'flatMap', 'forEach', 'map']),
  MapCollection: new Set(['clear', 'delete', 'entries', 'forEach', 'get', 'has', 'keys', 'set', 'size', 'values']),
  SetCollection: new Set(['add', 'clear', 'delete', 'entries', 'forEach', 'has', 'keys', 'size', 'values']),
  WeakMapCollection: new Set(['delete', 'get', 'has', 'set']),
  WeakSetCollection: new Set(['add', 'delete', 'has']),
} as const;

const standardStringMembers = new Set(['endsWith', 'includes', 'startsWith']);

type CollectionBinding = keyof typeof collectionMembers;

const domRootBindings = {
  document: 'DomDocumentBackend',
  navigator: 'DomNavigatorBackend',
  window: 'DomWindowBackend',
} as const satisfies Readonly<Record<string, IrDomRootBinding>>;

const typedArrayTypeReferenceMap = {
  Float32Array: 'flight._internal._Float32Array',
  Float64Array: 'flight._internal._Float64Array',
  Int16Array: 'flight._internal._Int16Array',
  Int32Array: 'flight._internal._Int32Array',
  Int8Array: 'flight._internal._Int8Array',
  Uint16Array: 'flight._internal._UInt16Array',
  Uint32Array: 'flight._internal._UInt32Array',
  Uint8Array: 'flight._internal._UInt8Array',
  Uint8ClampedArray: 'flight._internal._UInt8ClampedArray',
} as const;

type TypedArrayBinding = keyof typeof typedArrayTypeReferenceMap;

const typedArrayBindings = Object.keys(typedArrayTypeReferenceMap) as TypedArrayBinding[];

const typedArrayByteLengths = {
  Float32Array: 4,
  Float64Array: 8,
  Int16Array: 2,
  Int32Array: 4,
  Int8Array: 1,
  Uint16Array: 2,
  Uint32Array: 4,
  Uint8Array: 1,
  Uint8ClampedArray: 1,
} as const satisfies Readonly<Record<TypedArrayBinding, number>>;

const standardMathConstants = {
  E: Math.E,
  LN10: Math.LN10,
  LN2: Math.LN2,
  LOG10E: Math.LOG10E,
  LOG2E: Math.LOG2E,
  SQRT1_2: Math.SQRT1_2,
  SQRT2: Math.SQRT2,
} as const;

const portableTypeReferenceMap: Readonly<Record<string, string>> = {
  ArrayBuffer: 'haxe.io.Bytes',
  ArrayBufferLike: 'flight._internal._ArrayBufferLike',
  ArrayBufferView: 'haxe.io.ArrayBufferView',
  ...typedArrayTypeReferenceMap,
};

const standardGenericTypeReferenceMap: Readonly<Record<string, { arity: number; haxeType: string }>> = {
  ArrayLike: { arity: 1, haxeType: 'flight._internal._ArrayLike' },
  Record: { arity: 2, haxeType: 'flight._internal._Record' },
};

const collectionTypeReferenceMap: Readonly<Record<string, { arity: number; haxeType: string }>> = {
  Map: { arity: 2, haxeType: 'flight._internal._Map' },
  ReadonlyMap: { arity: 2, haxeType: 'flight._internal._Map' },
  ReadonlySet: { arity: 1, haxeType: 'flight._internal._Set' },
  Set: { arity: 1, haxeType: 'flight._internal._Set' },
  WeakMap: { arity: 2, haxeType: 'flight._internal._WeakMap' },
  WeakSet: { arity: 1, haxeType: 'flight._internal._WeakSet' },
};

const standardDynamicTypes = new Set([
  'AsyncIterable',
  'AsyncIterableIterator',
  'DataView',
  'Iterable',
  'IterableIterator',
  'Iterator',
  'RegExp',
  'WeakRef',
]);

const standardGlobalValues = new Set(['DataView', 'Map', 'RegExp', 'Set', 'WeakMap', 'WeakRef', 'WeakSet']);

const platformGlobalValues = new Set([
  'AbortController',
  'AbortSignal',
  'ArrayBuffer',
  'Blob',
  'Buffer',
  'CSSStyleDeclaration',
  'ClipboardItem',
  'FileReader',
  'HTMLCanvasElement',
  'HTMLImageElement',
  'HTMLVideoElement',
  'Image',
  'ImageData',
  'Intl',
  'File',
  'Float32Array',
  'Uint8Array',
  'FontFace',
  'Number',
  'Object',
  'OffscreenCanvas',
  'Promise',
  'ResizeObserver',
  'SharedArrayBuffer',
  'Notification',
  'Audio',
  'Date',
  'DeviceMotionEvent',
  'MediaMetadata',
  'TextEncoder',
  'URL',
  'URLSearchParams',
  'VideoFrame',
  'WebSocket',
  'atob',
  'btoa',
  'cancelAnimationFrame',
  'crypto',
  'decodeURIComponent',
  'document',
  'encodeURIComponent',
  'fetch',
  'createImageBitmap',
  'getComputedStyle',
  'globalThis',
  'localStorage',
  'location',
  'matchMedia',
  'navigator',
  'isNaN',
  'parseFloat',
  'parseInt',
  'performance',
  'requestAnimationFrame',
  'screen',
  'process',
  'structuredClone',
  'window',
]);

const webGpuConstantNamespaces = new Set([
  'GPUBufferUsage',
  'GPUColorWrite',
  'GPUMapMode',
  'GPUShaderStage',
  'GPUTextureUsage',
]);

interface LoweringOptions {
  expressionTypes?: boolean;
  inferredTypes?: boolean;
  ownedFunctionBodies?: ReadonlySet<string>;
  program?: ts.Program;
}

export function lowerTypeScriptSource(
  sourceFile: ts.SourceFile,
  packageName: string,
  workspaceDirectory: string,
  checker?: ts.TypeChecker,
  typedStructs?: TypedStructRegistry,
  options: LoweringOptions = {},
): LoweringResult {
  const diagnostics: LoweringDiagnostic[] = [];
  const declarations: IrDeclaration[] = [];
  const hostTypes = new Map<string, HostTypeUse>();
  let accountedDeclarations = 0;
  const erasedLocalTypes = new Set<string>();
  const collectLocalTypes = (node: ts.Node): void => {
    if ((ts.isInterfaceDeclaration(node) || ts.isTypeAliasDeclaration(node)) && !ts.isSourceFile(node.parent)) {
      erasedLocalTypes.add(node.name.text);
    }
    ts.forEachChild(node, collectLocalTypes);
  };
  collectLocalTypes(sourceFile);
  const externalTypes = new Set<string>();
  const externalValues = new Map<string, { imported: string; specifier: string }>();
  const directTypeNames = new Set<string>();
  const privateTypeAliases = new Map<string, ts.TypeAliasDeclaration>();
  const utilityAliasNames = new Set<string>();
  const visibleTypeNames = new Set<string>();
  for (const statement of sourceFile.statements) {
    if (
      (ts.isTypeAliasDeclaration(statement) ||
        ts.isInterfaceDeclaration(statement) ||
        ts.isClassDeclaration(statement) ||
        ts.isEnumDeclaration(statement)) &&
      statement.name
    ) {
      visibleTypeNames.add(statement.name.text);
      if (hasModifier(statement, ts.SyntaxKind.ExportKeyword)) directTypeNames.add(statement.name.text);
      else if (ts.isTypeAliasDeclaration(statement)) privateTypeAliases.set(statement.name.text, statement);
      if (ts.isTypeAliasDeclaration(statement) && typeNodeIncludesErasedUtility(statement.type)) {
        utilityAliasNames.add(statement.name.text);
      }
    }
  }
  for (const statement of sourceFile.statements) {
    if (!ts.isImportDeclaration(statement) || !ts.isStringLiteral(statement.moduleSpecifier)) continue;
    const specifier = statement.moduleSpecifier.text;
    const bindings = statement.importClause?.namedBindings;
    if (bindings && ts.isNamedImports(bindings)) {
      for (const element of bindings.elements) {
        let symbol = checker?.getSymbolAtLocation(element.name);
        if (symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0) symbol = checker?.getAliasedSymbol(symbol);
        if (
          (symbol && (symbol.flags & ts.SymbolFlags.Type) !== 0) ||
          (!checker && (statement.importClause?.isTypeOnly || element.isTypeOnly))
        ) {
          visibleTypeNames.add(element.name.text);
          directTypeNames.add(element.name.text);
        }
      }
    }
    if (specifier.startsWith('.') || specifier.startsWith('@flighthq/')) continue;
    if (statement.importClause?.name) {
      externalTypes.add(statement.importClause.name.text);
      externalValues.set(statement.importClause.name.text, { imported: 'default', specifier });
    }
    if (bindings && ts.isNamedImports(bindings)) {
      for (const element of bindings.elements) {
        externalTypes.add(element.name.text);
        externalValues.set(element.name.text, {
          imported: element.propertyName?.text ?? element.name.text,
          specifier,
        });
      }
    } else if (bindings && ts.isNamespaceImport(bindings)) {
      externalTypes.add(bindings.name.text);
      externalValues.set(bindings.name.text, { imported: '*', specifier });
    }
  }
  const canvasBindingNames = collectPlatformBindingNames(sourceFile, 'CanvasRenderingContext2D', (node, names) => {
    if (isCanvasValueExpression(node, names)) return true;
    return (
      packageName.toLowerCase().includes('canvas') &&
      ts.isPropertyAccessExpression(node) &&
      node.name.text === 'context'
    );
  });
  const canvasElementBindingNames = new Set([
    ...collectPlatformBindingNames(sourceFile, 'HTMLCanvasElement', isCanvasElementValueExpression),
    ...collectPlatformBindingNames(sourceFile, 'OffscreenCanvas', isCanvasElementValueExpression),
  ]);
  const webGpuDeviceBindingNames = collectPlatformBindingNames(sourceFile, 'GPUDevice', (node, names) =>
    isNamedPlatformValueExpression(node, names, 'device'),
  );
  const webGpuQueueBindingNames = collectPlatformBindingNames(sourceFile, 'GPUQueue', (node, names) =>
    isNamedPlatformValueExpression(node, names, 'queue'),
  );
  const webGpuCanvasContextBindingNames = collectPlatformBindingNames(sourceFile, 'GPUCanvasContext', (node, names) =>
    isNamedPlatformValueExpression(node, names, 'context'),
  );
  const webGpuLimitsBindingNames = collectPlatformBindingNames(sourceFile, 'GPUSupportedLimits', (node, names) =>
    isNamedPlatformValueExpression(node, names, 'limits'),
  );
  const webGlBindingNames = collectPlatformBindingNames(sourceFile, 'WebGL2RenderingContext', isWebGlValueExpression);
  const domWindowBindingNames = collectGlobalRootNames(sourceFile, 'window');
  const domDocumentBindingNames = collectGlobalRootNames(sourceFile, 'document');
  const domNavigatorBindingNames = collectGlobalRootNames(sourceFile, 'navigator');
  const context: LoweringContext = {
    checkerTypeCache: new Map(),
    preserveExpressionTypes: options.expressionTypes ?? true,
    preserveInferredTypes: options.inferredTypes ?? true,
    canvasBindingNames,
    canvasElementBindingNames,
    classThis: false,
    checker,
    diagnostics,
    directTypeNames,
    domDocumentBindingNames,
    domNavigatorBindingNames,
    domWindowBindingNames,
    dynamicThisCapture: undefined,
    erasedExpressionTypeParameters: new Set(),
    externalTypes,
    externalValues,
    erasedLocalTypes,
    hostTypes,
    packageName,
    privateTypeAliases,
    objectMethodArityContexts:
      checker && options.program ? collectObjectMethodArityContexts(options.program, checker) : new Map(),
    scopeBindings: new WeakMap(),
    sourceFile,
    temporaryIndex: 0,
    typedStructs,
    utilityAliasNames,
    visibleTypeNames,
    webGpuCanvasContextBindingNames,
    webGpuDeviceBindingNames,
    webGpuLimitsBindingNames,
    webGpuQueueBindingNames,
    webGlBindingNames,
    workspaceDirectory,
  };

  const overloads = new Map<string, IrFunctionOverload[]>();

  for (const statement of sourceFile.statements) {
    try {
      if (ts.isFunctionDeclaration(statement) && statement.name && statement.body) {
        const declaration = lowerFunction(statement, context, options.ownedFunctionBodies?.has(statement.name.text));
        const signatures = overloads.get(statement.name.text);
        if (signatures?.length) declaration.overloads = signatures;
        overloads.delete(statement.name.text);
        declarations.push(declaration);
        accountedDeclarations += 1;
      } else if (ts.isFunctionDeclaration(statement) && statement.name) {
        const signatures = overloads.get(statement.name.text) ?? [];
        signatures.push(lowerFunctionOverload(statement, context));
        overloads.set(statement.name.text, signatures);
        accountedDeclarations += 1;
      } else if (ts.isClassDeclaration(statement) && statement.name) {
        const previousClassThis = context.classThis;
        context.classThis = true;
        try {
          declarations.push(lowerClass(statement, context));
        } finally {
          context.classThis = previousClassThis;
        }
        accountedDeclarations += 1;
      } else if (ts.isInterfaceDeclaration(statement)) {
        declarations.push({
          exported: hasModifier(statement, ts.SyntaxKind.ExportKeyword),
          kind: 'type',
          name: statement.name.text,
          origin: origin(statement, context),
          type: {
            extends:
              statement.heritageClauses
                ?.filter((clause) => clause.token === ts.SyntaxKind.ExtendsKeyword)
                .flatMap((clause) => clause.types.map((item) => lowerExpressionWithTypeArguments(item, context))) ?? [],
            fields: lowerTypeMembers(statement.members, context),
            kind: 'anonymous',
          },
          typeParameters: statement.typeParameters?.map((parameter) => parameter.name.text) ?? [],
        });
        accountedDeclarations += 1;
      } else if (ts.isTypeAliasDeclaration(statement)) {
        declarations.push({
          exported: hasModifier(statement, ts.SyntaxKind.ExportKeyword),
          kind: 'type',
          name: statement.name.text,
          origin: origin(statement, context),
          type: lowerConcreteClosedMappedAlias(statement, context) ?? lowerType(statement.type, context),
          typeParameters: statement.typeParameters?.map((parameter) => parameter.name.text) ?? [],
        });
        accountedDeclarations += 1;
      } else if (ts.isEnumDeclaration(statement)) {
        declarations.push({
          exported: hasModifier(statement, ts.SyntaxKind.ExportKeyword),
          kind: 'enum',
          members: statement.members.map((member) => ({
            initializer: member.initializer ? lowerExpression(member.initializer, context) : undefined,
            name: propertyName(member.name, context),
            reverseMapping: enumMemberHasReverseMapping(member, context.checker),
          })),
          methods: [],
          name: statement.name.text,
          origin: origin(statement, context),
        });
        accountedDeclarations += 1;
      } else if (ts.isVariableStatement(statement)) {
        const exported = hasModifier(statement, ts.SyntaxKind.ExportKeyword);
        const mutable = (statement.declarationList.flags & ts.NodeFlags.Const) === 0;
        for (const declaration of statement.declarationList.declarations) {
          if (!ts.isIdentifier(declaration.name)) unsupported(declaration.name, context, 'binding pattern declaration');
          const inferred = declaration.type
            ? lowerType(declaration.type, context)
            : inferredType(declaration.name, context);
          const erasedTypeParameters = new Set(
            declaration.initializer &&
              (ts.isArrowFunction(declaration.initializer) || ts.isFunctionExpression(declaration.initializer))
              ? (declaration.initializer.typeParameters?.map((parameter) => parameter.name.text) ?? [])
              : [],
          );
          const type = inferred ? eraseLocalTypeParameters(inferred, erasedTypeParameters) : undefined;
          const loweredInitializer = declaration.initializer
            ? lowerExpression(declaration.initializer, context)
            : undefined;
          const initializer =
            declaration.initializer && loweredInitializer
              ? adaptFunctionValueToType(
                  declaration.initializer,
                  loweredInitializer,
                  context.checker?.getTypeAtLocation(declaration.name),
                  context,
                  type,
                )
              : loweredInitializer;
          widenObjectMethodArities(declaration, initializer, type, context);
          declarations.push({
            exported,
            initializer,
            kind: 'variable',
            mutable,
            name: declaration.name.text,
            origin: origin(statement, context),
            type,
          });
        }
        accountedDeclarations += 1;
      } else if (ts.isModuleDeclaration(statement)) {
        if (!mergeNamespace(statement, declarations, context)) {
          unsupported(statement, context, `declaration ${ts.SyntaxKind[statement.kind] ?? statement.kind}`);
        }
        accountedDeclarations += 1;
      }
    } catch (error) {
      if (!(error instanceof UnsupportedSyntaxError)) throw error;
    }
  }

  return {
    accountedDeclarations,
    declarations,
    diagnostics,
    hostTypes: [...hostTypes.values()].sort((left, right) =>
      [left.name, left.source, left.line, left.column, left.kind, left.member ?? '', left.operation ?? '']
        .join(':')
        .localeCompare(
          [
            right.name,
            right.source,
            right.line,
            right.column,
            right.kind,
            right.member ?? '',
            right.operation ?? '',
          ].join(':'),
        ),
    ),
    staticFacts: auditStaticFacts(declarations),
  };
}

function collectPlatformBindingNames(
  sourceFile: ts.SourceFile,
  typeName: string,
  isBindingValue: (node: ts.Expression, names: ReadonlySet<string>) => boolean,
): ReadonlySet<string> {
  const names = new Set<string>();
  const factories = new Set<string>();
  const collectFactories = (node: ts.Node): void => {
    if (ts.isFunctionDeclaration(node) && node.name && node.type?.getText(sourceFile).includes(typeName)) {
      factories.add(node.name.text);
    }
    ts.forEachChild(node, collectFactories);
  };
  collectFactories(sourceFile);
  const visit = (node: ts.Node): void => {
    if (
      (ts.isParameter(node) || ts.isVariableDeclaration(node) || ts.isPropertyDeclaration(node)) &&
      ts.isIdentifier(node.name)
    ) {
      const declaredType = node.type?.getText(sourceFile);
      if (
        declaredType?.includes(typeName) ||
        (typeName === 'WebGL2RenderingContext' && node.name.text === 'gl') ||
        (node.initializer &&
          ts.isCallExpression(node.initializer) &&
          ts.isIdentifier(node.initializer.expression) &&
          factories.has(node.initializer.expression.text)) ||
        (node.initializer && isBindingValue(node.initializer, names))
      ) {
        names.add(node.name.text);
      }
    }
    ts.forEachChild(node, visit);
  };
  // Repeat once so a simple alias can refer to a binding declared later in the file.
  visit(sourceFile);
  visit(sourceFile);
  return names;
}

function collectGlobalRootNames(sourceFile: ts.SourceFile, root: string): ReadonlySet<string> {
  const names = new Set([root]);
  const scopeBindings = new WeakMap<ts.Node, ReadonlySet<string>>();
  const isRootValue = (node: ts.Expression): boolean => {
    if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
      return isRootValue(node.expression);
    }
    return (
      ts.isIdentifier(node) &&
      names.has(node.text) &&
      (node.text !== root || !isLexicallyBoundInScopes(node, scopeBindings))
    );
  };
  const visit = (node: ts.Node): void => {
    if (
      ts.isVariableDeclaration(node) &&
      ts.isIdentifier(node.name) &&
      node.initializer &&
      ts.isVariableDeclarationList(node.parent) &&
      (node.parent.flags & ts.NodeFlags.Const) !== 0 &&
      isRootValue(node.initializer)
    ) {
      names.add(node.name.text);
    }
    ts.forEachChild(node, visit);
  };
  let previousSize = -1;
  while (names.size !== previousSize) {
    previousSize = names.size;
    visit(sourceFile);
  }
  return names;
}

function isBoundGlobalRootExpression(
  node: ts.Expression,
  context: LoweringContext,
  root: string,
  names: ReadonlySet<string>,
): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isBoundGlobalRootExpression(node.expression, context, root, names);
  }
  if (!ts.isIdentifier(node) || !names.has(node.text)) return false;
  return node.text !== root || !isLexicallyBound(node, context);
}

function domRootBinding(node: ts.Expression, context: LoweringContext): IrDomRootBinding | undefined {
  for (const [root, binding] of Object.entries(domRootBindings)) {
    const names =
      root === 'window'
        ? context.domWindowBindingNames
        : root === 'document'
          ? context.domDocumentBindingNames
          : context.domNavigatorBindingNames;
    if (isBoundGlobalRootExpression(node, context, root, names)) return binding;
  }
  return undefined;
}

function isWebGlValueExpression(node: ts.Expression, names: ReadonlySet<string>): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isWebGlValueExpression(node.expression, names);
  }
  if (ts.isIdentifier(node)) return names.has(node.text);
  return ts.isPropertyAccessExpression(node) && node.name.text === 'gl';
}

function isCanvasValueExpression(node: ts.Expression, names: ReadonlySet<string>): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isCanvasValueExpression(node.expression, names);
  }
  if (ts.isIdentifier(node)) return names.has(node.text);
  if (ts.isPropertyAccessExpression(node) && node.name.text === 'ctx') return true;
  return (
    ts.isCallExpression(node) &&
    ts.isPropertyAccessExpression(node.expression) &&
    node.expression.name.text === 'getContext' &&
    node.arguments[0] !== undefined &&
    ts.isStringLiteral(node.arguments[0]) &&
    node.arguments[0].text === '2d'
  );
}

function isCanvasElementValueExpression(node: ts.Expression, names: ReadonlySet<string>): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isCanvasElementValueExpression(node.expression, names);
  }
  if (ts.isIdentifier(node)) return names.has(node.text);
  if (ts.isPropertyAccessExpression(node)) return node.name.text === 'canvas';
  if (ts.isNewExpression(node) && ts.isIdentifier(node.expression)) {
    return node.expression.text === 'OffscreenCanvas';
  }
  return (
    ts.isCallExpression(node) &&
    ts.isPropertyAccessExpression(node.expression) &&
    node.expression.name.text === 'createElement' &&
    node.arguments[0] !== undefined &&
    ts.isStringLiteral(node.arguments[0]) &&
    node.arguments[0].text === 'canvas'
  );
}

function isBoundCanvasElementExpression(node: ts.Expression, context: LoweringContext): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isBoundCanvasElementExpression(node.expression, context);
  }
  if (ts.isIdentifier(node)) {
    const parameter = findEnclosingParameter(node);
    if (parameter?.type) {
      const type = parameter.type.getText(context.sourceFile);
      if (type.includes('HTMLCanvasElement') || type.includes('OffscreenCanvas')) return true;
    }
  }
  return isCanvasElementValueExpression(node, context.canvasElementBindingNames);
}

function isNamedPlatformValueExpression(
  node: ts.Expression,
  names: ReadonlySet<string>,
  propertyName: string,
): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isNamedPlatformValueExpression(node.expression, names, propertyName);
  }
  if (ts.isIdentifier(node)) return names.has(node.text);
  return ts.isPropertyAccessExpression(node) && node.name.text === propertyName;
}

function isBoundNamedPlatformExpression(
  node: ts.Expression,
  context: LoweringContext,
  typeName: string,
  names: ReadonlySet<string>,
  propertyName: string,
): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isBoundNamedPlatformExpression(node.expression, context, typeName, names, propertyName);
  }
  if (ts.isIdentifier(node)) {
    const parameter = findEnclosingParameter(node);
    if (parameter?.type?.getText(context.sourceFile).includes(typeName)) return true;
    if (context.packageName.toLowerCase().includes('wgpu') && node.text === propertyName) return true;
  }
  return isNamedPlatformValueExpression(node, names, propertyName);
}

function isBoundPlatformExpression(
  node: ts.Expression,
  context: LoweringContext,
  typeName: 'CanvasRenderingContext2D' | 'WebGL2RenderingContext',
): boolean {
  if (ts.isParenthesizedExpression(node) || ts.isAsExpression(node) || ts.isNonNullExpression(node)) {
    return isBoundPlatformExpression(node.expression, context, typeName);
  }
  if (typeIncludesNamed(context.checker?.getTypeAtLocation(node), context.checker, new Set([typeName]))) return true;
  if (ts.isIdentifier(node)) {
    const parameter = findEnclosingParameter(node);
    if (parameter) {
      if (parameter.type?.getText(context.sourceFile).includes(typeName)) return true;
      return (
        typeName === 'WebGL2RenderingContext' &&
        ts.isIdentifier(parameter.name) &&
        parameter.name.text === 'gl' &&
        context.packageName.toLowerCase().includes('-gl')
      );
    }
    const names = typeName === 'CanvasRenderingContext2D' ? context.canvasBindingNames : context.webGlBindingNames;
    return names.has(node.text);
  }
  return typeName === 'CanvasRenderingContext2D'
    ? isCanvasValueExpression(node, context.canvasBindingNames)
    : isWebGlValueExpression(node, context.webGlBindingNames);
}

function boundHostEndpoint(node: ts.Expression, context: LoweringContext): IrHostEndpointBinding | undefined {
  if (context.checker) {
    return hostEndpointBinding(context.checker.getTypeAtLocation(node), context.checker);
  }
  if (isBoundCanvasElementExpression(node, context)) return 'CanvasElementBackend';
  if (isBoundNamedPlatformExpression(node, context, 'GPUDevice', context.webGpuDeviceBindingNames, 'device')) {
    return 'WebGpuDeviceBackend';
  }
  if (isBoundNamedPlatformExpression(node, context, 'GPUQueue', context.webGpuQueueBindingNames, 'queue')) {
    return 'WebGpuQueueBackend';
  }
  if (
    isBoundNamedPlatformExpression(
      node,
      context,
      'GPUCanvasContext',
      context.webGpuCanvasContextBindingNames,
      'context',
    )
  ) {
    return 'WebGpuCanvasContextBackend';
  }
  if (isBoundNamedPlatformExpression(node, context, 'GPUSupportedLimits', context.webGpuLimitsBindingNames, 'limits')) {
    return 'WebGpuLimitsBackend';
  }
  if (isBoundGlobalRootExpression(node, context, 'window', context.domWindowBindingNames)) return 'DomWindowBackend';
  if (isBoundGlobalRootExpression(node, context, 'document', context.domDocumentBindingNames)) {
    return 'DomDocumentBackend';
  }
  if (isBoundGlobalRootExpression(node, context, 'navigator', context.domNavigatorBindingNames)) {
    return 'DomNavigatorBackend';
  }
  if (isBoundPlatformExpression(node, context, 'CanvasRenderingContext2D')) return 'Canvas2dBackend';
  if (isBoundPlatformExpression(node, context, 'WebGL2RenderingContext')) return 'WebGl2Backend';
  return undefined;
}

function collectionBinding(
  node: ts.Expression,
  member: string,
  context: LoweringContext,
): CollectionBinding | undefined {
  const type = context.checker?.getTypeAtLocation(node);
  const checker = context.checker;
  if (!type || !checker) return undefined;
  const candidates: Array<[CollectionBinding, ReadonlySet<string>, ReadonlySet<string>]> = [
    ['ArrayCollection', new Set(['Array', 'ReadonlyArray']), collectionMembers.ArrayCollection],
    ['MapCollection', new Set(['Map', 'ReadonlyMap']), collectionMembers.MapCollection],
    ['SetCollection', new Set(['ReadonlySet', 'Set']), collectionMembers.SetCollection],
    ['WeakMapCollection', new Set(['WeakMap']), collectionMembers.WeakMapCollection],
    ['WeakSetCollection', new Set(['WeakSet']), collectionMembers.WeakSetCollection],
  ];
  return candidates.find(([, names, members]) => members.has(member) && typeIncludesNamed(type, checker, names))?.[0];
}

function typedArrayBinding(
  node: ts.Expression,
  member: string,
  context: LoweringContext,
): TypedArrayBinding | undefined {
  if (member !== 'subarray') return undefined;
  const type = context.checker?.getTypeAtLocation(node);
  const checker = context.checker;
  if (!type || !checker) return undefined;
  return (Object.keys(typedArrayTypeReferenceMap) as TypedArrayBinding[]).find((name) =>
    typeIncludesNamed(type, checker, new Set([name])),
  );
}

function standardStringBinding(node: ts.Expression, member: string, context: LoweringContext): 'String' | undefined {
  const type = context.checker?.getTypeAtLocation(node);
  const checker = context.checker;
  return type &&
    checker &&
    standardStringMembers.has(member) &&
    typeOnlyHasFlags(type, checker, ts.TypeFlags.StringLike)
    ? 'String'
    : undefined;
}

function upstreamPackageSourceDirectory(sourceFile: ts.SourceFile, workspaceDirectory: string): string | undefined {
  const packagesDirectory = path.join(workspaceDirectory, 'upstream', 'packages');
  const relative = path.relative(packagesDirectory, sourceFile.fileName);
  if (relative.startsWith(`..${path.sep}`) || path.isAbsolute(relative)) return undefined;
  const [packageDirectory, sourceDirectory] = relative.split(path.sep);
  return packageDirectory && sourceDirectory === 'src' ? packageDirectory : undefined;
}

/** Preserve the nominal receiver for methods on classes generated from this upstream package. */
function generatedClassBinding(node: ts.Expression, context: LoweringContext): string | undefined {
  const checker = context.checker;
  if (!checker) return undefined;
  const packageDirectory = upstreamPackageSourceDirectory(context.sourceFile, context.workspaceDirectory);
  if (!packageDirectory) return undefined;
  const names = new Set<string>();
  const seen = new Set<ts.Type>();
  const visit = (type: ts.Type): void => {
    if (seen.has(type)) return;
    seen.add(type);
    if (type.isUnionOrIntersection()) {
      type.types.forEach(visit);
      return;
    }
    for (const declaration of type.getSymbol()?.declarations ?? []) {
      if (
        ts.isClassDeclaration(declaration) &&
        declaration.name &&
        upstreamPackageSourceDirectory(declaration.getSourceFile(), context.workspaceDirectory) === packageDirectory
      ) {
        names.add(declaration.name.text);
      }
    }
    const constraint = checker.getBaseConstraintOfType(type);
    if (constraint && constraint !== type) visit(constraint);
  };
  visit(checker.getTypeAtLocation(node));
  return names.size === 1 ? [...names][0] : undefined;
}

/** A source-defined structural receiver whose field is statically present. */
function structuralReceiverType(node: ts.PropertyAccessExpression, context: LoweringContext): IrType | undefined {
  const checker = context.checker;
  if (!checker) return undefined;
  const receiver = checker.getTypeAtLocation(node.expression);
  // JavaScript callable objects can carry fields, but native Haxe closures
  // cannot. Keep their property access on the portable runtime path, which
  // retains Object.assign decorations by closure identity.
  if (checker.getSignaturesOfType(checker.getNonNullableType(receiver), ts.SignatureKind.Call).length > 0) {
    return undefined;
  }
  const declaredProperty = checker.getPropertyOfType(receiver, node.name.text);
  const narrowedProperty = checker.getSymbolAtLocation(node.name);
  const property =
    declaredProperty ??
    (narrowedProperty?.declarations?.some((declaration) => !declaration.getSourceFile().isDeclarationFile)
      ? narrowedProperty
      : undefined);
  if ((receiver.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.TypeParameter)) !== 0) {
    return undefined;
  }
  if (!property) {
    const indexed = checker.getIndexTypeOfType(receiver, ts.IndexKind.String);
    const fieldType = indexed ? lowerCheckerType(indexed, node, context, new Set()) : undefined;
    return fieldType
      ? {
          extends: [],
          fields: [{ name: node.name.text, optional: false, type: fieldType }],
          kind: 'anonymous',
        }
      : undefined;
  }
  const fieldShape = (): IrType | undefined => {
    const declaration = property?.valueDeclaration ?? property?.declarations?.[0] ?? node;
    const fieldType = lowerCheckerType(
      checker.getTypeOfSymbolAtLocation(property, declaration),
      node,
      context,
      new Set(),
    );
    return fieldType
      ? {
          extends: [],
          fields: [
            {
              name: node.name.text,
              optional: Boolean(property && (property.flags & ts.SymbolFlags.Optional) !== 0),
              type: fieldType,
            },
          ],
          kind: 'anonymous',
        }
      : undefined;
  };
  const declaredTypeNode = declaredStorageTypeNode(node.expression, checker);
  if (declaredTypeNode && typeNodeContainsIndexedAccess(declaredTypeNode)) return fieldShape();
  const propertyDeclaration = property?.valueDeclaration ?? property?.declarations?.[0] ?? node;
  const propertyType =
    property && checker.getNonNullableType(checker.getTypeOfSymbolAtLocation(property, propertyDeclaration));
  const assignmentTarget =
    ts.isBinaryExpression(node.parent) &&
    node.parent.left === node &&
    node.parent.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
    node.parent.operatorToken.kind <= ts.SyntaxKind.LastAssignment;
  if (assignmentTarget && propertyType && checker.getSignaturesOfType(propertyType, ts.SignatureKind.Call).length > 0) {
    return fieldShape();
  }
  if (receiver.isUnionOrIntersection() || (receiver.flags & ts.TypeFlags.IndexedAccess) !== 0) return fieldShape();
  const lowered = lowerCheckerType(receiver, node.expression, context, new Set());
  if (!lowered || lowered.kind === 'dynamic' || lowered.kind === 'union') return undefined;
  if (lowered.kind === 'named' && lowered.name === 'flight._internal._IndexedAccess') return fieldShape();
  if (lowered.kind === 'anonymous') {
    return lowered.fields.some((field) => field.name === node.name.text) ? lowered : fieldShape();
  }
  if (lowered.kind !== 'named') return undefined;
  const symbol = receiver.aliasSymbol ?? receiver.getSymbol();
  const declarations = symbol?.declarations ?? [];
  return declarations.some(
    (declaration) =>
      !declaration.getSourceFile().isDeclarationFile &&
      (ts.isInterfaceDeclaration(declaration) ||
        (ts.isTypeAliasDeclaration(declaration) &&
          (ts.isTypeLiteralNode(declaration.type) || ts.isIntersectionTypeNode(declaration.type)))),
  )
    ? lowered
    : undefined;
}

function variadicCallConvention(
  node: ts.CallExpression,
  context: LoweringContext,
): { haxeRestIndex: number } | undefined {
  const checker = context.checker;
  if (!checker) return undefined;
  const type = checker.getTypeAtLocation(unwrapCallTargetAssertions(node.expression));
  if ((type.flags & ts.TypeFlags.TypeParameter) !== 0) return undefined;
  let restIndex: number | undefined;
  for (const signature of checker.getSignaturesOfType(type, ts.SignatureKind.Call)) {
    const declaration = signature.getDeclaration();
    if (!declaration || declaration.getSourceFile().isDeclarationFile) continue;
    const index = declaration.parameters.findIndex((parameter) => parameter.dotDotDotToken !== undefined);
    if (index < 0 || (restIndex !== undefined && restIndex !== index)) return undefined;
    restIndex = index;
  }
  return restIndex === undefined ? undefined : { haxeRestIndex: restIndex };
}

function unwrapCallTargetAssertions(expression: ts.Expression): ts.Expression {
  if (
    ts.isAsExpression(expression) ||
    ts.isTypeAssertionExpression(expression) ||
    ts.isSatisfiesExpression(expression) ||
    ts.isParenthesizedExpression(expression) ||
    ts.isNonNullExpression(expression)
  ) {
    return unwrapCallTargetAssertions(expression.expression);
  }
  return expression;
}

function typeIncludesNamed(
  type: ts.Type | undefined,
  checker: ts.TypeChecker | undefined,
  names: ReadonlySet<string>,
  seen = new Set<ts.Type>(),
): boolean {
  if (!type || !checker || seen.has(type)) return false;
  seen.add(type);
  if (type.isUnionOrIntersection() && type.types.some((item) => typeIncludesNamed(item, checker, names, seen))) {
    return true;
  }
  const symbols = [type.aliasSymbol, type.getSymbol()];
  if (symbols.some((symbol) => symbol && names.has(symbol.getName()))) return true;
  if (symbols.some((symbol) => symbol?.getName() === 'Readonly')) {
    const arguments_ = type.aliasTypeArguments ?? checker.getTypeArguments(type as ts.TypeReference);
    if (arguments_[0] && typeIncludesNamed(arguments_[0], checker, names, seen)) return true;
  }
  const constraint = checker.getBaseConstraintOfType(type);
  return constraint !== undefined && constraint !== type && typeIncludesNamed(constraint, checker, names, seen);
}

function findEnclosingParameter(identifier: ts.Identifier): ts.ParameterDeclaration | undefined {
  let current: ts.Node | undefined = identifier.parent;
  while (current) {
    if (ts.isFunctionLike(current)) {
      const parameter = current.parameters.find(
        (candidate) => ts.isIdentifier(candidate.name) && candidate.name.text === identifier.text,
      );
      if (parameter) return parameter;
    }
    current = current.parent;
  }
  return undefined;
}

interface LoweringContext {
  checkerTypeCache: Map<ts.Type, IrType | null>;
  preserveExpressionTypes: boolean;
  preserveInferredTypes: boolean;
  canvasBindingNames: ReadonlySet<string>;
  canvasElementBindingNames: ReadonlySet<string>;
  classThis: boolean;
  checker?: ts.TypeChecker | undefined;
  diagnostics: LoweringDiagnostic[];
  directTypeNames: ReadonlySet<string>;
  domDocumentBindingNames: ReadonlySet<string>;
  domNavigatorBindingNames: ReadonlySet<string>;
  domWindowBindingNames: ReadonlySet<string>;
  dynamicThisCapture?: string | undefined;
  erasedExpressionTypeParameters: ReadonlySet<string>;
  externalTypes: ReadonlySet<string>;
  externalValues: ReadonlyMap<string, { imported: string; specifier: string }>;
  erasedLocalTypes: ReadonlySet<string>;
  hostTypes: Map<string, HostTypeUse>;
  packageName: string;
  privateTypeAliases: ReadonlyMap<string, ts.TypeAliasDeclaration>;
  objectMethodArityContexts: ObjectMethodArityContexts;
  scopeBindings: WeakMap<ts.Node, ReadonlySet<string>>;
  sourceFile: ts.SourceFile;
  temporaryIndex: number;
  typedStructs?: TypedStructRegistry | undefined;
  utilityAliasNames: ReadonlySet<string>;
  visibleTypeNames: ReadonlySet<string>;
  webGpuCanvasContextBindingNames: ReadonlySet<string>;
  webGpuDeviceBindingNames: ReadonlySet<string>;
  webGpuLimitsBindingNames: ReadonlySet<string>;
  webGpuQueueBindingNames: ReadonlySet<string>;
  webGlBindingNames: ReadonlySet<string>;
  workspaceDirectory: string;
}

class UnsupportedSyntaxError extends Error {}

function lowerClass(node: ts.ClassDeclaration, context: LoweringContext) {
  if (!node.name) throw new Error('Expected named class');
  const constructor = node.members.find(ts.isConstructorDeclaration);
  const parameterProperties =
    constructor?.parameters.filter((parameter) => ts.isParameterPropertyDeclaration(parameter, constructor)) ?? [];
  const fields = node.members.filter(ts.isPropertyDeclaration).map((field) => {
    return {
      initializer: field.initializer ? lowerExpression(field.initializer, context) : undefined,
      mutable: !hasModifier(field, ts.SyntaxKind.ReadonlyKeyword),
      name: propertyName(field.name, context),
      public: !hasModifier(field, ts.SyntaxKind.PrivateKeyword) && !hasModifier(field, ts.SyntaxKind.ProtectedKeyword),
      static: hasModifier(field, ts.SyntaxKind.StaticKeyword),
      type: field.type ? lowerType(field.type, context) : (inferredType(field.name, context) ?? { kind: 'dynamic' }),
    };
  });
  for (const parameter of parameterProperties) {
    if (!ts.isIdentifier(parameter.name)) unsupported(parameter.name, context, 'binding pattern parameter property');
    fields.push({
      initializer: undefined,
      mutable: !hasModifier(parameter, ts.SyntaxKind.ReadonlyKeyword),
      name: parameter.name.text,
      public:
        !hasModifier(parameter, ts.SyntaxKind.PrivateKeyword) &&
        !hasModifier(parameter, ts.SyntaxKind.ProtectedKeyword),
      static: false,
      type: parameter.type
        ? lowerType(parameter.type, context)
        : (inferredType(parameter.name, context) ?? { kind: 'dynamic' }),
    });
  }
  const heritage = node.heritageClauses?.find((clause) => clause.token === ts.SyntaxKind.ExtendsKeyword)?.types.at(0);
  const extendsType = heritage ? lowerExpressionWithTypeArguments(heritage, context) : undefined;
  if (extendsType?.kind === 'named' && extendsType.name === 'Error') {
    extendsType.name = 'haxe.Exception';
    fields.push({
      initializer: { kind: 'literal', value: 'Error' },
      mutable: true,
      name: 'name',
      public: true,
      static: false,
      type: { kind: 'primitive', name: 'String' },
    });
  }
  const loweredConstructor = constructor ? lowerParameterList(constructor.parameters, context) : undefined;
  const parameterPropertyInitializers: IrStatement[] = parameterProperties.map((parameter) => {
    if (!ts.isIdentifier(parameter.name)) unsupported(parameter.name, context, 'binding pattern parameter property');
    return {
      expression: {
        kind: 'assignment',
        left: {
          kind: 'property',
          name: parameter.name.text,
          object: { kind: 'identifier', name: 'this' },
        },
        operator: '=',
        right: { kind: 'identifier', name: parameter.name.text },
      },
      kind: 'expression',
    };
  });
  const constructorStatements =
    constructor?.body?.statements.map((statement) => lowerStatement(statement, context)) ?? [];
  const superIndex = constructor?.body?.statements.findIndex(
    (statement) =>
      ts.isExpressionStatement(statement) &&
      ts.isCallExpression(statement.expression) &&
      statement.expression.expression.kind === ts.SyntaxKind.SuperKeyword,
  );
  const constructorBody =
    extendsType && superIndex !== undefined && superIndex >= 0
      ? [
          ...(loweredConstructor?.prefix ?? []),
          ...constructorStatements.slice(0, superIndex + 1),
          ...parameterPropertyInitializers,
          ...constructorStatements.slice(superIndex + 1),
        ]
      : [...(loweredConstructor?.prefix ?? []), ...parameterPropertyInitializers, ...constructorStatements];
  return {
    constructorBody,
    constructorParameters: loweredConstructor?.parameters ?? [],
    exported: hasModifier(node, ts.SyntaxKind.ExportKeyword),
    extends: extendsType,
    fields,
    kind: 'class' as const,
    methods: node.members.filter(ts.isMethodDeclaration).map((method) => {
      if (!method.body) unsupported(method, context, 'method without a body');
      const loweredParameters = lowerParameterList(method.parameters, context);
      return {
        async: hasModifier(method, ts.SyntaxKind.AsyncKeyword),
        body: [...loweredParameters.prefix, ...lowerStatementList(method.body.statements, context)],
        name: propertyName(method.name, context),
        parameters: loweredParameters.parameters,
        public:
          !hasModifier(method, ts.SyntaxKind.PrivateKeyword) && !hasModifier(method, ts.SyntaxKind.ProtectedKeyword),
        returns:
          (method.type ? lowerType(method.type, context) : inferredReturnType(method, context)) ??
          (hasModifier(method, ts.SyntaxKind.AsyncKeyword)
            ? promiseOfDynamic()
            : hasReturnValue(method.body)
              ? ({ kind: 'dynamic' } satisfies IrType)
              : ({ kind: 'primitive', name: 'Void' } satisfies IrType)),
        static: hasModifier(method, ts.SyntaxKind.StaticKeyword),
        typeParameterConstraints: lowerTypeParameterConstraints(method.typeParameters, context),
        typeParameters: method.typeParameters?.map((parameter) => parameter.name.text) ?? [],
      };
    }),
    name: node.name.text,
    origin: origin(node, context),
    typeParameters: node.typeParameters?.map((parameter) => parameter.name.text) ?? [],
  };
}

function mergeNamespace(node: ts.ModuleDeclaration, declarations: IrDeclaration[], context: LoweringContext): boolean {
  if (!ts.isIdentifier(node.name) || !node.body || !ts.isModuleBlock(node.body)) return false;
  const target = declarations.find(
    (declaration) => declaration.kind === 'enum' && declaration.name === node.name.getText(context.sourceFile),
  );
  if (!target || target.kind !== 'enum') return false;
  for (const statement of node.body.statements) {
    if (!ts.isFunctionDeclaration(statement) || !statement.name || !statement.body) return false;
    target.methods.push(lowerFunction(statement, context));
  }
  return true;
}

function enumMemberHasReverseMapping(member: ts.EnumMember, checker: ts.TypeChecker | undefined): boolean {
  const constant = checker?.getConstantValue(member);
  if (typeof constant === 'string') return false;
  if (typeof constant === 'number') return true;
  return !(
    member.initializer &&
    (ts.isStringLiteral(member.initializer) || ts.isNoSubstitutionTemplateLiteral(member.initializer))
  );
}

function lowerFunction(
  node: ts.FunctionDeclaration,
  context: LoweringContext,
  bodyOwnedByPatch = false,
): IrFunctionDeclaration {
  if (!node.name || !node.body) throw new Error('Expected named function with a body');
  const previousClassThis = context.classThis;
  const previousDynamicThisCapture = context.dynamicThisCapture;
  const thisCapture = dynamicThisCapture(node, context);
  context.classThis = false;
  context.dynamicThisCapture = thisCapture;
  try {
    const loweredParameters = lowerParameterList(node.parameters, context);
    return {
      async: hasModifier(node, ts.SyntaxKind.AsyncKeyword),
      body: bodyOwnedByPatch ? [] : [...loweredParameters.prefix, ...lowerStatementList(node.body.statements, context)],
      exported: hasModifier(node, ts.SyntaxKind.ExportKeyword),
      kind: 'function',
      name: node.name.text,
      origin: origin(node, context),
      parameters: loweredParameters.parameters,
      returns:
        (node.type ? lowerType(node.type, context) : inferredReturnType(node, context)) ??
        (hasModifier(node, ts.SyntaxKind.AsyncKeyword)
          ? promiseOfDynamic()
          : hasReturnValue(node.body)
            ? { kind: 'dynamic' }
            : { kind: 'primitive', name: 'Void' }),
      ...(thisCapture ? { thisCapture } : {}),
      typeParameterConstraints: lowerTypeParameterConstraints(node.typeParameters, context),
      typeParameters: node.typeParameters?.map((parameter) => parameter.name.text) ?? [],
    };
  } finally {
    context.classThis = previousClassThis;
    context.dynamicThisCapture = previousDynamicThisCapture;
  }
}

function lowerFunctionOverload(node: ts.FunctionDeclaration, context: LoweringContext): IrFunctionOverload {
  if (!node.name || node.body) throw new Error('Expected a named function overload without a body');
  const loweredParameters = lowerParameterList(node.parameters, context);
  if (loweredParameters.prefix.length > 0) {
    return unsupported(node, context, 'destructured function overload');
  }
  return {
    parameters: loweredParameters.parameters.map((parameter) => ({
      ...parameter,
      type: expandPrivateOverloadType(parameter.type, context),
    })),
    returns: expandPrivateOverloadType(
      node.type ? lowerType(node.type, context) : (inferredReturnType(node, context) ?? { kind: 'dynamic' }),
      context,
    ),
    typeParameterConstraints: lowerTypeParameterConstraints(node.typeParameters, context)?.map((constraint) =>
      constraint ? expandPrivateOverloadType(constraint, context) : undefined,
    ),
    typeParameters: node.typeParameters?.map((parameter) => parameter.name.text) ?? [],
  };
}

function expandPrivateOverloadType(
  type: IrType,
  context: LoweringContext,
  substitutions: ReadonlyMap<string, IrType> = new Map(),
  stack: ReadonlySet<string> = new Set(),
): IrType {
  switch (type.kind) {
    case 'anonymous':
      return {
        extends: type.extends.map((item) => expandPrivateOverloadType(item, context, substitutions, stack)),
        fields: type.fields.map((field) => ({
          ...field,
          type: expandPrivateOverloadType(field.type, context, substitutions, stack),
        })),
        kind: 'anonymous',
      };
    case 'array':
      return { element: expandPrivateOverloadType(type.element, context, substitutions, stack), kind: 'array' };
    case 'function':
      return {
        kind: 'function',
        parameters: type.parameters.map((item) => expandPrivateOverloadType(item, context, substitutions, stack)),
        returns: expandPrivateOverloadType(type.returns, context, substitutions, stack),
      };
    case 'named': {
      const substitution = type.arguments.length === 0 ? substitutions.get(type.name) : undefined;
      if (substitution) {
        const substitutionKey = `type-parameter:${type.name}`;
        if (
          stack.has(substitutionKey) ||
          (substitution.kind === 'named' && substitution.name === type.name && substitution.arguments.length === 0)
        ) {
          return type;
        }
        return expandPrivateOverloadType(substitution, context, substitutions, new Set([...stack, substitutionKey]));
      }
      const declaration = context.privateTypeAliases.get(type.name);
      if (!declaration || stack.has(type.name)) {
        return {
          arguments: type.arguments.map((item) => expandPrivateOverloadType(item, context, substitutions, stack)),
          kind: 'named',
          name: type.name,
        };
      }
      const arguments_ = type.arguments.map((item) => expandPrivateOverloadType(item, context, substitutions, stack));
      const aliasSubstitutions = new Map(substitutions);
      declaration.typeParameters?.forEach((parameter, index) => {
        aliasSubstitutions.set(parameter.name.text, arguments_[index] ?? { kind: 'dynamic' });
      });
      return expandPrivateOverloadType(
        lowerType(declaration.type, context),
        context,
        aliasSubstitutions,
        new Set([...stack, type.name]),
      );
    }
    case 'nullable':
      return { inner: expandPrivateOverloadType(type.inner, context, substitutions, stack), kind: 'nullable' };
    case 'union':
      return {
        alternatives: type.alternatives.map((item) => expandPrivateOverloadType(item, context, substitutions, stack)),
        kind: 'union',
      };
    case 'dynamic':
    case 'primitive':
      return type;
  }
}

function lowerTypeParameterConstraints(
  parameters: ts.NodeArray<ts.TypeParameterDeclaration> | undefined,
  context: LoweringContext,
): Array<IrType | undefined> | undefined {
  if (!parameters?.some((parameter) => parameter.constraint)) return undefined;
  return parameters.map((parameter) => (parameter.constraint ? lowerType(parameter.constraint, context) : undefined));
}

function freshThisCapture(context: LoweringContext): string {
  let name: string;
  do name = `__thisValue${String(context.temporaryIndex++)}`;
  while (context.sourceFile.text.includes(name));
  return name;
}

function dynamicThisCapture(node: ts.Node, context: LoweringContext): string | undefined {
  return containsLexicallyOwnedThis(node) ? freshThisCapture(context) : undefined;
}

function containsLexicallyOwnedThis(root: ts.Node): boolean {
  let found = false;
  const visit = (node: ts.Node): void => {
    if (found) return;
    if (node.kind === ts.SyntaxKind.ThisKeyword) {
      found = true;
      return;
    }
    if (node !== root && ts.isFunctionLike(node) && !ts.isArrowFunction(node)) return;
    if (node !== root && (ts.isClassDeclaration(node) || ts.isClassExpression(node))) return;
    ts.forEachChild(node, visit);
  };
  visit(root);
  return found;
}

function lowerParameter(node: ts.ParameterDeclaration, context: LoweringContext): IrParameter {
  if (!ts.isIdentifier(node.name)) unsupported(node.name, context, 'binding pattern parameter');
  return {
    initializer: node.initializer ? lowerExpression(node.initializer, context) : undefined,
    name: node.name.text,
    optional: Boolean(node.questionToken),
    rest: Boolean(node.dotDotDotToken),
    type: node.type ? lowerType(node.type, context) : (inferredType(node.name, context) ?? { kind: 'dynamic' }),
  };
}

function lowerParameterList(
  nodes: readonly ts.ParameterDeclaration[],
  context: LoweringContext,
): { parameters: IrParameter[]; prefix: IrStatement[] } {
  const parameters: IrParameter[] = [];
  const prefix: IrStatement[] = [];
  for (const node of nodes) {
    if (isThisParameter(node)) continue;
    if (ts.isIdentifier(node.name)) {
      parameters.push(lowerParameter(node, context));
      continue;
    }
    const name = `__parameter${String(context.temporaryIndex++)}`;
    parameters.push({
      initializer: node.initializer ? lowerExpression(node.initializer, context) : undefined,
      name,
      optional: Boolean(node.questionToken),
      rest: Boolean(node.dotDotDotToken),
      type: node.type ? lowerType(node.type, context) : (inferredType(node.name, context) ?? { kind: 'dynamic' }),
    });
    const declarations: IrVariable[] = [];
    lowerBindingPattern(node.name, { kind: 'identifier', name }, false, declarations, context, {
      destructuringSource: 'parameter',
      sourceType: context.checker?.getTypeAtLocation(node.name),
    });
    prefix.push({ declarations, kind: 'variable' });
  }
  return { parameters, prefix };
}

function recordHostType(
  identity: HostTypeIdentity,
  node: ts.Node,
  context: LoweringContext,
  use:
    | { arity: number; kind: 'type-reference' }
    | { kind: 'member'; member: string; operation: 'call' | 'read' | 'write' },
): void {
  const position = context.sourceFile.getLineAndCharacterOfPosition(node.getStart(context.sourceFile));
  const record: HostTypeUse = {
    arity: use.kind === 'type-reference' ? use.arity : identity.arity,
    column: position.character + 1,
    declarationSources: identity.declarationSources,
    kind: use.kind,
    line: position.line + 1,
    ...(use.kind === 'member' ? { member: use.member, operation: use.operation } : {}),
    name: identity.name,
    source: path.relative(context.workspaceDirectory, context.sourceFile.fileName).split(path.sep).join('/'),
  };
  const key = [
    record.name,
    record.source,
    record.line,
    record.column,
    record.kind,
    record.member ?? '',
    record.operation ?? '',
    record.arity,
  ].join(':');
  context.hostTypes.set(key, record);
}

function staticallyEmittedHostTypeIdentity(
  node: ts.Expression,
  context: LoweringContext,
): HostTypeIdentity | undefined {
  if (ts.isParenthesizedExpression(node) || ts.isNonNullExpression(node) || ts.isSatisfiesExpression(node)) {
    return staticallyEmittedHostTypeIdentity(node.expression, context);
  }
  if (ts.isAsExpression(node) || ts.isTypeAssertionExpression(node)) {
    return hostTypeIdentityForTypeNode(node.type, context.checker);
  }
  if (ts.isIdentifier(node) && !isLexicallyBound(node, context)) return undefined;
  // Only an identifier with an explicit mapped declaration is guaranteed to
  // retain its static host type in emitted Haxe. A property can have a host
  // type in TypeScript while its containing structural object is lowered
  // through `_Runtime.field`, so the resulting Haxe expression is Dynamic and
  // still needs a cast before direct member access.
  const symbol = ts.isIdentifier(node) ? context.checker?.getSymbolAtLocation(node) : undefined;
  const declaration = symbol?.valueDeclaration;
  const declaredType =
    declaration &&
    (ts.isParameter(declaration) ||
      ts.isVariableDeclaration(declaration) ||
      ts.isPropertyDeclaration(declaration) ||
      ts.isPropertySignature(declaration))
      ? declaration.type
      : undefined;
  return declaredType ? hostTypeIdentityForTypeNode(declaredType, context.checker) : undefined;
}

function hostTypeMemberBinding(
  node: ts.PropertyAccessExpression,
  context: LoweringContext,
): IrHostTypeBinding | undefined {
  const receiverType = context.checker?.getTypeAtLocation(node.expression);
  const property = context.checker?.getSymbolAtLocation(node.name);
  if (
    receiverType?.isIntersection() &&
    property?.declarations?.some((declaration) => !declaration.getSourceFile().isDeclarationFile)
  ) {
    return undefined;
  }
  const identity = hostTypeIdentityForExpression(node.expression, context.checker);
  if (!identity) return undefined;
  recordHostType(identity, node, context, {
    kind: 'member',
    member: node.name.text,
    operation: hostPropertyOperation(node),
  });
  return {
    haxeType:
      identity.arity > 0
        ? `${identity.haxeType}<${Array.from({ length: identity.arity }, () => 'Dynamic').join(', ')}>`
        : identity.haxeType,
    name: identity.name,
    receiverCast: staticallyEmittedHostTypeIdentity(node.expression, context)?.name !== identity.name,
  };
}

function lowerType(node: ts.TypeNode, context: LoweringContext): IrType {
  switch (node.kind) {
    case ts.SyntaxKind.AnyKeyword:
      return { kind: 'dynamic', reason: 'source-any' };
    case ts.SyntaxKind.UnknownKeyword:
      return { kind: 'dynamic', reason: 'source-unknown' };
    case ts.SyntaxKind.NeverKeyword:
      return { kind: 'dynamic', reason: 'source-never' };
    case ts.SyntaxKind.UndefinedKeyword:
      return { kind: 'dynamic', reason: 'source-undefined' };
    case ts.SyntaxKind.ObjectKeyword:
      return { arguments: [], kind: 'named', name: 'flight._internal._Object' };
    case ts.SyntaxKind.BooleanKeyword:
      return { kind: 'primitive', name: 'Bool' };
    case ts.SyntaxKind.NumberKeyword:
      return { kind: 'primitive', name: 'Float' };
    case ts.SyntaxKind.SymbolKeyword:
      return { arguments: [], kind: 'named', name: 'flight._internal._Symbol' };
    case ts.SyntaxKind.StringKeyword:
      return { kind: 'primitive', name: 'String' };
    case ts.SyntaxKind.VoidKeyword:
      return { kind: 'primitive', name: 'Void' };
  }
  if (ts.isArrayTypeNode(node)) return { element: lowerType(node.elementType, context), kind: 'array' };
  if (ts.isTypeOperatorNode(node)) {
    if (node.operator === ts.SyntaxKind.KeyOfKeyword && context.checker) {
      const type = context.checker.getTypeFromTypeNode(node);
      return lowerCheckerType(type, node, context, new Set()) ?? checkerKnownUnrepresentable(type, context.checker);
    }
    return lowerType(node.type, context);
  }
  if (ts.isTypeQueryNode(node)) return { kind: 'dynamic' };
  if (ts.isTypeLiteralNode(node)) {
    return { extends: [], fields: lowerTypeMembers(node.members, context), kind: 'anonymous' };
  }
  if (ts.isTupleTypeNode(node)) {
    const elements = node.elements.map((element) => {
      const typeNode = ts.isNamedTupleMember(element)
        ? element.type
        : ts.isRestTypeNode(element)
          ? element.type
          : element;
      const lowered = lowerType(typeNode, context);
      const rest = ts.isRestTypeNode(element) || (ts.isNamedTupleMember(element) && Boolean(element.dotDotDotToken));
      return rest && lowered.kind === 'array' ? lowered.element : lowered;
    });
    return { element: commonType(elements), kind: 'array' };
  }
  if (ts.isParenthesizedTypeNode(node)) return lowerType(node.type, context);
  if (ts.isFunctionTypeNode(node)) {
    const parameters = lowerParameterList(node.parameters, context).parameters;
    return {
      kind: 'function',
      parameters: parameters.map((parameter) => parameter.type),
      returns: lowerType(node.type, context),
    };
  }
  if (ts.isConstructorTypeNode(node)) return { kind: 'dynamic' };
  if (ts.isTypePredicateNode(node)) return { kind: 'primitive', name: 'Bool' };
  if (ts.isTypeReferenceNode(node)) {
    const name = node.typeName.getText(context.sourceFile);
    let arguments_ = node.typeArguments?.map((argument) => lowerType(argument, context)) ?? [];
    let symbol = context.checker?.getSymbolAtLocation(node.typeName);
    if (symbol && context.checker && (symbol.flags & ts.SymbolFlags.Alias) !== 0) {
      symbol = context.checker.getAliasedSymbol(symbol);
    }
    arguments_ = lowerConstrainedAnyTypeArguments(node, symbol, arguments_, context);
    const operatorBound = symbol?.declarations?.some(
      (declaration) =>
        ts.isTypeParameterDeclaration(declaration) &&
        (ts.isInferTypeNode(declaration.parent) || ts.isMappedTypeNode(declaration.parent)),
    );
    if (operatorBound) return { arguments: [], kind: 'named', name: 'flight._internal._Infer' };
    const declaredArity = Math.max(
      0,
      ...(symbol?.declarations ?? []).map((declaration) =>
        ts.isTypeAliasDeclaration(declaration) ||
        ts.isInterfaceDeclaration(declaration) ||
        ts.isClassDeclaration(declaration)
          ? (declaration.typeParameters?.length ?? 0)
          : 0,
      ),
    );
    if (arguments_.length === 0 && declaredArity > 0 && context.checker) {
      const defaultTypes = checkerTypeArguments(context.checker.getTypeFromTypeNode(node), context.checker).slice(
        0,
        declaredArity,
      );
      const directlyRepresentableDefaults = defaultTypes.every(
        (argument) =>
          (argument.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown)) !== 0 ||
          typeOnlyHasFlags(argument, context.checker!, ts.TypeFlags.BooleanLike) ||
          typeOnlyHasFlags(argument, context.checker!, ts.TypeFlags.NumberLike) ||
          typeOnlyHasFlags(argument, context.checker!, ts.TypeFlags.StringLike),
      );
      if (defaultTypes.length === declaredArity && directlyRepresentableDefaults) {
        arguments_ = defaultTypes.map(
          (argument): IrType => lowerCheckerType(argument, node, context, new Set()) ?? { kind: 'dynamic' },
        );
      }
    }
    if (name === 'DeepReadonly') {
      return { arguments: arguments_, kind: 'named', name: 'flight._internal._DeepReadonly' };
    }
    if (context.erasedLocalTypes.has(name)) {
      const localDeclaration = symbol?.declarations?.find(
        (declaration) =>
          (ts.isInterfaceDeclaration(declaration) || ts.isTypeAliasDeclaration(declaration)) &&
          !ts.isSourceFile(declaration.parent),
      );
      if (localDeclaration && context.checker) {
        const localType = context.checker.getTypeFromTypeNode(node);
        return (
          lowerCheckerType(localType, node, context, new Set()) ??
          checkerKnownUnrepresentable(localType, context.checker)
        );
      }
      return { kind: 'dynamic', reason: 'source-unknown' };
    }
    const concreteMappedReference = lowerConcreteClosedMappedTypeReference(node, symbol, context);
    if (concreteMappedReference) return concreteMappedReference;
    if (name === 'Error') return { arguments: [], kind: 'named', name: 'haxe.Exception' };
    const portableType = portableTypeReferenceMap[name];
    const standardType =
      !context.checker ||
      standardLibraryType(context.checker.getTypeFromTypeNode(node), name) ||
      standardLibraryTypeSymbol(context.checker.getSymbolAtLocation(node.typeName), name, context.checker);
    if (portableType && standardType) return { arguments: [], kind: 'named', name: portableType };
    const standardGenericType = standardGenericTypeReferenceMap[name];
    if (standardGenericType && standardType) {
      const genericArguments = [...arguments_];
      while (genericArguments.length < standardGenericType.arity) {
        genericArguments.push({ kind: 'dynamic', reason: 'source-unknown' });
      }
      return { arguments: genericArguments, kind: 'named', name: standardGenericType.haxeType };
    }
    const collectionType = collectionTypeReferenceMap[name];
    if (collectionType && standardType) {
      const collectionArguments = [...arguments_];
      while (collectionArguments.length < collectionType.arity) collectionArguments.push({ kind: 'dynamic' });
      return { arguments: collectionArguments, kind: 'named', name: collectionType.haxeType };
    }
    if (context.externalTypes.has(name.split('.')[0]!)) return { kind: 'dynamic' };
    if (
      standardDynamicTypes.has(name) ||
      name.startsWith('Intl.') ||
      name.startsWith('globalThis.') ||
      name === 'RegExpExecArray'
    ) {
      return { kind: 'dynamic' };
    }
    const utilityType = {
      Exclude: 'flight._internal._Exclude',
      Extract: 'flight._internal._Extract',
      Omit: 'flight._internal._Omit',
      Partial: 'flight._internal._Partial',
      Pick: 'flight._internal._Pick',
      Required: 'flight._internal._Required',
    }[name];
    if (utilityType && standardType) return { arguments: arguments_, kind: 'named', name: utilityType };
    if (['Awaited', 'NonNullable', 'Readonly'].includes(name) && arguments_[0]) {
      return arguments_[0];
    }
    if (name === 'Parameters') return { element: { kind: 'dynamic' }, kind: 'array' };
    if (['InstanceType', 'PropertyKey', 'ReturnType', 'ThisParameterType'].includes(name)) {
      return { kind: 'dynamic' };
    }
    if (name === 'Promise') {
      const promiseType =
        arguments_[0]?.kind === 'primitive' && arguments_[0].name === 'Void'
          ? { arguments: [], kind: 'named' as const, name: 'flight._internal._Nothing' }
          : (arguments_[0] ?? { kind: 'dynamic' as const });
      return { arguments: [promiseType], kind: 'named', name: 'flight._internal._Promise' };
    }
    if (name === 'Array' || name === 'ReadonlyArray') {
      return { element: arguments_[0] ?? { kind: 'dynamic' }, kind: 'array' };
    }
    const hostType = hostTypeIdentityForTypeNode(node, context.checker);
    if (hostType) {
      const hostArguments = [...arguments_];
      while (hostArguments.length < hostType.arity) hostArguments.push({ kind: 'dynamic' });
      recordHostType(hostType, node, context, { arity: hostArguments.length, kind: 'type-reference' });
      return { arguments: hostArguments, kind: 'named', name: hostType.haxeType };
    }
    return { arguments: arguments_, kind: 'named', name };
  }
  if (ts.isUnionTypeNode(node)) {
    const concrete = node.types.filter((item) => !isNullishType(item));
    const nullable = concrete.length !== node.types.length;
    const inner =
      concrete.length === 1
        ? lowerType(concrete[0]!, context)
        : commonType(concrete.map((item) => lowerType(item, context)));
    return nullable && !(inner.kind === 'primitive' && inner.name === 'Void') ? { inner, kind: 'nullable' } : inner;
  }
  if (ts.isIntersectionTypeNode(node)) {
    const types = node.types.map((item) => lowerType(item, context));
    const stringType = types.find((item) => item.kind === 'primitive' && item.name === 'String');
    if (stringType) return stringType;
    const nodeType = types.find((item) => item.kind === 'named' && item.name === 'Node');
    const genericIndex = node.types.findIndex((item) => {
      if (context.checker) {
        return (context.checker.getTypeFromTypeNode(item).flags & ts.TypeFlags.TypeParameter) !== 0;
      }
      return ts.isTypeReferenceNode(item) && ['D', 'R', 'T', 'Traits', 'Type', 'U'].includes(item.typeName.getText());
    });
    const genericPartner = genericIndex < 0 ? undefined : types[genericIndex];
    if (types.length === 2 && nodeType && genericPartner) return lowerIntersection(types, true);
    if (genericPartner) return genericPartner;
    const concrete = types.filter((item) => item.kind !== 'dynamic');
    if (concrete.length === 0) return { kind: 'dynamic' };
    if (concrete.length === 1) return concrete[0]!;
    return lowerIntersection(
      concrete,
      concrete.some((item) => item.kind === 'named' && context.utilityAliasNames.has(item.name)) ||
        Boolean(
          context.checker &&
          (node.types.some((item) => context.checker!.getTypeFromTypeNode(item).isUnion()) ||
            checkerTypesHaveConflictingProperties(
              node.types.map((item) => context.checker!.getTypeFromTypeNode(item)),
              context.checker,
            )),
        ),
    );
  }
  if (ts.isIndexedAccessTypeNode(node)) {
    return {
      arguments: [lowerType(node.objectType, context), lowerType(node.indexType, context)],
      kind: 'named',
      name: 'flight._internal._IndexedAccess',
    };
  }
  if (ts.isInferTypeNode(node)) {
    return { arguments: [], kind: 'named', name: 'flight._internal._Infer' };
  }
  if (ts.isConditionalTypeNode(node)) {
    return {
      arguments: [
        lowerType(node.checkType, context),
        lowerType(node.extendsType, context),
        lowerType(node.trueType, context),
        lowerType(node.falseType, context),
      ],
      kind: 'named',
      name: 'flight._internal._Conditional',
    };
  }
  if (ts.isMappedTypeNode(node)) {
    return {
      arguments: [
        node.typeParameter.constraint ? lowerType(node.typeParameter.constraint, context) : { kind: 'dynamic' },
        node.type ? lowerType(node.type, context) : { kind: 'dynamic' },
      ],
      kind: 'named',
      name: 'flight._internal._Mapped',
    };
  }
  if (ts.isLiteralTypeNode(node)) {
    if (node.literal.kind === ts.SyntaxKind.NullKeyword) return { kind: 'dynamic' };
    if (ts.isStringLiteral(node.literal)) return { kind: 'primitive', name: 'String' };
    if (ts.isNumericLiteral(node.literal)) return { kind: 'primitive', name: 'Float' };
    if (
      ts.isPrefixUnaryExpression(node.literal) &&
      node.literal.operator === ts.SyntaxKind.MinusToken &&
      ts.isNumericLiteral(node.literal.operand)
    ) {
      return { kind: 'primitive', name: 'Float' };
    }
    if (node.literal.kind === ts.SyntaxKind.TrueKeyword || node.literal.kind === ts.SyntaxKind.FalseKeyword) {
      return { kind: 'primitive', name: 'Bool' };
    }
  }
  // TypeScript template-literal types are refinements of string. Haxe cannot
  // encode their pattern constraint, but retaining String preserves the
  // source value domain without inventing an external toolkit identity.
  if (ts.isTemplateLiteralTypeNode(node)) return { kind: 'primitive', name: 'String' };
  return unsupported(node, context, `type ${ts.SyntaxKind[node.kind] ?? node.kind}`);
}

function lowerConstrainedAnyTypeArguments(
  node: ts.TypeReferenceNode,
  symbol: ts.Symbol | undefined,
  loweredArguments: readonly IrType[],
  context: LoweringContext,
): IrType[] {
  const checker = context.checker;
  if (!checker || !node.typeArguments) return [...loweredArguments];
  return loweredArguments.map((lowered, index) => {
    if (node.typeArguments?.[index]?.kind !== ts.SyntaxKind.AnyKeyword) return lowered;
    const declaration = (symbol?.declarations ?? []).find(
      (declaration) =>
        (ts.isTypeAliasDeclaration(declaration) ||
          ts.isInterfaceDeclaration(declaration) ||
          ts.isClassDeclaration(declaration)) &&
        declaration.typeParameters?.[index]?.constraint,
    );
    if (
      !declaration ||
      (!ts.isTypeAliasDeclaration(declaration) &&
        !ts.isInterfaceDeclaration(declaration) &&
        !ts.isClassDeclaration(declaration))
    ) {
      return lowered;
    }
    const constraintNode = declaration.typeParameters?.[index]?.constraint;
    if (!constraintNode) return lowered;
    const constraintType = checker.getTypeFromTypeNode(constraintNode);
    if (typeOnlyHasFlags(constraintType, checker, ts.TypeFlags.BooleanLike)) {
      return { kind: 'primitive', name: 'Bool' };
    }
    if (typeOnlyHasFlags(constraintType, checker, ts.TypeFlags.NumberLike)) {
      return { kind: 'primitive', name: 'Float' };
    }
    if (typeOnlyHasFlags(constraintType, checker, ts.TypeFlags.StringLike)) {
      return { kind: 'primitive', name: 'String' };
    }
    return lowered;
  });
}

function inferredType(node: ts.Node, context: LoweringContext): IrType | undefined {
  if (!context.preserveInferredTypes) return undefined;
  const checker = context.checker;
  if (!checker) return undefined;
  const type = checker.getTypeAtLocation(node);
  return lowerCheckerType(type, node, context, new Set()) ?? checkerKnownUnrepresentable(type, checker);
}

function inferredReturnType(node: ts.SignatureDeclaration, context: LoweringContext): IrType | undefined {
  if (!context.preserveInferredTypes) return undefined;
  const checker = context.checker;
  if (!checker) return undefined;
  let contextualType: ts.Type | undefined;
  if (ts.isArrowFunction(node) || ts.isFunctionExpression(node)) {
    contextualType = checker.getContextualType(node);
  } else if (ts.isMethodDeclaration(node) && ts.isObjectLiteralExpression(node.parent)) {
    const owner = checker.getContextualType(node.parent);
    const property = owner && checker.getPropertyOfType(owner, propertyName(node.name, context));
    contextualType = property && checker.getTypeOfSymbolAtLocation(property, node);
  }
  const contextualSignature = contextualType && checker.getSignaturesOfType(contextualType, ts.SignatureKind.Call)[0];
  let loweredContextualReturn: IrType | undefined;
  if (contextualSignature) {
    const contextualReturn = checker.getReturnTypeOfSignature(contextualSignature);
    loweredContextualReturn = lowerCheckerType(contextualReturn, node, context, new Set());
    if (loweredContextualReturn?.kind !== 'dynamic') return loweredContextualReturn;
  }
  const signature = checker.getSignatureFromDeclaration(node);
  if (!signature) return undefined;
  const type = checker.getReturnTypeOfSignature(signature);
  return (
    lowerCheckerType(type, node, context, new Set()) ??
    loweredContextualReturn ??
    checkerKnownUnrepresentable(type, checker)
  );
}

function checkerKnownUnrepresentable(type: ts.Type, checker: ts.TypeChecker): IrType {
  return {
    detail: checker.typeToString(type, undefined, ts.TypeFormatFlags.NoTruncation),
    kind: 'dynamic',
    reason: 'checker-known-unrepresentable',
  };
}

function lowerCheckerType(
  type: ts.Type,
  node: ts.Node,
  context: LoweringContext,
  seen: Set<ts.Type>,
): IrType | undefined {
  const cacheable = seen.size === 0;
  if (cacheable && context.checkerTypeCache.has(type)) {
    return context.checkerTypeCache.get(type) ?? undefined;
  }
  const lowered = lowerCheckerTypeUncached(type, node, context, seen);
  if (cacheable) context.checkerTypeCache.set(type, lowered ?? null);
  return lowered;
}

function lowerCheckerTypeUncached(
  type: ts.Type,
  node: ts.Node,
  context: LoweringContext,
  seen: Set<ts.Type>,
): IrType | undefined {
  const checker = context.checker;
  if (!checker || seen.has(type)) return undefined;
  const nextSeen = new Set(seen).add(type);
  if ((type.flags & ts.TypeFlags.Any) !== 0) return { kind: 'dynamic', reason: 'source-any' };
  if ((type.flags & ts.TypeFlags.Unknown) !== 0) return { kind: 'dynamic', reason: 'source-unknown' };
  if ((type.flags & ts.TypeFlags.Never) !== 0) return { kind: 'dynamic', reason: 'source-never' };
  if ((type.flags & ts.TypeFlags.Undefined) !== 0) return { kind: 'dynamic', reason: 'source-undefined' };
  if ((type.flags & ts.TypeFlags.BooleanLike) !== 0) return { kind: 'primitive', name: 'Bool' };
  if ((type.flags & ts.TypeFlags.NumberLike) !== 0) return { kind: 'primitive', name: 'Float' };
  if ((type.flags & ts.TypeFlags.StringLike) !== 0) return { kind: 'primitive', name: 'String' };
  if ((type.flags & ts.TypeFlags.ESSymbolLike) !== 0) {
    return { arguments: [], kind: 'named', name: 'flight._internal._Symbol' };
  }
  if ((type.flags & ts.TypeFlags.NonPrimitive) !== 0) {
    return { arguments: [], kind: 'named', name: 'flight._internal._Object' };
  }
  if ((type.flags & ts.TypeFlags.IndexedAccess) !== 0) {
    const indexed = type as ts.IndexedAccessType;
    const objectType = lowerCheckerType(indexed.objectType, node, context, nextSeen);
    const indexType = lowerCheckerType(indexed.indexType, node, context, nextSeen);
    return objectType && indexType
      ? {
          arguments: [objectType, indexType],
          kind: 'named',
          name: 'flight._internal._IndexedAccess',
        }
      : undefined;
  }
  if ((type.flags & ts.TypeFlags.Void) !== 0) return { kind: 'primitive', name: 'Void' };
  if ((type.flags & ts.TypeFlags.Null) !== 0) return { kind: 'dynamic', reason: 'source-null' };
  const symbol = type.aliasSymbol ?? type.getSymbol();
  const name = symbol?.getName();
  const rawArguments = checkerTypeArguments(type, checker);
  const arguments_ = rawArguments.map(
    (argument) => lowerCheckerType(argument, node, context, nextSeen) ?? ({ kind: 'dynamic' } as const),
  );
  if (name === 'Readonly' && rawArguments[0]) {
    return lowerCheckerType(rawArguments[0], node, context, nextSeen);
  }
  const standardGenericType =
    name && standardLibraryType(type, name) ? standardGenericTypeReferenceMap[name] : undefined;
  if (standardGenericType) {
    const genericArguments = [...arguments_];
    while (genericArguments.length < standardGenericType.arity) {
      genericArguments.push({ kind: 'dynamic', reason: 'source-unknown' });
    }
    return { arguments: genericArguments, kind: 'named', name: standardGenericType.haxeType };
  }
  const concreteMappedType = lowerConcreteClosedMappedCheckerType(type, node, context, nextSeen);
  if (concreteMappedType) return concreteMappedType;
  // Preserve a source-visible alias before decomposing its union or
  // intersection. The alias is the portable identity; its implementation is
  // not a request to inline a potentially recursive structural graph.
  if (name && context.visibleTypeNames.has(name)) return { arguments: arguments_, kind: 'named', name };
  if (name && sourceDefinedNamedType(symbol)) return { arguments: arguments_, kind: 'named', name };
  const privateSourceType = name && sourceDefinedPrivateTypeName(symbol, context);
  if (privateSourceType) return { arguments: arguments_, kind: 'named', name: privateSourceType };
  if (name && context.externalTypes.has(name)) {
    return { kind: 'dynamic', reason: 'external-toolkit-boundary' };
  }
  if (name && standardLibraryType(type, name) && type.aliasSymbol) {
    return { kind: 'dynamic', reason: 'standard-toolkit-boundary' };
  }
  if (type.isUnion()) {
    const concrete = type.types.filter((item) => (item.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) === 0);
    const lowered = concrete.map((item) => lowerCheckerType(item, node, context, nextSeen));
    if (lowered.some((item) => !item)) return undefined;
    const inner = commonType(lowered as IrType[]);
    return concrete.length === type.types.length || (inner.kind === 'primitive' && inner.name === 'Void')
      ? inner
      : { inner, kind: 'nullable' };
  }
  if (type.isIntersection()) {
    const lowered = type.types.map((item) => lowerCheckerType(item, node, context, nextSeen));
    if (lowered.some((item) => !item)) return undefined;
    const concrete = (lowered as IrType[]).filter((item) => item.kind !== 'dynamic');
    if (concrete.length === 0) return commonType(lowered as IrType[]);
    if (concrete.length === 1) return concrete[0];
    return lowerIntersection(
      concrete,
      type.types.some(
        (item) => checkerTypeContainsTypeParameter(item, checker) || hostTypeIdentity(item, checker) !== undefined,
      ) || checkerTypesHaveConflictingProperties(type.types, checker),
    );
  }
  const hostType = hostTypeIdentity(type, checker);
  if (hostType) {
    const arguments_ = checkerTypeArguments(type, checker).map(
      (argument) => lowerCheckerType(argument, node, context, nextSeen) ?? ({ kind: 'dynamic' } as const),
    );
    while (arguments_.length < hostType.arity) arguments_.push({ kind: 'dynamic' });
    recordHostType(hostType, node, context, { arity: arguments_.length, kind: 'type-reference' });
    return { arguments: arguments_, kind: 'named', name: hostType.haxeType };
  }
  if (checker.isArrayType(type) || checker.isTupleType(type)) {
    const elements = checkerTypeArguments(type, checker).map((item) => lowerCheckerType(item, node, context, nextSeen));
    if (elements.length === 0 || elements.some((item) => !item)) return undefined;
    return { element: commonType(elements as IrType[]), kind: 'array' };
  }
  if ((type.flags & ts.TypeFlags.TypeParameter) !== 0) {
    const name = type.getSymbol()?.getName();
    return name ? { arguments: [], kind: 'named', name } : undefined;
  }
  if (name === 'Promise') {
    const promised = arguments_[0] ?? ({ kind: 'dynamic' } as const);
    return {
      arguments: [
        promised.kind === 'primitive' && promised.name === 'Void'
          ? { arguments: [], kind: 'named', name: 'flight._internal._Nothing' }
          : promised,
      ],
      kind: 'named',
      name: 'flight._internal._Promise',
    };
  }
  const portableType = name && standardLibraryType(type, name) ? portableTypeReferenceMap[name] : undefined;
  // TypeScript's ES library models typed-array backing buffers as a generic
  // implementation detail. The portable Haxe wrappers deliberately own that
  // storage choice and are not generic, so do not leak the lib.d.ts argument
  // into generated source.
  if (portableType) return { arguments: [], kind: 'named', name: portableType };
  const collectionType = name && standardLibraryType(type, name) ? collectionTypeReferenceMap[name] : undefined;
  if (collectionType) {
    const collectionArguments = [...arguments_];
    while (collectionArguments.length < collectionType.arity) collectionArguments.push({ kind: 'dynamic' });
    return { arguments: collectionArguments, kind: 'named', name: collectionType.haxeType };
  }
  if (name && standardDynamicTypes.has(name)) return { kind: 'dynamic', reason: 'standard-toolkit-boundary' };
  if (name && context.externalTypes.has(name)) return { kind: 'dynamic', reason: 'external-toolkit-boundary' };
  if (name && context.visibleTypeNames.has(name)) return { arguments: arguments_, kind: 'named', name };
  const declarationBoundary = checkerTypeDeclarationBoundary(type);
  if (declarationBoundary) return { kind: 'dynamic', reason: declarationBoundary };
  const signatures = checker.getSignaturesOfType(type, ts.SignatureKind.Call);
  if (signatures.length === 1) {
    const signature = signatures[0]!;
    const parameters = signature.getParameters().map((parameter) => {
      const declaration = parameter.valueDeclaration ?? parameter.declarations?.[0] ?? node;
      return lowerCheckerType(checker.getTypeOfSymbolAtLocation(parameter, declaration), node, context, nextSeen);
    });
    const returns = lowerCheckerType(checker.getReturnTypeOfSignature(signature), node, context, nextSeen);
    if (returns && parameters.every((parameter) => parameter)) {
      return { kind: 'function', parameters: parameters as IrType[], returns };
    }
  }
  if ((type.flags & ts.TypeFlags.Object) !== 0) {
    const sourceDefined = (symbol?.declarations ?? []).some(
      (declaration) => !declaration.getSourceFile().isDeclarationFile,
    );
    const fields = checker.getPropertiesOfType(type).flatMap((property): IrTypeField[] => {
      const declaration = property.valueDeclaration ?? property.declarations?.[0];
      if (!declaration || declaration.getSourceFile().isDeclarationFile) return [];
      const fieldType = lowerCheckerType(
        checker.getTypeOfSymbolAtLocation(property, declaration),
        node,
        context,
        nextSeen,
      );
      return fieldType
        ? [
            {
              name: property.getName(),
              optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
              type: fieldType,
            },
          ]
        : [];
    });
    if (fields.length > 0 || sourceDefined || checker.typeToString(type) === '{}') {
      return { extends: [], fields, kind: 'anonymous' };
    }
  }
  return undefined;
}

function sourceDefinedNamedType(symbol: ts.Symbol | undefined): boolean {
  return (symbol?.declarations ?? []).some(
    (declaration) =>
      !declaration.getSourceFile().isDeclarationFile &&
      hasModifier(declaration, ts.SyntaxKind.ExportKeyword) &&
      (ts.isClassDeclaration(declaration) ||
        ts.isEnumDeclaration(declaration) ||
        ts.isInterfaceDeclaration(declaration) ||
        ts.isTypeAliasDeclaration(declaration)),
  );
}

/**
 * A checker-inferred type can retain the private identity of a declaration in
 * another source file even though the consuming file cannot name it in
 * TypeScript. Package modules merge those files and namespace every private
 * declaration by its source basename, so use that same deterministic identity
 * instead of recursively expanding (and eventually erasing) its structure.
 */
function sourceDefinedPrivateTypeName(symbol: ts.Symbol | undefined, context: LoweringContext): string | undefined {
  const currentPackageDirectory = upstreamPackageSourceDirectory(context.sourceFile, context.workspaceDirectory);
  if (!currentPackageDirectory) return undefined;
  const declaration = (symbol?.declarations ?? []).find(
    (candidate) =>
      candidate.getSourceFile() !== context.sourceFile &&
      ts.isSourceFile(candidate.parent) &&
      !candidate.getSourceFile().isDeclarationFile &&
      !hasModifier(candidate, ts.SyntaxKind.ExportKeyword) &&
      (ts.isClassDeclaration(candidate) ||
        ts.isEnumDeclaration(candidate) ||
        ts.isInterfaceDeclaration(candidate) ||
        ts.isTypeAliasDeclaration(candidate)),
  );
  if (!declaration) return undefined;
  const declarationPackageDirectory = upstreamPackageSourceDirectory(
    declaration.getSourceFile(),
    context.workspaceDirectory,
  );
  if (declarationPackageDirectory !== currentPackageDirectory) return undefined;
  const name = symbol?.getName();
  const suffix = path
    .basename(declaration.getSourceFile().fileName)
    .replace(/\.tsx?$/u, '')
    .replace(/[^A-Za-z0-9]/gu, '_');
  return name && suffix ? `${name}__${suffix}` : undefined;
}

function checkerTypeDeclarationBoundary(
  type: ts.Type,
): 'external-toolkit-boundary' | 'standard-toolkit-boundary' | undefined {
  const declarations = [
    ...(type.aliasSymbol?.declarations ?? []),
    ...(type.getSymbol()?.declarations ?? []),
    ...type.getCallSignatures().flatMap((signature) => (signature.declaration ? [signature.declaration] : [])),
    ...type.getProperties().flatMap((property) => property.declarations ?? []),
  ];
  const declarationFiles = declarations.filter((declaration) => declaration.getSourceFile().isDeclarationFile);
  if (declarationFiles.length === 0) return undefined;
  return declarationFiles.every((declaration) =>
    /^lib\..*\.d\.ts$/u.test(path.basename(declaration.getSourceFile().fileName)),
  )
    ? 'standard-toolkit-boundary'
    : 'external-toolkit-boundary';
}

function checkerTypeArguments(type: ts.Type, checker: ts.TypeChecker): readonly ts.Type[] {
  if (type.aliasSymbol) return type.aliasTypeArguments ?? [];
  return (type.flags & ts.TypeFlags.Object) !== 0 &&
    ((type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference) !== 0
    ? checker.getTypeArguments(type as ts.TypeReference)
    : [];
}

function isNullishType(node: ts.TypeNode): boolean {
  return (
    node.kind === ts.SyntaxKind.UndefinedKeyword ||
    node.kind === ts.SyntaxKind.NullKeyword ||
    (ts.isLiteralTypeNode(node) && node.literal.kind === ts.SyntaxKind.NullKeyword)
  );
}

function lowerTypeMembers(members: ts.NodeArray<ts.TypeElement>, context: LoweringContext) {
  const lowered = members.flatMap((member) => {
    try {
      const field = lowerTypeMember(member, context);
      return field ? [field] : [];
    } catch (error) {
      if (error instanceof UnsupportedSyntaxError) return [];
      throw error;
    }
  });
  return [...new Map(lowered.map((field) => [field.name, field])).values()];
}

function lowerConcreteClosedMappedAlias(
  declaration: ts.TypeAliasDeclaration,
  context: LoweringContext,
): Extract<IrType, { kind: 'anonymous' }> | undefined {
  const checker = context.checker;
  if (
    !checker ||
    declaration.typeParameters?.length ||
    !ts.isTypeReferenceNode(declaration.type) ||
    !declaration.type.typeArguments?.length
  ) {
    return undefined;
  }
  const wrapper = originalSymbolAtLocation(declaration.type.typeName, checker);
  if (!closedMappedAliasWrapper(wrapper, checker)) return undefined;

  const resolved = checker.getTypeFromTypeNode(declaration.type);
  return lowerResolvedConcreteMappedType(resolved, declaration.type.typeArguments[0]!, declaration, context);
}

function lowerConcreteClosedMappedTypeReference(
  node: ts.TypeReferenceNode,
  symbol: ts.Symbol | undefined,
  context: LoweringContext,
): Extract<IrType, { kind: 'anonymous' }> | undefined {
  const checker = context.checker;
  const targetNode = node.typeArguments?.[0];
  if (!checker || !targetNode || !closedMappedAliasWrapper(symbol, checker)) return undefined;
  return lowerResolvedConcreteMappedType(checker.getTypeFromTypeNode(node), targetNode, node, context);
}

function lowerResolvedConcreteMappedType(
  resolved: ts.Type,
  targetNode: ts.TypeNode,
  location: ts.Node,
  context: LoweringContext,
): Extract<IrType, { kind: 'anonymous' }> | undefined {
  const checker = context.checker;
  if (!checker) return undefined;
  if (
    (resolved.flags & ts.TypeFlags.Object) === 0 ||
    checker.getIndexInfosOfType(resolved).length > 0 ||
    checker.getSignaturesOfType(resolved, ts.SignatureKind.Call).length > 0 ||
    checker.getSignaturesOfType(resolved, ts.SignatureKind.Construct).length > 0
  ) {
    return undefined;
  }

  const resolvedProperties = new Map(
    checker.getPropertiesOfType(resolved).map((property) => [property.getName(), property]),
  );
  if (
    concreteAliasTargetIsGeneric(targetNode, checker) ||
    checkerTypeContainsTypeParameter(checker.getTypeFromTypeNode(targetNode), checker)
  ) {
    return undefined;
  }
  const target = checker.getTypeFromTypeNode(targetNode);
  const sourceOrder = concreteAliasTargetFieldOrder(targetNode, checker);
  const orderedProperties = checker
    .getPropertiesOfType(target)
    .flatMap((property) => {
      const resolvedProperty = resolvedProperties.get(property.getName());
      return resolvedProperty ? [resolvedProperty] : [];
    })
    .map((property, checkerOrder) => ({ checkerOrder, property }))
    .sort(
      (left, right) =>
        (sourceOrder.get(left.property.getName()) ?? Number.MAX_SAFE_INTEGER) -
          (sourceOrder.get(right.property.getName()) ?? Number.MAX_SAFE_INTEGER) ||
        left.checkerOrder - right.checkerOrder,
    )
    .map(({ property }) => property);
  if (orderedProperties.length !== resolvedProperties.size) return undefined;

  const fields: IrTypeField[] = [];
  const fieldNames = new Set<string>();
  for (const property of orderedProperties) {
    const propertyDeclaration = property.valueDeclaration ?? property.declarations?.[0];
    if (!propertyDeclaration || propertyDeclaration.getSourceFile().isDeclarationFile) return undefined;
    const name = concreteMappedPropertyName(property, propertyDeclaration, context);
    if (!name || fieldNames.has(name)) return undefined;
    const checkerType = checker.getTypeOfSymbolAtLocation(property, propertyDeclaration);
    const fieldType = concreteMappedFieldType(checkerType, propertyDeclaration, location, context);
    if (!fieldType) return undefined;
    fieldNames.add(name);
    fields.push({
      name,
      optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
      type: fieldType,
    });
  }
  return { extends: [], fields, kind: 'anonymous' };
}

function lowerConcreteClosedMappedCheckerType(
  type: ts.Type,
  node: ts.Node,
  context: LoweringContext,
  seen: Set<ts.Type>,
): Extract<IrType, { kind: 'anonymous' }> | undefined {
  const checker = context.checker;
  const symbol = type.aliasSymbol ?? type.getSymbol();
  const typeArguments = checker ? checkerTypeArguments(type, checker) : [];
  if (
    !checker ||
    !closedMappedAliasWrapper(symbol, checker) ||
    typeArguments.length === 0 ||
    typeArguments.some((argument) => checkerTypeContainsTypeParameter(argument, checker)) ||
    (type.flags & ts.TypeFlags.Object) === 0 ||
    checker.getIndexInfosOfType(type).length > 0 ||
    checker.getSignaturesOfType(type, ts.SignatureKind.Call).length > 0 ||
    checker.getSignaturesOfType(type, ts.SignatureKind.Construct).length > 0
  ) {
    return undefined;
  }

  const fields: IrTypeField[] = [];
  const fieldNames = new Set<string>();
  for (const property of checker.getPropertiesOfType(type)) {
    const propertyDeclaration = property.valueDeclaration ?? property.declarations?.[0];
    if (!propertyDeclaration || propertyDeclaration.getSourceFile().isDeclarationFile) return undefined;
    const name = concreteMappedPropertyName(property, propertyDeclaration, context);
    if (!name || fieldNames.has(name)) return undefined;
    const fieldType = lowerCheckerType(
      checker.getTypeOfSymbolAtLocation(property, propertyDeclaration),
      node,
      context,
      seen,
    );
    if (!fieldType) return undefined;
    fieldNames.add(name);
    fields.push({
      name,
      optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
      type: fieldType,
    });
  }
  return { extends: [], fields, kind: 'anonymous' };
}

function concreteAliasTargetIsGeneric(node: ts.TypeNode, checker: ts.TypeChecker): boolean {
  if (!ts.isTypeReferenceNode(node)) return false;
  const symbol = originalSymbolAtLocation(node.typeName, checker);
  return (symbol?.declarations ?? []).some(
    (declaration) =>
      (ts.isInterfaceDeclaration(declaration) ||
        ts.isTypeAliasDeclaration(declaration) ||
        ts.isClassDeclaration(declaration)) &&
      Boolean(declaration.typeParameters?.length),
  );
}

function concreteMappedFieldType(
  checkerType: ts.Type,
  propertyDeclaration: ts.Declaration,
  location: ts.Node,
  context: LoweringContext,
): IrType | undefined {
  if (
    (ts.isPropertySignature(propertyDeclaration) || ts.isPropertyDeclaration(propertyDeclaration)) &&
    propertyDeclaration.type
  ) {
    const checker = context.checker;
    if (checker && checkerTypeContainsTypeParameter(checker.getTypeFromTypeNode(propertyDeclaration.type), checker)) {
      return lowerCheckerType(checkerType, location, context, new Set());
    }
    const declared = lowerType(propertyDeclaration.type, {
      ...context,
      sourceFile: propertyDeclaration.getSourceFile(),
    });
    const nullish = checkerType.isUnion()
      ? checkerType.types.some((item) => (item.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) !== 0)
      : (checkerType.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) !== 0;
    return nullish && declared.kind !== 'dynamic' && declared.kind !== 'nullable'
      ? { inner: declared, kind: 'nullable' }
      : declared;
  }
  return lowerCheckerType(checkerType, location, context, new Set());
}

function concreteAliasTargetFieldOrder(node: ts.TypeNode, checker: ts.TypeChecker): ReadonlyMap<string, number> {
  if (!ts.isTypeReferenceNode(node)) return new Map();
  const symbol = originalSymbolAtLocation(node.typeName, checker);
  const names: string[] = [];
  for (const declaration of symbol?.declarations ?? []) {
    if (!ts.isInterfaceDeclaration(declaration) && !ts.isTypeLiteralNode(declaration)) continue;
    for (const member of declaration.members) {
      if (!ts.isPropertySignature(member) || !member.name) continue;
      const property = checker.getSymbolAtLocation(member.name);
      if (property) names.push(property.getName());
    }
  }
  return new Map(names.map((name, index) => [name, index]));
}

function closedMappedAliasWrapper(symbol: ts.Symbol | undefined, checker: ts.TypeChecker): boolean {
  if (closedStandardMappedUtility(symbol)) return true;
  for (const declaration of symbol?.declarations ?? []) {
    if (!ts.isTypeAliasDeclaration(declaration) || !declaration.typeParameters?.length) continue;
    if (!ts.isTypeReferenceNode(declaration.type)) continue;
    const wrapped = originalSymbolAtLocation(declaration.type.typeName, checker);
    if (closedStandardMappedUtility(wrapped)) return true;
  }
  return false;
}

function closedStandardMappedUtility(symbol: ts.Symbol | undefined): boolean {
  return ['Omit', 'Partial', 'Pick'].some((name) => standardLibraryTypeSymbol(symbol, name));
}

function concreteMappedPropertyName(
  property: ts.Symbol,
  declaration: ts.Declaration,
  context: LoweringContext,
): string | undefined {
  if (ts.isPropertySignature(declaration) || ts.isPropertyDeclaration(declaration)) {
    return propertyName(declaration.name, context);
  }
  const name = property.getName();
  return name.startsWith('__@') ? undefined : name;
}

function lowerExpressionWithTypeArguments(node: ts.ExpressionWithTypeArguments, context: LoweringContext): IrType {
  const name = node.expression.getText(context.sourceFile);
  const arguments_ = node.typeArguments?.map((argument) => lowerType(argument, context)) ?? [];
  if (standardDynamicTypes.has(name) || context.externalTypes.has(name.split('.')[0]!)) return { kind: 'dynamic' };
  if (name === 'Partial' && context.checker) {
    const mapped = lowerConcreteClosedMappedCheckerType(
      context.checker.getTypeAtLocation(node),
      node,
      context,
      new Set(),
    );
    if (mapped) return mapped;
  }
  if (
    [
      'Exclude',
      'Extract',
      'InstanceType',
      'Omit',
      'Partial',
      'Pick',
      'PropertyKey',
      'ReturnType',
      'ThisParameterType',
    ].includes(name)
  ) {
    return { kind: 'dynamic' };
  }
  if (['Awaited', 'NonNullable', 'Readonly'].includes(name) && arguments_[0]) {
    return arguments_[0];
  }
  const hostType = context.checker
    ? hostTypeIdentity(context.checker.getTypeAtLocation(node), context.checker)
    : undefined;
  if (hostType) {
    const hostArguments = [...arguments_];
    while (hostArguments.length < hostType.arity) hostArguments.push({ kind: 'dynamic' });
    recordHostType(hostType, node, context, { arity: hostArguments.length, kind: 'type-reference' });
    if (hostType.name === 'EventTarget') {
      return { arguments: hostArguments, kind: 'named', name: hostType.haxeType };
    }
    // Haxe anonymous structures can only extend other structures. The host
    // identity remains in the toolkit audit; the local declaration carries
    // the source-defined structural slice that portable targets consume.
    return { kind: 'dynamic', reason: 'external-toolkit-boundary' };
  }
  return {
    arguments: arguments_,
    kind: 'named',
    name,
  };
}

function lowerTypeMember(node: ts.TypeElement, context: LoweringContext) {
  if (ts.isPropertySignature(node) && node.type) {
    return {
      contextualParameters: ts.isFunctionTypeNode(node.type)
        ? lowerParameterList(node.type.parameters, context).parameters
        : undefined,
      name: propertyName(node.name, context),
      optional: Boolean(node.questionToken) || ts.isComputedPropertyName(node.name),
      type: lowerType(node.type, context),
    };
  }
  if (ts.isMethodSignature(node)) {
    const parameters = lowerParameterList(node.parameters, context).parameters;
    return {
      contextualParameters: parameters,
      name: propertyName(node.name, context),
      optional: Boolean(node.questionToken),
      type: {
        kind: 'function' as const,
        parameters: parameters.map((parameter) => parameter.type),
        returns: (node.type ? lowerType(node.type, context) : inferredReturnType(node, context)) ?? {
          kind: 'dynamic' as const,
        },
      },
    };
  }
  if (ts.isIndexSignatureDeclaration(node)) return undefined;
  if (ts.isConstructSignatureDeclaration(node)) {
    return {
      name: '__construct',
      optional: true,
      type: { kind: 'dynamic' as const },
    };
  }
  return unsupported(node, context, `type member ${ts.SyntaxKind[node.kind] ?? node.kind}`);
}

function commonType(types: IrType[]): IrType {
  const flattened = types.flatMap((type) => (type.kind === 'union' ? type.alternatives : [type]));
  const dynamic = flattened.find((type): type is Extract<IrType, { kind: 'dynamic' }> => type.kind === 'dynamic');
  if (dynamic) return dynamic;
  const unique = [...new Map(flattened.map((type) => [JSON.stringify(type), type])).values()];
  const first = unique[0];
  if (!first) return { kind: 'dynamic' };
  return unique.length === 1 ? first : { alternatives: unique, kind: 'union' };
}

function lowerIntersection(types: IrType[], forceNominal = false): IrType {
  const concrete = types.filter(
    (type) => !(type.kind === 'named' && type.name === 'flight._internal._Object' && types.length > 1),
  );
  if (concrete.length === 0) return types[0] ?? { kind: 'dynamic', reason: 'source-unknown' };
  if (concrete.length === 1) return concrete[0]!;
  if (
    !forceNominal &&
    concrete.every(
      (type) => type.kind === 'anonymous' || (type.kind === 'named' && !type.name.startsWith('flight._internal.')),
    )
  ) {
    return {
      extends: concrete.flatMap((type) => (type.kind === 'anonymous' ? type.extends : [type])),
      fields: concrete.flatMap((type) => (type.kind === 'anonymous' ? type.fields : [])),
      kind: 'anonymous',
    };
  }
  return concrete.slice(1).reduce<IrType>(
    (left, right) => ({
      arguments: [left, right],
      kind: 'named',
      name: 'flight._internal._Intersection2',
    }),
    concrete[0] ?? { kind: 'dynamic', reason: 'source-unknown' },
  );
}

function hasReturnValue(body: ts.Block): boolean {
  let found = false;
  const visit = (node: ts.Node): void => {
    if (found) return;
    if (ts.isReturnStatement(node) && node.expression) {
      found = true;
      return;
    }
    if (node !== body && ts.isFunctionLike(node)) return;
    ts.forEachChild(node, visit);
  };
  visit(body);
  return found;
}

function lowerStatementList(nodes: readonly ts.Statement[], context: LoweringContext): IrStatement[] {
  const runtimeNodes = nodes.filter((node) => !ts.isInterfaceDeclaration(node) && !ts.isTypeAliasDeclaration(node));
  const lowered = runtimeNodes.map((node) => lowerStatement(node, context));
  const hoisted: IrStatement[] = [];
  const ordered: IrStatement[] = [];
  runtimeNodes.forEach((node, index) => {
    const statement = lowered[index]!;
    if (ts.isFunctionDeclaration(node) && node.name && node.body) hoisted.push(statement);
    else ordered.push(statement);
  });
  return [...hoisted, ...ordered];
}

function lowerStatement(node: ts.Statement, context: LoweringContext): IrStatement {
  if (ts.isBlock(node)) return { kind: 'block', statements: lowerStatementList(node.statements, context) };
  if (ts.isVariableStatement(node)) {
    const mutable = (node.declarationList.flags & ts.NodeFlags.Const) === 0;
    return { kind: 'variable', declarations: lowerVariables(node.declarationList, mutable, context) };
  }
  if (ts.isExpressionStatement(node))
    return { expression: lowerExpression(node.expression, context), kind: 'expression' };
  if (ts.isReturnStatement(node)) {
    return { expression: node.expression ? lowerExpression(node.expression, context) : undefined, kind: 'return' };
  }
  if (ts.isIfStatement(node)) {
    return {
      condition: lowerExpression(node.expression, context),
      consequent: lowerStatement(node.thenStatement, context),
      kind: 'if',
      otherwise: node.elseStatement ? lowerStatement(node.elseStatement, context) : undefined,
    };
  }
  if (ts.isWhileStatement(node)) {
    return {
      body: lowerStatement(node.statement, context),
      condition: lowerExpression(node.expression, context),
      kind: 'while',
    };
  }
  if (ts.isDoStatement(node)) {
    return {
      body: lowerStatement(node.statement, context),
      condition: lowerExpression(node.expression, context),
      kind: 'do',
    };
  }
  if (ts.isForStatement(node)) {
    let initializer: IrExpression | IrVariable[] | undefined;
    if (node.initializer) {
      initializer = ts.isVariableDeclarationList(node.initializer)
        ? lowerVariables(node.initializer, (node.initializer.flags & ts.NodeFlags.Const) === 0, context)
        : lowerExpression(node.initializer, context);
    }
    return {
      body: lowerStatement(node.statement, context),
      condition: node.condition ? lowerExpression(node.condition, context) : undefined,
      increment: node.incrementor ? lowerExpression(node.incrementor, context) : undefined,
      initializer,
      kind: 'for',
    };
  }
  if (ts.isForOfStatement(node)) {
    if (!ts.isVariableDeclarationList(node.initializer) || node.initializer.declarations.length !== 1) {
      return unsupported(node.initializer, context, 'for-of initializer');
    }
    const declaration = node.initializer.declarations[0]!;
    const mutable = (node.initializer.flags & ts.NodeFlags.Const) === 0;
    const bindings: IrVariable[] = [];
    const variable = ts.isIdentifier(declaration.name)
      ? declaration.name.text
      : `__iteration${String(context.temporaryIndex++)}`;
    if (!ts.isIdentifier(declaration.name)) {
      lowerBindingPattern(declaration.name, { kind: 'identifier', name: variable }, mutable, bindings, context, {
        sourceType: context.checker?.getTypeAtLocation(declaration.name),
        syntheticArrayRead: 'iterationBinding',
      });
    }
    return {
      async: Boolean(node.awaitModifier),
      bindings,
      body: lowerStatement(node.statement, context),
      iterable: lowerExpression(node.expression, context),
      kind: 'forOf',
      variable,
    };
  }
  if (ts.isForInStatement(node)) {
    if (!ts.isVariableDeclarationList(node.initializer) || node.initializer.declarations.length !== 1) {
      return unsupported(node.initializer, context, 'for-in initializer');
    }
    const declaration = node.initializer.declarations[0]!;
    if (!ts.isIdentifier(declaration.name)) {
      return unsupported(declaration.name, context, 'for-in initializer');
    }
    return {
      body: lowerStatement(node.statement, context),
      enumeration: isStringIndexedRecord(node.expression, context.checker) ? 'direct-record' : 'runtime',
      kind: 'forIn',
      object: lowerExpression(node.expression, context),
      variable: declaration.name.text,
    };
  }
  if (ts.isTypeAliasDeclaration(node)) return { kind: 'block', statements: [] };
  if (ts.isThrowStatement(node)) return { expression: lowerExpression(node.expression, context), kind: 'throw' };
  if (ts.isSwitchStatement(node)) {
    return {
      cases: node.caseBlock.clauses.map((clause) => ({
        expression: ts.isCaseClause(clause) ? lowerExpression(clause.expression, context) : undefined,
        statements: lowerStatementList(clause.statements, context),
      })),
      expression: lowerExpression(node.expression, context),
      kind: 'switch',
    };
  }
  if (ts.isBreakStatement(node)) return { kind: 'break' };
  if (ts.isContinueStatement(node)) return { kind: 'continue' };
  if (ts.isTryStatement(node)) {
    const catchName = node.catchClause?.variableDeclaration?.name;
    if (catchName && !ts.isIdentifier(catchName)) unsupported(catchName, context, 'catch binding pattern');
    return {
      catchBody: node.catchClause ? lowerStatement(node.catchClause.block, context) : undefined,
      catchName: catchName?.text,
      finallyBody: node.finallyBlock ? lowerStatement(node.finallyBlock, context) : undefined,
      kind: 'try',
      tryBody: lowerStatement(node.tryBlock, context),
    };
  }
  if (ts.isFunctionDeclaration(node) && node.name && node.body) {
    const previousClassThis = context.classThis;
    const previousDynamicThisCapture = context.dynamicThisCapture;
    const thisCapture = dynamicThisCapture(node, context);
    context.classThis = false;
    context.dynamicThisCapture = thisCapture;
    try {
      const loweredParameters = lowerParameterList(node.parameters, context);
      const erasedTypeParameters = new Set(node.typeParameters?.map((parameter) => parameter.name.text) ?? []);
      const parameters = loweredParameters.parameters.map((parameter) => ({
        ...parameter,
        type: eraseLocalTypeParameters(parameter.type, erasedTypeParameters),
      }));
      const returnType = eraseLocalTypeParameters(
        (node.type ? lowerType(node.type, context) : inferredReturnType(node, context)) ??
          (hasModifier(node, ts.SyntaxKind.AsyncKeyword)
            ? promiseOfDynamic()
            : hasReturnValue(node.body)
              ? { kind: 'dynamic' }
              : { kind: 'primitive', name: 'Void' }),
        erasedTypeParameters,
      );
      return {
        declarations: [
          {
            initializer: {
              async: hasModifier(node, ts.SyntaxKind.AsyncKeyword),
              body: [...loweredParameters.prefix, ...lowerStatementList(node.body.statements, context)],
              kind: 'function',
              name: node.name.text,
              parameters,
              returns: returnType,
              ...(thisCapture ? { thisCapture } : {}),
            },
            mutable: false,
            name: node.name.text,
            type: {
              kind: 'function',
              parameters: parameters.map((parameter) => parameter.type),
              returns: returnType,
            },
          },
        ],
        kind: 'variable',
      };
    } finally {
      context.classThis = previousClassThis;
      context.dynamicThisCapture = previousDynamicThisCapture;
    }
  }
  if (ts.isEmptyStatement(node)) return { kind: 'block', statements: [] };
  return unsupported(node, context, `statement ${ts.SyntaxKind[node.kind] ?? node.kind}`);
}

function isStringIndexedRecord(node: ts.Expression, checker: ts.TypeChecker | undefined): boolean {
  if (!checker) return false;
  const seen = new Set<ts.Type>();
  const visit = (type: ts.Type): boolean => {
    if (seen.has(type)) return false;
    seen.add(type);
    if ((type.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.TypeParameter)) !== 0) return false;
    if (type.isUnionOrIntersection()) return type.types.length > 0 && type.types.every(visit);
    return checker.getIndexTypeOfType(type, ts.IndexKind.String) !== undefined;
  };
  return visit(checker.getTypeAtLocation(node));
}

function expressionStaticFacts(node: ts.Expression, context: LoweringContext): IrExpressionStaticFacts | undefined {
  const checker = context.checker;
  if (!checker) return undefined;
  const facts: IrExpressionStaticFacts = {};
  const boolean = typeOnlyHasFlags(checker.getTypeAtLocation(node), checker, ts.TypeFlags.BooleanLike);
  if (boolean) {
    facts.boolean = true;
    facts.truthinessUse = booleanTruthinessUse(node);
  }
  if (
    ts.isBinaryExpression(node) &&
    [ts.SyntaxKind.AmpersandAmpersandToken, ts.SyntaxKind.BarBarToken].includes(node.operatorToken.kind) &&
    typeOnlyHasFlags(checker.getTypeAtLocation(node.left), checker, ts.TypeFlags.BooleanLike) &&
    typeOnlyHasFlags(checker.getTypeAtLocation(node.right), checker, ts.TypeFlags.BooleanLike)
  ) {
    facts.booleanLogical = true;
  }
  if (
    ts.isBinaryExpression(node) &&
    [
      ts.SyntaxKind.PlusToken,
      ts.SyntaxKind.MinusToken,
      ts.SyntaxKind.AsteriskToken,
      ts.SyntaxKind.SlashToken,
      ts.SyntaxKind.PlusEqualsToken,
      ts.SyntaxKind.MinusEqualsToken,
      ts.SyntaxKind.AsteriskEqualsToken,
      ts.SyntaxKind.SlashEqualsToken,
    ].includes(node.operatorToken.kind) &&
    typeOnlyHasFlags(checker.getTypeAtLocation(node.left), checker, ts.TypeFlags.NumberLike) &&
    typeOnlyHasFlags(checker.getTypeAtLocation(node.right), checker, ts.TypeFlags.NumberLike)
  ) {
    facts.numericOperands = true;
    const widenedStorage = (operand: ts.Expression): boolean => {
      const target = unwrapAssignmentTarget(operand);
      if (!ts.isIdentifier(target)) return false;
      const declaration = checker.getSymbolAtLocation(target)?.valueDeclaration;
      const declaredTypeNode =
        declaration &&
        (ts.isParameter(declaration) || ts.isVariableDeclaration(declaration) || ts.isPropertyDeclaration(declaration))
          ? declaration.type
          : undefined;
      return Boolean(
        declaredTypeNode &&
        !typeOnlyHasFlags(checker.getTypeFromTypeNode(declaredTypeNode), checker, ts.TypeFlags.NumberLike),
      );
    };
    if (widenedStorage(node.left) || widenedStorage(node.right)) facts.narrowedNumericOperands = true;
  }
  if (
    ts.isBinaryExpression(node) &&
    [
      ts.SyntaxKind.LessThanToken,
      ts.SyntaxKind.LessThanEqualsToken,
      ts.SyntaxKind.GreaterThanToken,
      ts.SyntaxKind.GreaterThanEqualsToken,
    ].includes(node.operatorToken.kind) &&
    typeOnlyHasFlags(checker.getTypeAtLocation(node.left), checker, ts.TypeFlags.NumberLike) &&
    typeOnlyHasFlags(checker.getTypeAtLocation(node.right), checker, ts.TypeFlags.NumberLike)
  ) {
    facts.numericRelation = true;
  }
  if (
    ts.isBinaryExpression(node) &&
    node.operatorToken.kind === ts.SyntaxKind.EqualsToken &&
    ts.isArrayLiteralExpression(node.left)
  ) {
    facts.destructuringSource = destructuringSourceFact(checker.getTypeAtLocation(node.right), 'assignment', checker);
  }
  if (ts.isElementAccessExpression(node) && node.argumentExpression && !ts.isOptionalChain(node)) {
    const receiver = indexedReceiver(checker.getTypeAtLocation(node.expression), checker);
    const access = indexedAccessMode(node);
    const numericKey = typeOnlyHasFlags(
      checker.getTypeAtLocation(node.argumentExpression),
      checker,
      ts.TypeFlags.NumberLike,
    );
    if (receiver === 'Uint16ArrayOrUint32Array' && access?.writes === 1 && numericKey) {
      facts.indexedAccessEscape = 'width-sensitive-mixed-write';
    }
    if (receiver && access && !(receiver === 'Uint16ArrayOrUint32Array' && access.writes === 1) && numericKey) {
      facts.indexedAccess = { ...access, receiver };
    }
  }
  if (ts.isCallExpression(node)) {
    const receiver = typedArraySetReceiver(node, checker);
    if (receiver) facts.typedArraySet = { receiver };
  }
  return Object.keys(facts).length > 0 ? facts : undefined;
}

function typedArraySetReceiver(node: ts.CallExpression, checker: ts.TypeChecker): IrTypedArraySetReceiver | undefined {
  if (
    !ts.isPropertyAccessExpression(node.expression) ||
    node.expression.name.text !== 'set' ||
    ts.isOptionalChain(node.expression) ||
    node.questionDotToken ||
    node.arguments.length < 1 ||
    node.arguments.length > 2 ||
    node.arguments.some(ts.isSpreadElement)
  ) {
    return undefined;
  }
  const offset = node.arguments[1];
  if (offset && !typeOnlyHasFlags(checker.getTypeAtLocation(offset), checker, ts.TypeFlags.NumberLike)) {
    return undefined;
  }
  const receiver = indexedReceiver(checker.getTypeAtLocation(node.expression.expression), checker);
  if (!receiver || receiver === 'Array' || receiver === 'ArrayOrFloat32Array') return undefined;
  if (receiver !== 'Uint16ArrayOrUint32Array') return receiver;
  return mixedUnsignedSetHasCorrelatedWidth(node, checker) ? receiver : undefined;
}

function mixedUnsignedSetHasCorrelatedWidth(node: ts.CallExpression, checker: ts.TypeChecker): boolean {
  const callee = node.expression;
  const source = node.arguments[0];
  if (!ts.isPropertyAccessExpression(callee) || !ts.isIdentifier(callee.expression) || !source) return false;
  const statement = node.parent;
  if (!ts.isExpressionStatement(statement) || statement.expression !== node || !ts.isBlock(statement.parent))
    return false;
  const statements = statement.parent.statements;
  const index = statements.indexOf(statement);
  const discriminator = index > 0 ? statements[index - 1] : undefined;
  if (!discriminator || !ts.isIfStatement(discriminator) || !discriminator.elseStatement) return false;
  if (
    !ts.isBinaryExpression(discriminator.expression) ||
    discriminator.expression.operatorToken.kind !== ts.SyntaxKind.InstanceOfKeyword ||
    normalizedExpression(discriminator.expression.left) !== normalizedExpression(source)
  ) {
    return false;
  }
  const discriminated = standardLibraryConstructorName(discriminator.expression.right, checker);
  if (discriminated !== 'Uint32Array') return false;
  const consequent = assignedTypedArrayFamily(discriminator.thenStatement, callee.expression.text, checker);
  const alternate = assignedTypedArrayFamily(discriminator.elseStatement, callee.expression.text, checker);
  return consequent === 'Uint32Array' && alternate === 'Uint16Array';
}

function assignedTypedArrayFamily(
  statement: ts.Statement,
  receiver: string,
  checker: ts.TypeChecker,
): 'Uint16Array' | 'Uint32Array' | undefined {
  const candidate = ts.isBlock(statement) && statement.statements.length === 1 ? statement.statements[0] : statement;
  if (
    !candidate ||
    !ts.isExpressionStatement(candidate) ||
    !ts.isBinaryExpression(candidate.expression) ||
    candidate.expression.operatorToken.kind !== ts.SyntaxKind.EqualsToken ||
    !ts.isIdentifier(candidate.expression.left) ||
    candidate.expression.left.text !== receiver ||
    !ts.isNewExpression(candidate.expression.right)
  ) {
    return undefined;
  }
  const family = indexedReceiver(checker.getTypeAtLocation(candidate.expression.right), checker);
  return family === 'Uint16Array' || family === 'Uint32Array' ? family : undefined;
}

function standardLibraryConstructorName(
  node: ts.Expression,
  checker: ts.TypeChecker,
): 'Uint16Array' | 'Uint32Array' | undefined {
  let symbol = checker.getSymbolAtLocation(node);
  if (symbol && (symbol.flags & ts.SymbolFlags.Alias) !== 0) symbol = checker.getAliasedSymbol(symbol);
  const name = symbol?.getName();
  if (name !== 'Uint16Array' && name !== 'Uint32Array') return undefined;
  return symbol?.declarations?.some((declaration) => {
    const source = declaration.getSourceFile();
    return source.isDeclarationFile && /^lib\..*\.d\.ts$/u.test(path.basename(source.fileName));
  })
    ? name
    : undefined;
}

function normalizedExpression(node: ts.Expression): string {
  return fingerprintPrinter.printNode(ts.EmitHint.Expression, node, node.getSourceFile());
}

function booleanTruthinessUse(node: ts.Expression): IrExpressionStaticFacts['truthinessUse'] | undefined {
  const parent = node.parent;
  if (ts.isConditionalExpression(parent) && parent.condition === node) return 'conditional';
  if (
    ts.isBinaryExpression(parent) &&
    parent.left === node &&
    [ts.SyntaxKind.AmpersandAmpersandToken, ts.SyntaxKind.BarBarToken].includes(parent.operatorToken.kind)
  ) {
    return 'logical';
  }
  if (
    (ts.isIfStatement(parent) && parent.expression === node) ||
    (ts.isWhileStatement(parent) && parent.expression === node) ||
    (ts.isDoStatement(parent) && parent.expression === node) ||
    (ts.isForStatement(parent) && parent.condition === node) ||
    (ts.isPrefixUnaryExpression(parent) &&
      parent.operand === node &&
      parent.operator === ts.SyntaxKind.ExclamationToken)
  ) {
    return 'explicit';
  }
  return undefined;
}

function indexedAccessMode(node: ts.ElementAccessExpression): { reads: 0 | 1; writes: 0 | 1 } | undefined {
  const parent = node.parent;
  if (ts.isDeleteExpression(parent) && parent.expression === node) return undefined;
  if (
    (ts.isPrefixUnaryExpression(parent) || ts.isPostfixUnaryExpression(parent)) &&
    parent.operand === node &&
    [ts.SyntaxKind.PlusPlusToken, ts.SyntaxKind.MinusMinusToken].includes(parent.operator)
  ) {
    return undefined;
  }
  if (
    ts.isBinaryExpression(parent) &&
    parent.left === node &&
    parent.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
    parent.operatorToken.kind <= ts.SyntaxKind.LastAssignment
  ) {
    return parent.operatorToken.kind === ts.SyntaxKind.EqualsToken ? { reads: 0, writes: 1 } : { reads: 1, writes: 1 };
  }
  if (
    ts.isArrayLiteralExpression(parent) &&
    ts.isBinaryExpression(parent.parent) &&
    parent.parent.left === parent &&
    parent.parent.operatorToken.kind === ts.SyntaxKind.EqualsToken
  ) {
    return { reads: 0, writes: 1 };
  }
  return { reads: 1, writes: 0 };
}

function indexedReceiver(
  type: ts.Type,
  checker: ts.TypeChecker,
  seen = new Set<ts.Type>(),
): IrIndexedReceiver | undefined {
  if (seen.has(type)) return undefined;
  seen.add(type);
  if (type.isUnion()) {
    const bindings = type.types.map((item) => indexedReceiver(item, checker, new Set(seen)));
    if (bindings.some((binding) => binding === undefined)) return undefined;
    const unique = [...new Set(bindings as IrIndexedReceiver[])];
    if (unique.length === 1) return unique[0];
    if (bindings.length !== 2 || unique.length !== 2) return undefined;
    if (unique.includes('Array') && unique.includes('Float32Array')) return 'ArrayOrFloat32Array';
    if (unique.includes('Uint16Array') && unique.includes('Uint32Array')) return 'Uint16ArrayOrUint32Array';
    return undefined;
  }
  if (type.isIntersection()) return undefined;
  if ((type.flags & ts.TypeFlags.TypeParameter) !== 0) {
    const constraint = checker.getBaseConstraintOfType(type);
    return constraint && constraint !== type ? indexedReceiver(constraint, checker, seen) : undefined;
  }
  if (type.aliasSymbol?.getName() === 'Readonly' && type.aliasTypeArguments?.[0]) {
    return indexedReceiver(type.aliasTypeArguments[0], checker, seen);
  }
  if (checker.isArrayType(type) || checker.isTupleType(type)) return 'Array';
  if (standardLibraryType(type, 'Array') || standardLibraryType(type, 'ReadonlyArray')) return 'Array';
  for (const name of typedArrayBindings) if (standardLibraryType(type, name)) return name;
  return undefined;
}

function standardLibraryType(type: ts.Type, name: string): boolean {
  return [type.aliasSymbol, type.getSymbol()].some((symbol) => standardLibraryTypeSymbol(symbol, name));
}

function standardLibraryTypeSymbol(symbol: ts.Symbol | undefined, name: string, checker?: ts.TypeChecker): boolean {
  const resolved =
    symbol && checker && (symbol.flags & ts.SymbolFlags.Alias) !== 0 ? checker.getAliasedSymbol(symbol) : symbol;
  return (
    resolved?.getName() === name &&
    (resolved.declarations ?? []).some((declaration) => {
      const source = declaration.getSourceFile();
      return source.isDeclarationFile && /^lib\..*\.d\.ts$/u.test(path.basename(source.fileName));
    })
  );
}

function typeOnlyHasFlags(
  type: ts.Type,
  checker: ts.TypeChecker,
  flags: ts.TypeFlags,
  seen = new Set<ts.Type>(),
): boolean {
  if (seen.has(type)) return false;
  seen.add(type);
  if (type.isUnion())
    return type.types.length > 0 && type.types.every((item) => typeOnlyHasFlags(item, checker, flags, seen));
  if (type.isIntersection()) return false;
  if ((type.flags & ts.TypeFlags.TypeParameter) !== 0) {
    const constraint = checker.getBaseConstraintOfType(type);
    return constraint !== undefined && constraint !== type && typeOnlyHasFlags(constraint, checker, flags, seen);
  }
  return (type.flags & flags) !== 0;
}

function lowerVariables(node: ts.VariableDeclarationList, mutable: boolean, context: LoweringContext): IrVariable[] {
  return node.declarations.flatMap((declaration) => {
    if (ts.isIdentifier(declaration.name)) {
      const erasedTypeParameters = new Set(
        declaration.initializer &&
          (ts.isArrowFunction(declaration.initializer) || ts.isFunctionExpression(declaration.initializer))
          ? (declaration.initializer.typeParameters?.map((parameter) => parameter.name.text) ?? [])
          : [],
      );
      const type = declaration.type ? lowerType(declaration.type, context) : inferredType(declaration.name, context);
      const loweredInitializer = declaration.initializer
        ? lowerExpression(declaration.initializer, context)
        : undefined;
      const initializer =
        declaration.initializer && loweredInitializer
          ? adaptFunctionValueToType(
              declaration.initializer,
              loweredInitializer,
              context.checker?.getTypeAtLocation(declaration.name),
              context,
              type,
            )
          : loweredInitializer;
      return {
        initializer,
        mutable,
        name: declaration.name.text,
        type: type ? eraseLocalTypeParameters(type, erasedTypeParameters) : undefined,
      };
    }
    if (!declaration.initializer) unsupported(declaration.name, context, 'uninitialized binding pattern variable');
    const temporaryName = `__destructure${String(context.temporaryIndex++)}`;
    const sourceType = context.checker?.getTypeAtLocation(declaration.initializer);
    const temporaryType = sourceType
      ? directTypedStructDestructuringType(sourceType, declaration.initializer, context)
      : undefined;
    const variables: IrVariable[] = [
      {
        initializer: lowerExpression(declaration.initializer, context),
        mutable: false,
        name: temporaryName,
        type: temporaryType,
      },
    ];
    lowerBindingPattern(
      declaration.name,
      { kind: 'identifier', name: temporaryName, type: temporaryType },
      mutable,
      variables,
      context,
      {
        destructuringSource: 'declaration',
        sourceType,
      },
    );
    return variables;
  });
}

function widenObjectMethodArities(
  declaration: ts.VariableDeclaration,
  initializer: IrExpression | undefined,
  type: IrType | undefined,
  context: LoweringContext,
): void {
  if (!context.checker || initializer?.kind !== 'object' || !type || !ts.isIdentifier(declaration.name)) return;
  const symbol = originalSymbolAtLocation(declaration.name, context.checker);
  const arityContext = symbol ? context.objectMethodArityContexts.get(symbol) : undefined;
  if (!arityContext) return;
  for (const [name, signature] of arityContext.methods) {
    const property = initializer.properties.find(
      (candidate) => candidate.kind === 'property' && candidate.name === name && candidate.value.kind === 'function',
    );
    if (!property || property.kind !== 'property' || property.value.kind !== 'function') continue;
    const expectedParameters = signature.getParameters().map((parameter) => ({
      optional: signatureParameterIsOptional(parameter),
      type:
        lowerCheckerType(
          context.checker!.getTypeOfSymbolAtLocation(parameter, declaration.name),
          declaration.name,
          context,
          new Set(),
        ) ?? ({ kind: 'dynamic' } as const),
    }));
    const actualCount = property.value.parameters.length;
    if (actualCount >= expectedParameters.length) continue;
    const names = new Set(property.value.parameters.map((parameter) => parameter.name));
    const appended: IrParameter[] = expectedParameters.slice(actualCount).map((parameter, offset) => {
      let name = `__unused${String(actualCount + offset)}`;
      while (names.has(name)) name += '_';
      names.add(name);
      return {
        name,
        optional: parameter.optional,
        rest: false,
        type: parameter.type,
      };
    });
    property.value.parameters.push(...appended);
    widenFunctionFieldArity(
      type,
      name,
      expectedParameters.map((parameter) => parameter.type),
    );
  }
  addMissingContextualObjectFields(type, arityContext.expectedTypes, declaration, context);
}

function addMissingContextualObjectFields(
  type: IrType,
  expectedTypes: readonly ts.Type[],
  declaration: ts.VariableDeclaration,
  context: LoweringContext,
): void {
  if (!context.checker) return;
  if (type.kind === 'nullable') {
    addMissingContextualObjectFields(type.inner, expectedTypes, declaration, context);
    return;
  }
  if (type.kind !== 'anonymous') return;
  const names = new Set(type.fields.map((field) => field.name));
  for (const expectedType of expectedTypes) {
    for (const property of context.checker.getPropertiesOfType(expectedType)) {
      const name = property.getName();
      if (names.has(name)) continue;
      const propertyType = lowerCheckerType(
        context.checker.getTypeOfSymbolAtLocation(property, declaration.name),
        declaration.name,
        context,
        new Set(),
      );
      if (!propertyType) continue;
      names.add(name);
      type.fields.push({
        name,
        optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
        type: propertyType,
      });
    }
  }
}

function widenFunctionFieldArity(type: IrType, name: string, expectedParameters: IrType[]): void {
  if (type.kind === 'nullable') {
    widenFunctionFieldArity(type.inner, name, expectedParameters);
    return;
  }
  if (type.kind !== 'anonymous') return;
  const field = type.fields.find((candidate) => candidate.name === name);
  if (!field) return;
  const widen = (fieldType: IrType): void => {
    if (fieldType.kind === 'nullable') {
      widen(fieldType.inner);
      return;
    }
    if (fieldType.kind !== 'function' || fieldType.parameters.length >= expectedParameters.length) return;
    fieldType.parameters.push(...expectedParameters.slice(fieldType.parameters.length));
  };
  widen(field.type);
}

interface BindingPatternOptions {
  destructuringSource?: IrDestructuringReadSource | undefined;
  sourceType?: ts.Type | undefined;
  syntheticArrayRead?: 'iterationBinding' | undefined;
}

function lowerBindingPattern(
  pattern: ts.BindingPattern,
  source: IrExpression,
  mutable: boolean,
  variables: IrVariable[],
  context: LoweringContext,
  options?: BindingPatternOptions,
): void {
  if (ts.isObjectBindingPattern(pattern)) {
    const sourceType = options?.sourceType;
    const directSourceType = sourceType ? directTypedStructDestructuringType(sourceType, pattern, context) : undefined;
    const typedSource = directSourceType && !source.type ? { ...source, type: directSourceType } : source;
    for (const element of pattern.elements) {
      if (element.dotDotDotToken) unsupported(element, context, 'object rest binding');
      const name = element.propertyName
        ? propertyName(element.propertyName, context)
        : element.name.getText(context.sourceFile);
      const field = sourceType ? typedStructDestructuringField(sourceType, name, element, context) : undefined;
      let value: IrExpression = {
        kind: 'property',
        name,
        object: typedSource,
        type: field?.type,
        typedStructBinding: field?.binding,
      };
      if (element.initializer) {
        value = {
          kind: 'binary',
          left: value,
          operator: '??undefined',
          right: lowerExpression(element.initializer, context),
        };
      }
      if (ts.isIdentifier(element.name)) {
        variables.push({
          initializer: value,
          mutable,
          name: element.name.text,
          type: inferredType(element.name, context),
        });
      } else {
        lowerBindingPattern(element.name, value, mutable, variables, context, {
          ...options,
          sourceType: field?.checkerType,
        });
      }
    }
    return;
  }
  const destructuringSource = options?.destructuringSource;
  const sourceFact = destructuringSource
    ? context.checker
      ? destructuringSourceFact(context.checker.getTypeAtLocation(pattern), destructuringSource, context.checker)
      : { escape: 'unproven-receiver' as const, source: destructuringSource }
    : undefined;
  pattern.elements.forEach((element, index) => {
    if (ts.isOmittedExpression(element)) return;
    if (element.dotDotDotToken) unsupported(element, context, 'array rest binding');
    let value: IrExpression = {
      index: { kind: 'literal', value: index },
      kind: 'element',
      object: source,
      staticFacts: sourceFact ? { destructuringSource: sourceFact } : undefined,
      syntheticArrayRead: options?.syntheticArrayRead,
    };
    if (element.initializer) {
      value = {
        kind: 'binary',
        left: value,
        operator: '??undefined',
        right: lowerExpression(element.initializer, context),
      };
    }
    if (ts.isIdentifier(element.name)) {
      variables.push({
        initializer: value,
        mutable,
        name: element.name.text,
        type: inferredType(element.name, context),
      });
    } else {
      lowerBindingPattern(element.name, value, mutable, variables, context, options);
    }
  });
}

function directTypedStructDestructuringType(
  type: ts.Type,
  node: ts.Node,
  context: LoweringContext,
): IrType | undefined {
  const registry = context.typedStructs;
  if (!context.checker || !registry) return undefined;
  const resolution = registry.resolveDirect(type);
  const schema = resolution.kind === 'matched' ? resolution.schemas[0] : undefined;
  if (!schema?.eligible || schema.emission.mode !== 'direct') return undefined;
  const lowered = lowerCheckerType(type, node, context, new Set());
  return lowered?.kind === 'dynamic' || lowered?.kind === 'nullable' ? undefined : lowered;
}

function typedStructDestructuringField(
  receiverType: ts.Type,
  name: string,
  node: ts.Node,
  context: LoweringContext,
): { binding: IrTypedStructBinding; checkerType: ts.Type; type?: IrType | undefined } | undefined {
  const checker = context.checker;
  const registry = context.typedStructs;
  if (!checker || !registry || !directTypedStructDestructuringType(receiverType, node, context)) return undefined;
  const property = checker.getPropertyOfType(checker.getNonNullableType(receiverType), name);
  const binding = registry.resolveField(receiverType, name, property);
  if (!property || !binding) return undefined;
  const declaration = property.valueDeclaration ?? property.declarations?.[0] ?? node;
  const checkerType = checker.getTypeOfSymbolAtLocation(property, declaration);
  const fieldType = lowerCheckerType(checkerType, node, context, new Set());
  return {
    binding: {
      field: {
        name: binding.field.name,
        optional: binding.field.optional,
        readonly: binding.field.readonly,
        requiredUndefined: binding.field.requiredUndefined,
        ...(fieldType ? { type: fieldType } : {}),
      },
      schemaId: binding.schemaId,
      schemaName: binding.schemaName,
    },
    checkerType,
    type: fieldType,
  };
}

function destructuringSourceFact(
  type: ts.Type,
  source: IrDestructuringReadSource,
  checker: ts.TypeChecker,
): NonNullable<IrExpressionStaticFacts['destructuringSource']> {
  const receiver = indexedReceiver(type, checker);
  if (receiver) return { receiver, source };
  const escape: IrDestructuringReadEscape =
    standardLibraryType(type, 'RegExpExecArray') || standardLibraryType(type, 'RegExpMatchArray')
      ? 'regexp-result-array'
      : 'unproven-receiver';
  return { escape, source };
}

function typedStructPropertyBinding(
  node: ts.PropertyAccessExpression,
  context: LoweringContext,
): IrTypedStructBinding | undefined {
  const checker = context.checker;
  const registry = context.typedStructs;
  if (!checker || !registry) return undefined;
  const receiverType = checker.getTypeAtLocation(node.expression);
  const resolution = registry.resolveDirect(receiverType);
  if (resolution.kind !== 'matched') return undefined;
  if (node.name.text === 'hasOwnProperty' && ts.isCallExpression(node.parent) && node.parent.expression === node) {
    return undefined;
  }
  const schema = resolution.schemas[0]!;
  if (!schema.eligible || schema.emission.mode !== 'direct') return undefined;
  const property = checker.getSymbolAtLocation(node.name);
  const binding = registry.resolveField(receiverType, node.name.text, property);
  if (!binding) {
    if (property) return undefined;
    return unsupported(node, context, `unknown typed-struct field ${schema.name}.${node.name.text}`);
  }
  const field = binding.field;
  if (field.receiverSensitive) return undefined;
  if (ts.isDeleteExpression(node.parent)) return undefined;
  if (field.readonly && isTypedStructWrite(node)) {
    return unsupported(node, context, `assignment to readonly typed-struct field ${schema.name}.${node.name.text}`);
  }
  const propertyDeclaration = property?.valueDeclaration ?? property?.declarations?.[0] ?? node;
  const fieldType = property
    ? lowerCheckerType(checker.getTypeOfSymbolAtLocation(property, propertyDeclaration), node, context, new Set())
    : undefined;
  return {
    field: {
      name: field.name,
      optional: field.optional,
      readonly: field.readonly,
      requiredUndefined: field.requiredUndefined,
      ...(fieldType ? { type: fieldType } : {}),
    },
    receiverCast: typedStructReceiverCast(
      node.expression,
      binding.schemaId,
      binding.schemaHaxeType,
      node.name.text,
      context,
    ),
    schemaId: binding.schemaId,
    schemaName: binding.schemaName,
  };
}

function typedStructReceiverCast(
  receiver: ts.Expression,
  schemaId: string,
  schemaHaxeType: string,
  fieldName: string,
  context: LoweringContext,
): IrType | string | undefined {
  if (!context.checker || !context.typedStructs) return undefined;
  if (!ts.isIdentifier(receiver)) {
    const receiverType = context.checker.getNonNullableType(context.checker.getTypeAtLocation(receiver));
    const property = context.checker.getPropertyOfType(receiverType, fieldName);
    if (property) {
      const location = property.valueDeclaration ?? property.declarations?.[0] ?? receiver;
      const fieldType = lowerCheckerType(
        context.checker.getTypeOfSymbolAtLocation(property, location),
        receiver,
        context,
        new Set(),
      );
      if (fieldType) {
        return {
          extends: [],
          fields: [
            {
              name: fieldName,
              optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
              type: fieldType,
            },
          ],
          kind: 'anonymous',
        };
      }
    }
    return schemaHaxeType;
  }
  const symbol = context.checker.getSymbolAtLocation(receiver);
  const declaration = symbol?.valueDeclaration;
  const declaredTypeNode =
    declaration &&
    (ts.isParameter(declaration) || ts.isVariableDeclaration(declaration) || ts.isPropertyDeclaration(declaration))
      ? declaration.type
      : undefined;
  const declaredType = declaredTypeNode
    ? context.checker.getTypeFromTypeNode(declaredTypeNode)
    : declaration &&
        (ts.isParameter(declaration) || ts.isVariableDeclaration(declaration) || ts.isPropertyDeclaration(declaration))
      ? context.checker.getTypeAtLocation(declaration.name)
      : undefined;
  if (!declaredType) return undefined;
  const narrowedType = context.checker.getNonNullableType(context.checker.getTypeAtLocation(receiver));
  const narrowedProperty = context.checker.getPropertyOfType(narrowedType, fieldName);
  const narrowedFieldShape = (): IrType | undefined => {
    if (!narrowedProperty) return undefined;
    const location = narrowedProperty.valueDeclaration ?? narrowedProperty.declarations?.[0] ?? receiver;
    const fieldType = lowerCheckerType(
      context.checker!.getTypeOfSymbolAtLocation(narrowedProperty, location),
      receiver,
      context,
      new Set(),
    );
    return fieldType
      ? {
          extends: [],
          fields: [
            {
              name: fieldName,
              optional: (narrowedProperty.flags & ts.SymbolFlags.Optional) !== 0,
              type: fieldType,
            },
          ],
          kind: 'anonymous',
        }
      : undefined;
  };
  if (declaredTypeNode && typeNodeContainsIndexedAccess(declaredTypeNode)) {
    return narrowedFieldShape() ?? schemaHaxeType;
  }
  // A schema-only cast would erase generic storage such as SignalData<T>. Concrete
  // utility wrappers (for example Readonly<Projection>) are safe to narrow.
  if (checkerTypeContainsTypeParameter(declaredType, context.checker)) return undefined;
  if (!context.checker.getPropertyOfType(declaredType, fieldName)) {
    return narrowedFieldShape() ?? schemaHaxeType;
  }
  if (declaredType.isUnion()) return narrowedFieldShape() ?? schemaHaxeType;
  if (declaredTypeNode && ts.isTypeReferenceNode(declaredTypeNode) && declaredTypeNode.typeArguments?.length) {
    return undefined;
  }
  const declaredResolution = context.typedStructs.resolveDirect(declaredType);
  if (declaredTypeNode) {
    const storageType = lowerType(declaredTypeNode, context);
    const concreteStorageType = storageType.kind === 'nullable' ? storageType.inner : storageType;
    if (concreteStorageType.kind === 'named' && concreteStorageType.name === 'flight._internal._IndexedAccess') {
      return schemaHaxeType;
    }
  }
  if (declaredResolution.kind === 'matched' && declaredResolution.schemas[0]?.id === schemaId) return undefined;
  try {
    if (!declaredTypeNode) return schemaHaxeType;
    const storageType = lowerType(declaredTypeNode, context);
    const concreteStorageType = storageType.kind === 'nullable' ? storageType.inner : storageType;
    return concreteStorageType.kind === 'named' ? schemaHaxeType : undefined;
  } catch (error) {
    if (error instanceof UnsupportedSyntaxError) return undefined;
    throw error;
  }
}

function declaredStorageTypeNode(expression: ts.Expression, checker: ts.TypeChecker): ts.TypeNode | undefined {
  if (!ts.isIdentifier(expression)) return undefined;
  const declaration = checker.getSymbolAtLocation(expression)?.valueDeclaration;
  return declaration &&
    (ts.isParameter(declaration) || ts.isVariableDeclaration(declaration) || ts.isPropertyDeclaration(declaration))
    ? declaration.type
    : undefined;
}

function typeNodeContainsIndexedAccess(node: ts.TypeNode): boolean {
  if (ts.isIndexedAccessTypeNode(node)) return true;
  let found = false;
  ts.forEachChild(node, (child) => {
    if (!found && ts.isTypeNode(child) && typeNodeContainsIndexedAccess(child)) found = true;
  });
  return found;
}

function checkerTypeContainsTypeParameter(type: ts.Type, checker: ts.TypeChecker, seen = new Set<ts.Type>()): boolean {
  if (seen.has(type)) return false;
  seen.add(type);
  if ((type.flags & ts.TypeFlags.TypeParameter) !== 0) return true;
  if (
    type.isUnionOrIntersection() &&
    type.types.some((member) => checkerTypeContainsTypeParameter(member, checker, seen))
  ) {
    return true;
  }
  for (const signature of [...type.getCallSignatures(), ...type.getConstructSignatures()]) {
    const location = signature.declaration;
    if (
      checkerTypeContainsTypeParameter(checker.getReturnTypeOfSignature(signature), checker, seen) ||
      (location &&
        signature
          .getParameters()
          .some((parameter) =>
            checkerTypeContainsTypeParameter(checker.getTypeOfSymbolAtLocation(parameter, location), checker, seen),
          ))
    ) {
      return true;
    }
  }
  return checkerTypeArguments(type, checker).some((argument) =>
    checkerTypeContainsTypeParameter(argument, checker, seen),
  );
}

function checkerTypesHaveConflictingProperties(types: readonly ts.Type[], checker: ts.TypeChecker): boolean {
  if (
    !types.some((type) => {
      return [type, ...checkerTypeArguments(type, checker)].some((candidate) => {
        const name = (candidate.aliasSymbol ?? candidate.getSymbol())?.getName();
        return name?.startsWith('Host') || name?.startsWith('Has') || name?.endsWith('Options');
      });
    })
  ) {
    return false;
  }
  const propertyTypes = new Map<string, string>();
  for (const type of types) {
    for (const property of checker.getPropertiesOfType(type)) {
      const name = property.getName();
      const declaration = property.valueDeclaration ?? property.declarations?.[0];
      if (!declaration) continue;
      const propertyType = checker.typeToString(
        checker.getTypeOfSymbolAtLocation(property, declaration),
        undefined,
        ts.TypeFormatFlags.NoTruncation,
      );
      const previous = propertyTypes.get(name);
      if (previous !== undefined && previous !== propertyType) return true;
      propertyTypes.set(name, propertyType);
    }
  }
  return false;
}

function isTypedStructWrite(node: ts.PropertyAccessExpression): boolean {
  const parent = node.parent;
  if (
    ts.isBinaryExpression(parent) &&
    parent.left === node &&
    parent.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
    parent.operatorToken.kind <= ts.SyntaxKind.LastAssignment
  ) {
    return true;
  }
  return (
    (ts.isPrefixUnaryExpression(parent) || ts.isPostfixUnaryExpression(parent)) &&
    (parent.operator === ts.SyntaxKind.PlusPlusToken || parent.operator === ts.SyntaxKind.MinusMinusToken)
  );
}

function lowerExpression(node: ts.Expression, context: LoweringContext): IrExpression {
  const expression = lowerExpressionNode(node, context);
  const staticFacts = expressionStaticFacts(node, context);
  if (staticFacts) expression.staticFacts = staticFacts;
  const contextualType =
    context.preserveExpressionTypes && ts.isCallExpression(node) ? context.checker?.getContextualType(node) : undefined;
  const loweredContextualType = contextualType ? lowerCheckerType(contextualType, node, context, new Set()) : undefined;
  const loweredInferredType = context.preserveExpressionTypes ? inferredType(node, context) : undefined;
  const inferredExpressionType =
    context.preserveExpressionTypes && preservesExpressionType(node)
      ? loweredInferredType && loweredInferredType.kind !== 'dynamic'
        ? loweredInferredType
        : (loweredContextualType ?? loweredInferredType)
      : undefined;
  const expressionTypeParameters =
    ts.isArrowFunction(node) || ts.isFunctionExpression(node)
      ? new Set([
          ...context.erasedExpressionTypeParameters,
          ...(node.typeParameters?.map((parameter) => parameter.name.text) ?? []),
        ])
      : context.erasedExpressionTypeParameters;
  const type =
    inferredExpressionType && expressionTypeParameters.size > 0
      ? eraseLocalTypeParameters(inferredExpressionType, expressionTypeParameters)
      : inferredExpressionType;
  // Anonymous object shapes are already explicit in object-expression IR and
  // on each structural member binding. Repeating their full field graph on
  // every intermediate expression makes module transforms quadratic without
  // adding backend information.
  const explicitParentCast =
    (ts.isAsExpression(node.parent) || ts.isTypeAssertionExpression(node.parent)) && node.parent.expression === node;
  if (type && !explicitParentCast && (type.kind !== 'anonymous' || ts.isCallExpression(node))) expression.type = type;
  return expression;
}

function preservesExpressionType(node: ts.Expression): boolean {
  if (
    ts.isCallExpression(node) ||
    ts.isNewExpression(node) ||
    ts.isPropertyAccessExpression(node) ||
    ts.isElementAccessExpression(node) ||
    ts.isConditionalExpression(node) ||
    ts.isArrowFunction(node) ||
    ts.isFunctionExpression(node) ||
    ts.isAwaitExpression(node)
  ) {
    return true;
  }
  if (!ts.isIdentifier(node)) return false;
  const parent = node.parent;
  return (ts.isPropertyAccessExpression(parent) || ts.isElementAccessExpression(parent)) && parent.expression === node;
}

function lowerExpressionNode(node: ts.Expression, context: LoweringContext): IrExpression {
  if (ts.isParenthesizedExpression(node)) return lowerExpression(node.expression, context);
  if (ts.isAsExpression(node) || ts.isTypeAssertionExpression(node)) {
    if (
      node.type.kind === ts.SyntaxKind.ConstKeyword ||
      (ts.isTypeReferenceNode(node.type) && node.type.typeName.getText(context.sourceFile) === 'const')
    ) {
      return lowerExpression(node.expression, context);
    }
    const type = ts.isIntersectionTypeNode(node.type)
      ? lowerIntersection(
          node.type.types.map((item) => lowerType(item, context)),
          true,
        )
      : lowerType(node.type, context);
    return { expression: lowerExpression(node.expression, context), kind: 'cast', type };
  }
  if (ts.isNonNullExpression(node)) {
    return lowerExpression(node.expression, context);
  }
  if (ts.isSatisfiesExpression(node)) return lowerExpression(node.expression, context);
  if (ts.isAwaitExpression(node)) return { expression: lowerExpression(node.expression, context), kind: 'await' };
  if (ts.isVoidExpression(node)) {
    return {
      kind: 'unary',
      operand: lowerExpression(node.expression, context),
      operator: 'void',
      postfix: false,
    };
  }
  if (ts.isRegularExpressionLiteral(node)) {
    const match = /^\/(.*)\/([a-z]*)$/su.exec(node.text);
    return { flags: match?.[2] ?? '', kind: 'regexp', pattern: match?.[1] ?? node.text };
  }
  if (node.kind === ts.SyntaxKind.ImportKeyword) return { kind: 'identifier', name: '_Runtime.dynamicImport' };
  if (node.kind === ts.SyntaxKind.ThisKeyword) {
    return context.classThis
      ? { kind: 'identifier', name: 'this' }
      : context.dynamicThisCapture
        ? { kind: 'identifier', name: context.dynamicThisCapture }
        : {
            arguments: [],
            callee: {
              kind: 'property',
              name: 'thisValue',
              object: { kind: 'identifier', name: '_Runtime' },
            },
            kind: 'call',
            typeArguments: [],
          };
  }
  if (node.kind === ts.SyntaxKind.SuperKeyword) return { kind: 'identifier', name: 'super' };
  if (ts.isIdentifier(node)) return lowerIdentifier(node, context, isLexicallyBound(node, context));
  if (ts.isNumericLiteral(node)) return { kind: 'literal', value: Number(node.text) };
  if (ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node))
    return { kind: 'literal', value: node.text };
  if (ts.isTemplateExpression(node)) {
    return {
      kind: 'template',
      parts: [
        node.head.text,
        ...node.templateSpans.flatMap((span) => [lowerExpression(span.expression, context), span.literal.text]),
      ],
    };
  }
  if (node.kind === ts.SyntaxKind.TrueKeyword) return { kind: 'literal', value: true };
  if (node.kind === ts.SyntaxKind.FalseKeyword) return { kind: 'literal', value: false };
  if (node.kind === ts.SyntaxKind.NullKeyword) return { kind: 'literal', value: null };
  if (ts.isArrayLiteralExpression(node)) {
    return { elements: node.elements.map((element) => lowerExpression(element, context)), kind: 'array' };
  }
  if (ts.isObjectLiteralExpression(node)) {
    const cppStructInit =
      context.checker && context.typedStructs
        ? context.typedStructs.resolveCppStructInitConstruction(
            context.checker.getContextualType(node) ?? context.checker.getTypeAtLocation(node),
          )
        : undefined;
    const thisCapture = node.properties.some(
      (property) => ts.isMethodDeclaration(property) && containsLexicallyOwnedThis(property),
    )
      ? freshThisCapture(context)
      : undefined;
    return {
      ...(cppStructInit ? { cppStructInit } : {}),
      kind: 'object',
      properties: node.properties.map((property) => {
        if (ts.isSpreadAssignment(property)) {
          return { expression: lowerExpression(property.expression, context), kind: 'spread' as const };
        }
        if (ts.isShorthandPropertyAssignment(property)) {
          return {
            kind: 'property' as const,
            name: property.name.text,
            value: lowerIdentifier(property.name, context, isLexicallyBound(property.name, context)),
          };
        }
        if (ts.isPropertyAssignment(property)) {
          const value = lowerExpression(property.initializer, context);
          if (ts.isComputedPropertyName(property.name)) {
            return {
              key: lowerExpression(property.name.expression, context),
              kind: 'computedProperty' as const,
              value,
            };
          }
          return { kind: 'property' as const, name: propertyName(property.name, context), value };
        }
        if (ts.isMethodDeclaration(property) && property.body) {
          const previousClassThis = context.classThis;
          const previousDynamicThisCapture = context.dynamicThisCapture;
          const methodThisCapture = containsLexicallyOwnedThis(property) ? thisCapture : undefined;
          context.classThis = false;
          context.dynamicThisCapture = methodThisCapture;
          let value: Extract<IrExpression, { kind: 'function' }>;
          try {
            value = {
              async: hasModifier(property, ts.SyntaxKind.AsyncKeyword),
              body: lowerStatementList(property.body.statements, context),
              kind: 'function' as const,
              parameters: property.parameters
                .filter((parameter) => !isThisParameter(parameter))
                .map((parameter) => lowerParameter(parameter, context)),
              returns:
                (property.type ? lowerType(property.type, context) : inferredReturnType(property, context)) ??
                (hasModifier(property, ts.SyntaxKind.AsyncKeyword) ? promiseOfDynamic() : undefined),
            };
          } finally {
            context.classThis = previousClassThis;
            context.dynamicThisCapture = previousDynamicThisCapture;
          }
          if (ts.isComputedPropertyName(property.name)) {
            return {
              key: lowerExpression(property.name.expression, context),
              kind: 'computedProperty' as const,
              value,
            };
          }
          return {
            kind: 'property' as const,
            name: propertyName(property.name, context),
            value,
          };
        }
        return unsupported(property, context, 'object literal member');
      }),
      ...(thisCapture ? { thisCapture } : {}),
    };
  }
  if (ts.isPropertyAccessExpression(node)) {
    if (
      ts.isIdentifier(node.expression) &&
      node.expression.text === 'Math' &&
      !isLexicallyBound(node.expression, context) &&
      node.name.text in standardMathConstants
    ) {
      return {
        kind: 'literal',
        value: standardMathConstants[node.name.text as keyof typeof standardMathConstants],
      };
    }
    if (
      ts.isIdentifier(node.expression) &&
      node.expression.text in typedArrayByteLengths &&
      !isLexicallyBound(node.expression, context) &&
      node.name.text === 'BYTES_PER_ELEMENT'
    ) {
      return {
        kind: 'literal',
        value: typedArrayByteLengths[node.expression.text as TypedArrayBinding],
      };
    }
    if (
      ts.isIdentifier(node.expression) &&
      node.expression.text === 'Number' &&
      !isLexicallyBound(node.expression, context)
    ) {
      if (
        [
          'EPSILON',
          'MAX_SAFE_INTEGER',
          'MAX_VALUE',
          'MIN_SAFE_INTEGER',
          'MIN_VALUE',
          'NaN',
          'NEGATIVE_INFINITY',
          'POSITIVE_INFINITY',
        ].includes(node.name.text)
      ) {
        return { kind: 'property', name: node.name.text, object: { kind: 'identifier', name: 'Number' } };
      }
    }
    const webGpuConstantNamespace =
      ts.isIdentifier(node.expression) &&
      webGpuConstantNamespaces.has(node.expression.text) &&
      !isLexicallyBound(node.expression, context)
        ? node.expression.text
        : undefined;
    const objectIsGlobalObject =
      ts.isIdentifier(node.expression) &&
      node.expression.text === 'Object' &&
      !isLexicallyBound(node.expression, context);
    const hostReceiverBinding = boundHostEndpoint(node.expression, context);
    const objectHostBinding = hostReceiverBinding
      ? hostEndpointBindingForUse(hostReceiverBinding, hostPropertyOperation(node), node.name.text)
      : undefined;
    const objectIsCollection = collectionBinding(node.expression, node.name.text, context);
    const objectIsTypedArray = typedArrayBinding(node.expression, node.name.text, context);
    const objectIsString = standardStringBinding(node.expression, node.name.text, context);
    const generatedClass = generatedClassBinding(node.expression, context);
    const hostTypeBinding = hostTypeMemberBinding(node, context);
    const typedStructBinding = typedStructPropertyBinding(node, context);
    const structuralType =
      !context.preserveExpressionTypes || generatedClass || hostTypeBinding || typedStructBinding
        ? undefined
        : structuralReceiverType(node, context);
    return {
      binding: webGpuConstantNamespace
        ? 'WebGpuConstantsBackend'
        : (objectHostBinding ??
          objectIsCollection ??
          (objectIsGlobalObject ? 'DynamicObject' : (objectIsTypedArray ?? objectIsString))),
      generatedClass,
      hostTypeBinding,
      kind: 'property',
      name: node.name.text,
      object: webGpuConstantNamespace
        ? { kind: 'literal', value: webGpuConstantNamespace }
        : lowerExpression(node.expression, context),
      optional: ts.isOptionalChain(node),
      ...(structuralType ? { structuralReceiverType: structuralType } : {}),
      typedStructBinding,
    };
  }
  if (ts.isElementAccessExpression(node) && node.argumentExpression) {
    const webGlBinding = boundHostEndpoint(node.expression, context) === 'WebGl2Backend';
    return {
      binding: webGlBinding ? 'WebGl2Backend' : undefined,
      index: lowerExpression(node.argumentExpression, context),
      kind: 'element',
      object: lowerExpression(node.expression, context),
      optional: ts.isOptionalChain(node),
      webGlComputedDomain: webGlBinding
        ? webGlComputedConstantDomain(context.checker?.getTypeAtLocation(node.argumentExpression), context.checker)
        : undefined,
    };
  }
  if (ts.isCallExpression(node)) {
    const variadic = variadicCallConvention(node, context);
    const callee = lowerExpression(node.expression, context);
    const direct =
      callee.kind === 'identifier' &&
      !node.questionDotToken &&
      !variadic &&
      !node.arguments.some(ts.isSpreadElement) &&
      checkerCallIsTyped(node.expression, context);
    const directCalleeType = direct ? directCallReceiverCast(node, context) : undefined;
    const adaptTypedPropertyCall =
      callee.kind === 'property' &&
      callee.name !== 'set' &&
      Boolean(callee.generatedClass || callee.typedStructBinding || callee.structuralReceiverType);
    const generatedClassCall = callee.kind === 'property' && Boolean(callee.generatedClass);
    const checkedCall =
      generatedClassCall || ((direct || adaptTypedPropertyCall) && checkerCallIsTyped(node.expression, context))
        ? directCallArguments(node, context)
        : undefined;
    return {
      arguments: checkedCall?.arguments ?? node.arguments.map((argument) => lowerExpression(argument, context)),
      callee,
      ...(checkedCall?.inferenceCasts.some(Boolean) ? { inferenceCastArguments: checkedCall.inferenceCasts } : {}),
      ...(checkedCall?.omittedArguments.some(Boolean) ? { omittedArguments: checkedCall.omittedArguments } : {}),
      ...(checkedCall?.undefinedArguments.some(Boolean) ? { undefinedArguments: checkedCall.undefinedArguments } : {}),
      ...(checkedCall?.types ? { directArgumentTypes: checkedCall.types } : {}),
      ...(direct
        ? {
            direct: true,
            ...(directCalleeType ? { directCalleeType } : {}),
          }
        : {}),
      kind: 'call',
      optional: Boolean(node.questionDotToken),
      ...variadic,
      typeArguments: node.typeArguments?.map((argument) => lowerType(argument, context)) ?? [],
    };
  }
  if (ts.isSpreadElement(node)) return { expression: lowerExpression(node.expression, context), kind: 'spread' };
  if (ts.isTypeOfExpression(node)) {
    if (
      ts.isIdentifier(node.expression) &&
      !isLexicallyBound(node.expression, context) &&
      !context.externalValues.has(node.expression.text)
    ) {
      return {
        arguments: [{ kind: 'literal', value: node.expression.text }],
        callee: {
          kind: 'property',
          name: 'typeofValue',
          object: { kind: 'identifier', name: 'flight._internal._HostValueLut' },
        },
        kind: 'call',
        typeArguments: [],
      };
    }
    return { kind: 'unary', operand: lowerExpression(node.expression, context), operator: 'typeof', postfix: false };
  }
  if (ts.isDeleteExpression(node)) {
    return { kind: 'unary', operand: lowerExpression(node.expression, context), operator: 'delete', postfix: false };
  }
  if (ts.isNewExpression(node)) {
    return {
      arguments: node.arguments?.map((argument) => lowerExpression(argument, context)) ?? [],
      callee: lowerExpression(node.expression, context),
      kind: 'new',
      runtime: isLocallyBoundRuntimeConstructor(node.expression, context),
    };
  }
  if (ts.isConditionalExpression(node)) {
    return {
      condition: lowerExpression(node.condition, context),
      kind: 'conditional',
      whenFalse: lowerExpression(node.whenFalse, context),
      whenTrue: lowerExpression(node.whenTrue, context),
    };
  }
  if (ts.isBinaryExpression(node)) {
    const iterableProbe = symbolIteratorPresenceProbe(node, context);
    if (iterableProbe) {
      return {
        arguments: [lowerExpression(iterableProbe, context)],
        callee: { kind: 'identifier', name: '_Runtime.isIterable' },
        direct: true,
        kind: 'call',
        type: { kind: 'primitive', name: 'Bool' },
        typeArguments: [],
      };
    }
    const operator = node.operatorToken.getText(context.sourceFile);
    const assignment =
      node.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
      node.operatorToken.kind <= ts.SyntaxKind.LastAssignment;
    const left = lowerExpression(assignment ? unwrapAssignmentTarget(node.left) : node.left, context);
    const loweredRight = lowerExpression(node.right, context);
    const right =
      assignment && operator === '='
        ? adaptFunctionValueToType(
            node.right,
            loweredRight,
            context.checker?.getTypeAtLocation(node.left),
            context,
            left.kind === 'property' ? (left.type ?? left.typedStructBinding?.field.type) : left.type,
          )
        : loweredRight;
    if (assignment) return { kind: 'assignment', left, operator, right };
    return {
      domRootBinding: operator === 'in' ? domRootBinding(node.right, context) : undefined,
      kind: 'binary',
      left,
      operator,
      right,
    };
  }
  if (ts.isPrefixUnaryExpression(node) || ts.isPostfixUnaryExpression(node)) {
    return {
      kind: 'unary',
      operand: lowerExpression(node.operand, context),
      operator: ts.tokenToString(node.operator) ?? unsupported(node, context, 'unary operator'),
      postfix: ts.isPostfixUnaryExpression(node),
    };
  }
  if (ts.isArrowFunction(node) || ts.isFunctionExpression(node)) {
    const previousClassThis = context.classThis;
    const previousDynamicThisCapture = context.dynamicThisCapture;
    const previousErasedExpressionTypeParameters = context.erasedExpressionTypeParameters;
    const thisCapture = ts.isFunctionExpression(node) ? dynamicThisCapture(node, context) : undefined;
    if (ts.isFunctionExpression(node)) {
      context.classThis = false;
      context.dynamicThisCapture = thisCapture;
    }
    try {
      const loweredParameters = lowerParameterList(node.parameters, context);
      const erasedTypeParameters = new Set(node.typeParameters?.map((parameter) => parameter.name.text) ?? []);
      context.erasedExpressionTypeParameters = new Set([
        ...previousErasedExpressionTypeParameters,
        ...erasedTypeParameters,
      ]);
      const parameters = padContextualFunctionParameters(node, loweredParameters.parameters, context).map(
        (parameter) => ({
          ...parameter,
          type: eraseLocalTypeParameters(parameter.type, erasedTypeParameters),
        }),
      );
      const expression = ts.isBlock(node.body) ? undefined : lowerExpression(node.body, context);
      const loweredReturnType =
        (node.type ? lowerType(node.type, context) : inferredReturnType(node, context)) ??
        (hasModifier(node, ts.SyntaxKind.AsyncKeyword) ? promiseOfDynamic() : undefined);
      const returnType = loweredReturnType
        ? eraseLocalTypeParameters(loweredReturnType, erasedTypeParameters)
        : undefined;
      return {
        async: hasModifier(node, ts.SyntaxKind.AsyncKeyword),
        body: ts.isBlock(node.body)
          ? [...loweredParameters.prefix, ...lowerStatementList(node.body.statements, context)]
          : loweredParameters.prefix.length > 0
            ? [...loweredParameters.prefix, { expression, kind: 'return' }]
            : [],
        expression: loweredParameters.prefix.length > 0 ? undefined : expression,
        kind: 'function',
        name: ts.isFunctionExpression(node) ? node.name?.text : undefined,
        parameters,
        returns: returnType,
        ...(thisCapture ? { thisCapture } : {}),
      };
    } finally {
      context.classThis = previousClassThis;
      context.dynamicThisCapture = previousDynamicThisCapture;
      context.erasedExpressionTypeParameters = previousErasedExpressionTypeParameters;
    }
  }
  return unsupported(node, context, `expression ${ts.SyntaxKind[node.kind] ?? node.kind}`);
}

function symbolIteratorPresenceProbe(node: ts.BinaryExpression, context: LoweringContext): ts.Expression | undefined {
  if (
    node.operatorToken.kind !== ts.SyntaxKind.InKeyword ||
    !ts.isPropertyAccessExpression(node.left) ||
    node.left.name.text !== 'iterator' ||
    !ts.isIdentifier(node.left.expression) ||
    node.left.expression.text !== 'Symbol' ||
    isLexicallyBound(node.left.expression, context) ||
    !ts.isCallExpression(node.right) ||
    !ts.isIdentifier(node.right.expression) ||
    node.right.expression.text !== 'Object' ||
    isLexicallyBound(node.right.expression, context) ||
    node.right.arguments.length !== 1 ||
    ts.isSpreadElement(node.right.arguments[0]!)
  ) {
    return undefined;
  }
  return node.right.arguments[0];
}

function checkerCallIsTyped(node: ts.Expression, context: LoweringContext): boolean {
  const checker = context.checker;
  if (!checker) return false;
  const type = checker.getTypeAtLocation(unwrapCallTargetAssertions(node));
  if ((type.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.TypeParameter)) !== 0) return false;
  return checker.getSignaturesOfType(type, ts.SignatureKind.Call).length > 0;
}

function directCallArguments(
  node: ts.CallExpression,
  context: LoweringContext,
): {
  arguments: IrExpression[];
  inferenceCasts: boolean[];
  omittedArguments: boolean[];
  undefinedArguments: boolean[];
  types?: Array<IrType | undefined>;
} {
  const arguments_ = node.arguments.map((argument) => lowerExpression(argument, context));
  const omittedArguments = node.arguments.map(() => false);
  const undefinedArguments = node.arguments.map(() => false);
  const inferenceCasts = node.arguments.map(
    (argument) =>
      ts.isObjectLiteralExpression(argument) ||
      ts.isArrayLiteralExpression(argument) ||
      ts.isArrowFunction(argument) ||
      ts.isFunctionExpression(argument),
  );
  const checker = context.checker;
  const signature = checker?.getResolvedSignature(node);
  if (!checker || !signature) {
    return { arguments: arguments_, inferenceCasts, omittedArguments, undefinedArguments };
  }
  const symbols = signature.getParameters();
  if (symbols.some(signatureParameterIsRest)) {
    return { arguments: arguments_, inferenceCasts, omittedArguments, undefinedArguments };
  }
  for (let index = 0; index < arguments_.length && index < symbols.length; index++) {
    undefinedArguments[index] =
      signatureParameterIsOptional(symbols[index]!) &&
      checkerTypeIncludesUndefined(checker.getTypeAtLocation(node.arguments[index]!));
    arguments_[index] = adaptDirectFunctionArgument(
      node.arguments[index]!,
      arguments_[index]!,
      symbols[index]!,
      context,
    );
  }
  const parameterTypes = symbols.map((parameter) => checker.getTypeOfSymbolAtLocation(parameter, node));
  const types = parameterTypes.map((type) => lowerCheckerType(type, node, context, new Set()));
  for (let index = arguments_.length; index < symbols.length; index++) {
    if (!signatureParameterIsOptional(symbols[index]!)) break;
    arguments_.push({
      kind: 'property',
      name: 'UNDEFINED',
      object: { kind: 'identifier', name: '_Runtime' },
    });
    omittedArguments.push(true);
  }
  const usedTypes = types.slice(0, arguments_.length);
  const visibleTypes = usedTypes.map((type, index) =>
    type &&
    (directArgumentTypeIsVisible(type, context) || checkerTypeIsExportedMonomorphic(parameterTypes[index]!, checker))
      ? type
      : undefined,
  );
  visibleTypes.forEach((type, index) => {
    const expected = usedTypes[index];
    if (!type && expected && expected.kind !== 'primitive') inferenceCasts[index] = true;
  });
  return visibleTypes.some((type) => type)
    ? { arguments: arguments_, inferenceCasts, omittedArguments, types: visibleTypes, undefinedArguments }
    : { arguments: arguments_, inferenceCasts, omittedArguments, undefinedArguments };
}

function adaptDirectFunctionArgument(
  node: ts.Expression,
  lowered: IrExpression,
  expectedParameter: ts.Symbol,
  context: LoweringContext,
): IrExpression {
  const checker = context.checker;
  if (!checker) return lowered;
  const expectedType = checker.getNonNullableType(
    checker.getContextualType(node) ?? checker.getTypeOfSymbolAtLocation(expectedParameter, node),
  );
  return adaptFunctionValueToType(node, lowered, expectedType, context);
}

function adaptFunctionValueToType(
  node: ts.Expression,
  lowered: IrExpression,
  rawExpectedType: ts.Type | undefined,
  context: LoweringContext,
  expectedIrType?: IrType,
): IrExpression {
  const checker = context.checker;
  if (!checker || !rawExpectedType) return lowered;
  const expectedType = checker.getNonNullableType(rawExpectedType);
  const expectedSignature = checker.getSignaturesOfType(expectedType, ts.SignatureKind.Call)[0];
  const actualSignature = checker.getSignaturesOfType(checker.getTypeAtLocation(node), ts.SignatureKind.Call)[0];
  if (!expectedSignature || !actualSignature) return lowered;
  const expectedParameters = expectedSignature.getParameters();
  const actualParameters = actualSignature.getParameters();
  if (actualParameters.length >= expectedParameters.length || actualParameters.some(signatureParameterIsRest)) {
    return lowered;
  }
  const expectedIrSignature =
    expectedIrType?.kind === 'function'
      ? expectedIrType
      : expectedIrType?.kind === 'nullable' && expectedIrType.inner.kind === 'function'
        ? expectedIrType.inner
        : undefined;
  const parameters: IrParameter[] = [];
  const erasedTypeParameters = enclosingTypeParameterNames(node);
  for (const parameter of expectedParameters) {
    const actualParameter = actualParameters[parameters.length];
    const sourceParameter = actualParameter ?? parameter;
    const declaration = sourceParameter.valueDeclaration ?? sourceParameter.declarations?.[0];
    const location = actualParameter || expectedSignature.typeParameters?.length ? node : (declaration ?? node);
    const parameterType = checker.getTypeOfSymbolAtLocation(sourceParameter, location);
    const checkerType = lowerCheckerType(parameterType, node, context, new Set([expectedType]));
    const sourceVisible = [parameterType, ...checkerTypeArguments(parameterType, checker)].some((candidate) =>
      sourceDefinedNamedType(candidate.aliasSymbol ?? candidate.getSymbol()),
    );
    const expectedIrParameter = expectedIrSignature?.parameters[parameters.length];
    const rawType = expectedIrParameter
      ? expectedIrParameter
      : checkerType && (directArgumentTypeIsVisible(checkerType, context) || sourceVisible)
        ? checkerType
        : declaration &&
            ts.isParameter(declaration) &&
            declaration.type &&
            declaration.getSourceFile() === context.sourceFile
          ? lowerType(declaration.type, context)
          : ({ kind: 'dynamic' } as const);
    if (!rawType) return lowered;
    const parameterTypeNames = new Set([...erasedTypeParameters, ...enclosingTypeParameterNames(declaration ?? node)]);
    const type = eraseLocalTypeParameters(rawType, parameterTypeNames);
    parameters.push({
      name: `__unused${String(context.temporaryIndex++)}`,
      optional: false,
      rest: false,
      type,
    });
  }
  const returns =
    expectedIrSignature?.returns ??
    lowerCheckerType(checker.getReturnTypeOfSignature(actualSignature), node, context, new Set());
  if (!returns) return lowered;
  return {
    body: [],
    expression: {
      arguments: parameters
        .slice(0, actualParameters.length)
        .map((parameter) => ({ kind: 'identifier', name: parameter.name })),
      callee: lowered,
      ...(lowered.kind === 'identifier' ? { direct: true } : {}),
      kind: 'call',
      typeArguments: [],
    },
    kind: 'function',
    parameters,
    returns,
  };
}

function checkerTypeIsExportedMonomorphic(type: ts.Type, checker: ts.TypeChecker): boolean {
  if (type.aliasSymbol?.getName() === 'Readonly' && type.aliasTypeArguments?.[0]) {
    return checkerTypeIsExportedMonomorphic(type.aliasTypeArguments[0], checker);
  }
  return (
    sourceDefinedNamedType(type.aliasSymbol ?? type.getSymbol()) && checkerTypeArguments(type, checker).length === 0
  );
}

function eraseLocalTypeParameters(type: IrType, names: ReadonlySet<string>): IrType {
  switch (type.kind) {
    case 'anonymous':
      return {
        extends: type.extends.map((item) => eraseLocalTypeParameters(item, names)),
        fields: type.fields.map((field) => ({ ...field, type: eraseLocalTypeParameters(field.type, names) })),
        kind: 'anonymous',
      };
    case 'array':
      return { element: eraseLocalTypeParameters(type.element, names), kind: 'array' };
    case 'function':
      return {
        kind: 'function',
        parameters: type.parameters.map((item) => eraseLocalTypeParameters(item, names)),
        returns: eraseLocalTypeParameters(type.returns, names),
      };
    case 'named':
      return names.has(type.name)
        ? { kind: 'dynamic', reason: 'source-unknown' }
        : {
            arguments: type.arguments.map((item) => eraseLocalTypeParameters(item, names)),
            kind: 'named',
            name: type.name,
          };
    case 'nullable':
      return { inner: eraseLocalTypeParameters(type.inner, names), kind: 'nullable' };
    case 'union':
      return { alternatives: type.alternatives.map((item) => eraseLocalTypeParameters(item, names)), kind: 'union' };
    case 'dynamic':
    case 'primitive':
      return type;
  }
}

function typeNodeIncludesErasedUtility(node: ts.TypeNode): boolean {
  let found = false;
  const visit = (current: ts.Node): void => {
    if (found) return;
    if (ts.isConditionalTypeNode(current) || ts.isMappedTypeNode(current)) {
      found = true;
      return;
    }
    if (
      ts.isTypeReferenceNode(current) &&
      ts.isIdentifier(current.typeName) &&
      ['Exclude', 'Extract', 'Omit', 'Partial', 'Pick', 'Required'].includes(current.typeName.text)
    ) {
      found = true;
      return;
    }
    ts.forEachChild(current, visit);
  };
  visit(node);
  return found;
}

function directArgumentTypeIsVisible(type: IrType, context: LoweringContext): boolean {
  switch (type.kind) {
    case 'anonymous':
      return (
        type.extends.every((item) => directArgumentTypeIsVisible(item, context)) &&
        type.fields.every((field) => directArgumentTypeIsVisible(field.type, context))
      );
    case 'array':
      return directArgumentTypeIsVisible(type.element, context);
    case 'function':
      return (
        type.parameters.every((parameter) => directArgumentTypeIsVisible(parameter, context)) &&
        directArgumentTypeIsVisible(type.returns, context)
      );
    case 'named':
      return (
        (type.name.includes('.') || context.directTypeNames.has(type.name)) &&
        type.arguments.every((argument) => directArgumentTypeIsVisible(argument, context))
      );
    case 'nullable':
      return directArgumentTypeIsVisible(type.inner, context);
    case 'union':
      return type.alternatives.every((alternative) => directArgumentTypeIsVisible(alternative, context));
    case 'dynamic':
    case 'primitive':
      return true;
  }
}

function signatureParameterIsOptional(parameter: ts.Symbol): boolean {
  if ((parameter.flags & ts.SymbolFlags.Optional) !== 0) return true;
  return Boolean(
    parameter.declarations?.some(
      (declaration) => ts.isParameter(declaration) && Boolean(declaration.questionToken || declaration.initializer),
    ),
  );
}

function checkerTypeIncludesUndefined(type: ts.Type): boolean {
  return type.isUnion()
    ? type.types.some((member) => checkerTypeIncludesUndefined(member))
    : (type.flags & ts.TypeFlags.Undefined) !== 0;
}

function signatureParameterIsRest(parameter: ts.Symbol): boolean {
  return Boolean(
    parameter.declarations?.some((declaration) => ts.isParameter(declaration) && Boolean(declaration.dotDotDotToken)),
  );
}

function enclosingTypeParameterNames(node: ts.Node): ReadonlySet<string> {
  const names = new Set<string>();
  let current: ts.Node | undefined = node;
  while (current) {
    if (
      ts.isFunctionLike(current) ||
      ts.isClassLike(current) ||
      ts.isInterfaceDeclaration(current) ||
      ts.isTypeAliasDeclaration(current)
    ) {
      current.typeParameters?.forEach((parameter) => names.add(parameter.name.text));
    }
    current = current.parent;
  }
  return names;
}

function padContextualFunctionParameters(
  node: ts.ArrowFunction | ts.FunctionExpression,
  parameters: IrParameter[],
  context: LoweringContext,
): IrParameter[] {
  const checker = context.checker;
  const contextualType = checker?.getContextualType(node);
  const signature =
    contextualType &&
    checker?.getSignaturesOfType(checker.getNonNullableType(contextualType), ts.SignatureKind.Call)[0];
  if (!checker || !signature) return parameters;
  const contextualParameters = signature.getParameters();
  if (contextualParameters.length <= parameters.length || contextualParameters.some(signatureParameterIsRest)) {
    return parameters;
  }
  const padded = [...parameters];
  const erasedTypeParameters = enclosingTypeParameterNames(node);
  for (let index = parameters.length; index < contextualParameters.length; index++) {
    const parameter = contextualParameters[index]!;
    const declaration = parameter.valueDeclaration ?? parameter.declarations?.[0];
    const checkerType = checker.getTypeOfSymbolAtLocation(parameter, node);
    const loweredType = lowerCheckerType(checkerType, node, context, new Set());
    const parameterTypeNames = new Set([...erasedTypeParameters, ...enclosingTypeParameterNames(declaration ?? node)]);
    const type = checkerTypeContainsTypeParameter(checkerType, checker)
      ? { kind: 'dynamic' as const, reason: 'source-unknown' as const }
      : loweredType
        ? eraseLocalTypeParameters(loweredType, parameterTypeNames)
        : undefined;
    if (!type) return parameters;
    padded.push({
      name: `__unused${String(context.temporaryIndex++)}`,
      optional: false,
      rest: false,
      type,
    });
  }
  return padded;
}

function directCallReceiverCast(node: ts.CallExpression, context: LoweringContext): IrType | undefined {
  const checker = context.checker;
  if (!checker || !ts.isIdentifier(node.expression)) return undefined;
  const symbol = checker.getSymbolAtLocation(node.expression);
  const declaration = symbol?.valueDeclaration;
  const declaredTypeNode =
    declaration &&
    (ts.isParameter(declaration) || ts.isVariableDeclaration(declaration) || ts.isPropertyDeclaration(declaration))
      ? declaration.type
      : undefined;
  const declaredType = declaredTypeNode ? checker.getTypeFromTypeNode(declaredTypeNode) : undefined;
  const calleeType = checker.getTypeAtLocation(node.expression);
  const signatures = checker.getSignaturesOfType(calleeType, ts.SignatureKind.Call);
  if (
    !declaredType?.isUnionOrIntersection() &&
    !calleeType.isUnionOrIntersection() &&
    signatures.length <= 1 &&
    !signatures.some((candidate) => Boolean(candidate.typeParameters?.length))
  ) {
    return undefined;
  }
  const signature = checker.getResolvedSignature(node);
  if (!signature) return undefined;
  const parameters = signature.getParameters().map((parameter) => {
    return lowerCheckerType(checker.getTypeOfSymbolAtLocation(parameter, node), node, context, new Set());
  });
  const returns = lowerCheckerType(checker.getReturnTypeOfSignature(signature), node, context, new Set());
  return returns &&
    directArgumentTypeIsVisible(returns, context) &&
    parameters.every((parameter) => parameter && directArgumentTypeIsVisible(parameter, context))
    ? { kind: 'function', parameters: parameters as IrType[], returns }
    : undefined;
}

function isThisParameter(node: ts.ParameterDeclaration): boolean {
  return ts.isIdentifier(node.name) && node.name.text === 'this';
}

function promiseOfDynamic(): IrType {
  return {
    kind: 'named',
    name: 'flight._internal._Promise',
    arguments: [{ kind: 'dynamic' }],
  };
}

function lowerIdentifier(node: ts.Identifier, context: LoweringContext, locallyBound = false): IrExpression {
  const name = node.text;
  if (name === 'Math') return { kind: 'identifier', name: 'HxMath' };
  if (name === 'Boolean' && !locallyBound) {
    return { kind: 'identifier', name: '_Runtime.truthy' };
  }
  if (name === 'undefined') {
    return { kind: 'property', name: 'UNDEFINED', object: { kind: 'identifier', name: '_Runtime' } };
  }
  if (name === 'NaN') return { kind: 'property', name: 'NaN', object: { kind: 'identifier', name: 'HxMath' } };
  if (name === 'Infinity') {
    return { kind: 'property', name: 'POSITIVE_INFINITY', object: { kind: 'identifier', name: 'HxMath' } };
  }
  if (name === 'queueMicrotask' && !locallyBound) {
    return { kind: 'property', name: 'queueMicrotask', object: { kind: 'identifier', name: '_Runtime' } };
  }
  const external = context.externalValues.get(name);
  if (external) {
    return {
      arguments: [
        { kind: 'literal', value: external.specifier },
        { kind: 'literal', value: external.imported },
      ],
      callee: {
        kind: 'property',
        name: 'get',
        object: { kind: 'identifier', name: 'flight._internal._HostModuleLut' },
      },
      kind: 'call',
      typeArguments: [],
    };
  }
  const domRootBinding = locallyBound ? undefined : domRootBindings[name as keyof typeof domRootBindings];
  if (domRootBinding) return { domRootBinding, kind: 'identifier', name };
  const checkerHostGlobal = locallyBound ? undefined : hostTypeIdentityForValueSymbol(node, context.checker);
  if (!locallyBound && (platformGlobalValues.has(name) || standardGlobalValues.has(name) || checkerHostGlobal)) {
    return {
      arguments: [{ kind: 'literal', value: name }],
      callee: {
        kind: 'property',
        name: 'get',
        object: { kind: 'identifier', name: 'flight._internal._HostValueLut' },
      },
      kind: 'call',
      typeArguments: [],
    };
  }
  return { kind: 'identifier', name };
}

function unwrapAssignmentTarget(node: ts.Expression): ts.Expression {
  let target = node;
  while (
    ts.isParenthesizedExpression(target) ||
    ts.isAsExpression(target) ||
    ts.isTypeAssertionExpression(target) ||
    ts.isNonNullExpression(target)
  ) {
    target = target.expression;
  }
  return target;
}

function isLocallyBoundRuntimeConstructor(node: ts.Expression, context: LoweringContext): boolean {
  const target = unwrapAssignmentTarget(node);
  if (!ts.isIdentifier(target) || !context.checker || !isLexicallyBound(target, context)) return false;
  const symbol = context.checker.getSymbolAtLocation(target);
  return !symbol?.declarations?.some((declaration) => ts.isClassDeclaration(declaration));
}

function isLexicallyBound(identifier: ts.Identifier, context: LoweringContext): boolean {
  return isLexicallyBoundInScopes(identifier, context.scopeBindings);
}

function isLexicallyBoundInScopes(
  identifier: ts.Identifier,
  scopeBindings: WeakMap<ts.Node, ReadonlySet<string>>,
): boolean {
  let current: ts.Node | undefined = identifier.parent;
  while (current) {
    if (ts.isFunctionLike(current) || ts.isSourceFile(current)) {
      let bindings = scopeBindings.get(current);
      if (!bindings) {
        const collected = new Set<string>();
        if (ts.isFunctionLike(current)) {
          for (const parameter of current.parameters) collectBindingNames(parameter.name, collected);
        }
        const root = ts.isSourceFile(current) ? current : 'body' in current ? current.body : undefined;
        if (root) {
          const visit = (node: ts.Node): void => {
            if (node !== root && ts.isFunctionLike(node)) {
              if (node.name && ts.isIdentifier(node.name)) collected.add(node.name.text);
              return;
            }
            if (ts.isVariableDeclaration(node)) collectBindingNames(node.name, collected);
            if ((ts.isFunctionDeclaration(node) || ts.isClassDeclaration(node)) && node.name) {
              collected.add(node.name.text);
            }
            ts.forEachChild(node, visit);
          };
          visit(root);
        }
        bindings = collected;
        scopeBindings.set(current, bindings);
      }
      if (bindings.has(identifier.text)) return true;
    }
    current = current.parent;
  }
  return false;
}

function collectBindingNames(name: ts.BindingName, output: Set<string>): void {
  if (ts.isIdentifier(name)) {
    output.add(name.text);
    return;
  }
  for (const element of name.elements) {
    if (!ts.isOmittedExpression(element)) collectBindingNames(element.name, output);
  }
}

function propertyName(node: ts.PropertyName, context: LoweringContext): string {
  if (ts.isIdentifier(node) || ts.isStringLiteral(node) || ts.isNumericLiteral(node)) return node.text;
  if (ts.isComputedPropertyName(node)) {
    const sourceName = node.expression.getText(node.getSourceFile()).replace(/[^A-Za-z0-9_]/gu, '_');
    return `__${sourceName}`;
  }
  return unsupported(node, context, 'computed property name');
}

function origin(node: ts.Node, context: LoweringContext): SourceOrigin {
  const position = context.sourceFile.getLineAndCharacterOfPosition(node.getStart(context.sourceFile));
  return {
    column: position.character + 1,
    fingerprint: `sha256:${createHash('sha256')
      .update(
        fingerprintPrinter.printNode(ts.EmitHint.Unspecified, node, context.sourceFile).replace(/\s+/gu, ' ').trim(),
      )
      .digest('hex')}`,
    line: position.line + 1,
    packageName: context.packageName,
    source: path.relative(context.workspaceDirectory, context.sourceFile.fileName),
  };
}

function hasModifier(node: ts.Node, kind: ts.SyntaxKind): boolean {
  return ts.canHaveModifiers(node) && ts.getModifiers(node)?.some((modifier) => modifier.kind === kind) === true;
}

function unsupported(node: ts.Node, context: LoweringContext, description: string): never {
  const position = context.sourceFile.getLineAndCharacterOfPosition(node.getStart(context.sourceFile));
  const diagnostic = {
    column: position.character + 1,
    line: position.line + 1,
    message: `Unsupported TypeScript ${description}`,
    source: path.relative(context.workspaceDirectory, context.sourceFile.fileName),
  } satisfies LoweringDiagnostic;
  context.diagnostics.push(diagnostic);
  throw new UnsupportedSyntaxError(
    `${diagnostic.source}:${diagnostic.line}:${diagnostic.column}: ${diagnostic.message}`,
  );
}
