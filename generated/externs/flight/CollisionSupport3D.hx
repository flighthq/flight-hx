package flight;

#if hl

typedef CollisionSupport3D = flight._hl.CollisionSupport3D;

#elseif cpp

typedef CollisionSupport3D = flight._cpp.CollisionSupport3D;

#elseif (js && flight_esm)

typedef CollisionSupport3D = flight._js.CollisionSupport3D;

#elseif js

#error "flight.CollisionSupport3D on js requires flight_esm."

#else

#error "flight.CollisionSupport3D: no backend for this target."

#end
