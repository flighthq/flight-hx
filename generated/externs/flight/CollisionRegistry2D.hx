package flight;

#if hl

typedef CollisionRegistry2D = flight._hl.CollisionRegistry2D;

#elseif cpp

typedef CollisionRegistry2D = flight._cpp.CollisionRegistry2D;

#elseif (js && flight_esm)

typedef CollisionRegistry2D = flight._js.CollisionRegistry2D;

#elseif js

#error "flight.CollisionRegistry2D on js requires flight_esm."

#else

#error "flight.CollisionRegistry2D: no backend for this target."

#end
