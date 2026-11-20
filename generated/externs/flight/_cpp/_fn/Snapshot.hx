package flight._cpp._fn;

extern class Snapshot {
	@:native("flight_disable_snapshot_guards")
	public static function disableSnapshotGuards(guards:flight._cpp.SnapshotGuardState):Void;
	@:native("flight_equals_snapshot")
	public static function equalsSnapshot(a:flight._cpp.Snapshot, b:flight._cpp.Snapshot):Bool;
}
