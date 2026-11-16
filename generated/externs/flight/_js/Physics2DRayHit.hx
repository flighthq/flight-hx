package flight._js;

abstract Physics2DRayHit(Dynamic) {
	public var colliderIndex(get, set):Int;
	inline function get_colliderIndex():Int return untyped this["colliderIndex"];
	inline function set_colliderIndex(value:Int):Int return untyped this["colliderIndex"] = value;
	public var fraction(get, set):Float;
	inline function get_fraction():Float return untyped this["fraction"];
	inline function set_fraction(value:Float):Float return untyped this["fraction"] = value;
	public var normalX(get, set):Float;
	inline function get_normalX():Float return untyped this["normalX"];
	inline function set_normalX(value:Float):Float return untyped this["normalX"] = value;
	public var normalY(get, set):Float;
	inline function get_normalY():Float return untyped this["normalY"];
	inline function set_normalY(value:Float):Float return untyped this["normalY"] = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
}
