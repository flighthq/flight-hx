package flight._js;

@:jsRequire("flight")
private extern class PerspectiveProjection_Ffi {
	@:native("flight_get_perspective_projection_aspect") static function get_aspect(ptr:Dynamic):Float;
	@:native("flight_set_perspective_projection_aspect") static function set_aspect(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_perspective_projection_fov_y") static function get_fovY(ptr:Dynamic):Float;
	@:native("flight_set_perspective_projection_fov_y") static function set_fovY(ptr:Dynamic, value:Float):Float;
}

abstract PerspectiveProjection(Dynamic) {
	public var aspect(get, set):Float;

	inline function get_aspect():Float return PerspectiveProjection_Ffi.get_aspect(this);

	inline function set_aspect(value:Float):Float return PerspectiveProjection_Ffi.set_aspect(this, value);
	public var fovY(get, set):Float;

	inline function get_fovY():Float return PerspectiveProjection_Ffi.get_fovY(this);

	inline function set_fovY(value:Float):Float return PerspectiveProjection_Ffi.set_fovY(this, value);
}
