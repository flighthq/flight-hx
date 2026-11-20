package flight;

#if hl

typedef StorageNamespace = flight._hl.StorageNamespace;

#elseif cpp

typedef StorageNamespace = flight._cpp.StorageNamespace;

#elseif (js && flight_esm)

typedef StorageNamespace = flight._js.StorageNamespace;

#elseif js

#error "flight.StorageNamespace on js requires flight_esm."

#else

#error "flight.StorageNamespace: no backend for this target."

#end
