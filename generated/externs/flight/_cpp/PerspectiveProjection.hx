package flight._cpp;

private extern class PerspectiveProjection_Ffi {
	@:native("flight_get_perspective_projection_aspect") static function get_aspect(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_perspective_projection_aspect") static function set_aspect(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_perspective_projection_fov_y") static function get_fovY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_perspective_projection_fov_y") static function set_fovY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract PerspectiveProjection(cpp.Star<cpp.Void>) {
	public var aspect(get, set):Float;

	inline function get_aspect():Float return PerspectiveProjection_Ffi.get_aspect(this);

	inline function set_aspect(value:Float):Float { PerspectiveProjection_Ffi.set_aspect(this, value); return value; }
	public var fovY(get, set):Float;

	inline function get_fovY():Float return PerspectiveProjection_Ffi.get_fovY(this);

	inline function set_fovY(value:Float):Float { PerspectiveProjection_Ffi.set_fovY(this, value); return value; }
}
