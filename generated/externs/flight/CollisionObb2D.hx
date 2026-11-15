package flight;

#if hl

typedef CollisionObb2D = flight._hl.CollisionObb2D;

#elseif cpp

typedef CollisionObb2D = flight._cpp.CollisionObb2D;

#elseif (js && flight_esm)

typedef CollisionObb2D = flight._js.CollisionObb2D;

#elseif js

#error "flight.CollisionObb2D on js requires flight_esm."

#else

#error "flight.CollisionObb2D: no backend for this target."

#end
