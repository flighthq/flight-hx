package flight;

#if hl

typedef CollisionRaycastHit3D = flight._hl.CollisionRaycastHit3D;

#elseif cpp

typedef CollisionRaycastHit3D = flight._cpp.CollisionRaycastHit3D;

#elseif (js && flight_esm)

typedef CollisionRaycastHit3D = flight._js.CollisionRaycastHit3D;

#elseif js

#error "flight.CollisionRaycastHit3D on js requires flight_esm."

#else

#error "flight.CollisionRaycastHit3D: no backend for this target."

#end
