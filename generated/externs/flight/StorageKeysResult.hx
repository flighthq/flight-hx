package flight;

#if hl

typedef StorageKeysResult = flight._hl.StorageKeysResult;

#elseif cpp

typedef StorageKeysResult = flight._cpp.StorageKeysResult;

#elseif (js && flight_esm)

typedef StorageKeysResult = flight._js.StorageKeysResult;

#elseif js

#error "flight.StorageKeysResult on js requires flight_esm."

#else

#error "flight.StorageKeysResult: no backend for this target."

#end
