package flight._js;

abstract CollisionRaycastHit3D(Dynamic) {
	public var fraction(get, set):Float;
	inline function get_fraction():Float return untyped this["fraction"];
	inline function set_fraction(value:Float):Float return untyped this["fraction"] = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this["z"];
	inline function set_z(value:Float):Float return untyped this["z"] = value;
	public var normalX(get, set):Float;
	inline function get_normalX():Float return untyped this["normalX"];
	inline function set_normalX(value:Float):Float return untyped this["normalX"] = value;
	public var normalY(get, set):Float;
	inline function get_normalY():Float return untyped this["normalY"];
	inline function set_normalY(value:Float):Float return untyped this["normalY"] = value;
	public var normalZ(get, set):Float;
	inline function get_normalZ():Float return untyped this["normalZ"];
	inline function set_normalZ(value:Float):Float return untyped this["normalZ"] = value;
}
