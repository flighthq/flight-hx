package flight;

#if hl

typedef NodeRuntime = flight._hl.NodeRuntime;

#elseif cpp

typedef NodeRuntime = flight._cpp.NodeRuntime;

#elseif (js && flight_esm)

typedef NodeRuntime = flight._js.NodeRuntime;

#elseif js

#error "flight.NodeRuntime on js requires flight_esm."

#else

#error "flight.NodeRuntime: no backend for this target."

#end
