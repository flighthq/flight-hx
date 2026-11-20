package flight._hl._fn;

extern class Snapshot {
	@:hlNative("flight", "flight_disable_snapshot_guards")
	public static function disableSnapshotGuards(guards:flight._hl.SnapshotGuardState):Void;
	@:hlNative("flight", "flight_equals_snapshot")
	public static function equalsSnapshot(a:flight._hl.Snapshot, b:flight._hl.Snapshot):Bool;
}
