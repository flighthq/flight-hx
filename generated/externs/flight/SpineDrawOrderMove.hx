package flight;

#if hl

typedef SpineDrawOrderMove = flight._hl.SpineDrawOrderMove;

#elseif cpp

typedef SpineDrawOrderMove = flight._cpp.SpineDrawOrderMove;

#elseif (js && flight_esm)

typedef SpineDrawOrderMove = flight._js.SpineDrawOrderMove;

#elseif js

#error "flight.SpineDrawOrderMove on js requires flight_esm."

#else

#error "flight.SpineDrawOrderMove: no backend for this target."

#end
