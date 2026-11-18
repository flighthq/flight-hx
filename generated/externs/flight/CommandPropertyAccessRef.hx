package flight;

#if hl

typedef CommandPropertyAccessRef = flight._hl.CommandPropertyAccessRef;

#elseif cpp

typedef CommandPropertyAccessRef = flight._cpp.CommandPropertyAccessRef;

#elseif (js && flight_esm)

typedef CommandPropertyAccessRef = flight._js.CommandPropertyAccessRef;

#elseif js

#error "flight.CommandPropertyAccessRef on js requires flight_esm."

#else

#error "flight.CommandPropertyAccessRef: no backend for this target."

#end
