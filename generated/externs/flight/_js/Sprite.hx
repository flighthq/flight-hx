package flight._js;

abstract Sprite(Dynamic) {
	inline public function clone():Dynamic {
		return flight._js._fn.Scene2D.cloneSprite(cast this);
	}
}
