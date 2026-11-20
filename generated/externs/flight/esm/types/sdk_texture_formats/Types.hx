package flight.esm.types.sdk_texture_formats;

#if (js && flight_esm)
typedef TextureContainer = flight.esm.types.texture_formats.Types.TextureContainer;

typedef TextureContainerFormat = flight.esm.types.texture_formats.Types.TextureContainerFormat;

typedef TextureContainerKind = flight.esm.types.texture_formats.Types.TextureContainerKind;

typedef TextureContainerLevel = flight.esm.types.texture_formats.Types.TextureContainerLevel;

typedef TextureContainerParseExplanation = flight.esm.types.texture_formats.Types.TextureContainerParseExplanation;

typedef TextureContainerParseFailureReason = flight.esm.types.texture_formats.Types.TextureContainerParseFailureReason;

typedef TextureContainerSupercompression = flight.esm.types.texture_formats.Types.TextureContainerSupercompression;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
