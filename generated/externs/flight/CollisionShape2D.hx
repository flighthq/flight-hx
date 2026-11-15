package flight;

#if hl

typedef CollisionShape2D = flight._hl.CollisionShape2D;

#elseif cpp

typedef CollisionShape2D = flight._cpp.CollisionShape2D;

#elseif (js && flight_esm)

typedef CollisionShape2D = flight._js.CollisionShape2D;

#elseif js

#error "flight.CollisionShape2D on js requires flight_esm."

#else

#error "flight.CollisionShape2D: no backend for this target."

#end
