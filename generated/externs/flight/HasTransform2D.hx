package flight;

#if hl

typedef HasTransform2D = flight._hl.HasTransform2D;

#elseif cpp

typedef HasTransform2D = flight._cpp.HasTransform2D;

#elseif (js && flight_esm)

typedef HasTransform2D = flight._js.HasTransform2D;

#elseif js

#error "flight.HasTransform2D on js requires flight_esm."

#else

#error "flight.HasTransform2D: no backend for this target."

#end
