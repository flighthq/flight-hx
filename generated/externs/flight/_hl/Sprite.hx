package flight._hl;

abstract Sprite(hl.Bytes) {
	inline public function clone():Dynamic {
		return flight._hl._fn.Scene2d.cloneSprite(cast this);
	}
	inline public function getRuntime():Dynamic {
		return flight._hl._fn.Scene2d.getSpriteRuntime(cast this);
	}
}
