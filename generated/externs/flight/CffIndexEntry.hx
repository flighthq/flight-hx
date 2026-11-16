package flight;

#if hl

typedef CffIndexEntry = flight._hl.CffIndexEntry;

#elseif cpp

typedef CffIndexEntry = flight._cpp.CffIndexEntry;

#elseif (js && flight_esm)

typedef CffIndexEntry = flight._js.CffIndexEntry;

#elseif js

#error "flight.CffIndexEntry on js requires flight_esm."

#else

#error "flight.CffIndexEntry: no backend for this target."

#end
