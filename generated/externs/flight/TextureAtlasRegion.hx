package flight;

#if hl

typedef TextureAtlasRegion = flight._hl.TextureAtlasRegion;

#elseif cpp

typedef TextureAtlasRegion = flight._cpp.TextureAtlasRegion;

#elseif (js && flight_esm)

typedef TextureAtlasRegion = flight._js.TextureAtlasRegion;

#elseif js

#error "flight.TextureAtlasRegion on js requires flight_esm."

#else

#error "flight.TextureAtlasRegion: no backend for this target."

#end
