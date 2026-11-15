package flight;

#if hl

typedef StatechartRaw = flight._hl.StatechartRaw;

#elseif cpp

typedef StatechartRaw = flight._cpp.StatechartRaw;

#elseif (js && flight_esm)

typedef StatechartRaw = flight._js.StatechartRaw;

#elseif js

#error "flight.StatechartRaw on js requires flight_esm."

#else

#error "flight.StatechartRaw: no backend for this target."

#end
