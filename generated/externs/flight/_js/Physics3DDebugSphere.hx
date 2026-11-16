package flight._js;

abstract Physics3DDebugSphere(Dynamic) {
	public var bodyA(get, set):Int;
	inline function get_bodyA():Int return untyped this["bodyA"];
	inline function set_bodyA(value:Int):Int return untyped this["bodyA"] = value;
	public var bodyB(get, set):Int;
	inline function get_bodyB():Int return untyped this["bodyB"];
	inline function set_bodyB(value:Int):Int return untyped this["bodyB"] = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this["z"];
	inline function set_z(value:Float):Float return untyped this["z"] = value;
	public var radius(get, set):Float;
	inline function get_radius():Float return untyped this["radius"];
	inline function set_radius(value:Float):Float return untyped this["radius"] = value;
}
