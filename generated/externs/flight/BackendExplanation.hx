package flight;

#if hl

typedef BackendExplanation = flight._hl.BackendExplanation;

#elseif cpp

typedef BackendExplanation = flight._cpp.BackendExplanation;

#elseif (js && flight_esm)

typedef BackendExplanation = flight._js.BackendExplanation;

#elseif js

#error "flight.BackendExplanation on js requires flight_esm."

#else

#error "flight.BackendExplanation: no backend for this target."

#end
