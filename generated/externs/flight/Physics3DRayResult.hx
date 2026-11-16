package flight;

#if hl

typedef Physics3DRayResult = flight._hl.Physics3DRayResult;

#elseif cpp

typedef Physics3DRayResult = flight._cpp.Physics3DRayResult;

#elseif (js && flight_esm)

typedef Physics3DRayResult = flight._js.Physics3DRayResult;

#elseif js

#error "flight.Physics3DRayResult on js requires flight_esm."

#else

#error "flight.Physics3DRayResult: no backend for this target."

#end
