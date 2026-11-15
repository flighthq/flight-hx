package flight;

#if hl

typedef CollisionTimeOfImpact3D = flight._hl.CollisionTimeOfImpact3D;

#elseif cpp

typedef CollisionTimeOfImpact3D = flight._cpp.CollisionTimeOfImpact3D;

#elseif (js && flight_esm)

typedef CollisionTimeOfImpact3D = flight._js.CollisionTimeOfImpact3D;

#elseif js

#error "flight.CollisionTimeOfImpact3D on js requires flight_esm."

#else

#error "flight.CollisionTimeOfImpact3D: no backend for this target."

#end
