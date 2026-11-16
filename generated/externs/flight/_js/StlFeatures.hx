package flight._js;

abstract StlFeatures(Dynamic) {
	public var triangleCount(get, set):Int;
	inline function get_triangleCount():Int return untyped this["triangleCount"];
	inline function set_triangleCount(value:Int):Int return untyped this["triangleCount"] = value;
}
