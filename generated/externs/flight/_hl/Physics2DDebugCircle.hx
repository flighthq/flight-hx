package flight._hl;

abstract Physics2DDebugCircle(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(0);

	inline function set_bodyA(value:Int):Int { this.setI32(0, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(4);

	inline function set_bodyB(value:Int):Int { this.setI32(4, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(16);

	inline function set_radius(value:Float):Float { this.setF64(16, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(24);

	inline function set_x(value:Float):Float { this.setF64(24, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(32);

	inline function set_y(value:Float):Float { this.setF64(32, value); return value; }
}
