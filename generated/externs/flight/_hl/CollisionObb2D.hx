package flight._hl;

abstract CollisionObb2D(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(0);

	inline function set_x(value:Float):Float { this.setF64(0, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(8);

	inline function set_y(value:Float):Float { this.setF64(8, value); return value; }
	public var halfW(get, set):Float;

	inline function get_halfW():Float return this.getF64(16);

	inline function set_halfW(value:Float):Float { this.setF64(16, value); return value; }
	public var halfH(get, set):Float;

	inline function get_halfH():Float return this.getF64(24);

	inline function set_halfH(value:Float):Float { this.setF64(24, value); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return this.getF64(32);

	inline function set_rotation(value:Float):Float { this.setF64(32, value); return value; }
}
