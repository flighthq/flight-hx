package flight;

#if hl

typedef StorageNumberOrResult = flight._hl.StorageNumberOrResult;

#elseif cpp

typedef StorageNumberOrResult = flight._cpp.StorageNumberOrResult;

#elseif (js && flight_esm)

typedef StorageNumberOrResult = flight._js.StorageNumberOrResult;

#elseif js

#error "flight.StorageNumberOrResult on js requires flight_esm."

#else

#error "flight.StorageNumberOrResult: no backend for this target."

#end
