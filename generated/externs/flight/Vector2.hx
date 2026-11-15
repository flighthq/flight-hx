package flight;

#if hl

typedef Vector2 = flight._hl.Vector2;

#elseif cpp

typedef Vector2 = flight._cpp.Vector2;

#elseif (js && flight_esm)

typedef Vector2 = flight._js.Vector2;

#elseif js

#error "flight.Vector2 on js requires flight_esm."

#else

#error "flight.Vector2: no backend for this target."

#end
