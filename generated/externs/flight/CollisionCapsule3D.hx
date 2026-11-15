package flight;

#if hl

typedef CollisionCapsule3D = flight._hl.CollisionCapsule3D;

#elseif cpp

typedef CollisionCapsule3D = flight._cpp.CollisionCapsule3D;

#elseif (js && flight_esm)

typedef CollisionCapsule3D = flight._js.CollisionCapsule3D;

#elseif js

#error "flight.CollisionCapsule3D on js requires flight_esm."

#else

#error "flight.CollisionCapsule3D: no backend for this target."

#end
