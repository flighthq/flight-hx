package flight;

#if hl

typedef StatechartTransitionExplanation = flight._hl.StatechartTransitionExplanation;

#elseif cpp

typedef StatechartTransitionExplanation = flight._cpp.StatechartTransitionExplanation;

#elseif (js && flight_esm)

typedef StatechartTransitionExplanation = flight._js.StatechartTransitionExplanation;

#elseif js

#error "flight.StatechartTransitionExplanation on js requires flight_esm."

#else

#error "flight.StatechartTransitionExplanation: no backend for this target."

#end
