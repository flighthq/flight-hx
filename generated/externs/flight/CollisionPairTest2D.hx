package flight;

#if hl

typedef CollisionPairTest2D = flight._hl.CollisionPairTest2D;

#elseif cpp

typedef CollisionPairTest2D = flight._cpp.CollisionPairTest2D;

#elseif (js && flight_esm)

typedef CollisionPairTest2D = flight._js.CollisionPairTest2D;

#elseif js

#error "flight.CollisionPairTest2D on js requires flight_esm."

#else

#error "flight.CollisionPairTest2D: no backend for this target."

#end
