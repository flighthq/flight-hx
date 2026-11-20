package flight;

#if hl

typedef CanvasTextMetrics = flight._hl.CanvasTextMetrics;

#elseif cpp

typedef CanvasTextMetrics = flight._cpp.CanvasTextMetrics;

#elseif (js && flight_esm)

typedef CanvasTextMetrics = flight._js.CanvasTextMetrics;

#elseif js

#error "flight.CanvasTextMetrics on js requires flight_esm."

#else

#error "flight.CanvasTextMetrics: no backend for this target."

#end
