package flight;

#if hl

typedef CollisionColliderShape3D = flight._hl.CollisionColliderShape3D;

#elseif cpp

typedef CollisionColliderShape3D = flight._cpp.CollisionColliderShape3D;

#elseif (js && flight_esm)

typedef CollisionColliderShape3D = flight._js.CollisionColliderShape3D;

#elseif js

#error "flight.CollisionColliderShape3D on js requires flight_esm."

#else

#error "flight.CollisionColliderShape3D: no backend for this target."

#end
