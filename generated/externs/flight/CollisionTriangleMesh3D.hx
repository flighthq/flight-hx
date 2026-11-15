package flight;

#if hl

typedef CollisionTriangleMesh3D = flight._hl.CollisionTriangleMesh3D;

#elseif cpp

typedef CollisionTriangleMesh3D = flight._cpp.CollisionTriangleMesh3D;

#elseif (js && flight_esm)

typedef CollisionTriangleMesh3D = flight._js.CollisionTriangleMesh3D;

#elseif js

#error "flight.CollisionTriangleMesh3D on js requires flight_esm."

#else

#error "flight.CollisionTriangleMesh3D: no backend for this target."

#end
