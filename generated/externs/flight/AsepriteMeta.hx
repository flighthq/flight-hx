package flight;

#if hl

typedef AsepriteMeta = flight._hl.AsepriteMeta;

#elseif cpp

typedef AsepriteMeta = flight._cpp.AsepriteMeta;

#elseif (js && flight_esm)

typedef AsepriteMeta = flight._js.AsepriteMeta;

#elseif js

#error "flight.AsepriteMeta on js requires flight_esm."

#else

#error "flight.AsepriteMeta: no backend for this target."

#end
