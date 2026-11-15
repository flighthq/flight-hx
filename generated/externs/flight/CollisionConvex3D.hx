package flight;

#if hl

typedef CollisionConvex3D = flight._hl.CollisionConvex3D;

#elseif cpp

typedef CollisionConvex3D = flight._cpp.CollisionConvex3D;

#elseif (js && flight_esm)

typedef CollisionConvex3D = flight._js.CollisionConvex3D;

#elseif js

#error "flight.CollisionConvex3D on js requires flight_esm."

#else

#error "flight.CollisionConvex3D: no backend for this target."

#end
