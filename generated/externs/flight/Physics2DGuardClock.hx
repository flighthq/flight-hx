package flight;

#if hl

typedef Physics2DGuardClock = flight._hl.Physics2DGuardClock;

#elseif cpp

typedef Physics2DGuardClock = flight._cpp.Physics2DGuardClock;

#elseif (js && flight_esm)

typedef Physics2DGuardClock = flight._js.Physics2DGuardClock;

#elseif js

#error "flight.Physics2DGuardClock on js requires flight_esm."

#else

#error "flight.Physics2DGuardClock: no backend for this target."

#end
