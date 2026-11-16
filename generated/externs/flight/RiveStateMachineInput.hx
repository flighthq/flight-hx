package flight;

#if hl

typedef RiveStateMachineInput = flight._hl.RiveStateMachineInput;

#elseif cpp

typedef RiveStateMachineInput = flight._cpp.RiveStateMachineInput;

#elseif (js && flight_esm)

typedef RiveStateMachineInput = flight._js.RiveStateMachineInput;

#elseif js

#error "flight.RiveStateMachineInput on js requires flight_esm."

#else

#error "flight.RiveStateMachineInput: no backend for this target."

#end
