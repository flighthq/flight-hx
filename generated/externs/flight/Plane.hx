package flight;

#if hl

typedef Plane = flight._hl.Plane;

#elseif cpp

typedef Plane = flight._cpp.Plane;

#elseif (js && flight_esm)

typedef Plane = flight._js.Plane;

#elseif js

#error "flight.Plane on js requires flight_esm."

#else

#error "flight.Plane: no backend for this target."

#end
