package flight._cpp;

private extern class Camera2D_Ffi {
	@:native("flight_get_camera2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera2_d_zoom") static function get_zoom(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera2_d_zoom") static function set_zoom(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Camera2D(cpp.Star<cpp.Void>) {
	public var rotation(get, set):Single;

	inline function get_rotation():Single return Camera2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Single):Single return Camera2D_Ffi.set_rotation(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return Camera2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single return Camera2D_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return Camera2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single return Camera2D_Ffi.set_y(this, value);
	public var zoom(get, set):Single;

	inline function get_zoom():Single return Camera2D_Ffi.get_zoom(this);

	inline function set_zoom(value:Single):Single return Camera2D_Ffi.set_zoom(this, value);
}
