package flight;

#if hl

typedef RiveStateMachineDescriptor = flight._hl.RiveStateMachineDescriptor;

#elseif cpp

typedef RiveStateMachineDescriptor = flight._cpp.RiveStateMachineDescriptor;

#elseif (js && flight_esm)

typedef RiveStateMachineDescriptor = flight._js.RiveStateMachineDescriptor;

#elseif js

#error "flight.RiveStateMachineDescriptor on js requires flight_esm."

#else

#error "flight.RiveStateMachineDescriptor: no backend for this target."

#end
