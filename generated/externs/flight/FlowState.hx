package flight;

#if hl

typedef FlowState = flight._hl.FlowState;

#elseif cpp

typedef FlowState = flight._cpp.FlowState;

#elseif (js && flight_esm)

typedef FlowState = flight._js.FlowState;

#elseif js

#error "flight.FlowState on js requires flight_esm."

#else

#error "flight.FlowState: no backend for this target."

#end
