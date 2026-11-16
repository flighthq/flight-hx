package flight;

#if hl

typedef Awd2NodeIndexEntry = flight._hl.Awd2NodeIndexEntry;

#elseif cpp

typedef Awd2NodeIndexEntry = flight._cpp.Awd2NodeIndexEntry;

#elseif (js && flight_esm)

typedef Awd2NodeIndexEntry = flight._js.Awd2NodeIndexEntry;

#elseif js

#error "flight.Awd2NodeIndexEntry on js requires flight_esm."

#else

#error "flight.Awd2NodeIndexEntry: no backend for this target."

#end
