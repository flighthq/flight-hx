package flight;

#if hl

typedef StorageSetItemResult = flight._hl.StorageSetItemResult;

#elseif cpp

typedef StorageSetItemResult = flight._cpp.StorageSetItemResult;

#elseif (js && flight_esm)

typedef StorageSetItemResult = flight._js.StorageSetItemResult;

#elseif js

#error "flight.StorageSetItemResult on js requires flight_esm."

#else

#error "flight.StorageSetItemResult: no backend for this target."

#end
