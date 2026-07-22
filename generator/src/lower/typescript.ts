import { createHash } from 'node:crypto';
import path from 'node:path';
import ts from 'typescript';

import type {
  IrDeclaration,
  IrExpression,
  IrFunctionDeclaration,
  IrParameter,
  IrStatement,
  IrType,
  IrVariable,
  LoweringDiagnostic,
  LoweringResult,
  SourceOrigin,
} from '../model/ir.ts';

const fingerprintPrinter = ts.createPrinter({ removeComments: true });

const portableTypeReferenceMap: Readonly<Record<string, string>> = {
  ArrayBuffer: 'haxe.io.Bytes',
  ArrayBufferView: 'haxe.io.ArrayBufferView',
  Float32Array: 'flighthq.internal.FlightFloat32Array',
  Int16Array: 'flighthq.internal.FlightInt16Array',
  Uint16Array: 'flighthq.internal.FlightUInt16Array',
};

const platformDynamicTypes = new Set([
  'AbortController',
  'AbortSignal',
  'ArrayBuffer',
  'AudioBuffer',
  'AudioBufferSourceNode',
  'AudioContext',
  'AudioNode',
  'AsyncIterable',
  'AsyncIterableIterator',
  'Blob',
  'Buffer',
  'BufferSource',
  'CanvasFillRule',
  'CanvasGradient',
  'CanvasImageSource',
  'CanvasPattern',
  'CanvasRenderingContext2D',
  'CanvasRenderingContext2DSettings',
  'DOMRect',
  'DOMRectReadOnly',
  'DataView',
  'DOMException',
  'Document',
  'Element',
  'Event',
  'EventTarget',
  'EXT_texture_filter_anisotropic',
  'File',
  'FileSystemDirectoryHandle',
  'FileSystemFileHandle',
  'FileSystemHandle',
  'FocusEvent',
  'FontFace',
  'FrameRequestCallback',
  'GlobalCompositeOperation',
  'GainNode',
  'Gamepad',
  'GamepadButton',
  'GamepadEvent',
  'GeolocationCoordinates',
  'GeolocationPosition',
  'GeolocationPositionError',
  'PositionOptions',
  'HTMLCanvasElement',
  'HTMLImageElement',
  'HTMLInputElement',
  'HTMLTextAreaElement',
  'HTMLElement',
  'HTMLVideoElement',
  'Image',
  'Headers',
  'ImageData',
  'ImageBitmap',
  'ImageBitmapOptions',
  'ImageSmoothingQuality',
  'KeyboardEvent',
  'Float64Array',
  'Int32Array',
  'Int8Array',
  'Iterable',
  'IterableIterator',
  'Iterator',
  'Map',
  'MediaDeviceInfo',
  'MediaDevices',
  'MediaStream',
  'MediaStreamConstraints',
  'MediaStreamTrack',
  'MediaTrackConstraints',
  'MediaElementAudioSourceNode',
  'Navigator',
  'Notification',
  'NotificationOptions',
  'NotificationPermission',
  'OffscreenCanvas',
  'PointerEvent',
  'PermissionDescriptor',
  'PermissionStatus',
  'Permissions',
  'ReadableStream',
  'TextDecoder',
  'RegExp',
  'ReadonlyMap',
  'ReadonlySet',
  'Request',
  'RequestInit',
  'Response',
  'RenderingContext',
  'Set',
  'ShareData',
  'StereoPannerNode',
  'StorageManager',
  'TexImageSource',
  'URL',
  'URLSearchParams',
  'Window',
  'WheelEvent',
  'Uint32Array',
  'Uint8Array',
  'Uint8ClampedArray',
  'WebGL2RenderingContext',
  'WebGLBuffer',
  'WebGLContextAttributes',
  'WebGLFramebuffer',
  'WebGLPowerPreference',
  'WebGLProgram',
  'WebGLRenderbuffer',
  'WebGLTexture',
  'WebGLUniformLocation',
  'WritableStream',
  'WeakMap',
  'WeakRef',
  'WeakSet',
]);

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
  'FontFace',
  'Number',
  'Object',
  'OffscreenCanvas',
  'Promise',
  'ResizeObserver',
  'Notification',
  'Audio',
  'Date',
  'DeviceMotionEvent',
  'MediaMetadata',
  'TextEncoder',
  'URL',
  'URLSearchParams',
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

export function lowerTypeScriptSource(
  sourceFile: ts.SourceFile,
  packageName: string,
  workspaceDirectory: string,
): LoweringResult {
  const diagnostics: LoweringDiagnostic[] = [];
  const declarations: IrDeclaration[] = [];
  let accountedDeclarations = 0;
  const erasedLocalTypes = new Set<string>();
  const collectLocalTypes = (node: ts.Node): void => {
    if (ts.isTypeAliasDeclaration(node) && !ts.isSourceFile(node.parent)) erasedLocalTypes.add(node.name.text);
    ts.forEachChild(node, collectLocalTypes);
  };
  collectLocalTypes(sourceFile);
  const externalTypes = new Set<string>();
  const externalValues = new Map<string, { imported: string; specifier: string }>();
  for (const statement of sourceFile.statements) {
    if (!ts.isImportDeclaration(statement) || !ts.isStringLiteral(statement.moduleSpecifier)) continue;
    const specifier = statement.moduleSpecifier.text;
    if (specifier.startsWith('.') || specifier.startsWith('@flighthq/')) continue;
    if (statement.importClause?.name) {
      externalTypes.add(statement.importClause.name.text);
      externalValues.set(statement.importClause.name.text, { imported: 'default', specifier });
    }
    const bindings = statement.importClause?.namedBindings;
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
  const context: LoweringContext = {
    classThis: false,
    diagnostics,
    externalTypes,
    externalValues,
    erasedLocalTypes,
    packageName,
    scopeBindings: new WeakMap(),
    sourceFile,
    temporaryIndex: 0,
    workspaceDirectory,
  };

  for (const statement of sourceFile.statements) {
    try {
      if (ts.isFunctionDeclaration(statement) && statement.name && statement.body) {
        declarations.push(lowerFunction(statement, context));
        accountedDeclarations += 1;
      } else if (ts.isFunctionDeclaration(statement) && statement.name) {
        // TypeScript overload signatures are represented by the following implementation declaration.
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
          type: lowerType(statement.type, context),
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
          declarations.push({
            exported,
            initializer: declaration.initializer ? lowerExpression(declaration.initializer, context) : undefined,
            kind: 'variable',
            mutable,
            name: declaration.name.text,
            origin: origin(statement, context),
            type: declaration.type ? lowerType(declaration.type, context) : undefined,
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

  return { accountedDeclarations, declarations, diagnostics };
}

interface LoweringContext {
  classThis: boolean;
  diagnostics: LoweringDiagnostic[];
  externalTypes: ReadonlySet<string>;
  externalValues: ReadonlyMap<string, { imported: string; specifier: string }>;
  erasedLocalTypes: ReadonlySet<string>;
  packageName: string;
  scopeBindings: WeakMap<ts.Node, ReadonlySet<string>>;
  sourceFile: ts.SourceFile;
  temporaryIndex: number;
  workspaceDirectory: string;
}

class UnsupportedSyntaxError extends Error {}

function lowerClass(node: ts.ClassDeclaration, context: LoweringContext) {
  if (!node.name) throw new Error('Expected named class');
  const constructor = node.members.find(ts.isConstructorDeclaration);
  const fields = node.members.filter(ts.isPropertyDeclaration).map((field) => {
    return {
      initializer: field.initializer ? lowerExpression(field.initializer, context) : undefined,
      mutable: !hasModifier(field, ts.SyntaxKind.ReadonlyKeyword),
      name: propertyName(field.name, context),
      public: !hasModifier(field, ts.SyntaxKind.PrivateKeyword) && !hasModifier(field, ts.SyntaxKind.ProtectedKeyword),
      static: hasModifier(field, ts.SyntaxKind.StaticKeyword),
      type: field.type ? lowerType(field.type, context) : { kind: 'dynamic' as const },
    };
  });
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
  return {
    constructorBody: [
      ...(loweredConstructor?.prefix ?? []),
      ...(constructor?.body?.statements.map((statement) => lowerStatement(statement, context)) ?? []),
    ],
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
        body: [
          ...loweredParameters.prefix,
          ...method.body.statements.map((statement) => lowerStatement(statement, context)),
        ],
        name: propertyName(method.name, context),
        parameters: loweredParameters.parameters,
        public:
          !hasModifier(method, ts.SyntaxKind.PrivateKeyword) && !hasModifier(method, ts.SyntaxKind.ProtectedKeyword),
        returns: method.type
          ? lowerType(method.type, context)
          : hasModifier(method, ts.SyntaxKind.AsyncKeyword)
            ? promiseOfDynamic()
            : hasReturnValue(method.body)
              ? ({ kind: 'dynamic' } satisfies IrType)
              : ({ kind: 'primitive', name: 'Void' } satisfies IrType),
        static: hasModifier(method, ts.SyntaxKind.StaticKeyword),
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

function lowerFunction(node: ts.FunctionDeclaration, context: LoweringContext): IrFunctionDeclaration {
  if (!node.name || !node.body) throw new Error('Expected named function with a body');
  const loweredParameters = lowerParameterList(node.parameters, context);
  return {
    async: hasModifier(node, ts.SyntaxKind.AsyncKeyword),
    body: [...loweredParameters.prefix, ...node.body.statements.map((statement) => lowerStatement(statement, context))],
    exported: hasModifier(node, ts.SyntaxKind.ExportKeyword),
    kind: 'function',
    name: node.name.text,
    origin: origin(node, context),
    parameters: loweredParameters.parameters,
    returns: node.type
      ? lowerType(node.type, context)
      : hasModifier(node, ts.SyntaxKind.AsyncKeyword)
        ? promiseOfDynamic()
        : hasReturnValue(node.body)
          ? { kind: 'dynamic' }
          : { kind: 'primitive', name: 'Void' },
    typeParameters: node.typeParameters?.map((parameter) => parameter.name.text) ?? [],
  };
}

function lowerParameter(node: ts.ParameterDeclaration, context: LoweringContext): IrParameter {
  if (!ts.isIdentifier(node.name)) unsupported(node.name, context, 'binding pattern parameter');
  return {
    initializer: node.initializer ? lowerExpression(node.initializer, context) : undefined,
    name: node.name.text,
    optional: Boolean(node.questionToken),
    rest: Boolean(node.dotDotDotToken),
    type: node.type ? lowerType(node.type, context) : { kind: 'dynamic' },
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
      type: node.type ? lowerType(node.type, context) : { kind: 'dynamic' },
    });
    const declarations: IrVariable[] = [];
    lowerBindingPattern(node.name, { kind: 'identifier', name }, false, declarations, context);
    prefix.push({ declarations, kind: 'variable' });
  }
  return { parameters, prefix };
}

function lowerType(node: ts.TypeNode, context: LoweringContext): IrType {
  switch (node.kind) {
    case ts.SyntaxKind.AnyKeyword:
    case ts.SyntaxKind.NeverKeyword:
    case ts.SyntaxKind.UnknownKeyword:
      return { kind: 'dynamic' };
    case ts.SyntaxKind.UndefinedKeyword:
      return { kind: 'dynamic' };
    case ts.SyntaxKind.ObjectKeyword:
      return { kind: 'dynamic' };
    case ts.SyntaxKind.BooleanKeyword:
      return { kind: 'primitive', name: 'Bool' };
    case ts.SyntaxKind.NumberKeyword:
      return { kind: 'primitive', name: 'Float' };
    case ts.SyntaxKind.SymbolKeyword:
      return { kind: 'dynamic' };
    case ts.SyntaxKind.StringKeyword:
      return { kind: 'primitive', name: 'String' };
    case ts.SyntaxKind.VoidKeyword:
      return { kind: 'primitive', name: 'Void' };
  }
  if (ts.isArrayTypeNode(node)) return { element: lowerType(node.elementType, context), kind: 'array' };
  if (ts.isTypeOperatorNode(node)) return lowerType(node.type, context);
  if (ts.isTypeQueryNode(node)) return { kind: 'dynamic' };
  if (ts.isTypeLiteralNode(node)) {
    return { extends: [], fields: lowerTypeMembers(node.members, context), kind: 'anonymous' };
  }
  if (ts.isTupleTypeNode(node)) {
    const elements = node.elements.map((element) =>
      lowerType(ts.isNamedTupleMember(element) ? element.type : element, context),
    );
    return { element: commonType(elements), kind: 'array' };
  }
  if (ts.isParenthesizedTypeNode(node)) return lowerType(node.type, context);
  if (ts.isFunctionTypeNode(node)) return { kind: 'dynamic' };
  if (ts.isConstructorTypeNode(node)) return { kind: 'dynamic' };
  if (ts.isTypePredicateNode(node)) return { kind: 'primitive', name: 'Bool' };
  if (ts.isTypeReferenceNode(node)) {
    const name = node.typeName.getText(context.sourceFile);
    const arguments_ = node.typeArguments?.map((argument) => lowerType(argument, context)) ?? [];
    if (context.erasedLocalTypes.has(name)) return { kind: 'dynamic' };
    if (name === 'Error') return { arguments: [], kind: 'named', name: 'haxe.Exception' };
    const portableType = portableTypeReferenceMap[name];
    if (portableType) return { arguments: [], kind: 'named', name: portableType };
    if (context.externalTypes.has(name.split('.')[0]!)) return { kind: 'dynamic' };
    if (
      platformDynamicTypes.has(name) ||
      name.startsWith('GPU') ||
      name.startsWith('HTML') ||
      name.startsWith('Intl.') ||
      name.startsWith('SVG') ||
      name.startsWith('WebGL') ||
      name.startsWith('globalThis.') ||
      name.startsWith('Canvas') ||
      name.startsWith('FileSystem') ||
      name.startsWith('Offscreen') ||
      name.startsWith('Performance') ||
      name.endsWith('Event') ||
      name.endsWith('EventListener') ||
      /^[A-Z]$/u.test(name) ||
      ['BodyInit', 'CSSStyleDeclaration', 'RegExpExecArray', 'TextEncoder', 'WindowEventMap'].includes(name)
    ) {
      return { kind: 'dynamic' };
    }
    if (['Omit', 'Partial', 'Pick'].includes(name)) return { kind: 'dynamic' };
    if (['Awaited', 'Exclude', 'Extract', 'NonNullable', 'Readonly', 'Required'].includes(name) && arguments_[0]) {
      return arguments_[0];
    }
    if (name === 'Parameters') return { element: { kind: 'dynamic' }, kind: 'array' };
    if (['InstanceType', 'PropertyKey', 'ReturnType', 'ThisParameterType'].includes(name)) {
      return { kind: 'dynamic' };
    }
    if (name === 'Promise') {
      const promiseType =
        arguments_[0]?.kind === 'primitive' && arguments_[0].name === 'Void'
          ? { arguments: [], kind: 'named' as const, name: 'flighthq.internal.FlightNothing' }
          : (arguments_[0] ?? { kind: 'dynamic' as const });
      return { arguments: [promiseType], kind: 'named', name: 'flighthq.internal.FlightPromise' };
    }
    if (name === 'ArrayLike') return { kind: 'dynamic' };
    if (name === 'Array' || name === 'ReadonlyArray') {
      return { element: arguments_[0] ?? { kind: 'dynamic' }, kind: 'array' };
    }
    if (name === 'Record') return { kind: 'dynamic' };
    return { arguments: arguments_, kind: 'named', name };
  }
  if (ts.isUnionTypeNode(node)) {
    const concrete = node.types.filter((item) => !isNullishType(item));
    const nullable = concrete.length !== node.types.length;
    const inner =
      concrete.length === 1
        ? lowerType(concrete[0]!, context)
        : commonType(concrete.map((item) => lowerType(item, context)));
    return nullable ? { inner, kind: 'nullable' } : inner;
  }
  if (ts.isIntersectionTypeNode(node)) {
    const types = node.types.map((item) => lowerType(item, context));
    const stringType = types.find((item) => item.kind === 'primitive' && item.name === 'String');
    if (stringType) return stringType;
    const nodeType = types.find((item) => item.kind === 'named' && item.name === 'Node');
    const genericPartner = types.find(
      (item) => item.kind === 'named' && ['D', 'R', 'T', 'Traits', 'Type', 'U'].includes(item.name),
    );
    if (types.length === 2 && nodeType && genericPartner) return nodeType;
    const genericType = types.find(
      (item) => item.kind === 'named' && ['D', 'R', 'T', 'Traits', 'Type', 'U'].includes(item.name),
    );
    if (genericType) return genericType;
    const concrete = types.filter((item) => item.kind !== 'dynamic');
    if (concrete.length === 0) return { kind: 'dynamic' };
    if (concrete.length === 1) return concrete[0]!;
    return {
      extends: concrete.flatMap((item) => (item.kind === 'anonymous' ? item.extends : [item])),
      fields: concrete.flatMap((item) => (item.kind === 'anonymous' ? item.fields : [])),
      kind: 'anonymous',
    };
  }
  if (ts.isIndexedAccessTypeNode(node) || ts.isConditionalTypeNode(node) || ts.isMappedTypeNode(node)) {
    return { kind: 'dynamic' };
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
  return unsupported(node, context, `type ${ts.SyntaxKind[node.kind] ?? node.kind}`);
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

function lowerExpressionWithTypeArguments(node: ts.ExpressionWithTypeArguments, context: LoweringContext): IrType {
  const name = node.expression.getText(context.sourceFile);
  const arguments_ = node.typeArguments?.map((argument) => lowerType(argument, context)) ?? [];
  if (platformDynamicTypes.has(name) || context.externalTypes.has(name.split('.')[0]!)) return { kind: 'dynamic' };
  if (name === 'Omit' || name === 'Partial' || name === 'Pick') return { kind: 'dynamic' };
  if (name === 'Readonly' && arguments_[0]) {
    return arguments_[0];
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
      name: propertyName(node.name, context),
      optional: Boolean(node.questionToken) || ts.isComputedPropertyName(node.name),
      type: lowerType(node.type, context),
    };
  }
  if (ts.isMethodSignature(node)) {
    return {
      name: propertyName(node.name, context),
      optional: Boolean(node.questionToken),
      type: { kind: 'dynamic' as const },
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
  const first = types[0];
  if (!first) return { kind: 'dynamic' };
  return types.every((item) => JSON.stringify(item) === JSON.stringify(first)) ? first : { kind: 'dynamic' };
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

function lowerStatement(node: ts.Statement, context: LoweringContext): IrStatement {
  if (ts.isBlock(node))
    return { kind: 'block', statements: node.statements.map((item) => lowerStatement(item, context)) };
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
      lowerBindingPattern(declaration.name, { kind: 'identifier', name: variable }, mutable, bindings, context);
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
  if (ts.isTypeAliasDeclaration(node)) return { kind: 'block', statements: [] };
  if (ts.isThrowStatement(node)) return { expression: lowerExpression(node.expression, context), kind: 'throw' };
  if (ts.isSwitchStatement(node)) {
    return {
      cases: node.caseBlock.clauses.map((clause) => ({
        expression: ts.isCaseClause(clause) ? lowerExpression(clause.expression, context) : undefined,
        statements: clause.statements.map((statement) => lowerStatement(statement, context)),
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
    const loweredParameters = lowerParameterList(node.parameters, context);
    const parameters = loweredParameters.parameters;
    return {
      declarations: [
        {
          initializer: {
            async: hasModifier(node, ts.SyntaxKind.AsyncKeyword),
            body: [
              ...loweredParameters.prefix,
              ...node.body.statements.map((statement) => lowerStatement(statement, context)),
            ],
            kind: 'function',
            name: node.name.text,
            parameters,
            returns: node.type
              ? lowerType(node.type, context)
              : hasModifier(node, ts.SyntaxKind.AsyncKeyword)
                ? promiseOfDynamic()
                : hasReturnValue(node.body)
                  ? { kind: 'dynamic' }
                  : { kind: 'primitive', name: 'Void' },
          },
          mutable: false,
          name: node.name.text,
          type: {
            kind: 'function',
            parameters: parameters.map((parameter) => parameter.type),
            returns: node.type ? lowerType(node.type, context) : { kind: 'dynamic' },
          },
        },
      ],
      kind: 'variable',
    };
  }
  if (ts.isEmptyStatement(node)) return { kind: 'block', statements: [] };
  return unsupported(node, context, `statement ${ts.SyntaxKind[node.kind] ?? node.kind}`);
}

function lowerVariables(node: ts.VariableDeclarationList, mutable: boolean, context: LoweringContext): IrVariable[] {
  return node.declarations.flatMap((declaration) => {
    if (ts.isIdentifier(declaration.name)) {
      return {
        initializer: declaration.initializer ? lowerExpression(declaration.initializer, context) : undefined,
        mutable,
        name: declaration.name.text,
        type: declaration.type ? lowerType(declaration.type, context) : undefined,
      };
    }
    if (!declaration.initializer) unsupported(declaration.name, context, 'uninitialized binding pattern variable');
    const temporaryName = `__destructure${String(context.temporaryIndex++)}`;
    const variables: IrVariable[] = [
      {
        initializer: lowerExpression(declaration.initializer, context),
        mutable: false,
        name: temporaryName,
      },
    ];
    lowerBindingPattern(declaration.name, { kind: 'identifier', name: temporaryName }, mutable, variables, context);
    return variables;
  });
}

function lowerBindingPattern(
  pattern: ts.BindingPattern,
  source: IrExpression,
  mutable: boolean,
  variables: IrVariable[],
  context: LoweringContext,
): void {
  if (ts.isObjectBindingPattern(pattern)) {
    for (const element of pattern.elements) {
      if (element.dotDotDotToken) unsupported(element, context, 'object rest binding');
      const name = element.propertyName
        ? propertyName(element.propertyName, context)
        : element.name.getText(context.sourceFile);
      let value: IrExpression = { kind: 'property', name, object: source };
      if (element.initializer) {
        value = {
          kind: 'binary',
          left: value,
          operator: '??undefined',
          right: lowerExpression(element.initializer, context),
        };
      }
      if (ts.isIdentifier(element.name)) {
        variables.push({ initializer: value, mutable, name: element.name.text });
      } else {
        lowerBindingPattern(element.name, value, mutable, variables, context);
      }
    }
    return;
  }
  pattern.elements.forEach((element, index) => {
    if (ts.isOmittedExpression(element)) return;
    if (element.dotDotDotToken) unsupported(element, context, 'array rest binding');
    let value: IrExpression = {
      index: { kind: 'literal', value: index },
      kind: 'element',
      object: source,
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
      variables.push({ initializer: value, mutable, name: element.name.text });
    } else {
      lowerBindingPattern(element.name, value, mutable, variables, context);
    }
  });
}

function lowerExpression(node: ts.Expression, context: LoweringContext): IrExpression {
  if (ts.isParenthesizedExpression(node)) return lowerExpression(node.expression, context);
  if (ts.isAsExpression(node) || ts.isTypeAssertionExpression(node)) {
    if (
      node.type.kind === ts.SyntaxKind.ConstKeyword ||
      (ts.isTypeReferenceNode(node.type) && node.type.typeName.getText(context.sourceFile) === 'const')
    ) {
      return lowerExpression(node.expression, context);
    }
    return { expression: lowerExpression(node.expression, context), kind: 'cast', type: lowerType(node.type, context) };
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
  if (node.kind === ts.SyntaxKind.ImportKeyword) return { kind: 'identifier', name: 'FlightRuntime.dynamicImport' };
  if (node.kind === ts.SyntaxKind.ThisKeyword) {
    return context.classThis
      ? { kind: 'identifier', name: 'this' }
      : {
          arguments: [],
          callee: {
            kind: 'property',
            name: 'thisValue',
            object: { kind: 'identifier', name: 'FlightRuntime' },
          },
          kind: 'call',
          typeArguments: [],
        };
  }
  if (node.kind === ts.SyntaxKind.SuperKeyword) return { kind: 'identifier', name: 'super' };
  if (ts.isIdentifier(node)) return lowerIdentifier(node.text, context, isLexicallyBound(node, context));
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
    return {
      kind: 'object',
      properties: node.properties.map((property) => {
        if (ts.isSpreadAssignment(property)) {
          return { expression: lowerExpression(property.expression, context), kind: 'spread' as const };
        }
        if (ts.isShorthandPropertyAssignment(property)) {
          return {
            kind: 'property' as const,
            name: property.name.text,
            value: lowerIdentifier(property.name.text, context, isLexicallyBound(property.name, context)),
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
          context.classThis = false;
          try {
            const value = {
              async: hasModifier(property, ts.SyntaxKind.AsyncKeyword),
              body: property.body.statements.map((statement) => lowerStatement(statement, context)),
              kind: 'function' as const,
              parameters: property.parameters
                .filter((parameter) => !isThisParameter(parameter))
                .map((parameter) => lowerParameter(parameter, context)),
              returns: hasModifier(property, ts.SyntaxKind.AsyncKeyword)
                ? property.type
                  ? lowerType(property.type, context)
                  : promiseOfDynamic()
                : undefined,
            };
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
          } finally {
            context.classThis = previousClassThis;
          }
        }
        return unsupported(property, context, 'object literal member');
      }),
    };
  }
  if (ts.isPropertyAccessExpression(node)) {
    return {
      kind: 'property',
      name: node.name.text,
      object: lowerExpression(node.expression, context),
      optional: ts.isOptionalChain(node),
    };
  }
  if (ts.isElementAccessExpression(node) && node.argumentExpression) {
    return {
      index: lowerExpression(node.argumentExpression, context),
      kind: 'element',
      object: lowerExpression(node.expression, context),
      optional: ts.isOptionalChain(node),
    };
  }
  if (ts.isCallExpression(node)) {
    return {
      arguments: node.arguments.map((argument) => lowerExpression(argument, context)),
      callee: lowerExpression(node.expression, context),
      kind: 'call',
      optional: Boolean(node.questionDotToken),
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
          name: 'typeofGlobal',
          object: { kind: 'identifier', name: 'FlightRuntime' },
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
    const operator = node.operatorToken.getText(context.sourceFile);
    const assignment =
      node.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
      node.operatorToken.kind <= ts.SyntaxKind.LastAssignment;
    return {
      kind: assignment ? 'assignment' : 'binary',
      left: lowerExpression(node.left, context),
      operator,
      right: lowerExpression(node.right, context),
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
    if (ts.isFunctionExpression(node)) context.classThis = false;
    try {
      const loweredParameters = lowerParameterList(node.parameters, context);
      const expression = ts.isBlock(node.body) ? undefined : lowerExpression(node.body, context);
      return {
        async: hasModifier(node, ts.SyntaxKind.AsyncKeyword),
        body: ts.isBlock(node.body)
          ? [
              ...loweredParameters.prefix,
              ...node.body.statements.map((statement) => lowerStatement(statement, context)),
            ]
          : loweredParameters.prefix.length > 0
            ? [...loweredParameters.prefix, { expression, kind: 'return' }]
            : [],
        expression: loweredParameters.prefix.length > 0 ? undefined : expression,
        kind: 'function',
        name: ts.isFunctionExpression(node) ? node.name?.text : undefined,
        parameters: loweredParameters.parameters,
        returns: hasModifier(node, ts.SyntaxKind.AsyncKeyword)
          ? node.type
            ? lowerType(node.type, context)
            : promiseOfDynamic()
          : undefined,
      };
    } finally {
      context.classThis = previousClassThis;
    }
  }
  return unsupported(node, context, `expression ${ts.SyntaxKind[node.kind] ?? node.kind}`);
}

function isThisParameter(node: ts.ParameterDeclaration): boolean {
  return ts.isIdentifier(node.name) && node.name.text === 'this';
}

function promiseOfDynamic(): IrType {
  return {
    kind: 'named',
    name: 'flighthq.internal.FlightPromise',
    arguments: [{ kind: 'dynamic' }],
  };
}

function lowerIdentifier(name: string, context: LoweringContext, locallyBound = false): IrExpression {
  if (name === 'Math') return { kind: 'identifier', name: 'HxMath' };
  if (name === 'undefined') {
    return { kind: 'property', name: 'UNDEFINED', object: { kind: 'identifier', name: 'FlightRuntime' } };
  }
  if (name === 'NaN') return { kind: 'property', name: 'NaN', object: { kind: 'identifier', name: 'HxMath' } };
  if (name === 'Infinity') {
    return { kind: 'property', name: 'POSITIVE_INFINITY', object: { kind: 'identifier', name: 'HxMath' } };
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
        name: 'externalValue',
        object: { kind: 'identifier', name: 'FlightRuntime' },
      },
      kind: 'call',
      typeArguments: [],
    };
  }
  if (!locallyBound && (platformGlobalValues.has(name) || platformDynamicTypes.has(name) || name.startsWith('GPU'))) {
    return {
      arguments: [{ kind: 'literal', value: name }],
      callee: {
        kind: 'property',
        name: 'globalValue',
        object: { kind: 'identifier', name: 'FlightRuntime' },
      },
      kind: 'call',
      typeArguments: [],
    };
  }
  return { kind: 'identifier', name };
}

function isLexicallyBound(identifier: ts.Identifier, context: LoweringContext): boolean {
  let current: ts.Node | undefined = identifier.parent;
  while (current) {
    if (ts.isFunctionLike(current) || ts.isSourceFile(current)) {
      let bindings = context.scopeBindings.get(current);
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
        context.scopeBindings.set(current, bindings);
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
    const sourceName = node.expression.getText(context.sourceFile).replace(/[^A-Za-z0-9_]/gu, '_');
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
