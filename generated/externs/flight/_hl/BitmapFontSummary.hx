package flight._hl;

abstract BitmapFontSummary(hl.Bytes) {
	public var byteSize(get, set):Int;

	inline function get_byteSize():Int return this.getI32(0);

	inline function set_byteSize(value:Int):Int { this.setI32(0, value); return value; }
	public var glyphCount(get, set):Int;

	inline function get_glyphCount():Int return this.getI32(8);

	inline function set_glyphCount(value:Int):Int { this.setI32(8, value); return value; }
	public var kerningPairCount(get, set):Int;

	inline function get_kerningPairCount():Int return this.getI32(16);

	inline function set_kerningPairCount(value:Int):Int { this.setI32(16, value); return value; }
	public var maxCodepoint(get, set):Int;

	inline function get_maxCodepoint():Int return this.getI32(24);

	inline function set_maxCodepoint(value:Int):Int { this.setI32(24, value); return value; }
	public var minCodepoint(get, set):Int;

	inline function get_minCodepoint():Int return this.getI32(28);

	inline function set_minCodepoint(value:Int):Int { this.setI32(28, value); return value; }
	public var pageCount(get, set):Int;

	inline function get_pageCount():Int return this.getI32(32);

	inline function set_pageCount(value:Int):Int { this.setI32(32, value); return value; }
}
