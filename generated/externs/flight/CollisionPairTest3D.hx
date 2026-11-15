package flight;

#if hl

typedef CollisionPairTest3D = flight._hl.CollisionPairTest3D;

#elseif cpp

typedef CollisionPairTest3D = flight._cpp.CollisionPairTest3D;

#elseif (js && flight_esm)

typedef CollisionPairTest3D = flight._js.CollisionPairTest3D;

#elseif js

#error "flight.CollisionPairTest3D on js requires flight_esm."

#else

#error "flight.CollisionPairTest3D: no backend for this target."

#end
