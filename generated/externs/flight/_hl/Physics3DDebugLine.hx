package flight._hl;

abstract Physics3DDebugLine(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(4);

	inline function set_bodyA(value:Int):Int { this.setI32(4, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(8);

	inline function set_bodyB(value:Int):Int { this.setI32(8, value); return value; }
	public var x0(get, set):Single;

	inline function get_x0():Single return this.getF32(12);

	inline function set_x0(value:Single):Single { this.setF32(12, value); return value; }
	public var y0(get, set):Single;

	inline function get_y0():Single return this.getF32(16);

	inline function set_y0(value:Single):Single { this.setF32(16, value); return value; }
	public var z0(get, set):Single;

	inline function get_z0():Single return this.getF32(20);

	inline function set_z0(value:Single):Single { this.setF32(20, value); return value; }
	public var x1(get, set):Single;

	inline function get_x1():Single return this.getF32(24);

	inline function set_x1(value:Single):Single { this.setF32(24, value); return value; }
	public var y1(get, set):Single;

	inline function get_y1():Single return this.getF32(28);

	inline function set_y1(value:Single):Single { this.setF32(28, value); return value; }
	public var z1(get, set):Single;

	inline function get_z1():Single return this.getF32(32);

	inline function set_z1(value:Single):Single { this.setF32(32, value); return value; }
}
