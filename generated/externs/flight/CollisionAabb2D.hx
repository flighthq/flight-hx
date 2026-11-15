package flight;

#if hl

typedef CollisionAabb2D = flight._hl.CollisionAabb2D;

#elseif cpp

typedef CollisionAabb2D = flight._cpp.CollisionAabb2D;

#elseif (js && flight_esm)

typedef CollisionAabb2D = flight._js.CollisionAabb2D;

#elseif js

#error "flight.CollisionAabb2D on js requires flight_esm."

#else

#error "flight.CollisionAabb2D: no backend for this target."

#end
