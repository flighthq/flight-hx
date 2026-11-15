package flight;

#if hl

typedef RenderStateStats = flight._hl.RenderStateStats;

#elseif cpp

typedef RenderStateStats = flight._cpp.RenderStateStats;

#elseif (js && flight_esm)

typedef RenderStateStats = flight._js.RenderStateStats;

#elseif js

#error "flight.RenderStateStats on js requires flight_esm."

#else

#error "flight.RenderStateStats: no backend for this target."

#end
