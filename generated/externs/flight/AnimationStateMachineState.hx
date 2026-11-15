package flight;

#if hl

typedef AnimationStateMachineState = flight._hl.AnimationStateMachineState;

#elseif cpp

typedef AnimationStateMachineState = flight._cpp.AnimationStateMachineState;

#elseif (js && flight_esm)

typedef AnimationStateMachineState = flight._js.AnimationStateMachineState;

#elseif js

#error "flight.AnimationStateMachineState on js requires flight_esm."

#else

#error "flight.AnimationStateMachineState: no backend for this target."

#end
