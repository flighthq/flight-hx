package flight;

#if hl

typedef TextureAtlasRegionOptions = flight._hl.TextureAtlasRegionOptions;

#elseif cpp

typedef TextureAtlasRegionOptions = flight._cpp.TextureAtlasRegionOptions;

#elseif (js && flight_esm)

typedef TextureAtlasRegionOptions = flight._js.TextureAtlasRegionOptions;

#elseif js

#error "flight.TextureAtlasRegionOptions on js requires flight_esm."

#else

#error "flight.TextureAtlasRegionOptions: no backend for this target."

#end
