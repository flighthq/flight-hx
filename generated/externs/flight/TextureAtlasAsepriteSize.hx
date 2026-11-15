package flight;

#if hl

typedef TextureAtlasAsepriteSize = flight._hl.TextureAtlasAsepriteSize;

#elseif cpp

typedef TextureAtlasAsepriteSize = flight._cpp.TextureAtlasAsepriteSize;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteSize = flight._js.TextureAtlasAsepriteSize;

#elseif js

#error "flight.TextureAtlasAsepriteSize on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteSize: no backend for this target."

#end
