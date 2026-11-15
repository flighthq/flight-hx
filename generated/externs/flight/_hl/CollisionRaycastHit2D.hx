package flight._hl;

abstract CollisionRaycastHit2D(hl.Bytes) {
	public var fraction(get, set):Float;

	inline function get_fraction():Float return this.getF64(0);

	inline function set_fraction(value:Float):Float { this.setF64(0, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(8);

	inline function set_x(value:Float):Float { this.setF64(8, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(16);

	inline function set_y(value:Float):Float { this.setF64(16, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return this.getF64(24);

	inline function set_normalX(value:Float):Float { this.setF64(24, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return this.getF64(32);

	inline function set_normalY(value:Float):Float { this.setF64(32, value); return value; }
}
