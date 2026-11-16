package flight._js;

abstract ColladaPerspectiveCameraDefinition(Dynamic) {
	public var aspect(get, set):Float;
	inline function get_aspect():Float return untyped this["aspect"];
	inline function set_aspect(value:Float):Float return untyped this["aspect"] = value;
	public var far(get, set):Float;
	inline function get_far():Float return untyped this["far"];
	inline function set_far(value:Float):Float return untyped this["far"] = value;
	public var fovY(get, set):Float;
	inline function get_fovY():Float return untyped this["fovY"];
	inline function set_fovY(value:Float):Float return untyped this["fovY"] = value;
	public var near(get, set):Float;
	inline function get_near():Float return untyped this["near"];
	inline function set_near(value:Float):Float return untyped this["near"] = value;
}
