package flight._js;

abstract CollisionTriangleMesh3D(Dynamic) {
	public var version(get, set):Float;
	inline function get_version():Float return untyped this["version"];
	inline function set_version(value:Float):Float return untyped this["version"] = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this["z"];
	inline function set_z(value:Float):Float return untyped this["z"] = value;
	public var rotationX(get, set):Float;
	inline function get_rotationX():Float return untyped this["rotationX"];
	inline function set_rotationX(value:Float):Float return untyped this["rotationX"] = value;
	public var rotationY(get, set):Float;
	inline function get_rotationY():Float return untyped this["rotationY"];
	inline function set_rotationY(value:Float):Float return untyped this["rotationY"] = value;
	public var rotationZ(get, set):Float;
	inline function get_rotationZ():Float return untyped this["rotationZ"];
	inline function set_rotationZ(value:Float):Float return untyped this["rotationZ"] = value;
	public var rotationW(get, set):Float;
	inline function get_rotationW():Float return untyped this["rotationW"];
	inline function set_rotationW(value:Float):Float return untyped this["rotationW"] = value;
}
