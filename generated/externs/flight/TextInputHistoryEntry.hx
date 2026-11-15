package flight;

#if hl

typedef TextInputHistoryEntry = flight._hl.TextInputHistoryEntry;

#elseif cpp

typedef TextInputHistoryEntry = flight._cpp.TextInputHistoryEntry;

#elseif (js && flight_esm)

typedef TextInputHistoryEntry = flight._js.TextInputHistoryEntry;

#elseif js

#error "flight.TextInputHistoryEntry on js requires flight_esm."

#else

#error "flight.TextInputHistoryEntry: no backend for this target."

#end
