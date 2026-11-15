package flight;

#if hl

typedef NodeRuntimeMethods = flight._hl.NodeRuntimeMethods;

#elseif cpp

typedef NodeRuntimeMethods = flight._cpp.NodeRuntimeMethods;

#elseif (js && flight_esm)

typedef NodeRuntimeMethods = flight._js.NodeRuntimeMethods;

#elseif js

#error "flight.NodeRuntimeMethods on js requires flight_esm."

#else

#error "flight.NodeRuntimeMethods: no backend for this target."

#end
