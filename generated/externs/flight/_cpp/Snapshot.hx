package flight._cpp;

abstract Snapshot(cpp.Star<cpp.Void>) {
	inline public function equals(b:flight._cpp.Snapshot):Bool {
		return flight._cpp._fn.Snapshot.equalsSnapshot(cast this, b);
	}
}
