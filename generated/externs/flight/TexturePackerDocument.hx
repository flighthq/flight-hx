package flight;

#if hl

typedef TexturePackerDocument = flight._hl.TexturePackerDocument;

#elseif cpp

typedef TexturePackerDocument = flight._cpp.TexturePackerDocument;

#elseif (js && flight_esm)

typedef TexturePackerDocument = flight._js.TexturePackerDocument;

#elseif js

#error "flight.TexturePackerDocument on js requires flight_esm."

#else

#error "flight.TexturePackerDocument: no backend for this target."

#end
