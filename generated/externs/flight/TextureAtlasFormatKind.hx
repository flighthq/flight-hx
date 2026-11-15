package flight;

#if hl

typedef TextureAtlasFormatKind = flight._hl.TextureAtlasFormatKind;

#elseif cpp

typedef TextureAtlasFormatKind = flight._cpp.TextureAtlasFormatKind;

#elseif (js && flight_esm)

typedef TextureAtlasFormatKind = flight._js.TextureAtlasFormatKind;

#elseif js

#error "flight.TextureAtlasFormatKind on js requires flight_esm."

#else

#error "flight.TextureAtlasFormatKind: no backend for this target."

#end
