package flight;

#if hl

typedef CollisionContactManifold2D = flight._hl.CollisionContactManifold2D;

#elseif cpp

typedef CollisionContactManifold2D = flight._cpp.CollisionContactManifold2D;

#elseif (js && flight_esm)

typedef CollisionContactManifold2D = flight._js.CollisionContactManifold2D;

#elseif js

#error "flight.CollisionContactManifold2D on js requires flight_esm."

#else

#error "flight.CollisionContactManifold2D: no backend for this target."

#end
