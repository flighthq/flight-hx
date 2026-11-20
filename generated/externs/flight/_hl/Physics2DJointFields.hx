package flight._hl;

abstract Physics2DJointFields(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(48);

	inline function set_bodyA(value:Int):Int { this.setI32(48, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(52);

	inline function set_bodyB(value:Int):Int { this.setI32(52, value); return value; }
	public var breakForce(get, set):Float;

	inline function get_breakForce():Float return this.getF64(56);

	inline function set_breakForce(value:Float):Float { this.setF64(56, value); return value; }
	public var breakTorque(get, set):Float;

	inline function get_breakTorque():Float return this.getF64(64);

	inline function set_breakTorque(value:Float):Float { this.setF64(64, value); return value; }
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return this.getUI8(72) != 0;

	inline function set_collideConnected(value:Bool):Bool { this.setUI8(72, value ? 1 : 0); return value; }
	public var impulse0(get, set):Float;

	inline function get_impulse0():Float return this.getF64(80);

	inline function set_impulse0(value:Float):Float { this.setF64(80, value); return value; }
	public var impulse1(get, set):Float;

	inline function get_impulse1():Float return this.getF64(88);

	inline function set_impulse1(value:Float):Float { this.setF64(88, value); return value; }
	public var impulse2(get, set):Float;

	inline function get_impulse2():Float return this.getF64(96);

	inline function set_impulse2(value:Float):Float { this.setF64(96, value); return value; }
	public var localAnchorAx(get, set):Float;

	inline function get_localAnchorAx():Float return this.getF64(128);

	inline function set_localAnchorAx(value:Float):Float { this.setF64(128, value); return value; }
	public var localAnchorAy(get, set):Float;

	inline function get_localAnchorAy():Float return this.getF64(136);

	inline function set_localAnchorAy(value:Float):Float { this.setF64(136, value); return value; }
	public var localAnchorBx(get, set):Float;

	inline function get_localAnchorBx():Float return this.getF64(144);

	inline function set_localAnchorBx(value:Float):Float { this.setF64(144, value); return value; }
	public var localAnchorBy(get, set):Float;

	inline function get_localAnchorBy():Float return this.getF64(152);

	inline function set_localAnchorBy(value:Float):Float { this.setF64(152, value); return value; }
	public var rAx(get, set):Float;

	inline function get_rAx():Float return this.getF64(160);

	inline function set_rAx(value:Float):Float { this.setF64(160, value); return value; }
	public var rAy(get, set):Float;

	inline function get_rAy():Float return this.getF64(168);

	inline function set_rAy(value:Float):Float { this.setF64(168, value); return value; }
	public var rBx(get, set):Float;

	inline function get_rBx():Float return this.getF64(176);

	inline function set_rBx(value:Float):Float { this.setF64(176, value); return value; }
	public var rBy(get, set):Float;

	inline function get_rBy():Float return this.getF64(184);

	inline function set_rBy(value:Float):Float { this.setF64(184, value); return value; }
}
