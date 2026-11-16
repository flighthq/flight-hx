package flight._hl;

abstract Physics3DHingeJoint(hl.Bytes) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return this.getUI8(236) != 0;

	inline function set_enableLimit(value:Bool):Bool { this.setUI8(236, value ? 1 : 0); return value; }
	public var lowerAngle(get, set):Single;

	inline function get_lowerAngle():Single return this.getF32(200);

	inline function set_lowerAngle(value:Single):Single { this.setF32(200, value); return value; }
	public var upperAngle(get, set):Single;

	inline function get_upperAngle():Single return this.getF32(204);

	inline function set_upperAngle(value:Single):Single { this.setF32(204, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return this.getUI8(237) != 0;

	inline function set_enableMotor(value:Bool):Bool { this.setUI8(237, value ? 1 : 0); return value; }
	public var motorSpeed(get, set):Single;

	inline function get_motorSpeed():Single return this.getF32(208);

	inline function set_motorSpeed(value:Single):Single { this.setF32(208, value); return value; }
	public var maxMotorTorque(get, set):Single;

	inline function get_maxMotorTorque():Single return this.getF32(212);

	inline function set_maxMotorTorque(value:Single):Single { this.setF32(212, value); return value; }
	public var motorImpulse(get, set):Single;

	inline function get_motorImpulse():Single return this.getF32(216);

	inline function set_motorImpulse(value:Single):Single { this.setF32(216, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(238) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(238, value ? 1 : 0); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return this.getF32(220);

	inline function set_limitFrequencyHz(value:Single):Single { this.setF32(220, value); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return this.getF32(224);

	inline function set_limitDampingRatio(value:Single):Single { this.setF32(224, value); return value; }
	public var lowerLimitImpulse(get, set):Single;

	inline function get_lowerLimitImpulse():Single return this.getF32(228);

	inline function set_lowerLimitImpulse(value:Single):Single { this.setF32(228, value); return value; }
	public var upperLimitImpulse(get, set):Single;

	inline function get_upperLimitImpulse():Single return this.getF32(232);

	inline function set_upperLimitImpulse(value:Single):Single { this.setF32(232, value); return value; }
}
