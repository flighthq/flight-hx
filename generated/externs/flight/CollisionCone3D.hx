package flight;

#if hl

typedef CollisionCone3D = flight._hl.CollisionCone3D;

#elseif cpp

typedef CollisionCone3D = flight._cpp.CollisionCone3D;

#elseif (js && flight_esm)

typedef CollisionCone3D = flight._js.CollisionCone3D;

#elseif js

#error "flight.CollisionCone3D on js requires flight_esm."

#else

#error "flight.CollisionCone3D: no backend for this target."

#end
