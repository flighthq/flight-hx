package flight._js;

abstract GltfPerspectiveCamera(Dynamic) {
	public var yfov(get, set):Float;
	inline function get_yfov():Float return untyped this["yfov"];
	inline function set_yfov(value:Float):Float return untyped this["yfov"] = value;
	public var znear(get, set):Float;
	inline function get_znear():Float return untyped this["znear"];
	inline function set_znear(value:Float):Float return untyped this["znear"] = value;
}
