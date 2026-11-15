package flight;

#if hl

typedef CollisionPoint2D = flight._hl.CollisionPoint2D;

#elseif cpp

typedef CollisionPoint2D = flight._cpp.CollisionPoint2D;

#elseif (js && flight_esm)

typedef CollisionPoint2D = flight._js.CollisionPoint2D;

#elseif js

#error "flight.CollisionPoint2D on js requires flight_esm."

#else

#error "flight.CollisionPoint2D: no backend for this target."

#end
