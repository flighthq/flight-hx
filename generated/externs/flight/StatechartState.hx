package flight;

#if hl

typedef StatechartState = flight._hl.StatechartState;

#elseif cpp

typedef StatechartState = flight._cpp.StatechartState;

#elseif (js && flight_esm)

typedef StatechartState = flight._js.StatechartState;

#elseif js

#error "flight.StatechartState on js requires flight_esm."

#else

#error "flight.StatechartState: no backend for this target."

#end
