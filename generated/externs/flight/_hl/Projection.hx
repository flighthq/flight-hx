package flight._hl;

abstract Projection(hl.Bytes) {
	inline public function isOrthographic():Bool {
		return flight._hl._fn.Camera.isOrthographicProjection(cast this);
	}
	inline public function isPerspective():Bool {
		return flight._hl._fn.Camera.isPerspectiveProjection(cast this);
	}
	inline public function isRaw():Bool {
		return flight._hl._fn.Camera.isRawProjection(cast this);
	}
}
