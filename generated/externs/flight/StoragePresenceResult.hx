package flight;

#if hl

typedef StoragePresenceResult = flight._hl.StoragePresenceResult;

#elseif cpp

typedef StoragePresenceResult = flight._cpp.StoragePresenceResult;

#elseif (js && flight_esm)

typedef StoragePresenceResult = flight._js.StoragePresenceResult;

#elseif js

#error "flight.StoragePresenceResult on js requires flight_esm."

#else

#error "flight.StoragePresenceResult: no backend for this target."

#end
