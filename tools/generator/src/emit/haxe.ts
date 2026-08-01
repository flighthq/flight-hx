import type {
  IrDeclaration,
  IrDestructuringReadEscape,
  IrDestructuringReadSource,
  IrExpression,
  IrHostEndpointBinding,
  IrIndexedReceiver,
  IrModule,
  IrParameter,
  IrStatement,
  IrType,
  IrVariable,
  IrWebGlComputedConstantDomain,
  StaticLoweringEmissionCounts,
} from '../model/ir.ts';
import { requireHostEndpoint } from '../host-endpoints.ts';

type ScalarStaticLoweringEmissionName = Exclude<
  keyof StaticLoweringEmissionCounts,
  | 'destructuringEscapes'
  | 'destructuringReads'
  | 'destructuringReceivers'
  | 'indexedAccesses'
  | 'indexedReceivers'
  | 'syntheticArrayReads'
>;

const binaryOperatorMap: Readonly<Record<string, string>> = {
  '===': '==',
  '!==': '!=',
  '??': '??',
};

const staticLoweringMarkers = {
  booleanAndExpressions: '/*__flight_direct_boolean_and__*/',
  booleanConditionalExpressions: '/*__flight_direct_boolean_conditional__*/',
  booleanOrExpressions: '/*__flight_direct_boolean_or__*/',
  booleanTruthinessUses: '/*__flight_direct_boolean_truthiness__*/',
  numericRelations: '/*__flight_direct_numeric_relation__*/',
} as const satisfies Record<ScalarStaticLoweringEmissionName, string>;

const syntheticArrayReadMarkers = {
  highArityArguments: '/*__flight_direct_synthetic_array_high_arity_arguments__*/',
  iterationBindings: '/*__flight_direct_synthetic_array_iteration_bindings__*/',
} as const satisfies Record<keyof StaticLoweringEmissionCounts['syntheticArrayReads'], string>;

const destructuringReadSources = [
  'assignment',
  'declaration',
  'parameter',
] as const satisfies readonly IrDestructuringReadSource[];

const destructuringReadEscapes = [
  'regexp-result-array',
  'unproven-receiver',
] as const satisfies readonly IrDestructuringReadEscape[];

const indexedReceiverNames = [
  'Array',
  'ArrayOrFloat32Array',
  'Float32Array',
  'Float64Array',
  'Int16Array',
  'Int32Array',
  'Int8Array',
  'Uint16Array',
  'Uint16ArrayOrUint32Array',
  'Uint32Array',
  'Uint8Array',
  'Uint8ClampedArray',
] as const satisfies readonly IrIndexedReceiver[];

const collectionBindingTypes = {
  MapCollection: 'flighthq._internal._Map',
  SetCollection: 'flighthq._internal._Set',
  WeakMapCollection: 'flighthq._internal._WeakMap',
  WeakSetCollection: 'flighthq._internal._WeakSet',
} as const;

const typedArrayBindingTypes = {
  Float32Array: 'flighthq._internal._Float32Array',
  Float64Array: 'flighthq._internal._Float64Array',
  Int16Array: 'flighthq._internal._Int16Array',
  Int32Array: 'flighthq._internal._Int32Array',
  Int8Array: 'flighthq._internal._Int8Array',
  Uint16Array: 'flighthq._internal._UInt16Array',
  Uint32Array: 'flighthq._internal._UInt32Array',
  Uint8Array: 'flighthq._internal._UInt8Array',
  Uint8ClampedArray: 'flighthq._internal._UInt8ClampedArray',
} as const;

let temporaryIndex = 0;
let currentHaxePackage = 'flighthq';
let currentModuleName = '';
let currentSourceIdentity = '';
let currentModuleValues = new Set<string>();
let currentDirectFunctions = new Set<string>();
let currentReturnRequiresValue = false;
let currentContinueIncrement: IrExpression | undefined;
let currentAsyncFunction = false;
let currentAsyncReturnsNothing = false;
let currentFinallyStack: IrStatement[] = [];
let staticLoweringEmission: StaticLoweringEmissionCounts = emptyStaticLoweringEmissionCounts();

interface ExtractedAwait {
  awaited: boolean;
  expression: IrExpression;
  name: string;
}

export function resetStaticLoweringEmissionCounts(): void {
  staticLoweringEmission = emptyStaticLoweringEmissionCounts();
}

export function staticLoweringEmissionCounts(): StaticLoweringEmissionCounts {
  return {
    ...staticLoweringEmission,
    destructuringEscapes: Object.fromEntries(
      destructuringReadEscapes.map((escape) => [escape, { ...staticLoweringEmission.destructuringEscapes[escape] }]),
    ) as StaticLoweringEmissionCounts['destructuringEscapes'],
    destructuringReads: Object.fromEntries(
      destructuringReadSources.map((source) => [source, { ...staticLoweringEmission.destructuringReads[source] }]),
    ) as StaticLoweringEmissionCounts['destructuringReads'],
    destructuringReceivers: Object.fromEntries(
      indexedReceiverNames.map((receiver) => [
        receiver,
        { ...staticLoweringEmission.destructuringReceivers[receiver] },
      ]),
    ) as StaticLoweringEmissionCounts['destructuringReceivers'],
    indexedAccesses: { ...staticLoweringEmission.indexedAccesses },
    indexedReceivers: Object.fromEntries(
      indexedReceiverNames.map((receiver) => [receiver, { ...staticLoweringEmission.indexedReceivers[receiver] }]),
    ) as StaticLoweringEmissionCounts['indexedReceivers'],
    syntheticArrayReads: { ...staticLoweringEmission.syntheticArrayReads },
  };
}

export function emitHaxeModule(module: IrModule): string {
  temporaryIndex = 0;
  currentHaxePackage = module.haxePackage ?? 'flighthq';
  currentModuleName = module.name;
  currentSourceIdentity =
    module.source ?? module.declarations[0]?.origin.source ?? `${module.packageName}/${module.name}`;
  currentModuleValues = new Set(
    module.declarations
      .filter(
        (declaration) => declaration.kind !== 'class' && declaration.kind !== 'enum' && declaration.kind !== 'type',
      )
      .map((declaration) => declaration.name),
  );
  currentDirectFunctions = new Set(
    module.declarations
      .filter(
        (declaration) => declaration.kind === 'function' && !declaration.exported && declaration.parameters.length > 26,
      )
      .map((declaration) => declaration.name),
  );
  currentFinallyStack = [];
  const typeDeclarations = module.declarations.filter(
    (declaration) => declaration.kind === 'class' || declaration.kind === 'enum' || declaration.kind === 'type',
  );
  const valueDeclarations = orderValueDeclarations(
    module.declarations.filter(
      (declaration) => declaration.kind !== 'class' && declaration.kind !== 'enum' && declaration.kind !== 'type',
    ),
  );
  const lines = [
    '// Generated by flight-hx. Do not edit.',
    `package ${currentHaxePackage};`,
    '',
    'import Math as HxMath;',
    'import flighthq._internal._Runtime;',
  ];
  for (const imported of module.imports) lines.push(`import ${imported};`);
  lines.push('');
  for (const declaration of typeDeclarations) lines.push(...emitDeclaration(declaration), '');
  // Barrel free functions live as public static members of a constructorless class
  // that acts purely as their module namespace (Flight allocates via `create<Type>`,
  // never `new`). Async lowering is applied per function, so the namespace class
  // requires no class-level build macro.
  //
  // Do not expose namespace classes to JavaScript here. Exposure is an output policy
  // that prevents consumer DCE; the parity harness adds it only to its dedicated JS
  // build.
  if (valueDeclarations.length === 0) return finalizeStaticLoweringEmission(lines.join('\n'));
  lines.push(`class ${module.name} {`);
  for (const declaration of typeDeclarations) {
    if (declaration.kind !== 'enum') continue;
    lines.push(
      `  public static final __enum_${safeName(declaration.name)}:Dynamic = { ${declaration.members
        .map((member) => `${safeName(member.name)}: ${safeName(declaration.name)}.${safeName(member.name)}`)
        .join(', ')} };`,
      '',
    );
  }
  for (const declaration of valueDeclarations) {
    lines.push(...indent(emitModuleValue(declaration)), '');
  }
  if (lines.at(-1) === '') lines.pop();
  lines.push('}', '');
  return finalizeStaticLoweringEmission(lines.join('\n'));
}

/**
 * Emit a barrel value (free function or variable) as a public static member of the
 * module's namespace class. Async functions are lowered per function rather than
 * through class-level build metadata.
 */
function emitModuleValue(declaration: Extract<IrDeclaration, { kind: 'function' | 'variable' }>): string[] {
  if (declaration.kind === 'variable') {
    const mutability = declaration.mutable || !declaration.initializer ? 'var' : 'final';
    const type = declaration.type ? `:${emitType(declaration.type)}` : ':Dynamic';
    // Haxe omits null-valued static initializers, which changes an explicit
    // TypeScript `null` into `undefined`. Keep the initialization observable.
    const initializer = declaration.initializer
      ? ` = ${
          declaration.initializer.kind === 'literal' && declaration.initializer.value === null
            ? '_Runtime.explicitNull()'
            : emitExpression(declaration.initializer)
        }`
      : '';
    return [`public static ${mutability} ${safeName(declaration.name)}${type}${initializer};`];
  }
  const generics = declaration.typeParameters.length > 0 ? `<${declaration.typeParameters.join(', ')}>` : '';
  const directOnly = currentDirectFunctions.has(declaration.name);
  const parameters = directOnly ? '__flightArguments:Array<Dynamic>' : emitParameters(declaration.parameters);
  // High-arity `directOnly` shims stay private; everything else is public.
  const access = directOnly ? 'private' : 'public';
  const signature = `${access} static function ${safeName(declaration.name)}${generics}(${parameters}):${emitType(declaration.returns)}`;

  const bodyLines: string[] = [];
  if (directOnly) {
    bodyLines.push(
      ...declaration.parameters.map(
        (parameter, index) =>
          `var ${safeName(parameter.name)}:${emitType(parameter.type)} = cast ${emitSyntheticArrayRead('highArityArguments', '__flightArguments', String(index))};`,
      ),
    );
  }
  if (declaration.haxeBody !== undefined) {
    bodyLines.push(...emitParameterInitializers(declaration.parameters));
    bodyLines.push(...splitLines(declaration.haxeBody));
  } else {
    bodyLines.push(
      ...emitFunctionBody(declaration.body, declaration.parameters, declaration.returns, declaration.async),
    );
  }
  if (!isVoidType(declaration.returns)) {
    if (declaration.async && isPromiseNothingType(declaration.returns)) {
      bodyLines.push('#if js', 'return;', '#else', 'return cast null;', '#end');
    } else {
      bodyLines.push('return cast null;');
    }
  }

  if (declaration.async) {
    if (!declaration.haxeBody && canFlatMapStatements(declaration.body)) {
      return [`${signature} {`, ...indent(emitFlatMapFunctionBody(declaration.body, declaration.parameters)), '}'];
    }
    if (!declaration.haxeBody && statementsContainAwait(declaration.body) && canFlowStatements(declaration.body)) {
      return [`${signature} {`, ...indent(emitFlowFunctionBody(declaration.body, declaration.parameters)), '}'];
    }
    if (!declaration.haxeBody && !statementsContainAwait(declaration.body)) {
      return [`${signature} {`, ...indent(emitPromiseProtectedBody(bodyLines)), '}'];
    }
    throw new Error(`Generator async lowering does not support ${declaration.origin.source}:${declaration.name}`);
  }
  return [`${signature} {`, ...indent(bodyLines), '}'];
}

/**
 * Haxe initializes static fields in declaration order. A generated module
 * combines many TypeScript source modules, so their lexical file order can
 * place a field before another field used by its initializer. Keep functions
 * in their existing slots, but stably topologically order static variables by
 * the module variables referenced while their initializer is evaluated.
 */
function orderValueDeclarations(
  declarations: Array<Extract<IrDeclaration, { kind: 'function' | 'variable' }>>,
): Array<Extract<IrDeclaration, { kind: 'function' | 'variable' }>> {
  const variables = declarations.filter((declaration) => declaration.kind === 'variable');
  const variablesByName = new Map(variables.map((declaration) => [declaration.name, declaration]));
  const dependencies = new Map(
    variables.map((declaration) => {
      const names = new Set<string>();
      collectInitializerIdentifiers(declaration.initializer, names);
      return [
        declaration.name,
        new Set([...names].filter((name) => name !== declaration.name && variablesByName.has(name))),
      ] as const;
    }),
  );
  const remaining = new Set(variables.map((declaration) => declaration.name));
  const ordered: typeof variables = [];
  while (remaining.size > 0) {
    const ready = variables.find(
      (declaration) =>
        remaining.has(declaration.name) &&
        [...(dependencies.get(declaration.name) ?? [])].every((name) => !remaining.has(name)),
    );
    if (!ready) {
      // Preserve deterministic source order for a genuine initialization cycle.
      ordered.push(...variables.filter((declaration) => remaining.has(declaration.name)));
      break;
    }
    remaining.delete(ready.name);
    ordered.push(ready);
  }
  let variableIndex = 0;
  return declarations.map((declaration) => (declaration.kind === 'variable' ? ordered[variableIndex++]! : declaration));
}

function collectInitializerIdentifiers(expression: IrExpression | undefined, output: Set<string>): void {
  if (!expression || expression.kind === 'function') return;
  if (expression.kind === 'identifier') {
    output.add(expression.name);
    return;
  }
  for (const value of Object.values(expression)) {
    if (Array.isArray(value)) {
      for (const item of value) {
        if (item && typeof item === 'object') {
          const record = item as Record<string, unknown>;
          if (record.kind === 'function') continue;
          if (record.kind === 'property' || record.kind === 'computedProperty') {
            collectInitializerIdentifiers(record.value as IrExpression, output);
            if (record.kind === 'computedProperty') collectInitializerIdentifiers(record.key as IrExpression, output);
          } else if (record.kind === 'spread') {
            collectInitializerIdentifiers(record.expression as IrExpression, output);
          } else {
            collectInitializerIdentifiers(item as IrExpression, output);
          }
        }
      }
    } else if (value && typeof value === 'object') {
      collectInitializerIdentifiers(value as IrExpression, output);
    }
  }
}

function emitDeclaration(declaration: IrDeclaration): string[] {
  const access = 'public ';
  if (declaration.kind === 'class') {
    const generics = declaration.typeParameters.length > 0 ? `<${declaration.typeParameters.join(', ')}>` : '';
    const parent = declaration.extends ? ` extends ${emitType(declaration.extends)}` : '';
    // Spread calls and method references still use dynamic dispatch, so internal-class
    // members need a DCE retention belt even though ordinary typed calls are direct.
    const lines = [
      ...(!declaration.exported ? ['@:keep'] : []),
      declaration.packagePrivate
        ? `private class ${safeName(declaration.name)}${generics}${parent} {`
        : `class ${safeName(declaration.name)}${generics}${parent} {`,
    ];
    for (const field of declaration.fields) {
      const fieldAccess = field.public ? 'public ' : 'private ';
      const static_ = field.static ? 'static ' : '';
      const mutable = field.mutable ? 'var' : 'final';
      const initializer =
        field.initializer && (!declaration.extends || field.static) ? ` = ${emitExpression(field.initializer)}` : '';
      lines.push(
        ...indent([
          `${fieldAccess}${static_}${mutable} ${safeName(field.name)}:${emitType(field.type)}${initializer};`,
        ]),
      );
    }
    lines.push(`  public function new(${emitParameters(declaration.constructorParameters)}):Void {`);
    for (const initializer of emitParameterInitializers(declaration.constructorParameters)) {
      lines.push(...indent(indent([initializer])));
    }
    const deferredInitializers = declaration.extends
      ? declaration.fields.filter((field) => !field.static && field.initializer)
      : [];
    let initialized = false;
    for (const statement of declaration.constructorBody) {
      lines.push(...indent(indent(emitStatement(statement))));
      if (!initialized && isSuperCall(statement)) {
        for (const field of deferredInitializers) {
          lines.push(...indent(indent([`this.${safeName(field.name)} = ${emitExpression(field.initializer!)};`])));
        }
        initialized = true;
      }
    }
    if (!initialized) {
      for (const field of deferredInitializers) {
        lines.push(...indent(indent([`this.${safeName(field.name)} = ${emitExpression(field.initializer!)};`])));
      }
    }
    lines.push('  }');
    for (const method of declaration.methods) {
      const methodAccess = method.public ? 'public ' : 'private ';
      const static_ = method.static ? 'static ' : '';
      const methodGenerics = method.typeParameters.length > 0 ? `<${method.typeParameters.join(', ')}>` : '';
      const bodyLines = emitFunctionBody(method.body, method.parameters, method.returns, method.async);
      if (!isVoidType(method.returns)) {
        if (method.async && isPromiseNothingType(method.returns)) {
          bodyLines.push('#if js', 'return;', '#else', 'return cast null;', '#end');
        } else {
          bodyLines.push('return cast null;');
        }
      }
      lines.push(
        `  ${methodAccess}${static_}function ${safeName(method.name)}${methodGenerics}(${emitParameters(method.parameters)}):${emitType(method.returns)} {`,
      );
      if (method.async) {
        if (canFlatMapStatements(method.body)) {
          lines.push(...indent(indent(emitFlatMapFunctionBody(method.body, method.parameters))));
        } else if (statementsContainAwait(method.body) && canFlowStatements(method.body)) {
          lines.push(...indent(indent(emitFlowFunctionBody(method.body, method.parameters))));
        } else if (!statementsContainAwait(method.body)) {
          lines.push(...indent(indent(emitPromiseProtectedBody(bodyLines))));
        } else {
          throw new Error(`Generator async lowering does not support ${declaration.origin.source}:${method.name}`);
        }
      } else {
        lines.push(...indent(indent(bodyLines)));
      }
      lines.push('  }');
    }
    lines.push('}');
    return lines;
  }
  if (declaration.kind === 'enum') {
    let nextValue = 0;
    const lines = [
      `${declaration.packagePrivate ? 'private ' : ''}enum abstract ${safeName(declaration.name)}(Int) from Int to Int {`,
    ];
    for (const member of declaration.members) {
      const initializer =
        member.initializer?.kind === 'literal' && typeof member.initializer.value === 'number'
          ? String(member.initializer.value)
          : member.initializer
            ? emitExpression(member.initializer)
            : String(nextValue);
      lines.push(
        ...indent([
          `public static inline var ${safeName(member.name)}:${safeName(declaration.name)} = ${initializer};`,
        ]),
      );
      if (member.initializer?.kind === 'literal' && typeof member.initializer.value === 'number') {
        nextValue = member.initializer.value + 1;
      } else {
        nextValue += 1;
      }
    }
    for (const method of declaration.methods) lines.push(...indent(emitDeclaration(method)));
    lines.push('}');
    return lines;
  }
  if (declaration.kind === 'type') {
    const generics = declaration.typeParameters.length > 0 ? `<${declaration.typeParameters.join(', ')}>` : '';
    const modifier = declaration.packagePrivate ? 'private ' : '';
    if (declaration.cppStructInitSchemaId) {
      if (declaration.type.kind !== 'anonymous') {
        throw new Error(`cpp @:structInit declaration is not anonymous: ${declaration.cppStructInitSchemaId}`);
      }
      const fields = declaration.type.fields;
      const lines = ['#if cpp', '@:structInit', `${modifier}class ${safeName(declaration.name)}${generics} {`];
      for (const field of fields) {
        lines.push(`  public var ${safeName(field.name)}:${emitType(field.type)};`);
      }
      lines.push(
        '',
        `  public function new(${fields.map((field) => `${safeName(field.name)}:${emitType(field.type)}`).join(', ')}):Void {`,
      );
      for (const field of fields) lines.push(`    this.${safeName(field.name)} = ${safeName(field.name)};`);
      lines.push(
        '  }',
        '}',
        '#else',
        `${modifier}typedef ${safeName(declaration.name)}${generics} = ${emitType(declaration.type)};`,
        '#end',
      );
      return lines;
    }
    return [`${modifier}typedef ${safeName(declaration.name)}${generics} = ${emitType(declaration.type)};`];
  }
  if (declaration.kind === 'variable') {
    const mutability = declaration.mutable || !declaration.initializer ? 'var' : 'final';
    const type = declaration.type ? `:${emitType(declaration.type)}` : ':Dynamic';
    // Haxe omits null-valued JS static initializers, which changes an explicit
    // TypeScript `null` into `undefined`. Keep the initialization observable.
    const initializer = declaration.initializer
      ? ` = ${
          declaration.initializer.kind === 'literal' && declaration.initializer.value === null
            ? '_Runtime.explicitNull()'
            : emitExpression(declaration.initializer)
        }`
      : '';
    return [`${access}static ${mutability} ${safeName(declaration.name)}${type}${initializer};`];
  }
  const generics = declaration.typeParameters.length > 0 ? `<${declaration.typeParameters.join(', ')}>` : '';
  const directOnly = currentDirectFunctions.has(declaration.name);
  const parameters = directOnly ? '__flightArguments:Array<Dynamic>' : emitParameters(declaration.parameters);
  const signature = `${directOnly ? 'private ' : access}static function ${safeName(declaration.name)}${generics}(${parameters}):${emitType(declaration.returns)}`;
  const bodyLines: string[] = [];
  if (directOnly) {
    bodyLines.push(
      ...declaration.parameters.map(
        (parameter, index) =>
          `var ${safeName(parameter.name)}:${emitType(parameter.type)} = cast ${emitSyntheticArrayRead('highArityArguments', '__flightArguments', String(index))};`,
      ),
    );
  }
  if (declaration.haxeBody !== undefined) {
    bodyLines.push(...emitParameterInitializers(declaration.parameters));
    bodyLines.push(...splitLines(declaration.haxeBody));
  } else {
    bodyLines.push(
      ...emitFunctionBody(declaration.body, declaration.parameters, declaration.returns, declaration.async),
    );
  }
  if (!isVoidType(declaration.returns)) {
    if (declaration.async && isPromiseNothingType(declaration.returns)) {
      bodyLines.push('#if js', 'return;', '#else', 'return cast null;', '#end');
    } else {
      bodyLines.push('return cast null;');
    }
  }
  if (declaration.async) {
    if (!declaration.haxeBody && canFlatMapStatements(declaration.body)) {
      return [`${signature} {`, ...indent(emitFlatMapFunctionBody(declaration.body, declaration.parameters)), '}'];
    }
    if (!declaration.haxeBody && statementsContainAwait(declaration.body) && canFlowStatements(declaration.body)) {
      return [`${signature} {`, ...indent(emitFlowFunctionBody(declaration.body, declaration.parameters)), '}'];
    }
    if (!declaration.haxeBody && !statementsContainAwait(declaration.body)) {
      return [`${signature} {`, ...indent(emitPromiseProtectedBody(bodyLines)), '}'];
    }
    throw new Error(`Generator async lowering does not support ${declaration.origin.source}:${declaration.name}`);
  }
  return [`${signature} {`, ...indent(bodyLines), '}'];
}

function isSuperCall(statement: IrStatement): boolean {
  return (
    statement.kind === 'expression' &&
    statement.expression.kind === 'call' &&
    statement.expression.callee.kind === 'identifier' &&
    statement.expression.callee.name === 'super'
  );
}

function emitParameters(parameters: IrParameter[], packedRest = false): string {
  return parameters
    .map((parameter) => {
      const constantInitializer = parameter.initializer && isHaxeConstant(parameter.initializer);
      const prefix = parameter.rest
        ? packedRest
          ? ''
          : '...'
        : parameter.optional || (parameter.initializer && !constantInitializer)
          ? '?'
          : '';
      const initializer = constantInitializer ? ` = ${emitExpression(parameter.initializer!)}` : '';
      const type =
        parameter.rest && !packedRest && parameter.type.kind === 'array' ? parameter.type.element : parameter.type;
      return `${prefix}${safeName(parameter.name)}:${emitType(type)}${initializer}`;
    })
    .join(', ');
}

function emitPromiseProtectedBody(bodyLines: string[]): string[] {
  return ['return cast flighthq._internal._Async.protect(function():Dynamic {', ...indent(bodyLines), '});'];
}

function emitFlatMapFunctionBody(statements: IrStatement[], parameters: IrParameter[]): string[] {
  const previousReturnRequiresValue = currentReturnRequiresValue;
  const previousContinueIncrement = currentContinueIncrement;
  const previousAsyncFunction = currentAsyncFunction;
  const previousAsyncReturnsNothing = currentAsyncReturnsNothing;
  const previousFinallyStack = currentFinallyStack;
  currentReturnRequiresValue = true;
  currentContinueIncrement = undefined;
  currentAsyncFunction = true;
  currentAsyncReturnsNothing = false;
  currentFinallyStack = [];
  try {
    const body = emitParameterInitializers(parameters);
    const variables = statements.flatMap((statement) => (statement.kind === 'variable' ? statement.declarations : []));
    for (const variable of variables) {
      body.push(
        `var ${safeName(variable.name)}:${variable.type ? emitType(variable.type) : 'Dynamic'} = cast _Runtime.UNDEFINED;`,
      );
    }
    body.push(...emitFlatMapStatements(statements));
    return emitPromiseProtectedBody(body);
  } finally {
    currentReturnRequiresValue = previousReturnRequiresValue;
    currentContinueIncrement = previousContinueIncrement;
    currentAsyncFunction = previousAsyncFunction;
    currentAsyncReturnsNothing = previousAsyncReturnsNothing;
    currentFinallyStack = previousFinallyStack;
  }
}

function emitFlowFunctionBody(statements: IrStatement[], parameters: IrParameter[]): string[] {
  const previousReturnRequiresValue = currentReturnRequiresValue;
  const previousContinueIncrement = currentContinueIncrement;
  const previousAsyncFunction = currentAsyncFunction;
  const previousAsyncReturnsNothing = currentAsyncReturnsNothing;
  const previousFinallyStack = currentFinallyStack;
  currentReturnRequiresValue = true;
  currentContinueIncrement = undefined;
  currentAsyncFunction = true;
  currentAsyncReturnsNothing = false;
  currentFinallyStack = [];
  try {
    const body = [...emitParameterInitializers(parameters), ...emitFlowScopedStatements(statements)];
    return [
      'return cast flighthq._internal._Async.finishFlow(',
      '  flighthq._internal._Async.protect(function():Dynamic {',
      ...indent(indent(body)),
      '  })',
      ');',
    ];
  } finally {
    currentReturnRequiresValue = previousReturnRequiresValue;
    currentContinueIncrement = previousContinueIncrement;
    currentAsyncFunction = previousAsyncFunction;
    currentAsyncReturnsNothing = previousAsyncReturnsNothing;
    currentFinallyStack = previousFinallyStack;
  }
}

function emitFlowScopedStatements(statements: IrStatement[]): string[] {
  const lines: string[] = [];
  const variables = statements.flatMap((statement) => (statement.kind === 'variable' ? statement.declarations : []));
  for (const variable of variables) {
    lines.push(
      `var ${safeName(variable.name)}:${variable.type ? emitType(variable.type) : 'Dynamic'} = cast _Runtime.UNDEFINED;`,
    );
  }
  lines.push(...emitFlowStatements(statements));
  return lines;
}

function emitFlowStatements(statements: IrStatement[], index = 0): string[] {
  if (index >= statements.length) return ['return flighthq._internal._Async.flowNormal();'];
  const statement = statements[index]!;
  const continuation = () => emitFlowStatements(statements, index + 1);
  switch (statement.kind) {
    case 'break':
      return ['return flighthq._internal._Async.flowBreak();'];
    case 'continue':
      return ['return flighthq._internal._Async.flowContinue();'];
    case 'variable':
      return emitFlatMapVariableInitializers(statement.declarations, 0, continuation);
    case 'expression':
      return emitAwaitedExpression(statement.expression, (value) => [`${value};`, ...continuation()]);
    case 'return':
      return statement.expression
        ? emitAwaitedExpression(statement.expression, (value) => [
            `return flighthq._internal._Async.flowReturn(${value});`,
          ])
        : ['return flighthq._internal._Async.flowReturn(_Runtime.UNDEFINED);'];
    case 'throw':
      return emitAwaitedExpression(statement.expression, (value) => [
        `return flighthq._internal._Async.reject(${value});`,
      ]);
    case 'block':
      return emitFlowThenContinue(emitFlowProtectedStatements(statement.statements), continuation);
    case 'if':
      return emitAwaitedExpression(statement.condition, (condition) => {
        const branch = `__flowBranch${String(temporaryIndex++)}`;
        const lines = [`var ${branch}:Dynamic;`, `if (${emitTruthinessValue(condition, statement.condition)}) {`];
        lines.push(
          ...indent([`${branch} = ${emitFlowProtectedStatements(statementToStatements(statement.consequent))};`]),
        );
        if (statement.otherwise) {
          lines.push('} else {');
          lines.push(
            ...indent([`${branch} = ${emitFlowProtectedStatements(statementToStatements(statement.otherwise))};`]),
          );
        } else {
          lines.push('} else {', `  ${branch} = flighthq._internal._Async.flowNormal();`);
        }
        lines.push('}');
        lines.push(...emitFlowThenContinue(branch, continuation));
        return lines;
      });
    case 'while': {
      if (!statementContainsAwait(statement)) return [...emitStatement(statement), ...continuation()];
      const iteration = [
        'function():Dynamic {',
        ...indent(
          emitAwaitedExpression(statement.condition, (condition) => [
            `if (!${emitTruthinessValue(condition, statement.condition)}) return flighthq._internal._Async.flowBreak();`,
            `return ${emitFlowProtectedStatements(statementToStatements(statement.body))};`,
          ]),
        ),
        '}',
      ].join('\n');
      return emitFlowThenContinue(`flighthq._internal._Async.repeatFlow(${iteration})`, continuation);
    }
    case 'for': {
      if (!statementContainsAwait(statement)) return [...emitStatement(statement), ...continuation()];
      const advance = statement.increment
        ? emitAwaitedExpression(statement.increment, (value) => [
            `${value};`,
            'return flighthq._internal._Async.flowNormal();',
          ])
        : ['return flighthq._internal._Async.flowNormal();'];
      const condition = statement.condition ?? { kind: 'literal', value: true };
      const iteration = [
        'function():Dynamic {',
        ...indent(
          emitAwaitedExpression(condition, (value) => [
            `if (!${emitTruthinessValue(value, condition)}) return flighthq._internal._Async.flowBreak();`,
            `return flighthq._internal._Async.continueIteration(${emitFlowProtectedStatements(statementToStatements(statement.body))}, function():Dynamic {`,
            ...indent(advance),
            '});',
          ]),
        ),
        '}',
      ].join('\n');
      const loop = () => [`return flighthq._internal._Async.repeatFlow(${iteration});`];
      let body: string[];
      if (Array.isArray(statement.initializer)) {
        body = statement.initializer.map(
          (variable) =>
            `var ${safeName(variable.name)}:${variable.type ? emitType(variable.type) : 'Dynamic'} = cast _Runtime.UNDEFINED;`,
        );
        body.push(...emitFlatMapVariableInitializers(statement.initializer, 0, loop));
      } else if (statement.initializer) {
        body = emitAwaitedExpression(statement.initializer, (value) => [`${value};`, ...loop()]);
      } else {
        body = loop();
      }
      const flow = ['flighthq._internal._Async.protect(function():Dynamic {', ...indent(body), '})'].join('\n');
      return emitFlowThenContinue(flow, continuation);
    }
    case 'forOf':
      if (!statementContainsAwait(statement)) return [...emitStatement(statement), ...continuation()];
      return emitAwaitedExpression(statement.iterable, (iterable) => {
        const iterator = `__flowIterator${String(temporaryIndex++)}`;
        const indexName = `__flowIndex${String(temporaryIndex++)}`;
        const bodyStatements: IrStatement[] = [
          ...(statement.bindings.length > 0
            ? [{ declarations: statement.bindings, kind: 'variable' } as IrStatement]
            : []),
          ...statementToStatements(statement.body),
        ];
        const body = emitFlowScopedStatements(bodyStatements);
        const iteration = statement.async
          ? [
              'function():Dynamic {',
              `  return flighthq._internal._Async.flatMap(_Runtime.callProperty(${iterator}, 'next', cast ([] : Array<Dynamic>)), function(__step:Dynamic):Dynamic {`,
              `    if (_Runtime.truthy(_Runtime.field(__step, 'done'))) return flighthq._internal._Async.flowBreak();`,
              `    var ${safeName(statement.variable)}:Dynamic = _Runtime.field(__step, 'value');`,
              ...indent(indent(body)),
              '  });',
              '}',
            ].join('\n')
          : [
              'function():Dynamic {',
              `  if (${indexName} >= ${iterator}.length) return flighthq._internal._Async.flowBreak();`,
              `  var ${safeName(statement.variable)}:Dynamic = ${iterator}[${indexName}++];`,
              ...indent(body),
              '}',
            ].join('\n');
        const lines = statement.async
          ? [`var ${iterator}:Dynamic = _Runtime.asyncIterator(${iterable});`]
          : [`var ${iterator}:Array<Dynamic> = _Runtime.iterable(${iterable});`, `var ${indexName}:Int = 0;`];
        lines.push(...emitFlowThenContinue(`flighthq._internal._Async.repeatFlow(${iteration})`, continuation));
        return lines;
      });
    case 'do':
    case 'switch':
      return [...emitStatement(statement), ...continuation()];
    case 'try': {
      let flow = emitFlowProtectedStatements(statementToStatements(statement.tryBody));
      if (statement.catchBody) {
        const error = safeName(statement.catchName ?? '__error');
        flow = [
          `flighthq._internal._Async.recover(${flow}, function(__caughtError:Dynamic):Dynamic {`,
          `  var ${error}:Dynamic = __caughtError;`,
          ...indent([`return ${emitFlowProtectedStatements(statementToStatements(statement.catchBody))};`]),
          '})',
        ].join('\n');
      }
      if (statement.finallyBody) {
        flow = [
          `flighthq._internal._Async.finalizeFlow(${flow}, function():Dynamic {`,
          ...indent(emitFlowScopedStatements(statementToStatements(statement.finallyBody))),
          '})',
        ].join('\n');
      }
      return emitFlowThenContinue(flow, continuation);
    }
    default:
      throw new Error('Flow lowering encountered an unsupported statement');
  }
}

function emitFlowProtectedStatements(statements: IrStatement[]): string {
  return [
    'flighthq._internal._Async.protect(function():Dynamic {',
    ...indent(emitFlowScopedStatements(statements)),
    '})',
  ].join('\n');
}

function emitFlowThenContinue(value: string, continuation: () => string[]): string[] {
  return [
    `return flighthq._internal._Async.continueFlow(${value}, function():Dynamic {`,
    ...indent(continuation()),
    '});',
  ];
}

function statementToStatements(statement: IrStatement): IrStatement[] {
  return statement.kind === 'block' ? statement.statements : [statement];
}

function emitFlatMapStatements(statements: IrStatement[], index = 0): string[] {
  if (index >= statements.length) {
    return ['return flighthq._internal._Async.resolve(_Runtime.UNDEFINED);'];
  }
  const statement = statements[index]!;
  const continuation = () => emitFlatMapStatements(statements, index + 1);
  switch (statement.kind) {
    case 'variable':
      return emitFlatMapVariableInitializers(statement.declarations, 0, continuation);
    case 'expression':
      return emitAwaitedExpression(statement.expression, (value) => [`${value};`, ...continuation()]);
    case 'return':
      return statement.expression
        ? emitAwaitedExpression(statement.expression, (value) => [
            `return flighthq._internal._Async.resolve(${value});`,
          ])
        : ['return flighthq._internal._Async.resolve(_Runtime.UNDEFINED);'];
    case 'throw':
      return emitAwaitedExpression(statement.expression, (value) => [
        `return flighthq._internal._Async.reject(${value});`,
      ]);
    default:
      throw new Error(`Flat-map lowering does not support statement ${statement.kind}`);
  }
}

function emitFlatMapVariableInitializers(
  declarations: IrVariable[],
  index: number,
  continuation: () => string[],
): string[] {
  if (index >= declarations.length) return continuation();
  const declaration = declarations[index]!;
  const next = () => emitFlatMapVariableInitializers(declarations, index + 1, continuation);
  if (!declaration.initializer) return next();
  return emitAwaitedExpression(declaration.initializer, (value) => [
    `${safeName(declaration.name)} = ${value};`,
    ...next(),
  ]);
}

function emitAwaitedExpression(expression: IrExpression, continuation: (value: string) => string[]): string[] {
  if (expression.kind === 'conditional' && expressionContainsAwait(expression)) {
    return emitAwaitedExpression(expression.condition, (condition) => [
      `if (${emitTruthinessValue(condition, expression.condition)}) {`,
      ...indent(emitAwaitedExpression(expression.whenTrue, continuation)),
      '} else {',
      ...indent(emitAwaitedExpression(expression.whenFalse, continuation)),
      '}',
    ]);
  }
  if (
    expression.kind === 'binary' &&
    ['&&', '??', '??undefined', '||'].includes(expression.operator) &&
    expressionContainsAwait(expression.right)
  ) {
    return emitAwaitedExpression(expression.left, (left) => {
      const right = emitAwaitedExpression(expression.right, continuation);
      if (expression.operator === '&&') {
        return [
          `if (${emitTruthinessValue(left, expression.left)}) {`,
          ...indent(right),
          '} else {',
          ...indent(continuation(left)),
          '}',
        ];
      }
      if (expression.operator === '||') {
        return [
          `if (${emitTruthinessValue(left, expression.left)}) {`,
          ...indent(continuation(left)),
          '} else {',
          ...indent(right),
          '}',
        ];
      }
      const absent =
        expression.operator === '??undefined'
          ? `_Runtime.strictEquals(${left}, _Runtime.UNDEFINED)`
          : `_Runtime.strictEquals(${left}, null)`;
      return [`if (${absent}) {`, ...indent(right), '} else {', ...indent(continuation(left)), '}'];
    });
  }
  const awaits: ExtractedAwait[] = [];
  const normalized = extractAwaits(expression, awaits);
  let lines = continuation(emitExpression(normalized));
  for (let index = awaits.length - 1; index >= 0; index -= 1) {
    const awaited = awaits[index]!;
    lines = awaited.awaited
      ? [
          `return flighthq._internal._Async.flatMap(${emitExpression(awaited.expression)}, function(${awaited.name}:Dynamic):Dynamic {`,
          ...indent(lines),
          '});',
        ]
      : [`var ${awaited.name}:Dynamic = ${emitExpression(awaited.expression)};`, ...lines];
  }
  return lines;
}

function extractAwaits(expression: IrExpression, awaits: ExtractedAwait[]): IrExpression {
  if (expression.kind === 'await') {
    const awaitedExpression = extractAwaits(expression.expression, awaits);
    const name = `__awaitValue${String(temporaryIndex++)}`;
    awaits.push({ awaited: true, expression: awaitedExpression, name });
    return { kind: 'identifier', name };
  }
  switch (expression.kind) {
    case 'array':
      return { ...expression, elements: expression.elements.map((item) => extractAwaits(item, awaits)) };
    case 'assignment': {
      let left = extractAwaits(expression.left, awaits);
      if (expressionContainsAwait(expression.right)) {
        if (left.kind === 'element') {
          const object = extractSynchronousValue(left.object, awaits);
          const index = extractSynchronousValue(left.index, awaits);
          left = { ...left, index, object };
        } else if (left.kind === 'property') {
          left = { ...left, object: extractSynchronousValue(left.object, awaits) };
        }
      }
      return {
        ...expression,
        left,
        right: extractAwaits(expression.right, awaits),
      };
    }
    case 'binary':
      return {
        ...expression,
        left: extractAwaits(expression.left, awaits),
        right: extractAwaits(expression.right, awaits),
      };
    case 'call':
      return {
        ...expression,
        arguments: expression.arguments.map((item) => extractAwaits(item, awaits)),
        callee: extractAwaits(expression.callee, awaits),
      };
    case 'cast':
      return { ...expression, expression: extractAwaits(expression.expression, awaits) };
    case 'conditional':
      return {
        ...expression,
        condition: extractAwaits(expression.condition, awaits),
        whenFalse: extractAwaits(expression.whenFalse, awaits),
        whenTrue: extractAwaits(expression.whenTrue, awaits),
      };
    case 'element':
      return {
        ...expression,
        index: extractAwaits(expression.index, awaits),
        object: extractAwaits(expression.object, awaits),
      };
    case 'function':
      return expression;
    case 'identifier':
    case 'literal':
    case 'regexp':
      return expression;
    case 'new':
      return {
        ...expression,
        arguments: expression.arguments.map((item) => extractAwaits(item, awaits)),
        callee: extractAwaits(expression.callee, awaits),
      };
    case 'object':
      return {
        ...expression,
        properties: expression.properties.map((property) => {
          if (property.kind === 'spread') {
            return { ...property, expression: extractAwaits(property.expression, awaits) };
          }
          if (property.kind === 'computedProperty') {
            return {
              ...property,
              key: extractAwaits(property.key, awaits),
              value: extractAwaits(property.value, awaits),
            };
          }
          return { ...property, value: extractAwaits(property.value, awaits) };
        }),
      };
    case 'property':
      return { ...expression, object: extractAwaits(expression.object, awaits) };
    case 'spread':
      return { ...expression, expression: extractAwaits(expression.expression, awaits) };
    case 'template':
      return {
        ...expression,
        parts: expression.parts.map((part) => (typeof part === 'string' ? part : extractAwaits(part, awaits))),
      };
    case 'unary':
      return { ...expression, operand: extractAwaits(expression.operand, awaits) };
  }
}

function extractSynchronousValue(expression: IrExpression, awaits: ExtractedAwait[]): IrExpression {
  const name = `__beforeAwait${String(temporaryIndex++)}`;
  awaits.push({ awaited: false, expression, name });
  return { kind: 'identifier', name };
}

function canFlatMapStatements(statements: IrStatement[]): boolean {
  return statements.every((statement) => {
    switch (statement.kind) {
      case 'expression':
      case 'return':
      case 'throw':
        return !statement.expression || expressionSupportsFlatMapExtraction(statement.expression);
      case 'variable':
        return statement.declarations.every(
          (variable) => !variable.initializer || expressionSupportsFlatMapExtraction(variable.initializer),
        );
      default:
        return false;
    }
  });
}

function canFlowStatements(statements: IrStatement[], inLoop = false): boolean {
  return statements.every((statement) => {
    switch (statement.kind) {
      case 'block':
        return canFlowStatements(statement.statements, inLoop);
      case 'break':
      case 'continue':
        return inLoop;
      case 'expression':
      case 'return':
      case 'throw':
        return !statement.expression || expressionSupportsFlatMapExtraction(statement.expression);
      case 'if':
        return (
          expressionSupportsFlatMapExtraction(statement.condition) &&
          canFlowStatements(statementToStatements(statement.consequent), inLoop) &&
          (!statement.otherwise || canFlowStatements(statementToStatements(statement.otherwise), inLoop))
        );
      case 'while':
        return (
          (!statementContainsAwait(statement) && !statementContainsReturn(statement)) ||
          (expressionSupportsFlatMapExtraction(statement.condition) &&
            canFlowStatements(statementToStatements(statement.body), true))
        );
      case 'for':
        return (
          (!statementContainsAwait(statement) && !statementContainsReturn(statement)) ||
          ((Array.isArray(statement.initializer)
            ? statement.initializer.every(
                (variable) => !variable.initializer || expressionSupportsFlatMapExtraction(variable.initializer),
              )
            : !statement.initializer || expressionSupportsFlatMapExtraction(statement.initializer)) &&
            (!statement.condition || expressionSupportsFlatMapExtraction(statement.condition)) &&
            (!statement.increment || expressionSupportsFlatMapExtraction(statement.increment)) &&
            canFlowStatements(statementToStatements(statement.body), true))
        );
      case 'forOf':
        return (
          (!statementContainsAwait(statement) && !statementContainsReturn(statement)) ||
          (expressionSupportsFlatMapExtraction(statement.iterable) &&
            statement.bindings.every(
              (variable) => !variable.initializer || expressionSupportsFlatMapExtraction(variable.initializer),
            ) &&
            canFlowStatements(statementToStatements(statement.body), true))
        );
      case 'do':
      case 'switch':
        return !statementContainsAwait(statement) && !statementContainsReturn(statement);
      case 'try':
        return (
          canFlowStatements(statementToStatements(statement.tryBody), inLoop) &&
          (!statement.catchBody || canFlowStatements(statementToStatements(statement.catchBody), inLoop)) &&
          (!statement.finallyBody || canFlowStatements(statementToStatements(statement.finallyBody), inLoop))
        );
      case 'variable':
        return statement.declarations.every(
          (variable) => !variable.initializer || expressionSupportsFlatMapExtraction(variable.initializer),
        );
      default:
        return false;
    }
  });
}

function expressionSupportsFlatMapExtraction(expression: IrExpression): boolean {
  switch (expression.kind) {
    case 'await':
      return expressionSupportsFlatMapExtraction(expression.expression);
    case 'array':
      return expression.elements.every(expressionSupportsFlatMapExtraction);
    case 'assignment':
      return (
        expressionSupportsFlatMapExtraction(expression.left) && expressionSupportsFlatMapExtraction(expression.right)
      );
    case 'binary':
      return (
        expressionSupportsFlatMapExtraction(expression.left) && expressionSupportsFlatMapExtraction(expression.right)
      );
    case 'call':
      return (
        (!(expression.optional || (expression.callee.kind === 'property' && expression.callee.optional)) ||
          !expression.arguments.some(expressionContainsAwait)) &&
        expressionSupportsFlatMapExtraction(expression.callee) &&
        expression.arguments.every(expressionSupportsFlatMapExtraction)
      );
    case 'cast':
    case 'spread':
      return expressionSupportsFlatMapExtraction(expression.expression);
    case 'conditional':
      return (
        expressionSupportsFlatMapExtraction(expression.condition) &&
        expressionSupportsFlatMapExtraction(expression.whenTrue) &&
        expressionSupportsFlatMapExtraction(expression.whenFalse)
      );
    case 'element':
      return (
        expressionSupportsFlatMapExtraction(expression.object) && expressionSupportsFlatMapExtraction(expression.index)
      );
    case 'function':
    case 'identifier':
    case 'literal':
    case 'regexp':
      return true;
    case 'new':
      return (
        expressionSupportsFlatMapExtraction(expression.callee) &&
        expression.arguments.every(expressionSupportsFlatMapExtraction)
      );
    case 'object':
      return expression.properties.every((property) => {
        if (property.kind === 'spread') return expressionSupportsFlatMapExtraction(property.expression);
        if (property.kind === 'computedProperty') {
          return (
            expressionSupportsFlatMapExtraction(property.key) && expressionSupportsFlatMapExtraction(property.value)
          );
        }
        return expressionSupportsFlatMapExtraction(property.value);
      });
    case 'property':
      return expressionSupportsFlatMapExtraction(expression.object);
    case 'template':
      return expression.parts.every((part) => typeof part === 'string' || expressionSupportsFlatMapExtraction(part));
    case 'unary':
      return expressionSupportsFlatMapExtraction(expression.operand);
  }
}

function statementsContainAwait(statements: IrStatement[]): boolean {
  return statements.some(statementContainsAwait);
}

function statementContainsAwait(statement: IrStatement): boolean {
  switch (statement.kind) {
    case 'block':
      return statementsContainAwait(statement.statements);
    case 'break':
    case 'continue':
      return false;
    case 'do':
    case 'while':
      return expressionContainsAwait(statement.condition) || statementContainsAwait(statement.body);
    case 'expression':
    case 'return':
    case 'throw':
      return statement.expression ? expressionContainsAwait(statement.expression) : false;
    case 'for':
      return (
        (Array.isArray(statement.initializer)
          ? statement.initializer.some(
              (variable) => variable.initializer && expressionContainsAwait(variable.initializer),
            )
          : statement.initializer
            ? expressionContainsAwait(statement.initializer)
            : false) ||
        (statement.condition ? expressionContainsAwait(statement.condition) : false) ||
        (statement.increment ? expressionContainsAwait(statement.increment) : false) ||
        statementContainsAwait(statement.body)
      );
    case 'forOf':
      return (
        statement.async ||
        expressionContainsAwait(statement.iterable) ||
        statement.bindings.some((variable) => variable.initializer && expressionContainsAwait(variable.initializer)) ||
        statementContainsAwait(statement.body)
      );
    case 'if':
      return (
        expressionContainsAwait(statement.condition) ||
        statementContainsAwait(statement.consequent) ||
        Boolean(statement.otherwise && statementContainsAwait(statement.otherwise))
      );
    case 'switch':
      return (
        expressionContainsAwait(statement.expression) ||
        statement.cases.some(
          (case_) =>
            Boolean(case_.expression && expressionContainsAwait(case_.expression)) ||
            statementsContainAwait(case_.statements),
        )
      );
    case 'try':
      return (
        statementContainsAwait(statement.tryBody) ||
        Boolean(statement.catchBody && statementContainsAwait(statement.catchBody)) ||
        Boolean(statement.finallyBody && statementContainsAwait(statement.finallyBody))
      );
    case 'variable':
      return statement.declarations.some(
        (variable) => variable.initializer && expressionContainsAwait(variable.initializer),
      );
  }
}

function statementContainsReturn(statement: IrStatement): boolean {
  switch (statement.kind) {
    case 'return':
      return true;
    case 'block':
      return statement.statements.some(statementContainsReturn);
    case 'do':
    case 'while':
      return statementContainsReturn(statement.body);
    case 'for':
    case 'forOf':
      return statementContainsReturn(statement.body);
    case 'if':
      return (
        statementContainsReturn(statement.consequent) ||
        Boolean(statement.otherwise && statementContainsReturn(statement.otherwise))
      );
    case 'switch':
      return statement.cases.some((case_) => case_.statements.some(statementContainsReturn));
    case 'try':
      return (
        statementContainsReturn(statement.tryBody) ||
        Boolean(statement.catchBody && statementContainsReturn(statement.catchBody)) ||
        Boolean(statement.finallyBody && statementContainsReturn(statement.finallyBody))
      );
    case 'break':
    case 'continue':
    case 'expression':
    case 'throw':
    case 'variable':
      return false;
  }
}

function expressionContainsAwait(expression: IrExpression): boolean {
  switch (expression.kind) {
    case 'await':
      return true;
    case 'array':
      return expression.elements.some(expressionContainsAwait);
    case 'assignment':
    case 'binary':
      return expressionContainsAwait(expression.left) || expressionContainsAwait(expression.right);
    case 'call':
    case 'new':
      return expressionContainsAwait(expression.callee) || expression.arguments.some(expressionContainsAwait);
    case 'cast':
    case 'spread':
      return expressionContainsAwait(expression.expression);
    case 'conditional':
      return (
        expressionContainsAwait(expression.condition) ||
        expressionContainsAwait(expression.whenTrue) ||
        expressionContainsAwait(expression.whenFalse)
      );
    case 'element':
      return expressionContainsAwait(expression.object) || expressionContainsAwait(expression.index);
    case 'function':
    case 'identifier':
    case 'literal':
    case 'regexp':
      return false;
    case 'object':
      return expression.properties.some((property) => {
        if (property.kind === 'spread') return expressionContainsAwait(property.expression);
        if (property.kind === 'computedProperty') {
          return expressionContainsAwait(property.key) || expressionContainsAwait(property.value);
        }
        return expressionContainsAwait(property.value);
      });
    case 'property':
      return expressionContainsAwait(expression.object);
    case 'template':
      return expression.parts.some((part) => typeof part !== 'string' && expressionContainsAwait(part));
    case 'unary':
      return expressionContainsAwait(expression.operand);
  }
}

function emitFunctionBody(
  statements: IrStatement[],
  parameters: IrParameter[],
  returns?: IrType,
  async = false,
): string[] {
  const previousReturnRequiresValue = currentReturnRequiresValue;
  const previousContinueIncrement = currentContinueIncrement;
  const previousAsyncFunction = currentAsyncFunction;
  const previousAsyncReturnsNothing = currentAsyncReturnsNothing;
  const previousFinallyStack = currentFinallyStack;
  currentReturnRequiresValue = returns ? !isVoidType(returns) : false;
  currentContinueIncrement = undefined;
  currentAsyncFunction = async;
  currentAsyncReturnsNothing = async && returns !== undefined && isPromiseNothingType(returns);
  currentFinallyStack = [];
  try {
    const lines = emitParameterInitializers(parameters);
    const variables = statements.flatMap((statement) => (statement.kind === 'variable' ? statement.declarations : []));
    for (const variable of variables) {
      lines.push(
        `var ${safeName(variable.name)}:${variable.type ? emitType(variable.type) : 'Dynamic'} = cast _Runtime.UNDEFINED;`,
      );
    }
    for (const statement of statements) {
      if (statement.kind === 'variable') {
        for (const variable of statement.declarations) {
          if (variable.initializer) lines.push(`${safeName(variable.name)} = ${emitExpression(variable.initializer)};`);
        }
      } else {
        lines.push(...emitStatement(statement));
      }
    }
    return lines;
  } finally {
    currentReturnRequiresValue = previousReturnRequiresValue;
    currentContinueIncrement = previousContinueIncrement;
    currentAsyncFunction = previousAsyncFunction;
    currentAsyncReturnsNothing = previousAsyncReturnsNothing;
    currentFinallyStack = previousFinallyStack;
  }
}

function emitParameterInitializers(parameters: IrParameter[]): string[] {
  return parameters
    .filter((parameter) => parameter.initializer && !isHaxeConstant(parameter.initializer))
    .map(
      (parameter) =>
        `if (${safeName(parameter.name)} == null) ${safeName(parameter.name)} = cast (${emitExpression(parameter.initializer!)} : Dynamic);`,
    );
}

function isHaxeConstant(expression: IrExpression): boolean {
  // A Haxe JS default of null is represented by an omitted argument and remains
  // undefined. Lower it in the function body so TypeScript's explicit null is
  // observable when the value is later stored in an object.
  return expression.kind === 'literal' && expression.value !== null;
}

function emitStatement(statement: IrStatement): string[] {
  switch (statement.kind) {
    case 'block': {
      const lines = ['{'];
      for (const item of statement.statements) lines.push(...indent(emitStatement(item)));
      lines.push('}');
      return lines;
    }
    case 'break':
      return ['break;'];
    case 'continue':
      return currentContinueIncrement ? [`${emitExpression(currentContinueIncrement)};`, 'continue;'] : ['continue;'];
    case 'do':
      return [`do ${emitLoopEmbedded(statement.body)} while (${emitTruthiness(statement.condition)});`];
    case 'expression':
      return [`${emitExpression(statement.expression)};`];
    case 'for': {
      const lines = ['{'];
      if (Array.isArray(statement.initializer)) {
        for (const item of statement.initializer) lines.push(...indent([`${emitVariable(item, false)};`]));
      } else if (statement.initializer) {
        lines.push(...indent([`${emitExpression(statement.initializer)};`]));
      }
      lines.push(...indent([`while (${statement.condition ? emitTruthiness(statement.condition) : 'true'}) {`]));
      const bodyStatements = statement.body.kind === 'block' ? statement.body.statements : [statement.body];
      const previousContinueIncrement = currentContinueIncrement;
      currentContinueIncrement = statement.increment;
      try {
        for (const item of bodyStatements) lines.push(...indent(indent(emitStatement(item))));
      } finally {
        currentContinueIncrement = previousContinueIncrement;
      }
      if (statement.increment) lines.push(...indent(indent([`${emitExpression(statement.increment)};`])));
      lines.push('  }', '}');
      return lines;
    }
    case 'forOf': {
      const iterator = `__asyncIterator${String(temporaryIndex++)}`;
      const step = `__asyncStep${String(temporaryIndex++)}`;
      const lines = statement.async
        ? [
            '{',
            ...indent([`var ${iterator}:Dynamic = _Runtime.asyncIterator(${emitExpression(statement.iterable)});`]),
            ...indent(['while (true) {']),
            ...indent(
              indent([
                `var ${step}:Dynamic = flighthq._internal._Async.awaitValue(_Runtime.callProperty(${iterator}, 'next', cast ([] : Array<Dynamic>)));`,
                `if (_Runtime.truthy(_Runtime.field(${step}, 'done'))) break;`,
                `var ${safeName(statement.variable)}:Dynamic = _Runtime.field(${step}, 'value');`,
              ]),
            ),
          ]
        : [`for (${safeName(statement.variable)} in _Runtime.iterable(${emitExpression(statement.iterable)})) {`];
      for (const binding of statement.bindings) {
        const bindingLines = indent([`${emitVariable(binding, false)};`]);
        lines.push(...(statement.async ? indent(bindingLines) : bindingLines));
      }
      const body = statement.body.kind === 'block' ? statement.body.statements : [statement.body];
      const previousContinueIncrement = currentContinueIncrement;
      currentContinueIncrement = undefined;
      try {
        for (const item of body) {
          const bodyLines = indent(emitStatement(item));
          lines.push(...(statement.async ? indent(bodyLines) : bodyLines));
        }
      } finally {
        currentContinueIncrement = previousContinueIncrement;
      }
      lines.push(...(statement.async ? ['  }', '}'] : ['}']));
      return lines;
    }
    case 'if': {
      const base = `if (${emitTruthiness(statement.condition)}) ${emitEmbedded(statement.consequent)}`;
      return [statement.otherwise ? `${base} else ${emitEmbedded(statement.otherwise)}` : base];
    }
    case 'return': {
      if (statement.expression && currentFinallyStack.length > 0) {
        const result = `__returnValue${String(temporaryIndex++)}`;
        const expression = emitExpression(statement.expression);
        return [`var ${result}:Dynamic = ${expression};`, ...emitPendingFinalizers(), `return cast ${result};`];
      }
      const finalizers = emitPendingFinalizers();
      if (!statement.expression && currentAsyncReturnsNothing) {
        return [...finalizers, '#if js', 'return;', '#else', 'return cast null;', '#end'];
      }
      return [
        ...finalizers,
        statement.expression
          ? `${statement.expression.kind === 'object' && statement.expression.cppStructInit ? 'return ' : 'return cast '}${emitExpression(statement.expression)};`
          : currentReturnRequiresValue
            ? 'return cast null;'
            : 'return;',
      ];
    }
    case 'switch': {
      const lines = ['{', ...indent([`var __switchValue = ${emitExpression(statement.expression)};`])];
      const grouped: Array<{ expressions: IrExpression[]; statements: IrStatement[] }> = [];
      let pending: IrExpression[] = [];
      for (const case_ of statement.cases) {
        if (case_.expression) pending.push(case_.expression);
        const statements = stripTrailingSwitchBreak(case_.statements);
        if (statements.length === 0 && case_.expression) continue;
        grouped.push({ expressions: pending, statements });
        pending = [];
      }
      grouped.forEach((case_, index) => {
        const prefix = index === 0 ? '' : 'else ';
        const condition =
          case_.expressions.length > 0
            ? `if (${case_.expressions.map((expression) => `__switchValue == ${emitExpression(expression)}`).join(' || ')})`
            : '';
        lines.push(...indent([`${prefix}${condition} {`]));
        for (const item of case_.statements) lines.push(...indent(indent(emitStatement(item))));
        lines.push('  }');
      });
      lines.push('}');
      return lines;
    }
    case 'throw':
      return [`throw ${emitExpression(statement.expression)};`];
    case 'try':
      return emitTryStatement(statement);
    case 'variable':
      return statement.declarations.map((item) => `${emitVariable(item, true)};`);
    case 'while':
      return [`while (${emitTruthiness(statement.condition)}) ${emitLoopEmbedded(statement.body)}`];
  }
}

function isVoidType(type: IrType): boolean {
  return type.kind === 'primitive' && type.name === 'Void';
}

function isPromiseNothingType(type: IrType): boolean {
  return (
    type.kind === 'named' &&
    type.name === 'flighthq._internal._Promise' &&
    type.arguments[0]?.kind === 'named' &&
    type.arguments[0].name === 'flighthq._internal._Nothing'
  );
}

function emitVariable(variable: IrVariable, includeSemicolon: boolean): string {
  const type = variable.type ? `:${emitType(variable.type)}` : ':Dynamic';
  const initializer = variable.initializer
    ? ` = ${emitExpression(variable.initializer)}`
    : ' = cast _Runtime.UNDEFINED';
  const output = `var ${safeName(variable.name)}${type}${initializer}`;
  return includeSemicolon ? output : output;
}

function emitEmbedded(statement: IrStatement): string {
  if (statement.kind === 'block') return emitStatement(statement).join('\n');
  return `{ ${emitStatement(statement).join(' ')} }`;
}

function emitLoopEmbedded(statement: IrStatement): string {
  const previousContinueIncrement = currentContinueIncrement;
  currentContinueIncrement = undefined;
  try {
    return emitEmbedded(statement);
  } finally {
    currentContinueIncrement = previousContinueIncrement;
  }
}

function emitInt32Operand(expression: IrExpression): string {
  // Literal operands that are already exact 32-bit integers stay plain integer
  // literals: `_Runtime.toInt32` on them is redundant, and inline-variable
  // initializers (const enum flags) must remain compile-time constants.
  if (
    expression.kind === 'literal' &&
    typeof expression.value === 'number' &&
    Number.isInteger(expression.value) &&
    expression.value >= -2147483648 &&
    expression.value <= 2147483647
  ) {
    return String(expression.value);
  }
  return `_Runtime.toInt32(${emitExpression(expression)})`;
}

function emitArithmeticOperation(left: string, operator: string, right: string): string {
  return operator === '%' ? `_Runtime.fmod(${left}, ${right})` : `(${left} ${operator} ${right})`;
}

function emitTruthiness(expression: IrExpression): string {
  return emitTruthinessValue(emitExpression(expression), expression);
}

function emitTruthinessValue(value: string, expression: IrExpression): string {
  if (expression.staticFacts?.boolean) {
    return markStaticLowering('booleanTruthinessUses', emitBooleanValue(value));
  }
  return `_Runtime.truthy(${value})`;
}

function emitBooleanExpression(expression: IrExpression): string {
  return emitBooleanValue(emitExpression(expression));
}

function emitBooleanValue(value: string): string {
  return `(cast ${value} : Bool)`;
}

function emptyStaticLoweringEmissionCounts(): StaticLoweringEmissionCounts {
  return {
    booleanAndExpressions: 0,
    booleanConditionalExpressions: 0,
    booleanOrExpressions: 0,
    booleanTruthinessUses: 0,
    destructuringEscapes: Object.fromEntries(
      destructuringReadEscapes.map((escape) => [
        escape,
        Object.fromEntries(destructuringReadSources.map((source) => [source, 0])),
      ]),
    ) as StaticLoweringEmissionCounts['destructuringEscapes'],
    destructuringReads: Object.fromEntries(
      destructuringReadSources.map((source) => [source, { direct: 0, parked: 0, proven: 0 }]),
    ) as StaticLoweringEmissionCounts['destructuringReads'],
    destructuringReceivers: Object.fromEntries(
      indexedReceiverNames.map((receiver) => [
        receiver,
        Object.fromEntries(destructuringReadSources.map((source) => [source, 0])),
      ]),
    ) as StaticLoweringEmissionCounts['destructuringReceivers'],
    indexedAccesses: {
      reads: 0,
      writes: 0,
    },
    indexedReceivers: Object.fromEntries(
      indexedReceiverNames.map((receiver) => [receiver, { reads: 0, writes: 0 }]),
    ) as StaticLoweringEmissionCounts['indexedReceivers'],
    numericRelations: 0,
    syntheticArrayReads: {
      highArityArguments: 0,
      iterationBindings: 0,
    },
  };
}

function finalizeStaticLoweringEmission(output: string): string {
  let finalized = output;
  for (const [name, marker] of Object.entries(staticLoweringMarkers) as Array<
    [ScalarStaticLoweringEmissionName, string]
  >) {
    staticLoweringEmission[name] += finalized.split(marker).length - 1;
    finalized = finalized.replaceAll(marker, '');
  }
  for (const receiver of indexedReceiverNames) {
    for (const operation of ['reads', 'writes'] as const) {
      const marker = staticIndexedLoweringMarker(receiver, operation);
      const count = finalized.split(marker).length - 1;
      staticLoweringEmission.indexedAccesses[operation] += count;
      staticLoweringEmission.indexedReceivers[receiver][operation] += count;
      finalized = finalized.replaceAll(marker, '');
    }
  }
  for (const [name, marker] of Object.entries(syntheticArrayReadMarkers) as Array<
    [keyof StaticLoweringEmissionCounts['syntheticArrayReads'], string]
  >) {
    staticLoweringEmission.syntheticArrayReads[name] += finalized.split(marker).length - 1;
    finalized = finalized.replaceAll(marker, '');
  }
  for (const source of destructuringReadSources) {
    for (const escape of destructuringReadEscapes) {
      const marker = destructuringReadMarker(source, escape);
      const count = finalized.split(marker).length - 1;
      staticLoweringEmission.destructuringReads[source].parked += count;
      staticLoweringEmission.destructuringEscapes[escape][source] += count;
      finalized = finalized.replaceAll(marker, '');
    }
    for (const receiver of indexedReceiverNames) {
      const marker = destructuringReadMarker(source, receiver);
      const count = finalized.split(marker).length - 1;
      staticLoweringEmission.destructuringReads[source].proven += count;
      if (receiver === 'Array') staticLoweringEmission.destructuringReads[source].direct += count;
      staticLoweringEmission.destructuringReceivers[receiver][source] += count;
      finalized = finalized.replaceAll(marker, '');
    }
  }
  return finalized;
}

function destructuringReadMarker(
  source: IrDestructuringReadSource,
  target: IrDestructuringReadEscape | IrIndexedReceiver,
): string {
  return `/*__flight_destructuring_index_${source}_${target}__*/`;
}

function markDestructuringRead(expression: IrExpression, value: string): string {
  const source = expression.staticFacts?.destructuringSource;
  return source
    ? `${destructuringReadMarker(source.source, source.receiver ?? source.escape ?? 'unproven-receiver')}${value}`
    : value;
}

function emitDestructuringRead(expression: IrExpression, object: string, index: string): string {
  const source = expression.staticFacts?.destructuringSource;
  const value =
    source?.receiver === 'Array'
      ? markStaticIndexedLowering('Array', 'reads', `flighthq._internal._StaticIndex.readArray(${object}, ${index})`)
      : `_Runtime.getIndex(${object}, ${index})`;
  return markDestructuringRead(expression, value);
}

function markStaticLowering(name: ScalarStaticLoweringEmissionName, value: string): string {
  return `${staticLoweringMarkers[name]}${value}`;
}

function staticIndexedLoweringMarker(receiver: IrIndexedReceiver, operation: 'reads' | 'writes'): string {
  return `/*__flight_direct_index_${operation}_${receiver}__*/`;
}

function markStaticIndexedLowering(receiver: IrIndexedReceiver, operation: 'reads' | 'writes', value: string): string {
  return `${staticIndexedLoweringMarker(receiver, operation)}${value}`;
}

function emitSyntheticArrayRead(
  kind: keyof StaticLoweringEmissionCounts['syntheticArrayReads'],
  object: string,
  index: string,
): string {
  return `${syntheticArrayReadMarkers[kind]}${markStaticIndexedLowering(
    'Array',
    'reads',
    `flighthq._internal._StaticIndex.readArray(${object}, ${index})`,
  )}`;
}

function emitStaticIndexedRead(
  expression: Extract<IrExpression, { kind: 'element' }>,
  object = emitExpression(expression.object),
  index = emitExpression(expression.index),
): string | undefined {
  if (expression.syntheticArrayRead === 'iterationBinding') {
    return emitSyntheticArrayRead('iterationBindings', object, index);
  }
  const indexedAccess = expression.staticFacts?.indexedAccess;
  if (!indexedAccess || indexedAccess.reads !== 1 || expression.optional) return undefined;
  return markStaticIndexedLowering(
    indexedAccess.receiver,
    'reads',
    `flighthq._internal._StaticIndex.read${indexedAccess.receiver}(${object}, ${index})`,
  );
}

function emitStaticIndexedWrite(
  expression: Extract<IrExpression, { kind: 'element' }>,
  value: string,
  object = emitExpression(expression.object),
  index = emitExpression(expression.index),
): string | undefined {
  const indexedAccess = expression.staticFacts?.indexedAccess;
  if (!indexedAccess || indexedAccess.writes !== 1 || expression.optional) return undefined;
  return markStaticIndexedLowering(
    indexedAccess.receiver,
    'writes',
    `flighthq._internal._StaticIndex.write${indexedAccess.receiver}(${object}, ${index}, ${value})`,
  );
}

function emitExpression(expression: IrExpression): string {
  switch (expression.kind) {
    case 'array':
      if (expression.elements.some((element) => element.kind === 'spread')) {
        return `_Runtime.concatArrays([${expression.elements
          .map((element) =>
            element.kind === 'spread'
              ? `_Runtime.toArray(${emitExpression(element.expression)})`
              : `[${emitExpression(element)}]`,
          )
          .join(', ')}])`;
      }
      return `cast ([${expression.elements.map(emitExpression).join(', ')}] : Array<Dynamic>)`;
    case 'await':
      return `flighthq._internal._Async.awaitValue(${emitExpression(expression.expression)})`;
    case 'assignment':
    case 'binary': {
      if (expression.kind === 'assignment' && expression.operator === '=' && expression.left.kind === 'array') {
        const temporary = `__destructure${String(temporaryIndex++)}`;
        return `({ var ${temporary}:Dynamic = ${emitExpression(expression.right)}; ${expression.left.elements
          .map((element, index) => {
            const value = emitDestructuringRead(expression, temporary, String(index));
            return element.kind === 'element'
              ? `_Runtime.setIndex(${emitExpression(element.object)}, ${emitExpression(element.index)}, ${value})`
              : `${emitExpression(element)} = cast ${value}`;
          })
          .join('; ')}; ${temporary}; })`;
      }
      if (
        expression.kind === 'assignment' &&
        expression.left.kind === 'property' &&
        expression.left.name === 'length'
      ) {
        const owner = emitExpression(expression.left.object);
        const value =
          expression.operator === '='
            ? emitExpression(expression.right)
            : emitArithmeticOperation(
                `${owner}.length`,
                expression.operator.slice(0, -1),
                emitExpression(expression.right),
              );
        return `_Runtime.setLength(${owner}, ${value})`;
      }
      if (expression.kind === 'assignment' && expression.left.kind === 'element') {
        if (expression.left.binding === 'WebGl2Backend') {
          throw new Error('WebGL2 computed property assignments have no typed backend endpoint');
        }
        const object = emitExpression(expression.left.object);
        const index = emitExpression(expression.left.index);
        if (expression.operator === '=') {
          const value = emitExpression(expression.right);
          return (
            emitStaticIndexedWrite(expression.left, value, object, index) ??
            `_Runtime.setIndex(${object}, ${index}, ${value})`
          );
        }
        const operator = expression.operator.slice(0, -1);
        const indexedAccess = expression.left.staticFacts?.indexedAccess;
        const directCompound = indexedAccess?.reads === 1 && indexedAccess.writes === 1 && !expression.left.optional;
        const indexedObject = directCompound ? `__indexedObject${String(temporaryIndex++)}` : object;
        const indexedKey = directCompound ? `__indexedKey${String(temporaryIndex++)}` : index;
        const current =
          emitStaticIndexedRead(expression.left, indexedObject, indexedKey) ?? `_Runtime.getIndex(${object}, ${index})`;
        const value =
          operator === '>>>'
            ? `_Runtime.unsignedShiftRight(_Runtime.toInt32(${current}), ${emitInt32Operand(expression.right)})`
            : ['&', '|', '^', '<<', '>>'].includes(operator)
              ? `(_Runtime.toInt32(${current}) ${operator} ${emitInt32Operand(expression.right)})`
              : emitArithmeticOperation(current, operator, emitExpression(expression.right));
        const directWrite = directCompound
          ? emitStaticIndexedWrite(expression.left, value, indexedObject, indexedKey)
          : undefined;
        return directWrite
          ? `({ var ${indexedObject}:Dynamic = ${object}; var ${indexedKey}:Dynamic = ${index}; ${directWrite}; })`
          : `_Runtime.setIndex(${object}, ${index}, ${value})`;
      }
      if (expression.kind === 'assignment' && expression.left.kind === 'property') {
        if (expression.left.binding === 'WebGl2Backend') {
          throw new Error(`WebGL2 property assignment has no typed backend endpoint: ${expression.left.name}`);
        }
        const object = emitExpression(expression.left.object);
        if (expression.left.binding && expression.left.binding in collectionBindingTypes) {
          throw new Error(`Typed collection property assignment is not supported: ${expression.left.name}`);
        }
        if (
          expression.left.binding === 'Canvas2dBackend' ||
          expression.left.binding === 'CanvasElementBackend' ||
          expression.left.binding === 'DomDocumentBackend' ||
          expression.left.binding === 'WebGpuCanvasContextBackend' ||
          expression.left.binding === 'WebGpuDeviceBackend' ||
          expression.left.binding === 'WebGpuQueueBackend'
        ) {
          requireHostEndpoint(expression.left.binding as IrHostEndpointBinding, 'write', expression.left.name);
          if (expression.left.binding === 'Canvas2dBackend') {
            if (expression.operator !== '=') {
              throw new Error(
                `Canvas2D compound property assignment has no typed backend endpoint: ${expression.left.name}`,
              );
            }
          }
          const binding = `flighthq._internal.backend.${expression.left.binding}`;
          const current = `${binding}.field(${object}, ${quote(expression.left.name)})`;
          const value =
            expression.operator === '='
              ? emitExpression(expression.right)
              : emitArithmeticOperation(current, expression.operator.slice(0, -1), emitExpression(expression.right));
          return `${binding}.setField(${object}, ${quote(expression.left.name)}, ${value})`;
        }
        if (expression.left.typedStructBinding) {
          if (expression.left.optional) {
            throw new Error(`Optional typed-struct assignment is not supported: ${expression.left.name}`);
          }
          const field = directTypedStructField(expression.left, object);
          if (expression.operator === '=') {
            return `(${field} = cast (${emitExpression(expression.right)} : Dynamic))`;
          }
          if (expression.operator === '%=') {
            return `(${field} = cast (${emitArithmeticOperation(field, '%', emitExpression(expression.right))} : Dynamic))`;
          }
          return `(${field} ${expression.operator} ${emitExpression(expression.right)})`;
        }
        if (expression.left.object.kind === 'identifier' && expression.left.object.name === 'this') {
          if (expression.operator === '=') {
            return `(this.${safeName(expression.left.name)} = cast (${emitExpression(expression.right)} : Dynamic))`;
          }
          if (expression.operator === '%=') {
            const field = `this.${safeName(expression.left.name)}`;
            return `(${field} = cast (${emitArithmeticOperation(field, '%', emitExpression(expression.right))} : Dynamic))`;
          }
          return `(this.${safeName(expression.left.name)} ${expression.operator} ${emitExpression(expression.right)})`;
        }
        if (expression.operator === '=') {
          return `_Runtime.setField(${object}, ${quote(expression.left.name)}, ${emitExpression(expression.right)})`;
        }
        const operation = expression.operator.slice(0, -1);
        const current = `_Runtime.field(${object}, ${quote(expression.left.name)})`;
        return `_Runtime.setField(${object}, ${quote(expression.left.name)}, ${emitArithmeticOperation(current, operation, emitExpression(expression.right))})`;
      }
      if (expression.kind === 'binary' && expression.operator === '**') {
        return `HxMath.pow(${emitExpression(expression.left)}, ${emitExpression(expression.right)})`;
      }
      if (expression.kind === 'binary' && expression.operator === '%') {
        return `_Runtime.fmod(${emitExpression(expression.left)}, ${emitExpression(expression.right)})`;
      }
      if (
        expression.kind === 'binary' &&
        expression.operator === '+' &&
        expression.left.kind === 'unary' &&
        expression.left.operator === '-' &&
        expression.right.kind === 'literal' &&
        expression.right.value === 0
      ) {
        // Haxe's JS optimizer removes `+ 0`, but TypeScript uses this form to
        // normalize an observable negative zero to positive zero.
        return `_Runtime.normalizeZero(${emitExpression(expression.left)})`;
      }
      if (expression.kind === 'binary' && expression.operator === ',') {
        return `({ ${emitExpression(expression.left)}; ${emitExpression(expression.right)}; })`;
      }
      if (expression.kind === 'binary' && expression.operator === '||') {
        if (expression.staticFacts?.booleanLogical) {
          return markStaticLowering(
            'booleanOrExpressions',
            `(${emitBooleanExpression(expression.left)} || ${emitBooleanExpression(expression.right)})`,
          );
        }
        return `_Runtime.orValue(${emitExpression(expression.left)}, function():Dynamic return cast ${emitExpression(expression.right)})`;
      }
      if (expression.kind === 'binary' && expression.operator === '&&') {
        if (expression.staticFacts?.booleanLogical) {
          return markStaticLowering(
            'booleanAndExpressions',
            `(${emitBooleanExpression(expression.left)} && ${emitBooleanExpression(expression.right)})`,
          );
        }
        return `_Runtime.andValue(${emitExpression(expression.left)}, function():Dynamic return cast ${emitExpression(expression.right)})`;
      }
      if (expression.kind === 'binary' && expression.operator === '??') {
        return `_Runtime.coalesce(${emitExpression(expression.left)}, function():Dynamic return cast ${emitExpression(expression.right)})`;
      }
      if (expression.kind === 'binary' && expression.operator === '??undefined') {
        return `_Runtime.defaultUndefined(${emitExpression(expression.left)}, function():Dynamic return cast ${emitExpression(expression.right)})`;
      }
      if (expression.kind === 'binary' && expression.operator === 'in') {
        if (expression.domRootBinding) {
          return `flighthq._internal.backend.${expression.domRootBinding}.hasField(${emitExpression(expression.right)}, ${emitExpression(expression.left)})`;
        }
        return `_Runtime.hasField(${emitExpression(expression.right)}, ${emitExpression(expression.left)})`;
      }
      if (expression.kind === 'binary' && ['<', '<=', '>', '>='].includes(expression.operator)) {
        if (expression.staticFacts?.numericRelation) {
          return markStaticLowering(
            'numericRelations',
            `((cast ${emitExpression(expression.left)} : Float) ${expression.operator} (cast ${emitExpression(expression.right)} : Float))`,
          );
        }
        return `_Runtime.compare(${emitExpression(expression.left)}, ${emitExpression(expression.right)}, ${quote(expression.operator)})`;
      }
      if (expression.kind === 'binary' && expression.operator === 'instanceof') {
        if (expression.right.kind === 'identifier' && expression.right.name === 'Error') {
          return `_Runtime.isError(${emitExpression(expression.left)})`;
        }
        if (emitExpression(expression.right) === "_Runtime.globalValue('Promise')") {
          return `flighthq._internal._Async.isPromise(${emitExpression(expression.left)})`;
        }
        if (
          expression.right.kind === 'identifier' &&
          ['Float64Array', 'Int32Array', 'Int8Array', 'Uint32Array', 'Uint8Array', 'Uint8ClampedArray'].includes(
            expression.right.name,
          )
        ) {
          return `_Runtime.isInstanceOfName(${emitExpression(expression.left)}, ${quote(expression.right.name)})`;
        }
        return `_Runtime.isInstanceOf(${emitExpression(expression.left)}, ${emitExpression(expression.right)})`;
      }
      if (expression.kind === 'binary' && ['==', '===', '!=', '!=='].includes(expression.operator)) {
        const equal = `_Runtime.${expression.operator.length === 3 ? 'strictEquals' : 'looseEquals'}(${emitExpression(expression.left)}, ${emitExpression(expression.right)})`;
        return expression.operator.startsWith('!') ? `!${equal}` : equal;
      }
      if (expression.kind === 'binary' && ['&', '|', '^', '<<', '>>'].includes(expression.operator)) {
        return `(${emitInt32Operand(expression.left)} ${expression.operator} ${emitInt32Operand(expression.right)})`;
      }
      if (expression.kind === 'binary' && expression.operator === '>>>') {
        return `_Runtime.unsignedShiftRight(${emitInt32Operand(expression.left)}, ${emitInt32Operand(expression.right)})`;
      }
      if (expression.kind === 'assignment' && ['&=', '|=', '^=', '<<=', '>>=', '>>>='].includes(expression.operator)) {
        const operator = expression.operator.slice(0, -1);
        const value =
          operator === '>>>'
            ? `_Runtime.unsignedShiftRight(${emitInt32Operand(expression.left)}, ${emitInt32Operand(expression.right)})`
            : `(${emitInt32Operand(expression.left)} ${operator} ${emitInt32Operand(expression.right)})`;
        return `(${emitExpression(expression.left)} = ${value})`;
      }
      if (expression.kind === 'assignment' && ['+=', '-=', '*=', '/=', '%='].includes(expression.operator)) {
        const operator = expression.operator.slice(0, -1);
        const left = emitExpression(expression.left);
        return `(${left} = cast (${emitArithmeticOperation(left, operator, emitExpression(expression.right))} : Dynamic))`;
      }
      const operator = binaryOperatorMap[expression.operator] ?? expression.operator;
      if (expression.kind === 'assignment' && expression.operator === '=') {
        return `(${emitExpression(expression.left)} = cast (${emitExpression(expression.right)} : Dynamic))`;
      }
      return `(${emitExpression(expression.left)} ${operator} ${emitExpression(expression.right)})`;
    }
    case 'call':
      return emitCall(expression);
    case 'cast':
      return `(cast ${emitExpression(expression.expression)} : ${emitType(expression.type)})`;
    case 'conditional':
      if (expression.condition.staticFacts?.boolean) {
        return markStaticLowering(
          'booleanConditionalExpressions',
          `(${emitBooleanExpression(expression.condition)} ? (cast ${emitExpression(expression.whenTrue)} : Dynamic) : (cast ${emitExpression(expression.whenFalse)} : Dynamic))`,
        );
      }
      return `_Runtime.select(${emitExpression(expression.condition)}, function():Dynamic return cast ${emitExpression(expression.whenTrue)}, function():Dynamic return cast ${emitExpression(expression.whenFalse)})`;
    case 'element':
      if (expression.binding === 'WebGl2Backend') {
        if (expression.optional) {
          throw new Error('Optional WebGL2 computed property access has no typed backend endpoint');
        }
        if (!expression.webGlComputedDomain) {
          throw new Error('WebGL2 computed property access is not a recognized closed string-literal constant union');
        }
        return emitWebGl2ComputedConstant(expression.index, expression.webGlComputedDomain);
      }
      return (
        emitStaticIndexedRead(expression) ??
        (expression.staticFacts?.destructuringSource && !expression.optional
          ? emitDestructuringRead(expression, emitExpression(expression.object), emitExpression(expression.index))
          : `_Runtime.${expression.optional ? 'optionalIndex' : 'getIndex'}(${emitExpression(expression.object)}, ${emitExpression(expression.index)})`)
      );
    case 'function': {
      const name = expression.name && !expression.async ? ` ${safeName(expression.name)}` : '';
      const parameters = emitParameters(expression.parameters, true);
      const returns = expression.returns ? `:${emitType(expression.returns)}` : '';
      if (expression.async) {
        const statements: IrStatement[] = expression.expression
          ? [{ expression: expression.expression, kind: 'return' }]
          : expression.body;
        if (canFlatMapStatements(statements)) {
          const body = indent(emitFlatMapFunctionBody(statements, expression.parameters)).join('\n');
          return `function${name}(${parameters})${returns} {\n${body}\n}`;
        }
        if (statementsContainAwait(statements) && canFlowStatements(statements)) {
          const body = indent(emitFlowFunctionBody(statements, expression.parameters)).join('\n');
          return `function${name}(${parameters})${returns} {\n${body}\n}`;
        }
        if (!statementsContainAwait(statements)) {
          const bodyLines = emitFunctionBody(statements, expression.parameters, expression.returns, false);
          if (expression.returns && !isVoidType(expression.returns)) bodyLines.push('return cast null;');
          const body = indent(emitPromiseProtectedBody(bodyLines)).join('\n');
          return `function${name}(${parameters})${returns} {\n${body}\n}`;
        }
        throw new Error('Generator async lowering does not support a nested async function');
      }
      if (expression.expression) {
        const output = `function${name}(${parameters})${returns} return ${emitExpression(expression.expression)}`;
        return output;
      }
      const bodyLines = emitFunctionBody(expression.body, expression.parameters, expression.returns, expression.async);
      const body = indent(bodyLines).join('\n');
      const output = `function${name}(${parameters})${returns} {\n${body}\n}`;
      return output;
    }
    case 'identifier':
      if (expression.domRootBinding) {
        return `flighthq._internal.backend.${expression.domRootBinding}.value()`;
      }
      if (expression.name === 'super' || expression.name === 'this') return expression.name;
      // Barrel values are statics of the module's namespace class; nominal classes in
      // the same module reference them cross-class, so qualify with the class name.
      if (currentModuleValues.has(expression.name) && expression.name.includes('__')) {
        return `${currentModuleName}.${qualifiedName(expression.name)}`;
      }
      return qualifiedName(expression.name);
    case 'literal':
      if (expression.value === null) return 'null';
      if (typeof expression.value === 'string') return quote(expression.value);
      if (typeof expression.value === 'number' && Number.isInteger(expression.value))
        return `${String(expression.value)}.0`;
      return String(expression.value);
    case 'new':
      const typedArray = typedArrayConstructor(expression.callee);
      if (typedArray) {
        return `new ${typedArray}(${expression.arguments.map(emitExpression).join(', ')})`;
      }
      if (
        (expression.callee.kind === 'identifier' && expression.callee.name === 'Promise') ||
        emitExpression(expression.callee) === "_Runtime.globalValue('Promise')"
      ) {
        return `flighthq._internal._Async.create(${expression.arguments.map(emitExpression).join(', ')})`;
      }
      if (emitExpression(expression.callee) === 'TypeError') {
        return `_Runtime.typeError(${expression.arguments.map(emitExpression).join(', ')})`;
      }
      if (emitExpression(expression.callee) === 'Error') {
        return `_Runtime.error(${expression.arguments.map(emitExpression).join(', ')})`;
      }
      if (emitExpression(expression.callee) === 'RangeError') {
        return `_Runtime.rangeError(${expression.arguments.map(emitExpression).join(', ')})`;
      }
      if (emitExpression(expression.callee) === 'Proxy') {
        return `_Runtime.createProxy(${expression.arguments.map(emitExpression).join(', ')})`;
      }
      if (expression.callee.kind === 'identifier' && expression.callee.name === 'Map') {
        return `_Runtime.createMap(${expression.arguments[0] ? emitExpression(expression.arguments[0]) : 'null'})`;
      }
      if (expression.callee.kind === 'identifier' && expression.callee.name === 'WeakMap') {
        return `_Runtime.createWeakMap(${expression.arguments[0] ? emitExpression(expression.arguments[0]) : 'null'})`;
      }
      if (expression.callee.kind === 'identifier' && expression.callee.name === 'Set') {
        return `_Runtime.createSet(${expression.arguments[0] ? emitExpression(expression.arguments[0]) : 'null'})`;
      }
      if (expression.callee.kind === 'identifier' && expression.callee.name === 'WeakSet') {
        return `_Runtime.createWeakSet(${expression.arguments[0] ? emitExpression(expression.arguments[0]) : 'null'})`;
      }
      if (expression.callee.kind === 'identifier' && expression.callee.name === 'Array') {
        return `_Runtime.createArray(${expression.arguments[0] ? emitExpression(expression.arguments[0]) : '0'})`;
      }
      if (
        expression.callee.kind === 'identifier' &&
        ['Float64Array', 'Int32Array', 'Int8Array', 'Uint32Array', 'Uint8Array', 'Uint8ClampedArray'].includes(
          expression.callee.name,
        )
      ) {
        return `_Runtime.typedArray(${quote(expression.callee.name)}, ${expression.arguments[0] ? emitExpression(expression.arguments[0]) : '0'})`;
      }
      if (expression.callee.kind !== 'identifier' || /^[a-z_]/u.test(expression.callee.name)) {
        return `_Runtime.construct(${emitExpression(expression.callee)}, [${expression.arguments.map(emitExpression).join(', ')}])`;
      }
      return `new ${emitExpression(expression.callee)}(${expression.arguments.map(emitExpression).join(', ')})`;
    case 'object':
      if (expression.cppStructInit) {
        const actualFields = expression.properties.map((property) =>
          property.kind === 'property' ? property.name : property.kind,
        );
        if (
          actualFields.length !== expression.cppStructInit.fieldNames.length ||
          actualFields.some((field, index) => field !== expression.cppStructInit!.fieldNames[index])
        ) {
          throw new Error(
            `cpp @:structInit construction order mismatch for ${expression.cppStructInit.schemaId}: expected ${expression.cppStructInit.fieldNames.join(', ')}, received ${actualFields.join(', ')}`,
          );
        }
      }
      if (expression.properties.some((property) => property.kind === 'spread')) {
        return `_Runtime.mergeObjects([${expression.properties
          .map((property) =>
            property.kind === 'spread'
              ? emitExpression(property.expression)
              : property.kind === 'computedProperty'
                ? `_Runtime.objectFromPairs([{ key: ${emitExpression(property.key)}, value: ${emitExpression(property.value)} }])`
                : emitNamedObject(property.name, property.value),
          )
          .join(', ')}])`;
      }
      if (
        expression.properties.some(
          (property) =>
            property.kind === 'computedProperty' ||
            (property.kind === 'property' &&
              (!isHaxeIdentifier(property.name) || safeName(property.name) !== property.name)),
        )
      ) {
        return `_Runtime.objectFromPairs([${expression.properties
          .map((property) =>
            property.kind === 'computedProperty'
              ? `{ key: ${emitExpression(property.key)}, value: ${emitExpression(property.value)} }`
              : property.kind === 'property'
                ? `{ key: ${quote(property.name)}, value: ${emitExpression(property.value)} }`
                : '',
          )
          .filter(Boolean)
          .join(', ')}])`;
      }
      return `{ ${expression.properties
        .map((property) =>
          property.kind === 'property' ? `${safeName(property.name)}: ${emitExpression(property.value)}` : '',
        )
        .filter(Boolean)
        .join(', ')} }`;
    case 'property':
      if (expression.binding === 'DynamicObject') {
        return `flighthq._internal.DynamicObject.field(${quote(expression.name)})`;
      }
      if (expression.binding === 'WebGpuConstantsBackend') {
        return `flighthq._internal.backend.WebGpuConstantsBackend.value(${emitExpression(expression.object)}, ${quote(expression.name)})`;
      }
      if (expression.binding === 'WebGl2Backend') {
        if (expression.optional) {
          throw new Error(`Optional WebGL2 constant access has no typed backend endpoint: ${expression.name}`);
        }
        return `flighthq._internal.backend.WebGl2Backend.${webGl2ConstantEndpoint(expression.name)}`;
      }
      if (expression.binding && expression.binding in collectionBindingTypes) {
        if (expression.name !== 'size') {
          throw new Error(`Typed collection method references are not supported: ${expression.name}`);
        }
        const owner = emitExpression(expression.object);
        const collectionType = collectionBindingTypes[expression.binding as keyof typeof collectionBindingTypes];
        if (!expression.optional) return `(cast ${owner} : ${collectionType}).size`;
        const temporary = `__collection${String(temporaryIndex++)}`;
        return `({ final ${temporary}:Dynamic = ${owner}; ${temporary} == null ? _Runtime.UNDEFINED : (cast ${temporary} : ${collectionType}).size; })`;
      }
      if (
        expression.binding === 'Canvas2dBackend' ||
        expression.binding === 'CanvasElementBackend' ||
        expression.binding === 'DomDocumentBackend' ||
        expression.binding === 'DomNavigatorBackend' ||
        expression.binding === 'DomWindowBackend' ||
        expression.binding === 'WebGpuCanvasContextBackend' ||
        expression.binding === 'WebGpuDeviceBackend' ||
        expression.binding === 'WebGpuLimitsBackend' ||
        expression.binding === 'WebGpuQueueBackend'
      ) {
        requireHostEndpoint(expression.binding as IrHostEndpointBinding, 'read', expression.name);
        return `flighthq._internal.backend.${expression.binding}.field(${emitExpression(expression.object)}, ${quote(expression.name)})`;
      }
      if (expression.typedStructBinding) return emitTypedStructRead(expression);
      if (
        expression.object.kind === 'identifier' &&
        expression.object.name === 'HxMath' &&
        expression.name === 'SQRT1_2'
      ) {
        return 'HxMath.sqrt(0.5)';
      }
      if (expression.object.kind === 'identifier' && expression.object.name === 'Number') {
        if (expression.name === 'EPSILON') return '_Runtime.NUMBER_EPSILON';
        if (expression.name === 'MAX_SAFE_INTEGER') return '_Runtime.MAX_SAFE_INTEGER';
        if (expression.name === 'NEGATIVE_INFINITY') return 'HxMath.NEGATIVE_INFINITY';
        if (expression.name === 'POSITIVE_INFINITY') return 'HxMath.POSITIVE_INFINITY';
      }
      if (expression.object.kind === 'identifier' && /^[A-Z]/u.test(expression.object.name)) {
        return `${emitExpression(expression.object)}.${safeName(expression.name)}`;
      }
      if (expression.optional) {
        return `_Runtime.optionalField(${emitExpression(expression.object)}, '${expression.name}')`;
      }
      return `_Runtime.field(${emitExpression(expression.object)}, ${quote(expression.name)})`;
    case 'regexp':
      return `_Runtime.regexp(${quote(expression.pattern)}, ${quote(expression.flags)})`;
    case 'template':
      return expression.parts
        .map((part) => (typeof part === 'string' ? quote(part) : `Std.string(${emitExpression(part)})`))
        .join(' + ');
    case 'spread':
      return emitExpression(expression.expression);
    case 'unary':
      if (expression.operator === 'delete') {
        if (expression.operand.kind === 'element') {
          if (expression.operand.binding === 'WebGl2Backend') {
            throw new Error('WebGL2 computed property deletion has no typed backend endpoint');
          }
          return `_Runtime.deleteIndex(${emitExpression(expression.operand.object)}, ${emitExpression(expression.operand.index)})`;
        }
        if (expression.operand.kind === 'property' && expression.operand.binding === 'WebGl2Backend') {
          throw new Error(`WebGL2 property deletion has no typed backend endpoint: ${expression.operand.name}`);
        }
        if (
          expression.operand.kind === 'property' &&
          (expression.operand.binding === 'Canvas2dBackend' ||
            expression.operand.binding === 'CanvasElementBackend' ||
            expression.operand.binding === 'WebGpuCanvasContextBackend' ||
            expression.operand.binding === 'WebGpuDeviceBackend' ||
            expression.operand.binding === 'WebGpuQueueBackend')
        ) {
          if (expression.operand.binding === 'Canvas2dBackend') {
            throw new Error(`Canvas2D property deletion has no typed backend endpoint: ${expression.operand.name}`);
          }
          return `flighthq._internal.backend.${expression.operand.binding}.deleteField(${emitExpression(expression.operand.object)}, ${quote(expression.operand.name)})`;
        }
        if (expression.operand.kind === 'property')
          return `_Runtime.deleteField(${emitExpression(expression.operand.object)}, ${quote(expression.operand.name)})`;
        return `_Runtime.deleteValue(${emitExpression(expression.operand)})`;
      }
      if (expression.operator === 'typeof') {
        return `_Runtime.typeofValue(${emitExpression(expression.operand)})`;
      }
      if (expression.operator === 'void') return `_Runtime.voidValue(${emitExpression(expression.operand)})`;
      if (expression.operator === '!') return `!${emitTruthiness(expression.operand)}`;
      if (expression.operator === '~') return `~${emitInt32Operand(expression.operand)}`;
      if (expression.operand.kind === 'element' && (expression.operator === '++' || expression.operator === '--')) {
        if (expression.operand.binding === 'WebGl2Backend') {
          throw new Error('WebGL2 computed property mutation has no typed backend endpoint');
        }
        return `_Runtime.incrementIndex(${emitExpression(expression.operand.object)}, ${emitExpression(expression.operand.index)}, ${expression.operator === '++' ? '1' : '-1'}, ${expression.postfix ? 'true' : 'false'})`;
      }
      if (expression.operand.kind === 'property' && (expression.operator === '++' || expression.operator === '--')) {
        if (expression.operand.binding === 'WebGl2Backend') {
          throw new Error(`WebGL2 property mutation has no typed backend endpoint: ${expression.operand.name}`);
        }
        if (expression.operand.typedStructBinding) {
          if (expression.operand.optional) {
            throw new Error(`Optional typed-struct mutation is not supported: ${expression.operand.name}`);
          }
          const field = directTypedStructField(expression.operand);
          return expression.postfix ? `${field}${expression.operator}` : `${expression.operator}${field}`;
        }
        return `_Runtime.incrementField(${emitExpression(expression.operand.object)}, ${quote(expression.operand.name)}, ${expression.operator === '++' ? '1' : '-1'}, ${expression.postfix ? 'true' : 'false'})`;
      }
      return expression.postfix
        ? `${emitExpression(expression.operand)}${expression.operator}`
        : `${expression.operator}${emitExpression(expression.operand)}`;
  }
}

function emitNamedObject(name: string, value: IrExpression): string {
  return isHaxeIdentifier(name) && safeName(name) === name
    ? `{ ${safeName(name)}: ${emitExpression(value)} }`
    : `_Runtime.objectFromPairs([{ key: ${quote(name)}, value: ${emitExpression(value)} }])`;
}

function isHaxeIdentifier(name: string): boolean {
  return /^[A-Za-z_][A-Za-z0-9_]*$/u.test(name);
}

function emitTryStatement(statement: Extract<IrStatement, { kind: 'try' }>): string[] {
  if (statement.finallyBody) {
    const outerFinalizers = currentFinallyStack;
    currentFinallyStack = [statement.finallyBody, ...outerFinalizers];
    let protectedLines: string[];
    try {
      protectedLines = emitTryWithoutFinally(statement);
    } finally {
      currentFinallyStack = outerFinalizers;
    }
    const error = `__finallyError${String(temporaryIndex++)}`;
    const exceptionalCleanup = emitStatement(statement.finallyBody);
    const normalCleanup = emitStatement(statement.finallyBody);
    return [
      'try {',
      ...indent(protectedLines),
      `} catch (${error}:Dynamic) {`,
      ...indent(exceptionalCleanup),
      `  throw ${error};`,
      '}',
      ...normalCleanup,
    ];
  }
  return emitTryWithoutFinally(statement);
}

function emitTryWithoutFinally(statement: Extract<IrStatement, { kind: 'try' }>): string[] {
  const lines = [`try ${emitEmbedded(statement.tryBody)}`];
  if (statement.catchBody) {
    lines[0] += ` catch (${safeName(statement.catchName ?? '__error')}:Dynamic) ${emitEmbedded(statement.catchBody)}`;
  } else {
    lines[0] += ' catch (__error:Dynamic) { throw __error; }';
  }
  return lines;
}

function emitPendingFinalizers(): string[] {
  const pending = currentFinallyStack;
  const lines: string[] = [];
  try {
    for (let index = 0; index < pending.length; index += 1) {
      currentFinallyStack = pending.slice(index + 1);
      lines.push(...emitStatement(pending[index]!));
    }
  } finally {
    currentFinallyStack = pending;
  }
  return lines;
}

function directTypedStructField(
  expression: Extract<IrExpression, { kind: 'property' }>,
  owner = emitExpression(expression.object),
): string {
  const binding = expression.typedStructBinding;
  if (!binding || binding.field.name !== expression.name) {
    throw new Error(`Invalid typed-struct field binding: ${currentSourceIdentity}:${expression.name}`);
  }
  const typedOwner = binding.receiverCast ? `(cast ${owner} : ${binding.receiverCast})` : owner;
  return `${typedOwner}.${safeName(binding.field.name)}`;
}

function emitTypedStructRead(expression: Extract<IrExpression, { kind: 'property' }>): string {
  const owner = emitExpression(expression.object);
  if (!expression.optional) return directTypedStructField(expression, owner);
  const temporary = `__typedStruct${String(temporaryIndex++)}`;
  return `({ final ${temporary} = ${owner}; ${temporary} == null ? _Runtime.UNDEFINED : ${directTypedStructField(expression, temporary)}; })`;
}

function emitCall(expression: Extract<IrExpression, { kind: 'call' }>): string {
  if (expression.callee.kind === 'identifier' && currentDirectFunctions.has(expression.callee.name)) {
    return `${currentModuleName}.${safeName(expression.callee.name)}(cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
  }
  if (expression.direct) {
    if (
      expression.callee.kind !== 'identifier' ||
      expression.optional ||
      expression.haxeRestIndex !== undefined ||
      expression.packedVariadicRestIndex !== undefined ||
      expression.arguments.some((argument) => argument.kind === 'spread')
    ) {
      throw new Error(`Invalid direct call: ${currentSourceIdentity}`);
    }
    return `${emitExpression(expression.callee)}(${expression.arguments.map(emitExpression).join(', ')})`;
  }
  if (expression.callee.kind === 'element' && expression.callee.binding === 'WebGl2Backend') {
    throw new Error('WebGL2 computed method calls have no typed backend endpoint');
  }
  if (
    expression.callee.kind === 'element' &&
    expression.callee.object.kind === 'identifier' &&
    expression.callee.object.name === 'console'
  ) {
    return `_Runtime.console(Std.string(${emitExpression(expression.callee.index)}), [${expression.arguments.map(emitExpression).join(', ')}])`;
  }
  if (expression.callee.kind === 'identifier') {
    if (expression.callee.name === 'Symbol') {
      return `_Runtime.symbol(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.name === 'clearTimeout') {
      return `_Runtime.clearTimeout(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.name === 'clearInterval') {
      return `_Runtime.clearInterval(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.name === 'isFinite') {
      return `_Runtime.isFinite(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.name === 'setInterval') {
      return `_Runtime.setInterval(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.name === 'setTimeout') {
      return `_Runtime.setTimeout(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.name === 'String') {
      return `Std.string(${expression.arguments.map(emitExpression).join(', ')})`;
    }
  }
  if (
    expression.callee.kind === 'property' &&
    emitExpression(expression.callee.object) === "_Runtime.globalValue('Promise')" &&
    ['all', 'allSettled', 'race', 'reject', 'resolve'].includes(expression.callee.name)
  ) {
    return `flighthq._internal._Async.${expression.callee.name}(${expression.arguments.map(emitExpression).join(', ')})`;
  }
  if (expression.haxeRestIndex !== undefined) {
    if (expression.callee.kind === 'property') {
      throw new Error('Dynamic Haxe Rest method calls have no packed receiver-preserving endpoint');
    }
    const chunks = expression.arguments.map((argument) =>
      argument.kind === 'spread'
        ? `_Runtime.toArray(${emitExpression(argument.expression)})`
        : `[${emitExpression(argument)}]`,
    );
    return `_Runtime.callHaxeRestValue(${emitExpression(expression.callee)}, _Runtime.concatArrays([${chunks.join(', ')}]), ${expression.haxeRestIndex})`;
  }
  if (expression.packedVariadicRestIndex !== undefined) {
    const index = expression.packedVariadicRestIndex;
    const fixed = expression.arguments.slice(0, index);
    const rest = expression.arguments.slice(index);
    let arguments_: string;
    if (fixed.every((argument) => argument.kind !== 'spread')) {
      const restChunks = rest.map((argument) =>
        argument.kind === 'spread'
          ? `_Runtime.toArray(${emitExpression(argument.expression)})`
          : `[${emitExpression(argument)}]`,
      );
      const restArray =
        rest.length === 1 && rest[0]?.kind === 'spread'
          ? restChunks[0]!
          : rest.every((argument) => argument.kind !== 'spread')
            ? `cast ([${rest.map(emitExpression).join(', ')}] : Array<Dynamic>)`
            : `_Runtime.concatArrays([${restChunks.join(', ')}])`;
      arguments_ = `cast ([${[...fixed.map(emitExpression), restArray].join(', ')}] : Array<Dynamic>)`;
    } else {
      const chunks = expression.arguments.map((argument) =>
        argument.kind === 'spread'
          ? `_Runtime.toArray(${emitExpression(argument.expression)})`
          : `[${emitExpression(argument)}]`,
      );
      const temporary = `__variadic${String(temporaryIndex++)}`;
      arguments_ = `({ final ${temporary}:Array<Dynamic> = _Runtime.concatArrays([${chunks.join(', ')}]); _Runtime.concatArrays([${temporary}.slice(0, ${index}), [${temporary}.slice(${index})]]); })`;
    }
    if (expression.callee.kind === 'property') {
      if (expression.callee.typedStructBinding) {
        const method = expression.optional || expression.callee.optional ? 'callOptionalValue' : 'callValue';
        return `_Runtime.${method}(${emitTypedStructRead(expression.callee)}, ${arguments_})`;
      }
      const method = expression.optional || expression.callee.optional ? 'callOptionalProperty' : 'callProperty';
      return `_Runtime.${method}(${emitExpression(expression.callee.object)}, ${quote(expression.callee.name)}, ${arguments_})`;
    }
    const method = expression.optional ? 'callOptionalValue' : 'callValue';
    return `_Runtime.${method}(${emitExpression(expression.callee)}, ${arguments_})`;
  }
  if (expression.arguments.some((argument) => argument.kind === 'spread')) {
    const chunks = expression.arguments.map((argument) =>
      argument.kind === 'spread'
        ? `_Runtime.toArray(${emitExpression(argument.expression)})`
        : `[${emitExpression(argument)}]`,
    );
    if (expression.callee.kind === 'property') {
      if (expression.callee.binding === 'WebGl2Backend') {
        throw new Error(`WebGL2 spread call has no typed backend endpoint: ${expression.callee.name}`);
      }
      if (expression.callee.binding && expression.callee.binding in collectionBindingTypes) {
        throw new Error(`Typed collection spread call has no direct endpoint: ${expression.callee.name}`);
      }
      if (
        expression.callee.binding === 'Canvas2dBackend' ||
        expression.callee.binding === 'CanvasElementBackend' ||
        expression.callee.binding === 'DomDocumentBackend' ||
        expression.callee.binding === 'DomNavigatorBackend' ||
        expression.callee.binding === 'DomWindowBackend' ||
        expression.callee.binding === 'WebGpuCanvasContextBackend' ||
        expression.callee.binding === 'WebGpuDeviceBackend' ||
        expression.callee.binding === 'WebGpuQueueBackend'
      ) {
        requireHostEndpoint(expression.callee.binding as IrHostEndpointBinding, 'call', expression.callee.name);
        return `flighthq._internal.backend.${expression.callee.binding}.call(${emitExpression(expression.callee.object)}, ${quote(expression.callee.name)}, _Runtime.concatArrays([${chunks.join(', ')}]))`;
      }
      if (expression.callee.typedStructBinding) {
        const method = expression.optional || expression.callee.optional ? 'callOptionalValue' : 'apply';
        return `_Runtime.${method}(${emitTypedStructRead(expression.callee)}, _Runtime.concatArrays([${chunks.join(', ')}]))`;
      }
      const method = expression.optional || expression.callee.optional ? 'callOptionalProperty' : 'callProperty';
      return `_Runtime.${method}(${emitExpression(expression.callee.object)}, ${quote(expression.callee.name)}, _Runtime.concatArrays([${chunks.join(', ')}]))`;
    }
    const method = expression.optional ? 'callOptionalValue' : 'apply';
    return `_Runtime.${method}(${emitExpression(expression.callee)}, _Runtime.concatArrays([${chunks.join(', ')}]))`;
  }
  if (expression.callee.kind === 'property') {
    const owner = emitExpression(expression.callee.object);
    const name = expression.callee.name;
    if (expression.callee.binding === 'DynamicObject') {
      return `flighthq._internal.DynamicObject.${safeName(name)}(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.binding === 'WebGl2Backend') {
      if (expression.optional || expression.callee.optional) {
        throw new Error(`Optional WebGL2 call has no typed backend endpoint: ${name}`);
      }
      const endpoint = webGl2MethodEndpoint(name, expression.arguments.length);
      const arguments_ = [owner, ...expression.arguments.map(emitExpression)].join(', ');
      return `flighthq._internal.backend.WebGl2Backend.${endpoint}(${arguments_})`;
    }
    if (expression.callee.binding && expression.callee.binding in collectionBindingTypes) {
      const collectionType = collectionBindingTypes[expression.callee.binding as keyof typeof collectionBindingTypes];
      const method = expression.callee.name === 'delete' ? 'delete_' : safeName(expression.callee.name);
      const call = (target: string) =>
        `((cast ${target} : ${collectionType}).${method}(${expression.arguments.map(emitExpression).join(', ')}))`;
      if (!(expression.optional || expression.callee.optional)) return call(owner);
      const temporary = `__collection${String(temporaryIndex++)}`;
      return `({ final ${temporary}:Dynamic = ${owner}; ${temporary} == null ? _Runtime.UNDEFINED : ${call(temporary)}; })`;
    }
    if (
      expression.callee.binding === 'Canvas2dBackend' ||
      expression.callee.binding === 'CanvasElementBackend' ||
      expression.callee.binding === 'DomDocumentBackend' ||
      expression.callee.binding === 'DomNavigatorBackend' ||
      expression.callee.binding === 'DomWindowBackend' ||
      expression.callee.binding === 'WebGpuCanvasContextBackend' ||
      expression.callee.binding === 'WebGpuDeviceBackend' ||
      expression.callee.binding === 'WebGpuQueueBackend'
    ) {
      requireHostEndpoint(expression.callee.binding as IrHostEndpointBinding, 'call', name);
      const method = expression.optional || expression.callee.optional ? 'callOptional' : 'call';
      return `flighthq._internal.backend.${expression.callee.binding}.${method}(${owner}, ${quote(name)}, cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
    }
    if (expression.callee.typedStructBinding) {
      const method = expression.optional || expression.callee.optional ? 'callOptionalValue' : 'callValue';
      return `_Runtime.${method}(${emitTypedStructRead(expression.callee)}, cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
    }
    if (expression.callee.generatedClass) {
      const generatedClass = expression.callee.generatedClass;
      const call = (target: string) =>
        `(cast ${target} : ${safeName(generatedClass)}).${safeName(name)}(${expression.arguments.map(emitExpression).join(', ')})`;
      if (!(expression.optional || expression.callee.optional)) return call(owner);
      const temporary = `__generatedClass${String(temporaryIndex++)}`;
      return `({ final ${temporary}:Dynamic = ${owner}; ${temporary} == null ? _Runtime.UNDEFINED : ${call(temporary)}; })`;
    }
    if (expression.callee.optional) {
      return `_Runtime.callOptionalProperty(${owner}, ${quote(name)}, cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
    }
    if (owner === '_Runtime' && name === 'thisValue') return '_Runtime.thisValue()';
    if (owner === '_Runtime') {
      return `_Runtime.${safeName(name)}(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Symbol' && name === 'for') {
      return `_Runtime.symbolFor(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Array' && name === 'isArray') {
      return `_Runtime.isArray(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Array' && name === 'from') {
      return `_Runtime.toArray(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'String' && name === 'fromCodePoint') {
      return `_Runtime.fromCodePoint(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'JSON' && name === 'parse') {
      return `_Runtime.jsonParse(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'JSON' && name === 'stringify') {
      return `_Runtime.jsonStringify(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Object' && name === 'assign') {
      return `_Runtime.assignObject(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Object' && name === 'entries') {
      return `_Runtime.objectEntries(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Object' && name === 'keys') {
      return `Reflect.fields(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'performance' && name === 'now') return '_Runtime.nowMilliseconds()';
    if (owner === 'console') {
      return `_Runtime.console(${quote(name)}, [${expression.arguments.map(emitExpression).join(', ')}])`;
    }
    if (owner === 'console' && name === 'warn') {
      return `_Runtime.warn([${expression.arguments.map(emitExpression).join(', ')}])`;
    }
    if (owner === 'Date' && name === 'now') return '_Runtime.nowMilliseconds()';
    if (owner === 'HxMath' && name === 'imul') {
      return `_Runtime.imul(${expression.arguments.map((argument) => emitInt32Operand(argument)).join(', ')})`;
    }
    if (owner === 'HxMath' && (name === 'max' || name === 'min') && expression.arguments.length > 2) {
      return expression.arguments
        .slice(1)
        .reduce(
          (result, argument) => `${owner}.${name}(${result}, ${emitExpression(argument)})`,
          emitExpression(expression.arguments[0]!),
        );
    }
    if (owner === 'HxMath' && ['hypot', 'sign', 'trunc'].includes(name)) {
      return `_Runtime.${name}(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'HxMath' && name === 'log2') {
      return `_Runtime.log2(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'HxMath' && name === 'cbrt') {
      return `_Runtime.cbrt(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'HxMath') {
      return `HxMath.${safeName(name)}(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (owner === 'Number' && ['isFinite', 'isInteger'].includes(name)) {
      return `_Runtime.${name}(${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (expression.callee.binding && expression.callee.binding in typedArrayBindingTypes) {
      const typedArrayType = typedArrayBindingTypes[expression.callee.binding as keyof typeof typedArrayBindingTypes];
      return `(cast ${owner} : ${typedArrayType}).${safeName(name)}(${expression.arguments.map((argument) => `Std.int(${emitExpression(argument)})`).join(', ')})`;
    }
    if (name === 'slice') {
      const start = expression.arguments[0] ? emitExpression(expression.arguments[0]) : '0';
      const end = expression.arguments[1] ? emitExpression(expression.arguments[1]) : 'null';
      return `_Runtime.slice(${owner}, ${start}, ${end})`;
    }
    if (name === 'catch' && expression.arguments.length === 1) {
      return `flighthq._internal._Async.recover(${owner}, ${emitExpression(expression.arguments[0]!)})`;
    }
    if (name === 'codePointAt') {
      return `_Runtime.codePointAt(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'charAt') {
      return `_Runtime.charAt(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'charCodeAt') {
      return `_Runtime.charCodeAt(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'substring' || name === 'substr') {
      const start = expression.arguments[0] ? emitExpression(expression.arguments[0]) : '0';
      const end = expression.arguments[1] ? emitExpression(expression.arguments[1]) : 'null';
      return `_Runtime.${name}(${owner}, ${start}, ${end})`;
    }
    if (name === 'replace' || name === 'replaceAll') {
      return `_Runtime.replace(${owner}, ${expression.arguments.map(emitExpression).join(', ')}, ${name === 'replaceAll' ? 'true' : 'false'})`;
    }
    if (name === 'match') {
      return `_Runtime.match(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'trim') return `StringTools.trim(Std.string(${owner}))`;
    if (name === 'endsWith') {
      return `StringTools.endsWith(Std.string(${owner}), ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'join') {
      return `_Runtime.join(${owner}, ${expression.arguments[0] ? emitExpression(expression.arguments[0]) : "','"})`;
    }
    if (name === 'includes') {
      return `_Runtime.includes(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'find' && expression.arguments.length === 1) {
      return `_Runtime.find(${owner}, ${emitExpression(expression.arguments[0]!)})`;
    }
    if (name === 'padStart') {
      return `_Runtime.padStart(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'padEnd') {
      return `_Runtime.padEnd(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'repeat') {
      return `_Runtime.repeat(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'startsWith') {
      return `StringTools.startsWith(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'toFixed') {
      return `_Runtime.toFixed(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'toString' && expression.arguments.length === 1) {
      return `_Runtime.numberToString(${owner}, ${emitExpression(expression.arguments[0]!)})`;
    }
    if (name === 'subarray') {
      return `${owner}.subarray(${expression.arguments.map((argument) => `Std.int(${emitExpression(argument)})`).join(', ')})`;
    }
    if (name === 'splice' && expression.arguments.length >= 2) {
      return `_Runtime.splice(${owner}, Std.int(${emitExpression(expression.arguments[0]!)}), Std.int(${emitExpression(expression.arguments[1]!)}), [${expression.arguments
        .slice(2)
        .map(emitExpression)
        .join(', ')}])`;
    }
    if (name === 'splice' && expression.arguments.length === 1) {
      return `_Runtime.splice(${owner}, Std.int(${emitExpression(expression.arguments[0]!)}), Std.int(${owner}.length - Std.int(${emitExpression(expression.arguments[0]!)})), [])`;
    }
    if (name === 'push' && expression.arguments.length > 1) {
      return `_Runtime.pushMany(${owner}, cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
    }
    if (name === 'fill') {
      return `_Runtime.fill(${owner}, ${expression.arguments[0] ? emitExpression(expression.arguments[0]) : 'null'}, ${expression.arguments[1] ? emitExpression(expression.arguments[1]) : '0'}, ${expression.arguments[2] ? emitExpression(expression.arguments[2]) : 'null'}, ${expression.arguments.length})`;
    }
    if (name === 'copyWithin') {
      return `_Runtime.copyWithin(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'reduce') {
      return `_Runtime.reduce(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'findIndex') {
      return `_Runtime.findIndex(${owner}, ${expression.arguments.map(emitExpression).join(', ')})`;
    }
    if (name === 'sort' && expression.arguments.length === 1 && expression.arguments[0]?.kind === 'function') {
      const comparator = expression.arguments[0];
      const parameters = comparator.parameters
        .map((parameter) => `${safeName(parameter.name)}:${emitType(parameter.type)}`)
        .join(', ');
      if (comparator.expression) {
        return `_Runtime.sortAndReturn(${owner}, function(${parameters}) return ${emitExpression(comparator.expression)})`;
      }
    }
  }
  if (expression.callee.kind === 'identifier' && expression.callee.name === 'super') {
    return `super(${expression.arguments.map(emitExpression).join(', ')})`;
  }
  if (expression.callee.kind === 'property') {
    const method = expression.optional || expression.callee.optional ? 'callOptionalProperty' : 'callProperty';
    return `_Runtime.${method}(${emitExpression(expression.callee.object)}, ${quote(expression.callee.name)}, cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
  }
  const method = expression.optional ? 'callOptionalValue' : 'callValue';
  return `_Runtime.${method}(${emitExpression(expression.callee)}, cast ([${expression.arguments.map(emitExpression).join(', ')}] : Array<Dynamic>))`;
}

function stripTrailingSwitchBreak(statements: IrStatement[]): IrStatement[] {
  if (statements.at(-1)?.kind === 'break') return statements.slice(0, -1);
  const last = statements.at(-1);
  if (last?.kind !== 'block') return statements;
  return [...statements.slice(0, -1), { ...last, statements: stripTrailingSwitchBreak(last.statements) }];
}

function typedArrayConstructor(expression: IrExpression): string | undefined {
  const name =
    expression.kind === 'identifier'
      ? expression.name
      : expression.kind === 'call' &&
          expression.callee.kind === 'property' &&
          expression.callee.object.kind === 'identifier' &&
          expression.callee.object.name === '_Runtime' &&
          expression.callee.name === 'globalValue' &&
          expression.arguments[0]?.kind === 'literal' &&
          typeof expression.arguments[0].value === 'string'
        ? expression.arguments[0].value
        : undefined;
  if (!name) return undefined;
  return {
    Float32Array: 'flighthq._internal._Float32Array',
    Float64Array: 'flighthq._internal._Float64Array',
    Int16Array: 'flighthq._internal._Int16Array',
    Int32Array: 'flighthq._internal._Int32Array',
    Int8Array: 'flighthq._internal._Int8Array',
    Uint16Array: 'flighthq._internal._UInt16Array',
    Uint32Array: 'flighthq._internal._UInt32Array',
    Uint8Array: 'flighthq._internal._UInt8Array',
    Uint8ClampedArray: 'flighthq._internal._UInt8ClampedArray',
  }[name];
}

export function emitType(type: IrType): string {
  switch (type.kind) {
    case 'anonymous': {
      if (type.extends.length > 0) return 'Dynamic';
      const members = [
        ...type.extends.filter((parent) => parent.kind !== 'dynamic').map((parent) => `>${emitType(parent)},`),
        ...type.fields.map(
          (field) => `${field.optional ? '@:optional ' : ''}var ${safeName(field.name)}:${emitType(field.type)};`,
        ),
      ];
      return `{ ${members.join(' ')} }`;
    }
    case 'array':
      return `Array<${emitType(type.element)}>`;
    case 'dynamic':
      return 'Dynamic';
    case 'function':
      return `${type.parameters.length === 0 ? 'Void' : type.parameters.map(emitType).join('->')}->${emitType(type.returns)}`;
    case 'named': {
      const arguments_ = type.arguments.length > 0 ? `<${type.arguments.map(emitType).join(', ')}>` : '';
      if (!type.name.includes('.') && shadowedTypeNames.has(type.name)) return 'Dynamic';
      if (!type.name.includes('.') && type.name === currentModuleName && selfShadowTypeModules.has(type.name)) {
        return `${selfShadowTypeModules.get(type.name)}${arguments_}`;
      }
      return `${qualifiedName(type.name)}${arguments_}`;
    }
    case 'nullable':
      return `Null<${emitType(type.inner)}>`;
    case 'primitive':
      return type.name;
  }
}

function quote(value: string): string {
  return `'${value.replaceAll('\\', '\\\\').replaceAll("'", "\\'").replaceAll('$', '$$$$').replaceAll('\n', '\\n').replaceAll('\r', '\\r')}'`;
}

function webGl2MethodEndpoint(name: string, argumentCount: number): string {
  let endpoint = name;
  if (name === 'texImage2D') {
    if (argumentCount === 6) endpoint = 'texImage2DSource';
    else if (argumentCount !== 9) {
      throw new Error(`WebGL2 method texImage2D has no typed backend endpoint for ${String(argumentCount)} arguments`);
    }
  } else if (name === 'texImage2DSource') {
    throw new Error('WebGL2 source method is not in the host endpoint contract: texImage2DSource');
  }
  return requireHostEndpoint('WebGl2Backend', 'call', endpoint);
}

function webGl2ConstantEndpoint(name: string): string {
  return requireHostEndpoint('WebGl2Backend', 'read', name);
}

function emitWebGl2ComputedConstant(index: IrExpression, domain: IrWebGlComputedConstantDomain): string {
  const cases = domain.values
    .map((name) => `case ${quote(name)}: flighthq._internal.backend.WebGl2Backend.${webGl2ConstantEndpoint(name)};`)
    .join(' ');
  return `(switch (${emitExpression(index)}) { ${cases} default: throw ${quote(`WebGL2 computed constant is outside the closed ${domain.name} domain: ${currentSourceIdentity}`)}; })`;
}

function indent(lines: string[]): string[] {
  return lines.flatMap((line) => splitLines(line).map((physicalLine) => `  ${physicalLine}`));
}

function splitLines(value: string): string[] {
  return value.split(/\r\n?|\n/gu);
}

function safeName(name: string): string {
  let normalized = '';
  for (const character of name) {
    normalized += /[A-Za-z0-9_]/u.test(character)
      ? character
      : `_u${character.codePointAt(0)!.toString(16).toUpperCase()}_`;
  }
  if (/^[0-9]/u.test(normalized)) normalized = `_${normalized}`;
  return haxeKeywords.has(normalized) ? `${normalized}_` : normalized;
}

// Secondary types made package-private because their name collides with a same-package module.
// Such a type is not importable across modules and its name is ambiguous with the module, so
// type-position references to it are emitted as `Dynamic` — every value of these types already
// flows through `Dynamic` (`_Runtime.field`/`cast`) in generated code.
let shadowedTypeNames = new Set<string>();

export function setShadowedTypeNames(names: Set<string>): void {
  shadowedTypeNames = names;
}

// Type name -> fully-qualified path of its canonical data type, for names that also name a
// `create<Type>` namespace module. Inside that namespace module a bare type reference resolves
// to the (function-only) class and shadows the real type; emitting the fully-qualified path
// resolves to the actual type without degrading to `Dynamic`.
let selfShadowTypeModules = new Map<string, string>();

export function setSelfShadowTypeModules(paths: Map<string, string>): void {
  selfShadowTypeModules = paths;
}

function qualifiedName(name: string): string {
  return name.split('.').map(safeName).join('.');
}

const haxeKeywords = new Set([
  'abstract',
  'break',
  'case',
  'cast',
  'catch',
  'class',
  'continue',
  'default',
  'do',
  'dynamic',
  'else',
  'enum',
  'extends',
  'extern',
  'false',
  'final',
  'for',
  'function',
  'if',
  'implements',
  'import',
  'in',
  'inline',
  'interface',
  'macro',
  'new',
  'null',
  'operator',
  'overload',
  'override',
  'package',
  'private',
  'public',
  'return',
  'static',
  'switch',
  'this',
  'throw',
  'true',
  'try',
  'typedef',
  'untyped',
  'using',
  'var',
  'while',
]);
