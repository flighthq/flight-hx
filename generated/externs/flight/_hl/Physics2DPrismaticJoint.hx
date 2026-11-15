package flight._hl;

abstract Physics2DPrismaticJoint(hl.Bytes) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return this.getUI8(136) != 0;

	inline function set_enableLimit(value:Bool):Bool { this.setUI8(136, value ? 1 : 0); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(137) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(137, value ? 1 : 0); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return this.getUI8(138) != 0;

	inline function set_enableMotor(value:Bool):Bool { this.setUI8(138, value ? 1 : 0); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return this.getF32(140);

	inline function set_limitDampingRatio(value:Single):Single { this.setF32(140, value); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return this.getF32(144);

	inline function set_limitFrequencyHz(value:Single):Single { this.setF32(144, value); return value; }
	public var localAxisAx(get, set):Single;

	inline function get_localAxisAx():Single return this.getF32(148);

	inline function set_localAxisAx(value:Single):Single { this.setF32(148, value); return value; }
	public var localAxisAy(get, set):Single;

	inline function get_localAxisAy():Single return this.getF32(152);

	inline function set_localAxisAy(value:Single):Single { this.setF32(152, value); return value; }
	public var lowerTranslation(get, set):Single;

	inline function get_lowerTranslation():Single return this.getF32(156);

	inline function set_lowerTranslation(value:Single):Single { this.setF32(156, value); return value; }
	public var maxMotorForce(get, set):Single;

	inline function get_maxMotorForce():Single return this.getF32(160);

	inline function set_maxMotorForce(value:Single):Single { this.setF32(160, value); return value; }
	public var motorImpulse(get, set):Single;

	inline function get_motorImpulse():Single return this.getF32(164);

	inline function set_motorImpulse(value:Single):Single { this.setF32(164, value); return value; }
	public var motorSpeed(get, set):Single;

	inline function get_motorSpeed():Single return this.getF32(168);

	inline function set_motorSpeed(value:Single):Single { this.setF32(168, value); return value; }
	public var referenceAngle(get, set):Single;

	inline function get_referenceAngle():Single return this.getF32(172);

	inline function set_referenceAngle(value:Single):Single { this.setF32(172, value); return value; }
	public var upperTranslation(get, set):Single;

	inline function get_upperTranslation():Single return this.getF32(176);

	inline function set_upperTranslation(value:Single):Single { this.setF32(176, value); return value; }
}
