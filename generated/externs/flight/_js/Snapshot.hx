package flight._js;

abstract Snapshot(Dynamic) {
	inline public function equals(b:flight._js.Snapshot):Bool {
		return flight._js._fn.Snapshot.equalsSnapshot(cast this, b);
	}
}
