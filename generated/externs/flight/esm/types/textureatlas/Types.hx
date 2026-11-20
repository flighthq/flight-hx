package flight.esm.types.textureatlas;

#if (js && flight_esm)
typedef TextureAtlasRotation = Float;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
