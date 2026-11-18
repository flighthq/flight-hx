package flight;

#if hl

typedef CommandHistory = flight._hl.CommandHistory;

#elseif cpp

typedef CommandHistory = flight._cpp.CommandHistory;

#elseif (js && flight_esm)

typedef CommandHistory = flight._js.CommandHistory;

#elseif js

#error "flight.CommandHistory on js requires flight_esm."

#else

#error "flight.CommandHistory: no backend for this target."

#end
