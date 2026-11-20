package flight;

#if hl

typedef NodeInteractiveStateBinding = flight._hl.NodeInteractiveStateBinding;

#elseif cpp

typedef NodeInteractiveStateBinding = flight._cpp.NodeInteractiveStateBinding;

#elseif (js && flight_esm)

typedef NodeInteractiveStateBinding = flight._js.NodeInteractiveStateBinding;

#elseif js

#error "flight.NodeInteractiveStateBinding on js requires flight_esm."

#else

#error "flight.NodeInteractiveStateBinding: no backend for this target."

#end
