package flight._hl;

abstract Camera2D(hl.Bytes) {
	public var rotation(get, set):Float;

	inline function get_rotation():Float return this.getF64(16);

	inline function set_rotation(value:Float):Float { this.setF64(16, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(24);

	inline function set_x(value:Float):Float { this.setF64(24, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(32);

	inline function set_y(value:Float):Float { this.setF64(32, value); return value; }
	public var zoom(get, set):Float;

	inline function get_zoom():Float return this.getF64(40);

	inline function set_zoom(value:Float):Float { this.setF64(40, value); return value; }
}
