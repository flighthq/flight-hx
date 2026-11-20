package flight;

#if hl

typedef StorageBatchMutationOk = flight._hl.StorageBatchMutationOk;

#elseif cpp

typedef StorageBatchMutationOk = flight._cpp.StorageBatchMutationOk;

#elseif (js && flight_esm)

typedef StorageBatchMutationOk = flight._js.StorageBatchMutationOk;

#elseif js

#error "flight.StorageBatchMutationOk on js requires flight_esm."

#else

#error "flight.StorageBatchMutationOk: no backend for this target."

#end
