package flight;

#if hl

typedef TextureAtlasAsepriteDocument = flight._hl.TextureAtlasAsepriteDocument;

#elseif cpp

typedef TextureAtlasAsepriteDocument = flight._cpp.TextureAtlasAsepriteDocument;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteDocument = flight._js.TextureAtlasAsepriteDocument;

#elseif js

#error "flight.TextureAtlasAsepriteDocument on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteDocument: no backend for this target."

#end
