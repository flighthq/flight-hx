package flight;

#if hl

typedef CollisionCircle2D = flight._hl.CollisionCircle2D;

#elseif cpp

typedef CollisionCircle2D = flight._cpp.CollisionCircle2D;

#elseif (js && flight_esm)

typedef CollisionCircle2D = flight._js.CollisionCircle2D;

#elseif js

#error "flight.CollisionCircle2D on js requires flight_esm."

#else

#error "flight.CollisionCircle2D: no backend for this target."

#end
