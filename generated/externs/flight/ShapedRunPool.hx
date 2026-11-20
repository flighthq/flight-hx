package flight;

#if hl

typedef ShapedRunPool = flight._hl.ShapedRunPool;

#elseif cpp

typedef ShapedRunPool = flight._cpp.ShapedRunPool;

#elseif (js && flight_esm)

typedef ShapedRunPool = flight._js.ShapedRunPool;

#elseif js

#error "flight.ShapedRunPool on js requires flight_esm."

#else

#error "flight.ShapedRunPool: no backend for this target."

#end
