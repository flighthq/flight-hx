package flight._js;

abstract PerspectiveProjection(Dynamic) {
	public var aspect(get, set):Float;
	inline function get_aspect():Float return untyped this["aspect"];
	inline function set_aspect(value:Float):Float return untyped this["aspect"] = value;
	public var fovY(get, set):Float;
	inline function get_fovY():Float return untyped this["fovY"];
	inline function set_fovY(value:Float):Float return untyped this["fovY"] = value;
}
