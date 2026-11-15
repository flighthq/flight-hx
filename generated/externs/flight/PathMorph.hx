package flight;

#if hl

typedef PathMorph = flight._hl.PathMorph;

#elseif cpp

typedef PathMorph = flight._cpp.PathMorph;

#elseif (js && flight_esm)

typedef PathMorph = flight._js.PathMorph;

#elseif js

#error "flight.PathMorph on js requires flight_esm."

#else

#error "flight.PathMorph: no backend for this target."

#end
