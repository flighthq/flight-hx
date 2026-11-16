package flight._js._fn;

@:jsRequire("@flighthq/snapshot")
extern class Snapshot {
	@:native("createSnapshotGuardState")
	public static function createSnapshotGuardState():flight._js.SnapshotGuardState;
	@:native("disableSnapshotGuards")
	public static function disableSnapshotGuards(guards:flight._js.SnapshotGuardState):Void;
	@:native("enableSnapshotGuards")
	public static function enableSnapshotGuards(guards:flight._js.SnapshotGuardState, logState:Dynamic, clock:Dynamic):Void;
	@:native("equalsSnapshot")
	public static function equalsSnapshot(a:flight._js.Snapshot, b:flight._js.Snapshot):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSnapshotGuardState(ptr:flight._js.SnapshotGuardState):Void {}
}
