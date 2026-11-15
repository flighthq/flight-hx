package flight;

#if hl

typedef Projection = flight._hl.Projection;

#elseif cpp

typedef Projection = flight._cpp.Projection;

#elseif (js && flight_esm)

typedef Projection = flight._js.Projection;

#elseif js

#error "flight.Projection on js requires flight_esm."

#else

#error "flight.Projection: no backend for this target."

#end
