package flight;

#if hl

typedef TextureAtlasFormatRegistry = flight._hl.TextureAtlasFormatRegistry;

#elseif cpp

typedef TextureAtlasFormatRegistry = flight._cpp.TextureAtlasFormatRegistry;

#elseif (js && flight_esm)

typedef TextureAtlasFormatRegistry = flight._js.TextureAtlasFormatRegistry;

#elseif js

#error "flight.TextureAtlasFormatRegistry on js requires flight_esm."

#else

#error "flight.TextureAtlasFormatRegistry: no backend for this target."

#end
