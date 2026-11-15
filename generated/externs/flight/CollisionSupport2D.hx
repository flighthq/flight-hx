package flight;

#if hl

typedef CollisionSupport2D = flight._hl.CollisionSupport2D;

#elseif cpp

typedef CollisionSupport2D = flight._cpp.CollisionSupport2D;

#elseif (js && flight_esm)

typedef CollisionSupport2D = flight._js.CollisionSupport2D;

#elseif js

#error "flight.CollisionSupport2D on js requires flight_esm."

#else

#error "flight.CollisionSupport2D: no backend for this target."

#end
