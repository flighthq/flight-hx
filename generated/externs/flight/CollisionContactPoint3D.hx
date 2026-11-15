package flight;

#if hl

typedef CollisionContactPoint3D = flight._hl.CollisionContactPoint3D;

#elseif cpp

typedef CollisionContactPoint3D = flight._cpp.CollisionContactPoint3D;

#elseif (js && flight_esm)

typedef CollisionContactPoint3D = flight._js.CollisionContactPoint3D;

#elseif js

#error "flight.CollisionContactPoint3D on js requires flight_esm."

#else

#error "flight.CollisionContactPoint3D: no backend for this target."

#end
