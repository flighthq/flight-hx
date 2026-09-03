export interface SourceOrigin {
  column: number;
  fingerprint: string;
  line: number;
  packageName: string;
  source: string;
}

export type IrType =
  | { kind: 'anonymous'; fields: IrTypeField[]; extends: IrType[] }
  | { kind: 'array'; element: IrType }
  | { detail?: string | undefined; kind: 'dynamic'; reason?: IrDynamicReason | undefined }
  | { kind: 'function'; parameters: IrType[]; returns: IrType }
  | { kind: 'named'; arguments: IrType[]; name: string }
  | { kind: 'nullable'; inner: IrType }
  | { kind: 'primitive'; name: 'Bool' | 'Float' | 'Int' | 'String' | 'Void' }
  | { kind: 'union'; alternatives: IrType[] };

export type IrDynamicReason =
  | 'checker-known-unrepresentable'
  | 'external-toolkit-boundary'
  | 'source-any'
  | 'source-never'
  | 'source-null'
  | 'source-object'
  | 'source-symbol'
  | 'source-undefined'
  | 'source-unknown'
  | 'standard-toolkit-boundary';

export interface IrTypeField {
  contextualParameters?: IrParameter[] | undefined;
  name: string;
  optional: boolean;
  type: IrType;
}

export interface IrParameter {
  initializer?: IrExpression | undefined;
  name: string;
  optional: boolean;
  rest: boolean;
  type: IrType;
}

export interface IrTypedStructBinding {
  field: {
    name: string;
    optional: boolean;
    readonly: boolean;
    requiredUndefined: boolean;
    type?: IrType | undefined;
  };
  receiverCast?: IrType | string | undefined;
  schemaId: string;
  schemaName: string;
}

export interface IrHostTypeBinding {
  haxeType: string;
  name: string;
  receiverCast?: boolean | undefined;
}

export interface IrCppStructInitConstruction {
  fieldNames: string[];
  missingFieldNames?: string[] | undefined;
  nativeOnly?: true | undefined;
  schemaHaxeType: string;
  schemaId: string;
  schemaName: string;
}

export type IrIndexedReceiver =
  | 'Array'
  | 'ArrayOrFloat32Array'
  | 'Float32Array'
  | 'Float64Array'
  | 'Int16Array'
  | 'Int32Array'
  | 'Int8Array'
  | 'Uint16Array'
  | 'Uint16ArrayOrUint32Array'
  | 'Uint32Array'
  | 'Uint8Array'
  | 'Uint8ClampedArray';

export type IrTypedArraySetReceiver = Exclude<IrIndexedReceiver, 'Array' | 'ArrayOrFloat32Array'>;

export type IrDestructuringReadSource = 'assignment' | 'declaration' | 'parameter';
export type IrDestructuringReadEscape = 'regexp-result-array' | 'unproven-receiver';

export type IrDomRootBinding = 'DomDocumentBackend' | 'DomNavigatorBackend' | 'DomWindowBackend';

export type IrHostEndpointBinding =
  | 'Canvas2dBackend'
  | 'CanvasElementBackend'
  | IrDomRootBinding
  | 'WebGl2Backend'
  | 'WebGpuCanvasContextBackend'
  | 'WebGpuDeviceBackend'
  | 'WebGpuLimitsBackend'
  | 'WebGpuQueueBackend';

export interface IrWebGlComputedConstantDomain {
  name: string;
  values: string[];
}

export interface IrExpressionStaticFacts {
  boolean?: true | undefined;
  booleanLogical?: true | undefined;
  destructuringSource?:
    | {
        escape?: IrDestructuringReadEscape | undefined;
        receiver?: IrIndexedReceiver | undefined;
        source: IrDestructuringReadSource;
      }
    | undefined;
  indexedAccess?:
    | {
        reads: 0 | 1;
        receiver: IrIndexedReceiver;
        writes: 0 | 1;
      }
    | undefined;
  indexedAccessEscape?: 'width-sensitive-mixed-write' | undefined;
  numericOperands?: true | undefined;
  narrowedNumericOperands?: true | undefined;
  numericRelation?: true | undefined;
  typedArraySet?:
    | {
        receiver: IrTypedArraySetReceiver;
      }
    | undefined;
  truthinessUse?: 'conditional' | 'explicit' | 'logical' | undefined;
}

type IrExpressionNode =
  | { kind: 'array'; elements: IrExpression[] }
  | { kind: 'await'; expression: IrExpression }
  | { kind: 'assignment'; left: IrExpression; operator: string; right: IrExpression }
  | {
      domRootBinding?: IrDomRootBinding | undefined;
      kind: 'binary';
      left: IrExpression;
      operator: string;
      right: IrExpression;
    }
  | {
      kind: 'call';
      arguments: IrExpression[];
      callee: IrExpression;
      directArgumentTypes?: Array<IrType | undefined>;
      inferenceCastArguments?: boolean[];
      omittedArguments?: boolean[];
      undefinedArguments?: boolean[];
      direct?: boolean;
      directCalleeType?: IrType;
      haxeRestIndex?: number;
      optional?: boolean;
      typeArguments: IrType[];
    }
  | { kind: 'cast'; expression: IrExpression; type: IrType }
  | { kind: 'conditional'; condition: IrExpression; whenFalse: IrExpression; whenTrue: IrExpression }
  | {
      binding?: 'WebGl2Backend' | undefined;
      kind: 'element';
      object: IrExpression;
      index: IrExpression;
      optional?: boolean | undefined;
      syntheticArrayRead?: 'iterationBinding' | undefined;
      webGlComputedDomain?: IrWebGlComputedConstantDomain | undefined;
    }
  | {
      async?: boolean | undefined;
      kind: 'function';
      name?: string | undefined;
      parameters: IrParameter[];
      body: IrStatement[];
      expression?: IrExpression | undefined;
      returns?: IrType | undefined;
      thisCapture?: string | undefined;
    }
  | { domRootBinding?: IrDomRootBinding | undefined; kind: 'identifier'; name: string }
  | { kind: 'literal'; value: boolean | null | number | string }
  | { kind: 'new'; arguments: IrExpression[]; callee: IrExpression; runtime?: boolean | undefined }
  | {
      cppStructInit?: IrCppStructInitConstruction | undefined;
      kind: 'object';
      properties: IrObjectMember[];
      thisCapture?: string | undefined;
    }
  | {
      binding?:
        | 'ArrayCollection'
        | IrHostEndpointBinding
        | 'Float32Array'
        | 'Float64Array'
        | 'Int16Array'
        | 'Int32Array'
        | 'Int8Array'
        | 'MapCollection'
        | 'DynamicObject'
        | 'SetCollection'
        | 'String'
        | 'Uint16Array'
        | 'Uint32Array'
        | 'Uint8Array'
        | 'Uint8ClampedArray'
        | 'WeakMapCollection'
        | 'WeakSetCollection'
        | 'WebGpuConstantsBackend'
        | undefined;
      kind: 'property';
      name: string;
      object: IrExpression;
      optional?: boolean | undefined;
      generatedClass?: string | undefined;
      hostTypeBinding?: IrHostTypeBinding | undefined;
      structuralReceiverType?: IrType | undefined;
      typedStructBinding?: IrTypedStructBinding | undefined;
    }
  | { flags: string; kind: 'regexp'; pattern: string }
  | { kind: 'template'; parts: Array<IrExpression | string> }
  | { kind: 'spread'; expression: IrExpression }
  | { kind: 'unary'; operand: IrExpression; operator: string; postfix: boolean };

export type IrExpression = IrExpressionNode & {
  staticFacts?: IrExpressionStaticFacts | undefined;
  type?: IrType | undefined;
};

export type IrObjectMember =
  | { key: IrExpression; kind: 'computedProperty'; nativeName?: string | undefined; value: IrExpression }
  | { kind: 'property'; name: string; value: IrExpression }
  | { kind: 'spread'; expression: IrExpression };

export type IrStatement =
  | { kind: 'block'; statements: IrStatement[] }
  | { kind: 'break' }
  | { kind: 'continue' }
  | { kind: 'do'; body: IrStatement; condition: IrExpression }
  | { kind: 'expression'; expression: IrExpression }
  | {
      kind: 'for';
      condition?: IrExpression | undefined;
      increment?: IrExpression | undefined;
      initializer?: IrExpression | IrVariable[] | undefined;
      body: IrStatement;
    }
  | {
      async: boolean;
      bindings: IrVariable[];
      body: IrStatement;
      iterable: IrExpression;
      kind: 'forOf';
      variable: string;
    }
  | {
      body: IrStatement;
      enumeration: 'direct-record' | 'runtime';
      kind: 'forIn';
      object: IrExpression;
      variable: string;
    }
  | { kind: 'if'; condition: IrExpression; consequent: IrStatement; otherwise?: IrStatement | undefined }
  | { kind: 'return'; expression?: IrExpression | undefined }
  | { kind: 'switch'; expression: IrExpression; cases: IrSwitchCase[] }
  | { kind: 'throw'; expression: IrExpression }
  | {
      catchBody?: IrStatement | undefined;
      catchName?: string | undefined;
      finallyBody?: IrStatement | undefined;
      kind: 'try';
      tryBody: IrStatement;
    }
  | { kind: 'variable'; declarations: IrVariable[] }
  | { kind: 'while'; body: IrStatement; condition: IrExpression };

export interface IrSwitchCase {
  expression?: IrExpression | undefined;
  statements: IrStatement[];
}

export interface IrVariable {
  initializer?: IrExpression | undefined;
  mutable: boolean;
  name: string;
  type?: IrType | undefined;
}

export interface IrFunctionDeclaration {
  allowPackage?: string | undefined;
  async?: boolean | undefined;
  body: IrStatement[];
  exported: boolean;
  haxeBody?: string | undefined;
  haxeCondition?: string | undefined;
  kind: 'function';
  moduleInitializer?: true | undefined;
  name: string;
  noCompletion?: true | undefined;
  origin: SourceOrigin;
  overloads?: IrFunctionOverload[] | undefined;
  parameters: IrParameter[];
  returns: IrType;
  thisCapture?: string | undefined;
  typeParameterConstraints?: Array<IrType | undefined> | undefined;
  typeParameters: string[];
}

export interface IrFunctionOverload {
  parameters: IrParameter[];
  returns: IrType;
  typeParameterConstraints?: Array<IrType | undefined> | undefined;
  typeParameters: string[];
}

export interface IrVariableDeclaration extends IrVariable {
  allowPackage?: string | undefined;
  exported: boolean;
  kind: 'variable';
  moduleInitializer?: true | undefined;
  noCompletion?: true | undefined;
  origin: SourceOrigin;
}

export interface IrTypeDeclaration {
  cppStructInitConstructorAllowModules?: string[] | undefined;
  cppStructInitNativeOnly?: true | undefined;
  cppStructInitSchemaId?: string | undefined;
  exported: boolean;
  kind: 'type';
  name: string;
  noCompletion?: true | undefined;
  origin: SourceOrigin;
  // Emitted as a module-private type when its name collides with a like-named module
  // in the same Haxe package (the module owns the package identity; this secondary type
  // shadow-resolves to it). See `markShadowedSecondaryTypes` in emit/core.ts.
  packagePrivate?: boolean;
  type: IrType;
  typeParameters: string[];
}

export interface IrEnumDeclaration {
  exported: boolean;
  kind: 'enum';
  members: Array<{ initializer?: IrExpression | undefined; name: string; reverseMapping: boolean }>;
  methods: IrFunctionDeclaration[];
  name: string;
  noCompletion?: true | undefined;
  origin: SourceOrigin;
  packagePrivate?: boolean;
}

export interface IrClassField {
  initializer?: IrExpression | undefined;
  mutable: boolean;
  name: string;
  public: boolean;
  static: boolean;
  type: IrType;
}

export interface IrClassMethod {
  async?: boolean | undefined;
  body: IrStatement[];
  name: string;
  parameters: IrParameter[];
  public: boolean;
  returns: IrType;
  static: boolean;
  typeParameterConstraints?: Array<IrType | undefined> | undefined;
  typeParameters: string[];
}

export interface IrClassDeclaration {
  constructorBody: IrStatement[];
  constructorParameters: IrParameter[];
  exported: boolean;
  extends?: IrType | undefined;
  fields: IrClassField[];
  kind: 'class';
  methods: IrClassMethod[];
  name: string;
  noCompletion?: true | undefined;
  origin: SourceOrigin;
  packagePrivate?: boolean;
  typeParameters: string[];
}

export type IrDeclaration =
  | IrClassDeclaration
  | IrEnumDeclaration
  | IrFunctionDeclaration
  | IrTypeDeclaration
  | IrVariableDeclaration;

export interface IrModule {
  declarations: IrDeclaration[];
  haxePackage?: string;
  imports: string[];
  name: string;
  namespaceNoCompletion?: true | undefined;
  packageName: string;
  source?: string | undefined;
}

export interface LoweringDiagnostic {
  column: number;
  line: number;
  message: string;
  source: string;
}

export interface HostTypeUse {
  arity: number;
  column: number;
  declarationSources: string[];
  kind: 'member' | 'type-reference';
  line: number;
  member?: string | undefined;
  name: string;
  operation?: 'call' | 'read' | 'write' | undefined;
  source: string;
}

export interface LoweringResult {
  accountedDeclarations: number;
  declarations: IrDeclaration[];
  diagnostics: LoweringDiagnostic[];
  hostTypes: HostTypeUse[];
  staticFacts: StaticFactAudit;
}

export interface StaticFactCounts {
  booleanConditionalTruthiness: number;
  booleanExplicitTruthiness: number;
  booleanLogicalExpressions: number;
  booleanLogicalTruthiness: number;
  indexedAccesses: {
    expressions: number;
    reads: number;
    writes: number;
  };
  indexedAccessEscapes: {
    widthSensitiveMixedWrites: number;
  };
  numericRelations: number;
  typedArraySetCalls: number;
}

export interface StaticFactAudit extends StaticFactCounts {
  indexedReceivers: Record<
    IrIndexedReceiver,
    {
      expressions: number;
      reads: number;
      writes: number;
    }
  >;
  typedArraySetReceivers: Record<IrTypedArraySetReceiver, number>;
}

export interface StaticLoweringEmissionCounts {
  booleanAndExpressions: number;
  booleanConditionalExpressions: number;
  booleanOrExpressions: number;
  booleanTruthinessUses: number;
  destructuringEscapes: Record<IrDestructuringReadEscape, Record<IrDestructuringReadSource, number>>;
  destructuringReads: Record<
    IrDestructuringReadSource,
    {
      direct: number;
      parked: number;
      proven: number;
    }
  >;
  destructuringReceivers: Record<IrIndexedReceiver, Record<IrDestructuringReadSource, number>>;
  indexedAccesses: {
    reads: number;
    writes: number;
  };
  indexedReceivers: Record<
    IrIndexedReceiver,
    {
      reads: number;
      writes: number;
    }
  >;
  guardedArrayReads: {
    asyncFlowForInKeys: number;
    asyncFlowForOfValues: number;
  };
  numericRelations: number;
  syntheticArrayReads: {
    highArityArguments: number;
    iterationBindings: number;
  };
  typedArraySetCalls: number;
  typedArraySetReceivers: Record<IrTypedArraySetReceiver, number>;
}
