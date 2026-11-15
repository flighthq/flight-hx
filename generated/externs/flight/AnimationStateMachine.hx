package flight;

#if hl

typedef AnimationStateMachine = flight._hl.AnimationStateMachine;

#elseif cpp

typedef AnimationStateMachine = flight._cpp.AnimationStateMachine;

#elseif (js && flight_esm)

typedef AnimationStateMachine = flight._js.AnimationStateMachine;

#elseif js

#error "flight.AnimationStateMachine on js requires flight_esm."

#else

#error "flight.AnimationStateMachine: no backend for this target."

#end
