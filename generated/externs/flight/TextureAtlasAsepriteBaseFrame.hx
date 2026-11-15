package flight;

#if hl

typedef TextureAtlasAsepriteBaseFrame = flight._hl.TextureAtlasAsepriteBaseFrame;

#elseif cpp

typedef TextureAtlasAsepriteBaseFrame = flight._cpp.TextureAtlasAsepriteBaseFrame;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteBaseFrame = flight._js.TextureAtlasAsepriteBaseFrame;

#elseif js

#error "flight.TextureAtlasAsepriteBaseFrame on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteBaseFrame: no backend for this target."

#end
