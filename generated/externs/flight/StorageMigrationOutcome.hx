package flight;

#if hl

typedef StorageMigrationOutcome = flight._hl.StorageMigrationOutcome;

#elseif cpp

typedef StorageMigrationOutcome = flight._cpp.StorageMigrationOutcome;

#elseif (js && flight_esm)

typedef StorageMigrationOutcome = flight._js.StorageMigrationOutcome;

#elseif js

#error "flight.StorageMigrationOutcome on js requires flight_esm."

#else

#error "flight.StorageMigrationOutcome: no backend for this target."

#end
