package flight;

#if hl

typedef Physics2DCollisionExplanation = flight._hl.Physics2DCollisionExplanation;

#elseif cpp

typedef Physics2DCollisionExplanation = flight._cpp.Physics2DCollisionExplanation;

#elseif (js && flight_esm)

typedef Physics2DCollisionExplanation = flight._js.Physics2DCollisionExplanation;

#elseif js

#error "flight.Physics2DCollisionExplanation on js requires flight_esm."

#else

#error "flight.Physics2DCollisionExplanation: no backend for this target."

#end
