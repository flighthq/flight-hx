package flight;

#if hl

typedef Physics3DContactPoint = flight._hl.Physics3DContactPoint;

#elseif cpp

typedef Physics3DContactPoint = flight._cpp.Physics3DContactPoint;

#elseif (js && flight_esm)

typedef Physics3DContactPoint = flight._js.Physics3DContactPoint;

#elseif js

#error "flight.Physics3DContactPoint on js requires flight_esm."

#else

#error "flight.Physics3DContactPoint: no backend for this target."

#end
