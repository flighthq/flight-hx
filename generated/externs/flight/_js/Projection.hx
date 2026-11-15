package flight._js;

abstract Projection(Dynamic) {
	inline public function isOrthographic():Bool {
		return flight._js._fn.Camera.isOrthographicProjection(cast this);
	}
	inline public function isPerspective():Bool {
		return flight._js._fn.Camera.isPerspectiveProjection(cast this);
	}
	inline public function isRaw():Bool {
		return flight._js._fn.Camera.isRawProjection(cast this);
	}
}
