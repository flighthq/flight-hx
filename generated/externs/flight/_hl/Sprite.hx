package flight._hl;

abstract Sprite(hl.Bytes) {
	inline public function clone():hl.Bytes {
		return flight._hl._fn.Scene2D.cloneSprite(cast this);
	}
}
