package flight;

#if hl

typedef CollisionRegistry3D = flight._hl.CollisionRegistry3D;

#elseif cpp

typedef CollisionRegistry3D = flight._cpp.CollisionRegistry3D;

#elseif (js && flight_esm)

typedef CollisionRegistry3D = flight._js.CollisionRegistry3D;

#elseif js

#error "flight.CollisionRegistry3D on js requires flight_esm."

#else

#error "flight.CollisionRegistry3D: no backend for this target."

#end
