package flight;

#if hl

typedef Aabb = flight._hl.Aabb;

#elseif cpp

typedef Aabb = flight._cpp.Aabb;

#elseif (js && flight_esm)

typedef Aabb = flight._js.Aabb;

#elseif js

#error "flight.Aabb on js requires flight_esm."

#else

#error "flight.Aabb: no backend for this target."

#end
