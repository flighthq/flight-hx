package flight;

#if hl

typedef StatechartSignals = flight._hl.StatechartSignals;

#elseif cpp

typedef StatechartSignals = flight._cpp.StatechartSignals;

#elseif (js && flight_esm)

typedef StatechartSignals = flight._js.StatechartSignals;

#elseif js

#error "flight.StatechartSignals on js requires flight_esm."

#else

#error "flight.StatechartSignals: no backend for this target."

#end
