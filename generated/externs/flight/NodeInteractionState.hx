package flight;

#if hl

typedef NodeInteractionState = flight._hl.NodeInteractionState;

#elseif cpp

typedef NodeInteractionState = flight._cpp.NodeInteractionState;

#elseif (js && flight_esm)

typedef NodeInteractionState = flight._js.NodeInteractionState;

#elseif js

#error "flight.NodeInteractionState on js requires flight_esm."

#else

#error "flight.NodeInteractionState: no backend for this target."

#end
