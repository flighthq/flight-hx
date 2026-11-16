package flight._js;

abstract Sprite(Dynamic) {
	inline public function clone():Dynamic {
		return flight._js._fn.Scene2D.cloneSprite(cast this);
	}
	inline public function getRuntime():Dynamic {
		return flight._js._fn.Scene2D.getSpriteRuntime(cast this);
	}
}
