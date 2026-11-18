package flight;

#if hl

typedef Blob = flight._hl.Blob;

#elseif cpp

typedef Blob = flight._cpp.Blob;

#elseif (js && flight_esm)

typedef Blob = flight._js.Blob;

#elseif js

#error "flight.Blob on js requires flight_esm."

#else

#error "flight.Blob: no backend for this target."

#end
