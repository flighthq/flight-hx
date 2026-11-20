package flight;

#if hl

typedef State = flight._hl.State;

#elseif cpp

typedef State = flight._cpp.State;

#elseif (js && flight_esm)

typedef State = flight._js.State;

#elseif js

#error "flight.State on js requires flight_esm."

#else

#error "flight.State: no backend for this target."

#end
