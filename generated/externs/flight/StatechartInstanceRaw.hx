package flight;

#if hl

typedef StatechartInstanceRaw = flight._hl.StatechartInstanceRaw;

#elseif cpp

typedef StatechartInstanceRaw = flight._cpp.StatechartInstanceRaw;

#elseif (js && flight_esm)

typedef StatechartInstanceRaw = flight._js.StatechartInstanceRaw;

#elseif js

#error "flight.StatechartInstanceRaw on js requires flight_esm."

#else

#error "flight.StatechartInstanceRaw: no backend for this target."

#end
