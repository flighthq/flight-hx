package flight;

#if hl

typedef Velocity2D = flight._hl.Velocity2D;

#elseif cpp

typedef Velocity2D = flight._cpp.Velocity2D;

#elseif (js && flight_esm)

typedef Velocity2D = flight._js.Velocity2D;

#elseif js

#error "flight.Velocity2D on js requires flight_esm."

#else

#error "flight.Velocity2D: no backend for this target."

#end
