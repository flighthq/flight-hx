package flight;

#if hl

typedef TextureAtlasAsepriteNamedFrame = flight._hl.TextureAtlasAsepriteNamedFrame;

#elseif cpp

typedef TextureAtlasAsepriteNamedFrame = flight._cpp.TextureAtlasAsepriteNamedFrame;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteNamedFrame = flight._js.TextureAtlasAsepriteNamedFrame;

#elseif js

#error "flight.TextureAtlasAsepriteNamedFrame on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteNamedFrame: no backend for this target."

#end
