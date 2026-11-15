package flight;

#if hl

typedef TextureAtlasImportOptions = flight._hl.TextureAtlasImportOptions;

#elseif cpp

typedef TextureAtlasImportOptions = flight._cpp.TextureAtlasImportOptions;

#elseif (js && flight_esm)

typedef TextureAtlasImportOptions = flight._js.TextureAtlasImportOptions;

#elseif js

#error "flight.TextureAtlasImportOptions on js requires flight_esm."

#else

#error "flight.TextureAtlasImportOptions: no backend for this target."

#end
