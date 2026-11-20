package flight._hl;

abstract BitmapRegion(hl.Bytes) {
	public var x(get, set):Int;

	inline function get_x():Int return this.getI32(8);

	inline function set_x(value:Int):Int { this.setI32(8, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return this.getI32(12);

	inline function set_y(value:Int):Int { this.setI32(12, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(16);

	inline function set_width(value:Int):Int { this.setI32(16, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(20);

	inline function set_height(value:Int):Int { this.setI32(20, value); return value; }
}
