package flight._js;

abstract Cursor(Dynamic) {
	inline public function free():Void {
		flight._js._fn.Interaction.freeCursor(cast this);
	}
}
