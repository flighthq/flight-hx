package flight._hl;

abstract BitmapMismatch(hl.Bytes) {
	public var mismatchedPixels(get, set):Int;

	inline function get_mismatchedPixels():Int return this.getI32(0);

	inline function set_mismatchedPixels(value:Int):Int { this.setI32(0, value); return value; }
	public var totalPixels(get, set):Int;

	inline function get_totalPixels():Int return this.getI32(4);

	inline function set_totalPixels(value:Int):Int { this.setI32(4, value); return value; }
	public var fraction(get, set):Float;

	inline function get_fraction():Float return this.getF64(8);

	inline function set_fraction(value:Float):Float { this.setF64(8, value); return value; }
	public var maxChannelDelta(get, set):Int;

	inline function get_maxChannelDelta():Int return this.getI32(16);

	inline function set_maxChannelDelta(value:Int):Int { this.setI32(16, value); return value; }
}
