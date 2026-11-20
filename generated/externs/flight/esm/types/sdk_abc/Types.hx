package flight.esm.types.sdk_abc;

#if (js && flight_esm)
typedef AbcClass = flight.esm.types.abc.Types.AbcClass;

typedef AbcConstantPool = flight.esm.types.abc.Types.AbcConstantPool;

typedef AbcException = flight.esm.types.abc.Types.AbcException;

typedef AbcFile = flight.esm.types.abc.Types.AbcFile;

typedef AbcInstance = flight.esm.types.abc.Types.AbcInstance;

typedef AbcInstruction = flight.esm.types.abc.Types.AbcInstruction;

typedef AbcMetadata = flight.esm.types.abc.Types.AbcMetadata;

typedef AbcMetadataItem = flight.esm.types.abc.Types.AbcMetadataItem;

typedef AbcMethod = flight.esm.types.abc.Types.AbcMethod;

typedef AbcMethodBody = flight.esm.types.abc.Types.AbcMethodBody;

typedef AbcMultiname = flight.esm.types.abc.Types.AbcMultiname;

typedef AbcMultinameKind = flight.esm.types.abc.Types.AbcMultinameKind;

typedef AbcNamespace = flight.esm.types.abc.Types.AbcNamespace;

typedef AbcOpcode = flight.esm.types.abc.Types.AbcOpcode;

typedef AbcOptionalValue = flight.esm.types.abc.Types.AbcOptionalValue;

typedef AbcScript = flight.esm.types.abc.Types.AbcScript;

typedef AbcTrait = flight.esm.types.abc.Types.AbcTrait;

typedef AbcTraitKind = flight.esm.types.abc.Types.AbcTraitKind;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
