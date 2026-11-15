package flight;

#if hl

typedef BokehDepthOfFieldEffect = flight._hl.BokehDepthOfFieldEffect;

#elseif cpp

typedef BokehDepthOfFieldEffect = flight._cpp.BokehDepthOfFieldEffect;

#elseif (js && flight_esm)

typedef BokehDepthOfFieldEffect = flight._js.BokehDepthOfFieldEffect;

#elseif js

#error "flight.BokehDepthOfFieldEffect on js requires flight_esm."

#else

#error "flight.BokehDepthOfFieldEffect: no backend for this target."

#end
