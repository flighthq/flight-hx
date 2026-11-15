package flight;

#if hl

typedef LinearColor = flight._hl.LinearColor;

#elseif cpp

typedef LinearColor = flight._cpp.LinearColor;

#elseif (js && flight_esm)

typedef LinearColor = flight._js.LinearColor;

#elseif js

#error "flight.LinearColor on js requires flight_esm."

#else

#error "flight.LinearColor: no backend for this target."

#end
