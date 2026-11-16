package flight;

#if hl

typedef Awd2BlockDispatchEntry = flight._hl.Awd2BlockDispatchEntry;

#elseif cpp

typedef Awd2BlockDispatchEntry = flight._cpp.Awd2BlockDispatchEntry;

#elseif (js && flight_esm)

typedef Awd2BlockDispatchEntry = flight._js.Awd2BlockDispatchEntry;

#elseif js

#error "flight.Awd2BlockDispatchEntry on js requires flight_esm."

#else

#error "flight.Awd2BlockDispatchEntry: no backend for this target."

#end
