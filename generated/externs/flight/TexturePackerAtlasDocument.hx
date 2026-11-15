package flight;

#if hl

typedef TexturePackerAtlasDocument = flight._hl.TexturePackerAtlasDocument;

#elseif cpp

typedef TexturePackerAtlasDocument = flight._cpp.TexturePackerAtlasDocument;

#elseif (js && flight_esm)

typedef TexturePackerAtlasDocument = flight._js.TexturePackerAtlasDocument;

#elseif js

#error "flight.TexturePackerAtlasDocument on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasDocument: no backend for this target."

#end
