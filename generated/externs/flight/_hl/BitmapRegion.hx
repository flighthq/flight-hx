package flight._hl;

abstract BitmapRegion(hl.Bytes) {
	public var x(get, set):Int;

	inline function get_x():Int return this.getI32(88);

	inline function set_x(value:Int):Int { this.setI32(88, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return this.getI32(92);

	inline function set_y(value:Int):Int { this.setI32(92, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(96);

	inline function set_width(value:Int):Int { this.setI32(96, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(100);

	inline function set_height(value:Int):Int { this.setI32(100, value); return value; }
}
