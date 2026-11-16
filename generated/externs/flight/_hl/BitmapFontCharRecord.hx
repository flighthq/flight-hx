package flight._hl;

abstract BitmapFontCharRecord(hl.Bytes) {
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(0);

	inline function set_height(value:Int):Int { this.setI32(0, value); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return this.getI32(4);

	inline function set_id(value:Int):Int { this.setI32(4, value); return value; }
	public var page(get, set):Int;

	inline function get_page():Int return this.getI32(8);

	inline function set_page(value:Int):Int { this.setI32(8, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(12);

	inline function set_width(value:Int):Int { this.setI32(12, value); return value; }
	public var x(get, set):Int;

	inline function get_x():Int return this.getI32(16);

	inline function set_x(value:Int):Int { this.setI32(16, value); return value; }
	public var xadvance(get, set):Single;

	inline function get_xadvance():Single return this.getF32(20);

	inline function set_xadvance(value:Single):Single { this.setF32(20, value); return value; }
	public var xoffset(get, set):Int;

	inline function get_xoffset():Int return this.getI32(24);

	inline function set_xoffset(value:Int):Int { this.setI32(24, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return this.getI32(28);

	inline function set_y(value:Int):Int { this.setI32(28, value); return value; }
	public var yoffset(get, set):Int;

	inline function get_yoffset():Int return this.getI32(32);

	inline function set_yoffset(value:Int):Int { this.setI32(32, value); return value; }
}
