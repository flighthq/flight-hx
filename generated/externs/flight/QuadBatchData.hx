package flight;

#if hl

typedef QuadBatchData = flight._hl.QuadBatchData;

#elseif cpp

typedef QuadBatchData = flight._cpp.QuadBatchData;

#elseif (js && flight_esm)

typedef QuadBatchData = flight._js.QuadBatchData;

#elseif js

#error "flight.QuadBatchData on js requires flight_esm."

#else

#error "flight.QuadBatchData: no backend for this target."

#end
