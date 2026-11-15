package flight;

#if hl

typedef Scene2D = flight._hl.Scene2D;

#elseif cpp

typedef Scene2D = flight._cpp.Scene2D;

#elseif (js && flight_esm)

typedef Scene2D = flight._js.Scene2D;

#elseif js

#error "flight.Scene2D on js requires flight_esm."

#else

#error "flight.Scene2D: no backend for this target."

#end
