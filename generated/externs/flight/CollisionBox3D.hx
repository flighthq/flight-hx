package flight;

#if hl

typedef CollisionBox3D = flight._hl.CollisionBox3D;

#elseif cpp

typedef CollisionBox3D = flight._cpp.CollisionBox3D;

#elseif (js && flight_esm)

typedef CollisionBox3D = flight._js.CollisionBox3D;

#elseif js

#error "flight.CollisionBox3D on js requires flight_esm."

#else

#error "flight.CollisionBox3D: no backend for this target."

#end
