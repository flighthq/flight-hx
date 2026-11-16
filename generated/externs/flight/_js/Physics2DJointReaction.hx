package flight._js;

abstract Physics2DJointReaction(Dynamic) {
	public var forceX(get, set):Float;
	inline function get_forceX():Float return untyped this["forceX"];
	inline function set_forceX(value:Float):Float return untyped this["forceX"] = value;
	public var forceY(get, set):Float;
	inline function get_forceY():Float return untyped this["forceY"];
	inline function set_forceY(value:Float):Float return untyped this["forceY"] = value;
	public var torque(get, set):Float;
	inline function get_torque():Float return untyped this["torque"];
	inline function set_torque(value:Float):Float return untyped this["torque"] = value;
}
