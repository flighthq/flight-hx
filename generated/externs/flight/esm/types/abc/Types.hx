package flight.esm.types.abc;

#if (js && flight_esm)
typedef AbcClass = { initializer:Float, traits:Array<flight.esm.types.abc.Types.AbcTrait> };

typedef AbcConstantPool = { doubles:Array<Float>, integers:Array<Float>, multinames:Array<flight.esm.types.abc.Types.AbcMultiname>, namespaceSets:Array<Array<Float>>, namespaces:Array<flight.esm.types.abc.Types.AbcNamespace>, strings:Array<String>, unsignedIntegers:Array<Float> };

typedef AbcException = { from:Float, target:Float, to:Float, exceptionType:Float, variableName:Float };

typedef AbcFile = { classes:Array<flight.esm.types.abc.Types.AbcClass>, constantPool:flight.esm.types.abc.Types.AbcConstantPool, instances:Array<flight.esm.types.abc.Types.AbcInstance>, majorVersion:Float, metadata:Array<flight.esm.types.abc.Types.AbcMetadata>, methodBodies:Array<flight.esm.types.abc.Types.AbcMethodBody>, methods:Array<flight.esm.types.abc.Types.AbcMethod>, minorVersion:Float, scripts:Array<flight.esm.types.abc.Types.AbcScript> };

typedef AbcInstance = { flags:Float, initializer:Float, interfaces:Array<Float>, name:Float, protectedNamespace:Float, superName:Float, traits:Array<flight.esm.types.abc.Types.AbcTrait> };

typedef AbcInstruction = { offset:Float, opcode:Float, operands:Array<Float> };

typedef AbcMetadata = { items:Array<flight.esm.types.abc.Types.AbcMetadataItem>, name:Float };

typedef AbcMetadataItem = { key:Float, value:Float };

typedef AbcMethod = { flags:Float, name:Float, parameterNames:Array<Float>, parameterTypes:Array<Float>, optionalValues:Array<flight.esm.types.abc.Types.AbcOptionalValue>, returnType:Float };

typedef AbcMethodBody = { code:js.lib.Uint8Array, exceptions:Array<flight.esm.types.abc.Types.AbcException>, initScopeDepth:Float, localCount:Float, maxScopeDepth:Float, maxStack:Float, method:Float, traits:Array<flight.esm.types.abc.Types.AbcTrait> };

typedef AbcMultiname = { kind:Float, name:Float, namespace:Float, namespaceSet:Float, parameters:Array<Float>, typeName:Float };

typedef AbcMultinameKind = Float;

typedef AbcNamespace = { kind:Float, name:Float };

typedef AbcOpcode = Float;

typedef AbcOptionalValue = { kind:Float, value:Float };

typedef AbcScript = { initializer:Float, traits:Array<flight.esm.types.abc.Types.AbcTrait> };

typedef AbcTrait = { attributes:Float, classIndex:Float, dispatchId:Float, methodIndex:Float, metadata:Array<Float>, name:Float, kind:Float, slotId:Float, typeName:Float, valueIndex:Float, valueKind:Float };

typedef AbcTraitKind = Float;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
