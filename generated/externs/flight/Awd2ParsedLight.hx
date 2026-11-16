package flight;

#if hl

typedef Awd2ParsedLight = flight._hl.Awd2ParsedLight;

#elseif cpp

typedef Awd2ParsedLight = flight._cpp.Awd2ParsedLight;

#elseif (js && flight_esm)

typedef Awd2ParsedLight = flight._js.Awd2ParsedLight;

#elseif js

#error "flight.Awd2ParsedLight on js requires flight_esm."

#else

#error "flight.Awd2ParsedLight: no backend for this target."

#end
