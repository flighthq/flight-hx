package flight._hl;

abstract Physics2DRayHit(hl.Bytes) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return this.getI32(16);

	inline function set_colliderIndex(value:Int):Int { this.setI32(16, value); return value; }
	public var fraction(get, set):Float;

	inline function get_fraction():Float return this.getF64(24);

	inline function set_fraction(value:Float):Float { this.setF64(24, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return this.getF64(32);

	inline function set_normalX(value:Float):Float { this.setF64(32, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return this.getF64(40);

	inline function set_normalY(value:Float):Float { this.setF64(40, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(48);

	inline function set_x(value:Float):Float { this.setF64(48, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(56);

	inline function set_y(value:Float):Float { this.setF64(56, value); return value; }
}
