package flight._js;

abstract Physics2DMouseJoint(Dynamic) {
	public var dampingRatio(get, set):Float;
	inline function get_dampingRatio():Float return untyped this["dampingRatio"];
	inline function set_dampingRatio(value:Float):Float return untyped this["dampingRatio"] = value;
	public var frequencyHz(get, set):Float;
	inline function get_frequencyHz():Float return untyped this["frequencyHz"];
	inline function set_frequencyHz(value:Float):Float return untyped this["frequencyHz"] = value;
	public var maxForce(get, set):Float;
	inline function get_maxForce():Float return untyped this["maxForce"];
	inline function set_maxForce(value:Float):Float return untyped this["maxForce"] = value;
	public var targetX(get, set):Float;
	inline function get_targetX():Float return untyped this["targetX"];
	inline function set_targetX(value:Float):Float return untyped this["targetX"] = value;
	public var targetY(get, set):Float;
	inline function get_targetY():Float return untyped this["targetY"];
	inline function set_targetY(value:Float):Float return untyped this["targetY"] = value;
}
