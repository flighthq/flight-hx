package flight;

#if hl

typedef TexturePackerAtlasParseOptions = flight._hl.TexturePackerAtlasParseOptions;

#elseif cpp

typedef TexturePackerAtlasParseOptions = flight._cpp.TexturePackerAtlasParseOptions;

#elseif (js && flight_esm)

typedef TexturePackerAtlasParseOptions = flight._js.TexturePackerAtlasParseOptions;

#elseif js

#error "flight.TexturePackerAtlasParseOptions on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasParseOptions: no backend for this target."

#end
