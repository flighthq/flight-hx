package flight;

#if hl

typedef StorageEntriesResult = flight._hl.StorageEntriesResult;

#elseif cpp

typedef StorageEntriesResult = flight._cpp.StorageEntriesResult;

#elseif (js && flight_esm)

typedef StorageEntriesResult = flight._js.StorageEntriesResult;

#elseif js

#error "flight.StorageEntriesResult on js requires flight_esm."

#else

#error "flight.StorageEntriesResult: no backend for this target."

#end
