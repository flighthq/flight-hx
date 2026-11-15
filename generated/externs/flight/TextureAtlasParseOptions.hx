package flight;

#if hl

typedef TextureAtlasParseOptions = flight._hl.TextureAtlasParseOptions;

#elseif cpp

typedef TextureAtlasParseOptions = flight._cpp.TextureAtlasParseOptions;

#elseif (js && flight_esm)

typedef TextureAtlasParseOptions = flight._js.TextureAtlasParseOptions;

#elseif js

#error "flight.TextureAtlasParseOptions on js requires flight_esm."

#else

#error "flight.TextureAtlasParseOptions: no backend for this target."

#end
