package flight;

#if hl

typedef QuadBatchRuntime = flight._hl.QuadBatchRuntime;

#elseif cpp

typedef QuadBatchRuntime = flight._cpp.QuadBatchRuntime;

#elseif (js && flight_esm)

typedef QuadBatchRuntime = flight._js.QuadBatchRuntime;

#elseif js

#error "flight.QuadBatchRuntime on js requires flight_esm."

#else

#error "flight.QuadBatchRuntime: no backend for this target."

#end
