package flight;

#if hl

typedef TexturePackerAtlasArrayFrame = flight._hl.TexturePackerAtlasArrayFrame;

#elseif cpp

typedef TexturePackerAtlasArrayFrame = flight._cpp.TexturePackerAtlasArrayFrame;

#elseif (js && flight_esm)

typedef TexturePackerAtlasArrayFrame = flight._js.TexturePackerAtlasArrayFrame;

#elseif js

#error "flight.TexturePackerAtlasArrayFrame on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasArrayFrame: no backend for this target."

#end
