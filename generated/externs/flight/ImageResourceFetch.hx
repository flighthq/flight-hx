package flight;

#if hl

typedef ImageResourceFetch = flight._hl.ImageResourceFetch;

#elseif cpp

typedef ImageResourceFetch = flight._cpp.ImageResourceFetch;

#elseif (js && flight_esm)

typedef ImageResourceFetch = flight._js.ImageResourceFetch;

#elseif js

#error "flight.ImageResourceFetch on js requires flight_esm."

#else

#error "flight.ImageResourceFetch: no backend for this target."

#end
