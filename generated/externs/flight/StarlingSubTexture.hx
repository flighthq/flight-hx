package flight;

#if hl

typedef StarlingSubTexture = flight._hl.StarlingSubTexture;

#elseif cpp

typedef StarlingSubTexture = flight._cpp.StarlingSubTexture;

#elseif (js && flight_esm)

typedef StarlingSubTexture = flight._js.StarlingSubTexture;

#elseif js

#error "flight.StarlingSubTexture on js requires flight_esm."

#else

#error "flight.StarlingSubTexture: no backend for this target."

#end
