package flight;

#if hl

typedef NodeInteractiveStateExplanation = flight._hl.NodeInteractiveStateExplanation;

#elseif cpp

typedef NodeInteractiveStateExplanation = flight._cpp.NodeInteractiveStateExplanation;

#elseif (js && flight_esm)

typedef NodeInteractiveStateExplanation = flight._js.NodeInteractiveStateExplanation;

#elseif js

#error "flight.NodeInteractiveStateExplanation on js requires flight_esm."

#else

#error "flight.NodeInteractiveStateExplanation: no backend for this target."

#end
