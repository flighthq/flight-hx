package flight;

#if hl

typedef StorageMigration = flight._hl.StorageMigration;

#elseif cpp

typedef StorageMigration = flight._cpp.StorageMigration;

#elseif (js && flight_esm)

typedef StorageMigration = flight._js.StorageMigration;

#elseif js

#error "flight.StorageMigration on js requires flight_esm."

#else

#error "flight.StorageMigration: no backend for this target."

#end
