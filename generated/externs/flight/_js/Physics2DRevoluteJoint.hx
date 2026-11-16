package flight._js;

abstract Physics2DRevoluteJoint(Dynamic) {
	public var enableLimit(get, set):Bool;
	inline function get_enableLimit():Bool return untyped this["enableLimit"];
	inline function set_enableLimit(value:Bool):Bool return untyped this["enableLimit"] = value;
	public var enableLimitSpring(get, set):Bool;
	inline function get_enableLimitSpring():Bool return untyped this["enableLimitSpring"];
	inline function set_enableLimitSpring(value:Bool):Bool return untyped this["enableLimitSpring"] = value;
	public var enableMotor(get, set):Bool;
	inline function get_enableMotor():Bool return untyped this["enableMotor"];
	inline function set_enableMotor(value:Bool):Bool return untyped this["enableMotor"] = value;
	public var limitDampingRatio(get, set):Float;
	inline function get_limitDampingRatio():Float return untyped this["limitDampingRatio"];
	inline function set_limitDampingRatio(value:Float):Float return untyped this["limitDampingRatio"] = value;
	public var limitFrequencyHz(get, set):Float;
	inline function get_limitFrequencyHz():Float return untyped this["limitFrequencyHz"];
	inline function set_limitFrequencyHz(value:Float):Float return untyped this["limitFrequencyHz"] = value;
	public var lowerAngle(get, set):Float;
	inline function get_lowerAngle():Float return untyped this["lowerAngle"];
	inline function set_lowerAngle(value:Float):Float return untyped this["lowerAngle"] = value;
	public var maxMotorTorque(get, set):Float;
	inline function get_maxMotorTorque():Float return untyped this["maxMotorTorque"];
	inline function set_maxMotorTorque(value:Float):Float return untyped this["maxMotorTorque"] = value;
	public var motorImpulse(get, set):Float;
	inline function get_motorImpulse():Float return untyped this["motorImpulse"];
	inline function set_motorImpulse(value:Float):Float return untyped this["motorImpulse"] = value;
	public var motorSpeed(get, set):Float;
	inline function get_motorSpeed():Float return untyped this["motorSpeed"];
	inline function set_motorSpeed(value:Float):Float return untyped this["motorSpeed"] = value;
	public var referenceAngle(get, set):Float;
	inline function get_referenceAngle():Float return untyped this["referenceAngle"];
	inline function set_referenceAngle(value:Float):Float return untyped this["referenceAngle"] = value;
	public var upperAngle(get, set):Float;
	inline function get_upperAngle():Float return untyped this["upperAngle"];
	inline function set_upperAngle(value:Float):Float return untyped this["upperAngle"] = value;
}
