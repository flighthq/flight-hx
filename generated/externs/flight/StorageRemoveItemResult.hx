package flight;

#if hl

typedef StorageRemoveItemResult = flight._hl.StorageRemoveItemResult;

#elseif cpp

typedef StorageRemoveItemResult = flight._cpp.StorageRemoveItemResult;

#elseif (js && flight_esm)

typedef StorageRemoveItemResult = flight._js.StorageRemoveItemResult;

#elseif js

#error "flight.StorageRemoveItemResult on js requires flight_esm."

#else

#error "flight.StorageRemoveItemResult: no backend for this target."

#end
