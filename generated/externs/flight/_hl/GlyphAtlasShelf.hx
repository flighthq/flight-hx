package flight._hl;

abstract GlyphAtlasShelf(hl.Bytes) {
	public var cursorX(get, set):Int;

	inline function get_cursorX():Int return this.getI32(0);

	inline function set_cursorX(value:Int):Int { this.setI32(0, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(4);

	inline function set_height(value:Int):Int { this.setI32(4, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return this.getI32(8);

	inline function set_y(value:Int):Int { this.setI32(8, value); return value; }
}
