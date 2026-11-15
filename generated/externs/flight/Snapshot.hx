package flight;

#if hl

typedef Snapshot = flight._hl.Snapshot;

#elseif cpp

typedef Snapshot = flight._cpp.Snapshot;

#elseif (js && flight_esm)

typedef Snapshot = flight._js.Snapshot;

#elseif js

#error "flight.Snapshot on js requires flight_esm."

#else

#error "flight.Snapshot: no backend for this target."

#end

inline function createSnapshotGuardState():SnapshotGuardState {
#if hl
	return flight._hl._fn.Snapshot.createSnapshotGuardState();
#elseif cpp
	return flight._cpp._fn.Snapshot.createSnapshotGuardState();
#elseif (js && flight_esm)
	return flight._js._fn.Snapshot.createSnapshotGuardState();
#else
	#error "flight.Snapshot: no backend for this target."
#end
}
inline function disableSnapshotGuards(guards:SnapshotGuardState):Void {
#if hl
	flight._hl._fn.Snapshot.disableSnapshotGuards(guards);
#elseif cpp
	flight._cpp._fn.Snapshot.disableSnapshotGuards(guards);
#elseif (js && flight_esm)
	flight._js._fn.Snapshot.disableSnapshotGuards(guards);
#else
	#error "flight.Snapshot: no backend for this target."
#end
}
inline function enableSnapshotGuards(guards:SnapshotGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Snapshot.enableSnapshotGuards(guards, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Snapshot.enableSnapshotGuards(guards, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Snapshot.enableSnapshotGuards(guards, logState, clockFn, clockCtx);
#else
	#error "flight.Snapshot: no backend for this target."
#end
}
inline function equalsSnapshot(a:Snapshot, b:Snapshot):Bool {
#if hl
	return flight._hl._fn.Snapshot.equalsSnapshot(a, b);
#elseif cpp
	return flight._cpp._fn.Snapshot.equalsSnapshot(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Snapshot.equalsSnapshot(a, b);
#else
	#error "flight.Snapshot: no backend for this target."
#end
}
inline function freeSnapshotGuardState(ptr:SnapshotGuardState):Void {
#if hl
	flight._hl._fn.Snapshot.freeSnapshotGuardState(ptr);
#elseif cpp
	flight._cpp._fn.Snapshot.freeSnapshotGuardState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Snapshot.freeSnapshotGuardState(ptr);
#else
	#error "flight.Snapshot: no backend for this target."
#end
}
