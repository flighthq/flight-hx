package flight;

#if hl

typedef TexturePackerAtlasSize = flight._hl.TexturePackerAtlasSize;

#elseif cpp

typedef TexturePackerAtlasSize = flight._cpp.TexturePackerAtlasSize;

#elseif (js && flight_esm)

typedef TexturePackerAtlasSize = flight._js.TexturePackerAtlasSize;

#elseif js

#error "flight.TexturePackerAtlasSize on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasSize: no backend for this target."

#end
