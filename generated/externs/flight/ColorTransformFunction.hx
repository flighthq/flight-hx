package flight;

#if hl

typedef ColorTransformFunction = flight._hl.ColorTransformFunction;

#elseif cpp

typedef ColorTransformFunction = flight._cpp.ColorTransformFunction;

#elseif (js && flight_esm)

typedef ColorTransformFunction = flight._js.ColorTransformFunction;

#elseif js

#error "flight.ColorTransformFunction on js requires flight_esm."

#else

#error "flight.ColorTransformFunction: no backend for this target."

#end
