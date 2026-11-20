package flight;

#if hl

typedef NodeInteractionStateRef = flight._hl.NodeInteractionStateRef;

#elseif cpp

typedef NodeInteractionStateRef = flight._cpp.NodeInteractionStateRef;

#elseif (js && flight_esm)

typedef NodeInteractionStateRef = flight._js.NodeInteractionStateRef;

#elseif js

#error "flight.NodeInteractionStateRef on js requires flight_esm."

#else

#error "flight.NodeInteractionStateRef: no backend for this target."

#end
