package flight;

#if hl

typedef CommandDispatchExplanation = flight._hl.CommandDispatchExplanation;

#elseif cpp

typedef CommandDispatchExplanation = flight._cpp.CommandDispatchExplanation;

#elseif (js && flight_esm)

typedef CommandDispatchExplanation = flight._js.CommandDispatchExplanation;

#elseif js

#error "flight.CommandDispatchExplanation on js requires flight_esm."

#else

#error "flight.CommandDispatchExplanation: no backend for this target."

#end
