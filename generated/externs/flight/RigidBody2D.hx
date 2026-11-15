package flight;

#if hl

typedef RigidBody2D = flight._hl.RigidBody2D;

#elseif cpp

typedef RigidBody2D = flight._cpp.RigidBody2D;

#elseif (js && flight_esm)

typedef RigidBody2D = flight._js.RigidBody2D;

#elseif js

#error "flight.RigidBody2D on js requires flight_esm."

#else

#error "flight.RigidBody2D: no backend for this target."

#end
