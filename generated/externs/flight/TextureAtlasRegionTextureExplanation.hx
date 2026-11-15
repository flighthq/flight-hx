package flight;

#if hl

typedef TextureAtlasRegionTextureExplanation = flight._hl.TextureAtlasRegionTextureExplanation;

#elseif cpp

typedef TextureAtlasRegionTextureExplanation = flight._cpp.TextureAtlasRegionTextureExplanation;

#elseif (js && flight_esm)

typedef TextureAtlasRegionTextureExplanation = flight._js.TextureAtlasRegionTextureExplanation;

#elseif js

#error "flight.TextureAtlasRegionTextureExplanation on js requires flight_esm."

#else

#error "flight.TextureAtlasRegionTextureExplanation: no backend for this target."

#end
