package flight;

#if hl

typedef Physics2DRayHit = flight._hl.Physics2DRayHit;

#elseif cpp

typedef Physics2DRayHit = flight._cpp.Physics2DRayHit;

#elseif (js && flight_esm)

typedef Physics2DRayHit = flight._js.Physics2DRayHit;

#elseif js

#error "flight.Physics2DRayHit on js requires flight_esm."

#else

#error "flight.Physics2DRayHit: no backend for this target."

#end
