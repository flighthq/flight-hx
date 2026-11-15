package flight._hl;

abstract Physics2DContact(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(0);

	inline function set_bodyA(value:Int):Int { this.setI32(0, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(4);

	inline function set_bodyB(value:Int):Int { this.setI32(4, value); return value; }
	public var colliderA(get, set):Int;

	inline function get_colliderA():Int return this.getI32(8);

	inline function set_colliderA(value:Int):Int { this.setI32(8, value); return value; }
	public var colliderB(get, set):Int;

	inline function get_colliderB():Int return this.getI32(16);

	inline function set_colliderB(value:Int):Int { this.setI32(16, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(24) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var friction(get, set):Single;

	inline function get_friction():Single return this.getF32(28);

	inline function set_friction(value:Single):Single { this.setF32(28, value); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return this.getF32(32);

	inline function set_normalX(value:Single):Single { this.setF32(32, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return this.getF32(36);

	inline function set_normalY(value:Single):Single { this.setF32(36, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(40);

	inline function set_pointCount(value:Int):Int { this.setI32(40, value); return value; }
	public var restitution(get, set):Single;

	inline function get_restitution():Single return this.getF32(72);

	inline function set_restitution(value:Single):Single { this.setF32(72, value); return value; }
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return this.getUI8(76) != 0;

	inline function set_sensor(value:Bool):Bool { this.setUI8(76, value ? 1 : 0); return value; }
	public var touching(get, set):Bool;

	inline function get_touching():Bool return this.getUI8(77) != 0;

	inline function set_touching(value:Bool):Bool { this.setUI8(77, value ? 1 : 0); return value; }
}
