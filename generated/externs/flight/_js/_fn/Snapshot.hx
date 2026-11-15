package flight._js._fn;

@:jsRequire("flight")
extern class Snapshot {
	@:native("flight_create_snapshot_guard_state")
	public static function createSnapshotGuardState():flight._js.SnapshotGuardState;
	@:native("flight_disable_snapshot_guards")
	public static function disableSnapshotGuards(guards:flight._js.SnapshotGuardState):Void;
	@:native("flight_enable_snapshot_guards")
	public static function enableSnapshotGuards(guards:flight._js.SnapshotGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_equals_snapshot")
	public static function equalsSnapshot(a:flight._js.Snapshot, b:flight._js.Snapshot):Bool;
	@:native("flight_free_snapshot_guard_state")
	public static function freeSnapshotGuardState(ptr:flight._js.SnapshotGuardState):Void;
}
