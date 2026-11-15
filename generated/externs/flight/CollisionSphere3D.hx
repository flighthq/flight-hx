package flight;

#if hl

typedef CollisionSphere3D = flight._hl.CollisionSphere3D;

#elseif cpp

typedef CollisionSphere3D = flight._cpp.CollisionSphere3D;

#elseif (js && flight_esm)

typedef CollisionSphere3D = flight._js.CollisionSphere3D;

#elseif js

#error "flight.CollisionSphere3D on js requires flight_esm."

#else

#error "flight.CollisionSphere3D: no backend for this target."

#end
