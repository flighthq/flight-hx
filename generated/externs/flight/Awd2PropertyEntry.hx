package flight;

#if hl

typedef Awd2PropertyEntry = flight._hl.Awd2PropertyEntry;

#elseif cpp

typedef Awd2PropertyEntry = flight._cpp.Awd2PropertyEntry;

#elseif (js && flight_esm)

typedef Awd2PropertyEntry = flight._js.Awd2PropertyEntry;

#elseif js

#error "flight.Awd2PropertyEntry on js requires flight_esm."

#else

#error "flight.Awd2PropertyEntry: no backend for this target."

#end
