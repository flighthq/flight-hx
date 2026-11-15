package flight;

#if hl

typedef Physics2DQueryHit = flight._hl.Physics2DQueryHit;

#elseif cpp

typedef Physics2DQueryHit = flight._cpp.Physics2DQueryHit;

#elseif (js && flight_esm)

typedef Physics2DQueryHit = flight._js.Physics2DQueryHit;

#elseif js

#error "flight.Physics2DQueryHit on js requires flight_esm."

#else

#error "flight.Physics2DQueryHit: no backend for this target."

#end
