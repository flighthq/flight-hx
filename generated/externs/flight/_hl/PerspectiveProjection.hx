package flight._hl;

private extern class PerspectiveProjection_Ffi {
	@:hlNative("flight", "flight_get_perspective_projection_aspect")
	static function get_aspect(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_perspective_projection_aspect")
	static function set_aspect(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_perspective_projection_fov_y")
	static function get_fovY(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_perspective_projection_fov_y")
	static function set_fovY(ptr:hl.Bytes, value:Single):Single;
}

abstract PerspectiveProjection(hl.Bytes) {
	public var aspect(get, set):Single;

	inline function get_aspect():Single return PerspectiveProjection_Ffi.get_aspect(this);
	inline function set_aspect(value:Single):Single { PerspectiveProjection_Ffi.set_aspect(this, value); return value; }
	public var fovY(get, set):Single;

	inline function get_fovY():Single return PerspectiveProjection_Ffi.get_fovY(this);
	inline function set_fovY(value:Single):Single { PerspectiveProjection_Ffi.set_fovY(this, value); return value; }
}
