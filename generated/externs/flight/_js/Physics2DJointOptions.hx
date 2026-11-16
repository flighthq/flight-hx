package flight._js;

abstract Physics2DJointOptions(Dynamic) {
	public var bodyA(get, set):Int;
	inline function get_bodyA():Int return untyped this["bodyA"];
	inline function set_bodyA(value:Int):Int return untyped this["bodyA"] = value;
	public var bodyB(get, set):Int;
	inline function get_bodyB():Int return untyped this["bodyB"];
	inline function set_bodyB(value:Int):Int return untyped this["bodyB"] = value;
}
