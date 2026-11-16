package flight;

#if hl

typedef TexturePackerAtlasMeta = flight._hl.TexturePackerAtlasMeta;

#elseif cpp

typedef TexturePackerAtlasMeta = flight._cpp.TexturePackerAtlasMeta;

#elseif (js && flight_esm)

typedef TexturePackerAtlasMeta = flight._js.TexturePackerAtlasMeta;

#elseif js

#error "flight.TexturePackerAtlasMeta on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasMeta: no backend for this target."

#end
