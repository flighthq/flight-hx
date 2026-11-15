package flight;

#if hl

typedef Physics3DCollider = flight._hl.Physics3DCollider;

#elseif cpp

typedef Physics3DCollider = flight._cpp.Physics3DCollider;

#elseif (js && flight_esm)

typedef Physics3DCollider = flight._js.Physics3DCollider;

#elseif js

#error "flight.Physics3DCollider on js requires flight_esm."

#else

#error "flight.Physics3DCollider: no backend for this target."

#end
