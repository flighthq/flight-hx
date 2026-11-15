package flight._hl;

abstract BitmapFontKerningData(hl.Bytes) {
	public var amount(get, set):Single;

	inline function get_amount():Single return this.getF32(0);

	inline function set_amount(value:Single):Single { this.setF32(0, value); return value; }
	public var left(get, set):Int;

	inline function get_left():Int return this.getI32(4);

	inline function set_left(value:Int):Int { this.setI32(4, value); return value; }
	public var right(get, set):Int;

	inline function get_right():Int return this.getI32(8);

	inline function set_right(value:Int):Int { this.setI32(8, value); return value; }
}
