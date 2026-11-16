package flight._js;

abstract CollisionAabb2D(Dynamic) {
	public var minX(get, set):Float;
	inline function get_minX():Float return untyped this["minX"];
	inline function set_minX(value:Float):Float return untyped this["minX"] = value;
	public var minY(get, set):Float;
	inline function get_minY():Float return untyped this["minY"];
	inline function set_minY(value:Float):Float return untyped this["minY"] = value;
	public var maxX(get, set):Float;
	inline function get_maxX():Float return untyped this["maxX"];
	inline function set_maxX(value:Float):Float return untyped this["maxX"] = value;
	public var maxY(get, set):Float;
	inline function get_maxY():Float return untyped this["maxY"];
	inline function set_maxY(value:Float):Float return untyped this["maxY"] = value;
}
