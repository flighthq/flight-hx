package flight._cpp._fn;

extern class Snapshot {
	@:native("flight_create_snapshot_guard_state")
	public static function createSnapshotGuardState():flight._cpp.SnapshotGuardState;
	@:native("flight_disable_snapshot_guards")
	public static function disableSnapshotGuards(guards:flight._cpp.SnapshotGuardState):Void;
	@:native("flight_enable_snapshot_guards")
	public static function enableSnapshotGuards(guards:flight._cpp.SnapshotGuardState, logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_equals_snapshot")
	public static function equalsSnapshot(a:flight._cpp.Snapshot, b:flight._cpp.Snapshot):Bool;
	@:native("flight_free_snapshot_guard_state")
	public static function freeSnapshotGuardState(ptr:flight._cpp.SnapshotGuardState):Void;
}
