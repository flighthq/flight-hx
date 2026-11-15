package flight._hl;

abstract Physics2DWheelJoint(hl.Bytes) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return this.getF32(136);

	inline function set_dampingRatio(value:Single):Single { this.setF32(136, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return this.getUI8(140) != 0;

	inline function set_enableMotor(value:Bool):Bool { this.setUI8(140, value ? 1 : 0); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return this.getF32(144);

	inline function set_frequencyHz(value:Single):Single { this.setF32(144, value); return value; }
	public var localAxisAx(get, set):Single;

	inline function get_localAxisAx():Single return this.getF32(148);

	inline function set_localAxisAx(value:Single):Single { this.setF32(148, value); return value; }
	public var localAxisAy(get, set):Single;

	inline function get_localAxisAy():Single return this.getF32(152);

	inline function set_localAxisAy(value:Single):Single { this.setF32(152, value); return value; }
	public var maxMotorTorque(get, set):Single;

	inline function get_maxMotorTorque():Single return this.getF32(156);

	inline function set_maxMotorTorque(value:Single):Single { this.setF32(156, value); return value; }
	public var motorImpulse(get, set):Single;

	inline function get_motorImpulse():Single return this.getF32(160);

	inline function set_motorImpulse(value:Single):Single { this.setF32(160, value); return value; }
	public var motorSpeed(get, set):Single;

	inline function get_motorSpeed():Single return this.getF32(164);

	inline function set_motorSpeed(value:Single):Single { this.setF32(164, value); return value; }
	public var restTranslation(get, set):Single;

	inline function get_restTranslation():Single return this.getF32(168);

	inline function set_restTranslation(value:Single):Single { this.setF32(168, value); return value; }
}
