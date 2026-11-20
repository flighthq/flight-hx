package flight;

#if hl

typedef StorageItemsResult = flight._hl.StorageItemsResult;

#elseif cpp

typedef StorageItemsResult = flight._cpp.StorageItemsResult;

#elseif (js && flight_esm)

typedef StorageItemsResult = flight._js.StorageItemsResult;

#elseif js

#error "flight.StorageItemsResult on js requires flight_esm."

#else

#error "flight.StorageItemsResult: no backend for this target."

#end
