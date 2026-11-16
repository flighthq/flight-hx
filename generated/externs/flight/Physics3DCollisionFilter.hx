package flight;

#if hl

typedef Physics3DCollisionFilter = flight._hl.Physics3DCollisionFilter;

#elseif cpp

typedef Physics3DCollisionFilter = flight._cpp.Physics3DCollisionFilter;

#elseif (js && flight_esm)

typedef Physics3DCollisionFilter = flight._js.Physics3DCollisionFilter;

#elseif js

#error "flight.Physics3DCollisionFilter on js requires flight_esm."

#else

#error "flight.Physics3DCollisionFilter: no backend for this target."

#end
