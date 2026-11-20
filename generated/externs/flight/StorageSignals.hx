package flight;

#if hl

typedef StorageSignals = flight._hl.StorageSignals;

#elseif cpp

typedef StorageSignals = flight._cpp.StorageSignals;

#elseif (js && flight_esm)

typedef StorageSignals = flight._js.StorageSignals;

#elseif js

#error "flight.StorageSignals on js requires flight_esm."

#else

#error "flight.StorageSignals: no backend for this target."

#end
