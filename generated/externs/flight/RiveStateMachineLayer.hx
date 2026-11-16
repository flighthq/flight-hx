package flight;

#if hl

typedef RiveStateMachineLayer = flight._hl.RiveStateMachineLayer;

#elseif cpp

typedef RiveStateMachineLayer = flight._cpp.RiveStateMachineLayer;

#elseif (js && flight_esm)

typedef RiveStateMachineLayer = flight._js.RiveStateMachineLayer;

#elseif js

#error "flight.RiveStateMachineLayer on js requires flight_esm."

#else

#error "flight.RiveStateMachineLayer: no backend for this target."

#end
