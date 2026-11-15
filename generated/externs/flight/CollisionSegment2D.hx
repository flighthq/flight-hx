package flight;

#if hl

typedef CollisionSegment2D = flight._hl.CollisionSegment2D;

#elseif cpp

typedef CollisionSegment2D = flight._cpp.CollisionSegment2D;

#elseif (js && flight_esm)

typedef CollisionSegment2D = flight._js.CollisionSegment2D;

#elseif js

#error "flight.CollisionSegment2D on js requires flight_esm."

#else

#error "flight.CollisionSegment2D: no backend for this target."

#end
