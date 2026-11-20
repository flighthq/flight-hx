package flight;

#if hl

typedef StorageItemCountResult = flight._hl.StorageItemCountResult;

#elseif cpp

typedef StorageItemCountResult = flight._cpp.StorageItemCountResult;

#elseif (js && flight_esm)

typedef StorageItemCountResult = flight._js.StorageItemCountResult;

#elseif js

#error "flight.StorageItemCountResult on js requires flight_esm."

#else

#error "flight.StorageItemCountResult: no backend for this target."

#end
