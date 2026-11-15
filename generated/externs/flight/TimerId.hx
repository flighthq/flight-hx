package flight;

#if hl

typedef TimerId = flight._hl.TimerId;

#elseif cpp

typedef TimerId = flight._cpp.TimerId;

#elseif (js && flight_esm)

typedef TimerId = flight._js.TimerId;

#elseif js

#error "flight.TimerId on js requires flight_esm."

#else

#error "flight.TimerId: no backend for this target."

#end
