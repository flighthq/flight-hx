package flight._cpp;

private extern class PerspectiveProjectionOptions_Ffi {
	@:native("flight_get_perspective_projection_options_fov_y") static function get_fovY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_perspective_projection_options_fov_y") static function set_fovY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract PerspectiveProjectionOptions(cpp.Star<cpp.Void>) {
	public var fovY(get, set):Single;

	inline function get_fovY():Single return PerspectiveProjectionOptions_Ffi.get_fovY(this);

	inline function set_fovY(value:Single):Single return PerspectiveProjectionOptions_Ffi.set_fovY(this, value);
}
