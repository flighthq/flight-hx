package flight._cpp;

private extern class PerspectiveProjection_Ffi {
	@:native("flight_get_perspective_projection_aspect") static function get_aspect(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_perspective_projection_aspect") static function set_aspect(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_perspective_projection_fov_y") static function get_fovY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_perspective_projection_fov_y") static function set_fovY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract PerspectiveProjection(cpp.Star<cpp.Void>) {
	public var aspect(get, set):Single;

	inline function get_aspect():Single return PerspectiveProjection_Ffi.get_aspect(this);

	inline function set_aspect(value:Single):Single return PerspectiveProjection_Ffi.set_aspect(this, value);
	public var fovY(get, set):Single;

	inline function get_fovY():Single return PerspectiveProjection_Ffi.get_fovY(this);

	inline function set_fovY(value:Single):Single return PerspectiveProjection_Ffi.set_fovY(this, value);
}
