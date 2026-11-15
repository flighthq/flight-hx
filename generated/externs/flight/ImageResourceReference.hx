package flight;

#if hl

typedef ImageResourceReference = flight._hl.ImageResourceReference;

#elseif cpp

typedef ImageResourceReference = flight._cpp.ImageResourceReference;

#elseif (js && flight_esm)

typedef ImageResourceReference = flight._js.ImageResourceReference;

#elseif js

#error "flight.ImageResourceReference on js requires flight_esm."

#else

#error "flight.ImageResourceReference: no backend for this target."

#end
