package flight;

#if hl

typedef StatechartCondition = flight._hl.StatechartCondition;

#elseif cpp

typedef StatechartCondition = flight._cpp.StatechartCondition;

#elseif (js && flight_esm)

typedef StatechartCondition = flight._js.StatechartCondition;

#elseif js

#error "flight.StatechartCondition on js requires flight_esm."

#else

#error "flight.StatechartCondition: no backend for this target."

#end
