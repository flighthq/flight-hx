package flight;

#if hl

typedef CollisionContactManifold3D = flight._hl.CollisionContactManifold3D;

#elseif cpp

typedef CollisionContactManifold3D = flight._cpp.CollisionContactManifold3D;

#elseif (js && flight_esm)

typedef CollisionContactManifold3D = flight._js.CollisionContactManifold3D;

#elseif js

#error "flight.CollisionContactManifold3D on js requires flight_esm."

#else

#error "flight.CollisionContactManifold3D: no backend for this target."

#end
