package flight;

#if hl

typedef Rectangle = flight._hl.Rectangle;

#elseif cpp

typedef Rectangle = flight._cpp.Rectangle;

#elseif (js && flight_esm)

typedef Rectangle = flight._js.Rectangle;

#elseif js

#error "flight.Rectangle on js requires flight_esm."

#else

#error "flight.Rectangle: no backend for this target."

#end
