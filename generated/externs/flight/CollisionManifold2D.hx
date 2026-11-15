package flight;

#if hl

typedef CollisionManifold2D = flight._hl.CollisionManifold2D;

#elseif cpp

typedef CollisionManifold2D = flight._cpp.CollisionManifold2D;

#elseif (js && flight_esm)

typedef CollisionManifold2D = flight._js.CollisionManifold2D;

#elseif js

#error "flight.CollisionManifold2D on js requires flight_esm."

#else

#error "flight.CollisionManifold2D: no backend for this target."

#end
