package flight;

#if hl

typedef QuadBatchSignals = flight._hl.QuadBatchSignals;

#elseif cpp

typedef QuadBatchSignals = flight._cpp.QuadBatchSignals;

#elseif (js && flight_esm)

typedef QuadBatchSignals = flight._js.QuadBatchSignals;

#elseif js

#error "flight.QuadBatchSignals on js requires flight_esm."

#else

#error "flight.QuadBatchSignals: no backend for this target."

#end
