package flight;

#if hl

typedef TexturePackerAtlasPivot = flight._hl.TexturePackerAtlasPivot;

#elseif cpp

typedef TexturePackerAtlasPivot = flight._cpp.TexturePackerAtlasPivot;

#elseif (js && flight_esm)

typedef TexturePackerAtlasPivot = flight._js.TexturePackerAtlasPivot;

#elseif js

#error "flight.TexturePackerAtlasPivot on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasPivot: no backend for this target."

#end
