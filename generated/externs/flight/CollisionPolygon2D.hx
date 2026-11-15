package flight;

#if hl

typedef CollisionPolygon2D = flight._hl.CollisionPolygon2D;

#elseif cpp

typedef CollisionPolygon2D = flight._cpp.CollisionPolygon2D;

#elseif (js && flight_esm)

typedef CollisionPolygon2D = flight._js.CollisionPolygon2D;

#elseif js

#error "flight.CollisionPolygon2D on js requires flight_esm."

#else

#error "flight.CollisionPolygon2D: no backend for this target."

#end
