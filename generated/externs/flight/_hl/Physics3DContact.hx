package flight._hl;

abstract Physics3DContact(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(104);

	inline function set_bodyA(value:Int):Int { this.setI32(104, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(108);

	inline function set_bodyB(value:Int):Int { this.setI32(108, value); return value; }
	public var colliderA(get, set):Int;

	inline function get_colliderA():Int return this.getI32(40);

	inline function set_colliderA(value:Int):Int { this.setI32(40, value); return value; }
	public var colliderB(get, set):Int;

	inline function get_colliderB():Int return this.getI32(48);

	inline function set_colliderB(value:Int):Int { this.setI32(48, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return this.getF64(56);

	inline function set_normalX(value:Float):Float { this.setF64(56, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return this.getF64(64);

	inline function set_normalY(value:Float):Float { this.setF64(64, value); return value; }
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return this.getF64(72);

	inline function set_normalZ(value:Float):Float { this.setF64(72, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(80);

	inline function set_pointCount(value:Int):Int { this.setI32(80, value); return value; }
	public var friction(get, set):Float;

	inline function get_friction():Float return this.getF64(88);

	inline function set_friction(value:Float):Float { this.setF64(88, value); return value; }
	public var restitution(get, set):Float;

	inline function get_restitution():Float return this.getF64(96);

	inline function set_restitution(value:Float):Float { this.setF64(96, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(112) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(112, value ? 1 : 0); return value; }
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return this.getUI8(113) != 0;

	inline function set_sensor(value:Bool):Bool { this.setUI8(113, value ? 1 : 0); return value; }
	public var touching(get, set):Bool;

	inline function get_touching():Bool return this.getUI8(114) != 0;

	inline function set_touching(value:Bool):Bool { this.setUI8(114, value ? 1 : 0); return value; }
}
