package flight;

#if hl

typedef OrthographicProjection = flight._hl.OrthographicProjection;

#elseif cpp

typedef OrthographicProjection = flight._cpp.OrthographicProjection;

#elseif (js && flight_esm)

typedef OrthographicProjection = flight._js.OrthographicProjection;

#elseif js

#error "flight.OrthographicProjection on js requires flight_esm."

#else

#error "flight.OrthographicProjection: no backend for this target."

#end
