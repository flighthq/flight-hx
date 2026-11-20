package flight;

#if hl

typedef FlowStack = flight._hl.FlowStack;

#elseif cpp

typedef FlowStack = flight._cpp.FlowStack;

#elseif (js && flight_esm)

typedef FlowStack = flight._js.FlowStack;

#elseif js

#error "flight.FlowStack on js requires flight_esm."

#else

#error "flight.FlowStack: no backend for this target."

#end
