package flight._cpp;

private extern class Camera2D_Ffi {
	@:native("flight_get_camera2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera2_d_zoom") static function get_zoom(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera2_d_zoom") static function set_zoom(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Camera2D(cpp.Star<cpp.Void>) {
	public var rotation(get, set):Float;

	inline function get_rotation():Float return Camera2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float { Camera2D_Ffi.set_rotation(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return Camera2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Camera2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Camera2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Camera2D_Ffi.set_y(this, value); return value; }
	public var zoom(get, set):Float;

	inline function get_zoom():Float return Camera2D_Ffi.get_zoom(this);

	inline function set_zoom(value:Float):Float { Camera2D_Ffi.set_zoom(this, value); return value; }
}
