package flight;

#if hl

typedef FontMetrics = flight._hl.FontMetrics;

#elseif cpp

typedef FontMetrics = flight._cpp.FontMetrics;

#elseif (js && flight_esm)

typedef FontMetrics = flight._js.FontMetrics;

#elseif js

#error "flight.FontMetrics on js requires flight_esm."

#else

#error "flight.FontMetrics: no backend for this target."

#end
