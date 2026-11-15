package flight;

#if hl

typedef TextAutoSize = flight._hl.TextAutoSize;

#elseif cpp

typedef TextAutoSize = flight._cpp.TextAutoSize;

#elseif (js && flight_esm)

typedef TextAutoSize = flight._js.TextAutoSize;

#elseif js

#error "flight.TextAutoSize on js requires flight_esm."

#else

#error "flight.TextAutoSize: no backend for this target."

#end
