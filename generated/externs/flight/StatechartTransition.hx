package flight;

#if hl

typedef StatechartTransition = flight._hl.StatechartTransition;

#elseif cpp

typedef StatechartTransition = flight._cpp.StatechartTransition;

#elseif (js && flight_esm)

typedef StatechartTransition = flight._js.StatechartTransition;

#elseif js

#error "flight.StatechartTransition on js requires flight_esm."

#else

#error "flight.StatechartTransition: no backend for this target."

#end
