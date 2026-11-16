package flight;

#if hl

typedef Awd2ParsedContainer = flight._hl.Awd2ParsedContainer;

#elseif cpp

typedef Awd2ParsedContainer = flight._cpp.Awd2ParsedContainer;

#elseif (js && flight_esm)

typedef Awd2ParsedContainer = flight._js.Awd2ParsedContainer;

#elseif js

#error "flight.Awd2ParsedContainer on js requires flight_esm."

#else

#error "flight.Awd2ParsedContainer: no backend for this target."

#end
