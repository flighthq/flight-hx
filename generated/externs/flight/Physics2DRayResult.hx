package flight;

#if hl

typedef Physics2DRayResult = flight._hl.Physics2DRayResult;

#elseif cpp

typedef Physics2DRayResult = flight._cpp.Physics2DRayResult;

#elseif (js && flight_esm)

typedef Physics2DRayResult = flight._js.Physics2DRayResult;

#elseif js

#error "flight.Physics2DRayResult on js requires flight_esm."

#else

#error "flight.Physics2DRayResult: no backend for this target."

#end
