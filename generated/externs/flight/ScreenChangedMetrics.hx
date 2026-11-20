package flight;

#if hl

typedef ScreenChangedMetrics = flight._hl.ScreenChangedMetrics;

#elseif cpp

typedef ScreenChangedMetrics = flight._cpp.ScreenChangedMetrics;

#elseif (js && flight_esm)

typedef ScreenChangedMetrics = flight._js.ScreenChangedMetrics;

#elseif js

#error "flight.ScreenChangedMetrics on js requires flight_esm."

#else

#error "flight.ScreenChangedMetrics: no backend for this target."

#end
