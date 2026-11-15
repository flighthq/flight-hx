package flight._hl;

abstract GlyphRasterizedBitmap(hl.Bytes) {
	public var advance(get, set):Single;

	inline function get_advance():Single return this.getF32(0);

	inline function set_advance(value:Single):Single { this.setF32(0, value); return value; }
	public var bearingX(get, set):Int;

	inline function get_bearingX():Int return this.getI32(4);

	inline function set_bearingX(value:Int):Int { this.setI32(4, value); return value; }
	public var bearingY(get, set):Int;

	inline function get_bearingY():Int return this.getI32(8);

	inline function set_bearingY(value:Int):Int { this.setI32(8, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(12);

	inline function set_height(value:Int):Int { this.setI32(12, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(32);

	inline function set_width(value:Int):Int { this.setI32(32, value); return value; }
}
