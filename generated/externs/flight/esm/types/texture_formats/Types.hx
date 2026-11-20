package flight.esm.types.texture_formats;

#if (js && flight_esm)
typedef TextureContainer = { format:flight.esm.types.texture_formats.Types.TextureContainerFormat, width:Float, height:Float, depth:Float, mipLevels:Float, layers:Float, faces:Float, supercompression:flight.esm.types.texture_formats.Types.TextureContainerSupercompression, levels:Array<flight.esm.types.texture_formats.Types.TextureContainerLevel> };

typedef TextureContainerFormat = String;

typedef TextureContainerKind = String;

typedef TextureContainerLevel = { byteOffset:Float, byteLength:Float, width:Float, height:Float };

typedef TextureContainerParseExplanation = { container:Null<String>, reason:flight.esm.types.texture_formats.Types.TextureContainerParseFailureReason };

typedef TextureContainerParseFailureReason = String;

typedef TextureContainerSupercompression = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
