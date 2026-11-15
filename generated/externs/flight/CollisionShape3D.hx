package flight;

#if hl

typedef CollisionShape3D = flight._hl.CollisionShape3D;

#elseif cpp

typedef CollisionShape3D = flight._cpp.CollisionShape3D;

#elseif (js && flight_esm)

typedef CollisionShape3D = flight._js.CollisionShape3D;

#elseif js

#error "flight.CollisionShape3D on js requires flight_esm."

#else

#error "flight.CollisionShape3D: no backend for this target."

#end
