package flight;

#if hl

typedef CommandPropertyAssignment = flight._hl.CommandPropertyAssignment;

#elseif cpp

typedef CommandPropertyAssignment = flight._cpp.CommandPropertyAssignment;

#elseif (js && flight_esm)

typedef CommandPropertyAssignment = flight._js.CommandPropertyAssignment;

#elseif js

#error "flight.CommandPropertyAssignment on js requires flight_esm."

#else

#error "flight.CommandPropertyAssignment: no backend for this target."

#end
