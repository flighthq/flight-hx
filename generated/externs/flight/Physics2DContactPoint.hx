package flight;

#if hl

typedef Physics2DContactPoint = flight._hl.Physics2DContactPoint;

#elseif cpp

typedef Physics2DContactPoint = flight._cpp.Physics2DContactPoint;

#elseif (js && flight_esm)

typedef Physics2DContactPoint = flight._js.Physics2DContactPoint;

#elseif js

#error "flight.Physics2DContactPoint on js requires flight_esm."

#else

#error "flight.Physics2DContactPoint: no backend for this target."

#end
