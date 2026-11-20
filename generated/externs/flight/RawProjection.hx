package flight;

#if hl

typedef RawProjection = flight._hl.RawProjection;

#elseif cpp

typedef RawProjection = flight._cpp.RawProjection;

#elseif (js && flight_esm)

typedef RawProjection = flight._js.RawProjection;

#elseif js

#error "flight.RawProjection on js requires flight_esm."

#else

#error "flight.RawProjection: no backend for this target."

#end
