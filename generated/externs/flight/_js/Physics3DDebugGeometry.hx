package flight._js;

abstract Physics3DDebugGeometry(Dynamic) {
	public var lineCount(get, set):Int;
	inline function get_lineCount():Int return untyped this["lineCount"];
	inline function set_lineCount(value:Int):Int return untyped this["lineCount"] = value;
	public var sphereCount(get, set):Int;
	inline function get_sphereCount():Int return untyped this["sphereCount"];
	inline function set_sphereCount(value:Int):Int return untyped this["sphereCount"] = value;
}
