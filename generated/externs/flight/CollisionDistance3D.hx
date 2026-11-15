package flight;

#if hl

typedef CollisionDistance3D = flight._hl.CollisionDistance3D;

#elseif cpp

typedef CollisionDistance3D = flight._cpp.CollisionDistance3D;

#elseif (js && flight_esm)

typedef CollisionDistance3D = flight._js.CollisionDistance3D;

#elseif js

#error "flight.CollisionDistance3D on js requires flight_esm."

#else

#error "flight.CollisionDistance3D: no backend for this target."

#end
