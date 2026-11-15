package flight;

#if hl

typedef CollisionCylinder3D = flight._hl.CollisionCylinder3D;

#elseif cpp

typedef CollisionCylinder3D = flight._cpp.CollisionCylinder3D;

#elseif (js && flight_esm)

typedef CollisionCylinder3D = flight._js.CollisionCylinder3D;

#elseif js

#error "flight.CollisionCylinder3D on js requires flight_esm."

#else

#error "flight.CollisionCylinder3D: no backend for this target."

#end
