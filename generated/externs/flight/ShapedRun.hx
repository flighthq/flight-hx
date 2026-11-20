package flight;

#if hl

typedef ShapedRun = flight._hl.ShapedRun;

#elseif cpp

typedef ShapedRun = flight._cpp.ShapedRun;

#elseif (js && flight_esm)

typedef ShapedRun = flight._js.ShapedRun;

#elseif js

#error "flight.ShapedRun on js requires flight_esm."

#else

#error "flight.ShapedRun: no backend for this target."

#end
