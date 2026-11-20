package flight;

#if hl

typedef StorageMigrationCheckpointFailed = flight._hl.StorageMigrationCheckpointFailed;

#elseif cpp

typedef StorageMigrationCheckpointFailed = flight._cpp.StorageMigrationCheckpointFailed;

#elseif (js && flight_esm)

typedef StorageMigrationCheckpointFailed = flight._js.StorageMigrationCheckpointFailed;

#elseif js

#error "flight.StorageMigrationCheckpointFailed on js requires flight_esm."

#else

#error "flight.StorageMigrationCheckpointFailed: no backend for this target."

#end
