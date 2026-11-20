package flight._hl;

abstract BitmapTextMissingGlyphs(hl.Bytes) {
	public var totalCodepoints(get, set):Int;

	inline function get_totalCodepoints():Int return this.getI32(24);

	inline function set_totalCodepoints(value:Int):Int { this.setI32(24, value); return value; }
}
