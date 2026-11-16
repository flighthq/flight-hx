package flight;

#if hl

typedef Awd2MaterialEntry = flight._hl.Awd2MaterialEntry;

#elseif cpp

typedef Awd2MaterialEntry = flight._cpp.Awd2MaterialEntry;

#elseif (js && flight_esm)

typedef Awd2MaterialEntry = flight._js.Awd2MaterialEntry;

#elseif js

#error "flight.Awd2MaterialEntry on js requires flight_esm."

#else

#error "flight.Awd2MaterialEntry: no backend for this target."

#end
