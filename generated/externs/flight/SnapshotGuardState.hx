package flight;

#if hl

typedef SnapshotGuardState = flight._hl.SnapshotGuardState;

#elseif cpp

typedef SnapshotGuardState = flight._cpp.SnapshotGuardState;

#elseif (js && flight_esm)

typedef SnapshotGuardState = flight._js.SnapshotGuardState;

#elseif js

#error "flight.SnapshotGuardState on js requires flight_esm."

#else

#error "flight.SnapshotGuardState: no backend for this target."

#end
