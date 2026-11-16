package flight;

#if hl

typedef Physics3DQueryHit = flight._hl.Physics3DQueryHit;

#elseif cpp

typedef Physics3DQueryHit = flight._cpp.Physics3DQueryHit;

#elseif (js && flight_esm)

typedef Physics3DQueryHit = flight._js.Physics3DQueryHit;

#elseif js

#error "flight.Physics3DQueryHit on js requires flight_esm."

#else

#error "flight.Physics3DQueryHit: no backend for this target."

#end
