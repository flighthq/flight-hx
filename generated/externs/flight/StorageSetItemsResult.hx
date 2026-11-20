package flight;

#if hl

typedef StorageSetItemsResult = flight._hl.StorageSetItemsResult;

#elseif cpp

typedef StorageSetItemsResult = flight._cpp.StorageSetItemsResult;

#elseif (js && flight_esm)

typedef StorageSetItemsResult = flight._js.StorageSetItemsResult;

#elseif js

#error "flight.StorageSetItemsResult on js requires flight_esm."

#else

#error "flight.StorageSetItemsResult: no backend for this target."

#end
