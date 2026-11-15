package flight;

#if hl

typedef RigidBody3D = flight._hl.RigidBody3D;

#elseif cpp

typedef RigidBody3D = flight._cpp.RigidBody3D;

#elseif (js && flight_esm)

typedef RigidBody3D = flight._js.RigidBody3D;

#elseif js

#error "flight.RigidBody3D on js requires flight_esm."

#else

#error "flight.RigidBody3D: no backend for this target."

#end
