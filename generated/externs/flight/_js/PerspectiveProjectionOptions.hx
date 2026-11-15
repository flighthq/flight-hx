package flight._js;

@:jsRequire("flight")
private extern class PerspectiveProjectionOptions_Ffi {
	@:native("flight_get_perspective_projection_options_fov_y") static function get_fovY(ptr:Dynamic):Float;
	@:native("flight_set_perspective_projection_options_fov_y") static function set_fovY(ptr:Dynamic, value:Float):Float;
}

abstract PerspectiveProjectionOptions(Dynamic) {
	public var fovY(get, set):Float;

	inline function get_fovY():Float return PerspectiveProjectionOptions_Ffi.get_fovY(this);

	inline function set_fovY(value:Float):Float return PerspectiveProjectionOptions_Ffi.set_fovY(this, value);
}
