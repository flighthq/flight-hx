package flight._hl;

abstract BitmapFontKerningPair(hl.Bytes) {
	public var left(get, set):Int;

	inline function get_left():Int return this.getI32(0);

	inline function set_left(value:Int):Int { this.setI32(0, value); return value; }
	public var right(get, set):Int;

	inline function get_right():Int return this.getI32(4);

	inline function set_right(value:Int):Int { this.setI32(4, value); return value; }
}
