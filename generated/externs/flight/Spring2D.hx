package flight;

#if hl

typedef Spring2D = flight._hl.Spring2D;

#elseif cpp

typedef Spring2D = flight._cpp.Spring2D;

#elseif (js && flight_esm)

typedef Spring2D = flight._js.Spring2D;

#elseif js

#error "flight.Spring2D on js requires flight_esm."

#else

#error "flight.Spring2D: no backend for this target."

#end
