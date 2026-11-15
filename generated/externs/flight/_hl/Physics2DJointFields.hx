package flight._hl;

abstract Physics2DJointFields(hl.Bytes) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(48);

	inline function set_bodyA(value:Int):Int { this.setI32(48, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(52);

	inline function set_bodyB(value:Int):Int { this.setI32(52, value); return value; }
	public var breakForce(get, set):Single;

	inline function get_breakForce():Single return this.getF32(56);

	inline function set_breakForce(value:Single):Single { this.setF32(56, value); return value; }
	public var breakTorque(get, set):Single;

	inline function get_breakTorque():Single return this.getF32(60);

	inline function set_breakTorque(value:Single):Single { this.setF32(60, value); return value; }
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return this.getUI8(64) != 0;

	inline function set_collideConnected(value:Bool):Bool { this.setUI8(64, value ? 1 : 0); return value; }
	public var impulse0(get, set):Single;

	inline function get_impulse0():Single return this.getF32(68);

	inline function set_impulse0(value:Single):Single { this.setF32(68, value); return value; }
	public var impulse1(get, set):Single;

	inline function get_impulse1():Single return this.getF32(72);

	inline function set_impulse1(value:Single):Single { this.setF32(72, value); return value; }
	public var impulse2(get, set):Single;

	inline function get_impulse2():Single return this.getF32(76);

	inline function set_impulse2(value:Single):Single { this.setF32(76, value); return value; }
	public var localAnchorAx(get, set):Single;

	inline function get_localAnchorAx():Single return this.getF32(104);

	inline function set_localAnchorAx(value:Single):Single { this.setF32(104, value); return value; }
	public var localAnchorAy(get, set):Single;

	inline function get_localAnchorAy():Single return this.getF32(108);

	inline function set_localAnchorAy(value:Single):Single { this.setF32(108, value); return value; }
	public var localAnchorBx(get, set):Single;

	inline function get_localAnchorBx():Single return this.getF32(112);

	inline function set_localAnchorBx(value:Single):Single { this.setF32(112, value); return value; }
	public var localAnchorBy(get, set):Single;

	inline function get_localAnchorBy():Single return this.getF32(116);

	inline function set_localAnchorBy(value:Single):Single { this.setF32(116, value); return value; }
	public var rAx(get, set):Single;

	inline function get_rAx():Single return this.getF32(120);

	inline function set_rAx(value:Single):Single { this.setF32(120, value); return value; }
	public var rAy(get, set):Single;

	inline function get_rAy():Single return this.getF32(124);

	inline function set_rAy(value:Single):Single { this.setF32(124, value); return value; }
	public var rBx(get, set):Single;

	inline function get_rBx():Single return this.getF32(128);

	inline function set_rBx(value:Single):Single { this.setF32(128, value); return value; }
	public var rBy(get, set):Single;

	inline function get_rBy():Single return this.getF32(132);

	inline function set_rBy(value:Single):Single { this.setF32(132, value); return value; }
}
