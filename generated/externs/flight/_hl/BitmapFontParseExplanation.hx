package flight._hl;

abstract BitmapFontParseExplanation(hl.Bytes) {
	public var charCount(get, set):Int;

	inline function get_charCount():Int return this.getI32(24);

	inline function set_charCount(value:Int):Int { this.setI32(24, value); return value; }
	public var kerningCount(get, set):Int;

	inline function get_kerningCount():Int return this.getI32(32);

	inline function set_kerningCount(value:Int):Int { this.setI32(32, value); return value; }
	public var pageCount(get, set):Int;

	inline function get_pageCount():Int return this.getI32(40);

	inline function set_pageCount(value:Int):Int { this.setI32(40, value); return value; }
	public var success(get, set):Bool;

	inline function get_success():Bool return this.getUI8(56) != 0;

	inline function set_success(value:Bool):Bool { this.setUI8(56, value ? 1 : 0); return value; }
}
