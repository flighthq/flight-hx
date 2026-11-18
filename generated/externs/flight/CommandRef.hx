package flight;

#if hl

typedef CommandRef = flight._hl.CommandRef;

#elseif cpp

typedef CommandRef = flight._cpp.CommandRef;

#elseif (js && flight_esm)

typedef CommandRef = flight._js.CommandRef;

#elseif js

#error "flight.CommandRef on js requires flight_esm."

#else

#error "flight.CommandRef: no backend for this target."

#end
