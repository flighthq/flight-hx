package flight._hl;

abstract Cursor(hl.Bytes) {
	inline public function free():Void {
		flight._hl._fn.Interaction.freeCursor(cast this);
	}
}
