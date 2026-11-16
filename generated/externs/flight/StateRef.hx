package flight;

#if hl

typedef StateRef = flight._hl.StateRef;

#elseif cpp

typedef StateRef = flight._cpp.StateRef;

#elseif (js && flight_esm)

typedef StateRef = flight._js.StateRef;

#elseif js

#error "flight.StateRef on js requires flight_esm."

#else

#error "flight.StateRef: no backend for this target."

#end
