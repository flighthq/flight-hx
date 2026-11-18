package flight;

#if hl

typedef CommandBindingRef = flight._hl.CommandBindingRef;

#elseif cpp

typedef CommandBindingRef = flight._cpp.CommandBindingRef;

#elseif (js && flight_esm)

typedef CommandBindingRef = flight._js.CommandBindingRef;

#elseif js

#error "flight.CommandBindingRef on js requires flight_esm."

#else

#error "flight.CommandBindingRef: no backend for this target."

#end
