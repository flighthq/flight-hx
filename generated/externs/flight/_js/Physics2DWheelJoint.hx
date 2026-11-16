package flight._js;

abstract Physics2DWheelJoint(Dynamic) {
	public var dampingRatio(get, set):Float;
	inline function get_dampingRatio():Float return untyped this["dampingRatio"];
	inline function set_dampingRatio(value:Float):Float return untyped this["dampingRatio"] = value;
	public var enableMotor(get, set):Bool;
	inline function get_enableMotor():Bool return untyped this["enableMotor"];
	inline function set_enableMotor(value:Bool):Bool return untyped this["enableMotor"] = value;
	public var frequencyHz(get, set):Float;
	inline function get_frequencyHz():Float return untyped this["frequencyHz"];
	inline function set_frequencyHz(value:Float):Float return untyped this["frequencyHz"] = value;
	public var localAxisAx(get, set):Float;
	inline function get_localAxisAx():Float return untyped this["localAxisAx"];
	inline function set_localAxisAx(value:Float):Float return untyped this["localAxisAx"] = value;
	public var localAxisAy(get, set):Float;
	inline function get_localAxisAy():Float return untyped this["localAxisAy"];
	inline function set_localAxisAy(value:Float):Float return untyped this["localAxisAy"] = value;
	public var maxMotorTorque(get, set):Float;
	inline function get_maxMotorTorque():Float return untyped this["maxMotorTorque"];
	inline function set_maxMotorTorque(value:Float):Float return untyped this["maxMotorTorque"] = value;
	public var motorImpulse(get, set):Float;
	inline function get_motorImpulse():Float return untyped this["motorImpulse"];
	inline function set_motorImpulse(value:Float):Float return untyped this["motorImpulse"] = value;
	public var motorSpeed(get, set):Float;
	inline function get_motorSpeed():Float return untyped this["motorSpeed"];
	inline function set_motorSpeed(value:Float):Float return untyped this["motorSpeed"] = value;
	public var restTranslation(get, set):Float;
	inline function get_restTranslation():Float return untyped this["restTranslation"];
	inline function set_restTranslation(value:Float):Float return untyped this["restTranslation"] = value;
}
