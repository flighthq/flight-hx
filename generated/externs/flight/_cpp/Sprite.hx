package flight._cpp;

abstract Sprite(cpp.Star<cpp.Void>) {
	extern inline public function clone():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Scene2d.cloneSprite(cast this);
	}
	extern inline public function getRuntime():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Scene2d.getSpriteRuntime(cast this);
	}
}
