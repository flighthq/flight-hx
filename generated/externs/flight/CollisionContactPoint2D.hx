package flight;

#if hl

typedef CollisionContactPoint2D = flight._hl.CollisionContactPoint2D;

#elseif cpp

typedef CollisionContactPoint2D = flight._cpp.CollisionContactPoint2D;

#elseif (js && flight_esm)

typedef CollisionContactPoint2D = flight._js.CollisionContactPoint2D;

#elseif js

#error "flight.CollisionContactPoint2D on js requires flight_esm."

#else

#error "flight.CollisionContactPoint2D: no backend for this target."

#end
