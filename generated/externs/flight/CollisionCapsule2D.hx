package flight;

#if hl

typedef CollisionCapsule2D = flight._hl.CollisionCapsule2D;

#elseif cpp

typedef CollisionCapsule2D = flight._cpp.CollisionCapsule2D;

#elseif (js && flight_esm)

typedef CollisionCapsule2D = flight._js.CollisionCapsule2D;

#elseif js

#error "flight.CollisionCapsule2D on js requires flight_esm."

#else

#error "flight.CollisionCapsule2D: no backend for this target."

#end
