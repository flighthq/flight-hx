package flight;

#if hl

typedef StorageItemOrResult = flight._hl.StorageItemOrResult;

#elseif cpp

typedef StorageItemOrResult = flight._cpp.StorageItemOrResult;

#elseif (js && flight_esm)

typedef StorageItemOrResult = flight._js.StorageItemOrResult;

#elseif js

#error "flight.StorageItemOrResult on js requires flight_esm."

#else

#error "flight.StorageItemOrResult: no backend for this target."

#end
