package flight._cpp;

abstract Cursor(cpp.Star<cpp.Void>) {
	extern inline public function free():Void {
		flight._cpp._fn.Interaction.freeCursor(cast this);
	}
}
