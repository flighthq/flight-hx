package flight;

#if hl

typedef StorageGetItemResult = flight._hl.StorageGetItemResult;

#elseif cpp

typedef StorageGetItemResult = flight._cpp.StorageGetItemResult;

#elseif (js && flight_esm)

typedef StorageGetItemResult = flight._js.StorageGetItemResult;

#elseif js

#error "flight.StorageGetItemResult on js requires flight_esm."

#else

#error "flight.StorageGetItemResult: no backend for this target."

#end
