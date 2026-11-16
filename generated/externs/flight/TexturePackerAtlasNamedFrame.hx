package flight;

#if hl

typedef TexturePackerAtlasNamedFrame = flight._hl.TexturePackerAtlasNamedFrame;

#elseif cpp

typedef TexturePackerAtlasNamedFrame = flight._cpp.TexturePackerAtlasNamedFrame;

#elseif (js && flight_esm)

typedef TexturePackerAtlasNamedFrame = flight._js.TexturePackerAtlasNamedFrame;

#elseif js

#error "flight.TexturePackerAtlasNamedFrame on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasNamedFrame: no backend for this target."

#end
