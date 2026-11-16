package flight;

#if hl

typedef TextureAtlasAsepriteMeta = flight._hl.TextureAtlasAsepriteMeta;

#elseif cpp

typedef TextureAtlasAsepriteMeta = flight._cpp.TextureAtlasAsepriteMeta;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteMeta = flight._js.TextureAtlasAsepriteMeta;

#elseif js

#error "flight.TextureAtlasAsepriteMeta on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteMeta: no backend for this target."

#end
