package flight;

#if hl

typedef PerspectiveProjection = flight._hl.PerspectiveProjection;

#elseif cpp

typedef PerspectiveProjection = flight._cpp.PerspectiveProjection;

#elseif (js && flight_esm)

typedef PerspectiveProjection = flight._js.PerspectiveProjection;

#elseif js

#error "flight.PerspectiveProjection on js requires flight_esm."

#else

#error "flight.PerspectiveProjection: no backend for this target."

#end
