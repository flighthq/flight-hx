package flight._hl;

abstract Physics2DJointResolution(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(0);

	inline function set_bodyA(value:Int):Int { this.setI32(0, value); return value; }
	public var bodyAFound(get, set):Bool;

	inline function get_bodyAFound():Bool return this.getUI8(4) != 0;

	inline function set_bodyAFound(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var bodyAUsed(get, set):Bool;

	inline function get_bodyAUsed():Bool return this.getUI8(5) != 0;

	inline function set_bodyAUsed(value:Bool):Bool { this.setUI8(5, value ? 1 : 0); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(8);

	inline function set_bodyB(value:Int):Int { this.setI32(8, value); return value; }
	public var bodyBFound(get, set):Bool;

	inline function get_bodyBFound():Bool return this.getUI8(12) != 0;

	inline function set_bodyBFound(value:Bool):Bool { this.setUI8(12, value ? 1 : 0); return value; }
	public var jointIndex(get, set):Int;

	inline function get_jointIndex():Int return this.getI32(16);

	inline function set_jointIndex(value:Int):Int { this.setI32(16, value); return value; }
	public var solverRegistered(get, set):Bool;

	inline function get_solverRegistered():Bool return this.getUI8(48) != 0;

	inline function set_solverRegistered(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
}
