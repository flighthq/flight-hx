package flight;

#if hl

typedef StorageClearResult = flight._hl.StorageClearResult;

#elseif cpp

typedef StorageClearResult = flight._cpp.StorageClearResult;

#elseif (js && flight_esm)

typedef StorageClearResult = flight._js.StorageClearResult;

#elseif js

#error "flight.StorageClearResult on js requires flight_esm."

#else

#error "flight.StorageClearResult: no backend for this target."

#end
