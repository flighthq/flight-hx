package flight;

#if hl

typedef CollisionManifold3D = flight._hl.CollisionManifold3D;

#elseif cpp

typedef CollisionManifold3D = flight._cpp.CollisionManifold3D;

#elseif (js && flight_esm)

typedef CollisionManifold3D = flight._js.CollisionManifold3D;

#elseif js

#error "flight.CollisionManifold3D on js requires flight_esm."

#else

#error "flight.CollisionManifold3D: no backend for this target."

#end
