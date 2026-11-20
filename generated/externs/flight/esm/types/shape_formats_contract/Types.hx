package flight.esm.types.shape_formats_contract;

#if (js && flight_esm)
typedef ShapeCommandSchema<K> = { arguments:Array<flight.esm.types.shape_formats_contract.Types.ShapeCommandSchemaArgument>, key:K, requiredArgumentCount:Float };

typedef ShapeCommandSchemaArgument = { name:String, type:flight.esm.types.shape_formats_contract.Types.ShapeCommandSchemaArgumentType };

typedef ShapeCommandSchemaArgumentType = String;

typedef ShapeJsonFormatOptions = { ?space:Dynamic };

typedef ShapeJsonParseOptions = { ?resolveTexture:Null<((reference:flight.esm.types.shape_formats_contract.Types.ShapeTextureReference) -> Dynamic)> };

typedef ShapeTextureReference = { index:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
