package flight;

#if hl

typedef FlowGuardState = flight._hl.FlowGuardState;

#elseif cpp

typedef FlowGuardState = flight._cpp.FlowGuardState;

#elseif (js && flight_esm)

typedef FlowGuardState = flight._js.FlowGuardState;

#elseif js

#error "flight.FlowGuardState on js requires flight_esm."

#else

#error "flight.FlowGuardState: no backend for this target."

#end
