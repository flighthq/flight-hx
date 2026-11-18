package flight;

#if hl

typedef CommandPropertyEntry = flight._hl.CommandPropertyEntry;

#elseif cpp

typedef CommandPropertyEntry = flight._cpp.CommandPropertyEntry;

#elseif (js && flight_esm)

typedef CommandPropertyEntry = flight._js.CommandPropertyEntry;

#elseif js

#error "flight.CommandPropertyEntry on js requires flight_esm."

#else

#error "flight.CommandPropertyEntry: no backend for this target."

#end
