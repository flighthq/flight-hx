package flight;

#if hl

typedef RiveStateMachineTransition = flight._hl.RiveStateMachineTransition;

#elseif cpp

typedef RiveStateMachineTransition = flight._cpp.RiveStateMachineTransition;

#elseif (js && flight_esm)

typedef RiveStateMachineTransition = flight._js.RiveStateMachineTransition;

#elseif js

#error "flight.RiveStateMachineTransition on js requires flight_esm."

#else

#error "flight.RiveStateMachineTransition: no backend for this target."

#end
