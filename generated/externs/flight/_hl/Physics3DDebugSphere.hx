package flight._hl;

abstract Physics3DDebugSphere(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(4);

	inline function set_bodyA(value:Int):Int { this.setI32(4, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(8);

	inline function set_bodyB(value:Int):Int { this.setI32(8, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(12);

	inline function set_x(value:Single):Single { this.setF32(12, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(16);

	inline function set_y(value:Single):Single { this.setF32(16, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(20);

	inline function set_z(value:Single):Single { this.setF32(20, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(24);

	inline function set_radius(value:Single):Single { this.setF32(24, value); return value; }
}
