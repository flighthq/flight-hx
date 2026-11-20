package flight;

#if hl

typedef StorageClearNamespaceResult = flight._hl.StorageClearNamespaceResult;

#elseif cpp

typedef StorageClearNamespaceResult = flight._cpp.StorageClearNamespaceResult;

#elseif (js && flight_esm)

typedef StorageClearNamespaceResult = flight._js.StorageClearNamespaceResult;

#elseif js

#error "flight.StorageClearNamespaceResult on js requires flight_esm."

#else

#error "flight.StorageClearNamespaceResult: no backend for this target."

#end
