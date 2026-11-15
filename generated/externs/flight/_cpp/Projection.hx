package flight._cpp;

abstract Projection(cpp.Star<cpp.Void>) {
	inline public function isOrthographic():Bool {
		return flight._cpp._fn.Camera.isOrthographicProjection(cast this);
	}
	inline public function isPerspective():Bool {
		return flight._cpp._fn.Camera.isPerspectiveProjection(cast this);
	}
	inline public function isRaw():Bool {
		return flight._cpp._fn.Camera.isRawProjection(cast this);
	}
}
