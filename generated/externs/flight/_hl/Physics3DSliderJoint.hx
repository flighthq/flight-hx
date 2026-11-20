package flight._hl;

abstract Physics3DSliderJoint(hl.Bytes) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return this.getUI8(384) != 0;

	inline function set_enableLimit(value:Bool):Bool { this.setUI8(384, value ? 1 : 0); return value; }
	public var lowerTranslation(get, set):Float;

	inline function get_lowerTranslation():Float return this.getF64(312);

	inline function set_lowerTranslation(value:Float):Float { this.setF64(312, value); return value; }
	public var upperTranslation(get, set):Float;

	inline function get_upperTranslation():Float return this.getF64(320);

	inline function set_upperTranslation(value:Float):Float { this.setF64(320, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return this.getUI8(385) != 0;

	inline function set_enableMotor(value:Bool):Bool { this.setUI8(385, value ? 1 : 0); return value; }
	public var motorSpeed(get, set):Float;

	inline function get_motorSpeed():Float return this.getF64(328);

	inline function set_motorSpeed(value:Float):Float { this.setF64(328, value); return value; }
	public var maxMotorForce(get, set):Float;

	inline function get_maxMotorForce():Float return this.getF64(336);

	inline function set_maxMotorForce(value:Float):Float { this.setF64(336, value); return value; }
	public var motorImpulse(get, set):Float;

	inline function get_motorImpulse():Float return this.getF64(344);

	inline function set_motorImpulse(value:Float):Float { this.setF64(344, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(386) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(386, value ? 1 : 0); return value; }
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return this.getF64(352);

	inline function set_limitFrequencyHz(value:Float):Float { this.setF64(352, value); return value; }
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return this.getF64(360);

	inline function set_limitDampingRatio(value:Float):Float { this.setF64(360, value); return value; }
	public var lowerLimitImpulse(get, set):Float;

	inline function get_lowerLimitImpulse():Float return this.getF64(368);

	inline function set_lowerLimitImpulse(value:Float):Float { this.setF64(368, value); return value; }
	public var upperLimitImpulse(get, set):Float;

	inline function get_upperLimitImpulse():Float return this.getF64(376);

	inline function set_upperLimitImpulse(value:Float):Float { this.setF64(376, value); return value; }
}
