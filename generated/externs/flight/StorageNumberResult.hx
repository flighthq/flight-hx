package flight;

#if hl

typedef StorageNumberResult = flight._hl.StorageNumberResult;

#elseif cpp

typedef StorageNumberResult = flight._cpp.StorageNumberResult;

#elseif (js && flight_esm)

typedef StorageNumberResult = flight._js.StorageNumberResult;

#elseif js

#error "flight.StorageNumberResult on js requires flight_esm."

#else

#error "flight.StorageNumberResult: no backend for this target."

#end
