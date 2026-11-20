package flight._hl;

abstract GlyphAtlasEntryExplanation(hl.Bytes) {
	public var renderable(get, set):Bool;

	inline function get_renderable():Bool return this.getUI8(20) != 0;

	inline function set_renderable(value:Bool):Bool { this.setUI8(20, value ? 1 : 0); return value; }
	public var glyphWidth(get, set):Int;

	inline function get_glyphWidth():Int return this.getI32(4);

	inline function set_glyphWidth(value:Int):Int { this.setI32(4, value); return value; }
	public var glyphHeight(get, set):Int;

	inline function get_glyphHeight():Int return this.getI32(8);

	inline function set_glyphHeight(value:Int):Int { this.setI32(8, value); return value; }
	public var usableWidth(get, set):Int;

	inline function get_usableWidth():Int return this.getI32(12);

	inline function set_usableWidth(value:Int):Int { this.setI32(12, value); return value; }
	public var usableHeight(get, set):Int;

	inline function get_usableHeight():Int return this.getI32(16);

	inline function set_usableHeight(value:Int):Int { this.setI32(16, value); return value; }
}
