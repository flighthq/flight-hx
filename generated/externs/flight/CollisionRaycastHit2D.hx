package flight;

#if hl

typedef CollisionRaycastHit2D = flight._hl.CollisionRaycastHit2D;

#elseif cpp

typedef CollisionRaycastHit2D = flight._cpp.CollisionRaycastHit2D;

#elseif (js && flight_esm)

typedef CollisionRaycastHit2D = flight._js.CollisionRaycastHit2D;

#elseif js

#error "flight.CollisionRaycastHit2D on js requires flight_esm."

#else

#error "flight.CollisionRaycastHit2D: no backend for this target."

#end
