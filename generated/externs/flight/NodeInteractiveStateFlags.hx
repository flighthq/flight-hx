package flight;

#if hl

typedef NodeInteractiveStateFlags = flight._hl.NodeInteractiveStateFlags;

#elseif cpp

typedef NodeInteractiveStateFlags = flight._cpp.NodeInteractiveStateFlags;

#elseif (js && flight_esm)

typedef NodeInteractiveStateFlags = flight._js.NodeInteractiveStateFlags;

#elseif js

#error "flight.NodeInteractiveStateFlags on js requires flight_esm."

#else

#error "flight.NodeInteractiveStateFlags: no backend for this target."

#end
