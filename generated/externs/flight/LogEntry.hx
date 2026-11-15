package flight;

#if hl

typedef LogEntry = flight._hl.LogEntry;

#elseif cpp

typedef LogEntry = flight._cpp.LogEntry;

#elseif (js && flight_esm)

typedef LogEntry = flight._js.LogEntry;

#elseif js

#error "flight.LogEntry on js requires flight_esm."

#else

#error "flight.LogEntry: no backend for this target."

#end
