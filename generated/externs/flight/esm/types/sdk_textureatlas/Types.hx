package flight.esm.types.sdk_textureatlas;

#if (js && flight_esm)
typedef TextureAtlasRotation = flight.esm.types.textureatlas.Types.TextureAtlasRotation;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
