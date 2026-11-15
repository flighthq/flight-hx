package flight;

#if hl

typedef TextureAtlasRegionLike = flight._hl.TextureAtlasRegionLike;

#elseif cpp

typedef TextureAtlasRegionLike = flight._cpp.TextureAtlasRegionLike;

#elseif (js && flight_esm)

typedef TextureAtlasRegionLike = flight._js.TextureAtlasRegionLike;

#elseif js

#error "flight.TextureAtlasRegionLike on js requires flight_esm."

#else

#error "flight.TextureAtlasRegionLike: no backend for this target."

#end
