package flight;

#if hl

typedef StorageMigrationOk = flight._hl.StorageMigrationOk;

#elseif cpp

typedef StorageMigrationOk = flight._cpp.StorageMigrationOk;

#elseif (js && flight_esm)

typedef StorageMigrationOk = flight._js.StorageMigrationOk;

#elseif js

#error "flight.StorageMigrationOk on js requires flight_esm."

#else

#error "flight.StorageMigrationOk: no backend for this target."

#end
