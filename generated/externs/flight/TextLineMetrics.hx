package flight;

#if hl

typedef TextLineMetrics = flight._hl.TextLineMetrics;

#elseif cpp

typedef TextLineMetrics = flight._cpp.TextLineMetrics;

#elseif (js && flight_esm)

typedef TextLineMetrics = flight._js.TextLineMetrics;

#elseif js

#error "flight.TextLineMetrics on js requires flight_esm."

#else

#error "flight.TextLineMetrics: no backend for this target."

#end
