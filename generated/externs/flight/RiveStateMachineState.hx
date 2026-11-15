package flight;

#if hl

typedef RiveStateMachineState = flight._hl.RiveStateMachineState;

#elseif cpp

typedef RiveStateMachineState = flight._cpp.RiveStateMachineState;

#elseif (js && flight_esm)

typedef RiveStateMachineState = flight._js.RiveStateMachineState;

#elseif js

#error "flight.RiveStateMachineState on js requires flight_esm."

#else

#error "flight.RiveStateMachineState: no backend for this target."

#end
