package flight;

#if hl

typedef Physics3DGuardState = flight._hl.Physics3DGuardState;

#elseif cpp

typedef Physics3DGuardState = flight._cpp.Physics3DGuardState;

#elseif (js && flight_esm)

typedef Physics3DGuardState = flight._js.Physics3DGuardState;

#elseif js

#error "flight.Physics3DGuardState on js requires flight_esm."

#else

#error "flight.Physics3DGuardState: no backend for this target."

#end
