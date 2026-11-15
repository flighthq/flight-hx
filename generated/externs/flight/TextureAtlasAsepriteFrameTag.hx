package flight;

#if hl

typedef TextureAtlasAsepriteFrameTag = flight._hl.TextureAtlasAsepriteFrameTag;

#elseif cpp

typedef TextureAtlasAsepriteFrameTag = flight._cpp.TextureAtlasAsepriteFrameTag;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteFrameTag = flight._js.TextureAtlasAsepriteFrameTag;

#elseif js

#error "flight.TextureAtlasAsepriteFrameTag on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteFrameTag: no backend for this target."

#end
