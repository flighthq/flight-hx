package flight;

#if hl

typedef CommandPropertyAccess = flight._hl.CommandPropertyAccess;

#elseif cpp

typedef CommandPropertyAccess = flight._cpp.CommandPropertyAccess;

#elseif (js && flight_esm)

typedef CommandPropertyAccess = flight._js.CommandPropertyAccess;

#elseif js

#error "flight.CommandPropertyAccess on js requires flight_esm."

#else

#error "flight.CommandPropertyAccess: no backend for this target."

#end
