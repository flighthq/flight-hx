package flight;

#if hl

typedef CollisionTimeOfImpact2D = flight._hl.CollisionTimeOfImpact2D;

#elseif cpp

typedef CollisionTimeOfImpact2D = flight._cpp.CollisionTimeOfImpact2D;

#elseif (js && flight_esm)

typedef CollisionTimeOfImpact2D = flight._js.CollisionTimeOfImpact2D;

#elseif js

#error "flight.CollisionTimeOfImpact2D on js requires flight_esm."

#else

#error "flight.CollisionTimeOfImpact2D: no backend for this target."

#end
