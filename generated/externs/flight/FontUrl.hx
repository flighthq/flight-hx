package flight;

#if hl

typedef FontUrl = flight._hl.FontUrl;

#elseif cpp

typedef FontUrl = flight._cpp.FontUrl;

#elseif (js && flight_esm)

typedef FontUrl = flight._js.FontUrl;

#elseif js

#error "flight.FontUrl on js requires flight_esm."

#else

#error "flight.FontUrl: no backend for this target."

#end
