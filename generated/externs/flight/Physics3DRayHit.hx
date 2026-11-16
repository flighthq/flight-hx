package flight;

#if hl

typedef Physics3DRayHit = flight._hl.Physics3DRayHit;

#elseif cpp

typedef Physics3DRayHit = flight._cpp.Physics3DRayHit;

#elseif (js && flight_esm)

typedef Physics3DRayHit = flight._js.Physics3DRayHit;

#elseif js

#error "flight.Physics3DRayHit on js requires flight_esm."

#else

#error "flight.Physics3DRayHit: no backend for this target."

#end
