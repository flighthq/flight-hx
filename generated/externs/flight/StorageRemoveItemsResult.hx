package flight;

#if hl

typedef StorageRemoveItemsResult = flight._hl.StorageRemoveItemsResult;

#elseif cpp

typedef StorageRemoveItemsResult = flight._cpp.StorageRemoveItemsResult;

#elseif (js && flight_esm)

typedef StorageRemoveItemsResult = flight._js.StorageRemoveItemsResult;

#elseif js

#error "flight.StorageRemoveItemsResult on js requires flight_esm."

#else

#error "flight.StorageRemoveItemsResult: no backend for this target."

#end
