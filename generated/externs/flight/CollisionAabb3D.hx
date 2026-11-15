package flight;

#if hl

typedef CollisionAabb3D = flight._hl.CollisionAabb3D;

#elseif cpp

typedef CollisionAabb3D = flight._cpp.CollisionAabb3D;

#elseif (js && flight_esm)

typedef CollisionAabb3D = flight._js.CollisionAabb3D;

#elseif js

#error "flight.CollisionAabb3D on js requires flight_esm."

#else

#error "flight.CollisionAabb3D: no backend for this target."

#end
