package flight;

#if hl

typedef TextureAtlasAsepriteRect = flight._hl.TextureAtlasAsepriteRect;

#elseif cpp

typedef TextureAtlasAsepriteRect = flight._cpp.TextureAtlasAsepriteRect;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteRect = flight._js.TextureAtlasAsepriteRect;

#elseif js

#error "flight.TextureAtlasAsepriteRect on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteRect: no backend for this target."

#end
