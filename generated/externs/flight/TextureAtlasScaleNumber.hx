package flight;

#if hl

typedef TextureAtlasScaleNumber = flight._hl.TextureAtlasScaleNumber;

#elseif cpp

typedef TextureAtlasScaleNumber = flight._cpp.TextureAtlasScaleNumber;

#elseif (js && flight_esm)

typedef TextureAtlasScaleNumber = flight._js.TextureAtlasScaleNumber;

#elseif js

#error "flight.TextureAtlasScaleNumber on js requires flight_esm."

#else

#error "flight.TextureAtlasScaleNumber: no backend for this target."

#end
