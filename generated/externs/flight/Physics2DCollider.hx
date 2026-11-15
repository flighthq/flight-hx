package flight;

#if hl

typedef Physics2DCollider = flight._hl.Physics2DCollider;

#elseif cpp

typedef Physics2DCollider = flight._cpp.Physics2DCollider;

#elseif (js && flight_esm)

typedef Physics2DCollider = flight._js.Physics2DCollider;

#elseif js

#error "flight.Physics2DCollider on js requires flight_esm."

#else

#error "flight.Physics2DCollider: no backend for this target."

#end
