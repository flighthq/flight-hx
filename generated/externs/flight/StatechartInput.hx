package flight;

#if hl

typedef StatechartInput = flight._hl.StatechartInput;

#elseif cpp

typedef StatechartInput = flight._cpp.StatechartInput;

#elseif (js && flight_esm)

typedef StatechartInput = flight._js.StatechartInput;

#elseif js

#error "flight.StatechartInput on js requires flight_esm."

#else

#error "flight.StatechartInput: no backend for this target."

#end
