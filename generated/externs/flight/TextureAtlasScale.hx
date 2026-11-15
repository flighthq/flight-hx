package flight;

#if hl

typedef TextureAtlasScale = flight._hl.TextureAtlasScale;

#elseif cpp

typedef TextureAtlasScale = flight._cpp.TextureAtlasScale;

#elseif (js && flight_esm)

typedef TextureAtlasScale = flight._js.TextureAtlasScale;

#elseif js

#error "flight.TextureAtlasScale on js requires flight_esm."

#else

#error "flight.TextureAtlasScale: no backend for this target."

#end
