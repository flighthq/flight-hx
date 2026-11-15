package flight;

#if hl

typedef TextMetrics = flight._hl.TextMetrics;

#elseif cpp

typedef TextMetrics = flight._cpp.TextMetrics;

#elseif (js && flight_esm)

typedef TextMetrics = flight._js.TextMetrics;

#elseif js

#error "flight.TextMetrics on js requires flight_esm."

#else

#error "flight.TextMetrics: no backend for this target."

#end
