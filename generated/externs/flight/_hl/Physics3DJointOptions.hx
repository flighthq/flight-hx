package flight._hl;

abstract Physics3DJointOptions(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(64);

	inline function set_bodyA(value:Int):Int { this.setI32(64, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(68);

	inline function set_bodyB(value:Int):Int { this.setI32(68, value); return value; }
}
