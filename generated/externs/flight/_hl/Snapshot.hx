package flight._hl;

abstract Snapshot(hl.Bytes) {
	inline public function equals(b:flight._hl.Snapshot):Bool {
		return flight._hl._fn.Snapshot.equalsSnapshot(cast this, b);
	}
}
