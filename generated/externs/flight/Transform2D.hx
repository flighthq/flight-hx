package flight;

#if hl

typedef Transform2D = flight._hl.Transform2D;

#elseif cpp

typedef Transform2D = flight._cpp.Transform2D;

#elseif (js && flight_esm)

typedef Transform2D = flight._js.Transform2D;

#elseif js

#error "flight.Transform2D on js requires flight_esm."

#else

#error "flight.Transform2D: no backend for this target."

#end
