package flight;

#if hl

typedef Physics2DGuardState = flight._hl.Physics2DGuardState;

#elseif cpp

typedef Physics2DGuardState = flight._cpp.Physics2DGuardState;

#elseif (js && flight_esm)

typedef Physics2DGuardState = flight._js.Physics2DGuardState;

#elseif js

#error "flight.Physics2DGuardState on js requires flight_esm."

#else

#error "flight.Physics2DGuardState: no backend for this target."

#end
