package flight;

#if hl

typedef NodeGuardState = flight._hl.NodeGuardState;

#elseif cpp

typedef NodeGuardState = flight._cpp.NodeGuardState;

#elseif (js && flight_esm)

typedef NodeGuardState = flight._js.NodeGuardState;

#elseif js

#error "flight.NodeGuardState on js requires flight_esm."

#else

#error "flight.NodeGuardState: no backend for this target."

#end
