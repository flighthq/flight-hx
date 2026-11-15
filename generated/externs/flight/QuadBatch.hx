package flight;

#if hl

typedef QuadBatch = flight._hl.QuadBatch;

#elseif cpp

typedef QuadBatch = flight._cpp.QuadBatch;

#elseif (js && flight_esm)

typedef QuadBatch = flight._js.QuadBatch;

#elseif js

#error "flight.QuadBatch on js requires flight_esm."

#else

#error "flight.QuadBatch: no backend for this target."

#end
