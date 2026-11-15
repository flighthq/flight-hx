package flight;

#if hl

typedef Physics2DCollisionFilter = flight._hl.Physics2DCollisionFilter;

#elseif cpp

typedef Physics2DCollisionFilter = flight._cpp.Physics2DCollisionFilter;

#elseif (js && flight_esm)

typedef Physics2DCollisionFilter = flight._js.Physics2DCollisionFilter;

#elseif js

#error "flight.Physics2DCollisionFilter on js requires flight_esm."

#else

#error "flight.Physics2DCollisionFilter: no backend for this target."

#end
