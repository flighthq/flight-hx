package flight;

#if hl

typedef TextFormat = flight._hl.TextFormat;

#elseif cpp

typedef TextFormat = flight._cpp.TextFormat;

#elseif (js && flight_esm)

typedef TextFormat = flight._js.TextFormat;

#elseif js

#error "flight.TextFormat on js requires flight_esm."

#else

#error "flight.TextFormat: no backend for this target."

#end
