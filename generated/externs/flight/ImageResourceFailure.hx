package flight;

#if hl

typedef ImageResourceFailure = flight._hl.ImageResourceFailure;

#elseif cpp

typedef ImageResourceFailure = flight._cpp.ImageResourceFailure;

#elseif (js && flight_esm)

typedef ImageResourceFailure = flight._js.ImageResourceFailure;

#elseif js

#error "flight.ImageResourceFailure on js requires flight_esm."

#else

#error "flight.ImageResourceFailure: no backend for this target."

#end
