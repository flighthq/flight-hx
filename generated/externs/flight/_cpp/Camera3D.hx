package flight._cpp;

private extern class Camera3D_Ffi {
	@:native("flight_get_camera3_d_far") static function get_far(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera3_d_far") static function set_far(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera3_d_near") static function get_near(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera3_d_near") static function set_near(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Camera3D(cpp.Star<cpp.Void>) {
	public var far(get, set):Float;

	inline function get_far():Float return Camera3D_Ffi.get_far(this);

	inline function set_far(value:Float):Float { Camera3D_Ffi.set_far(this, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return Camera3D_Ffi.get_near(this);

	inline function set_near(value:Float):Float { Camera3D_Ffi.set_near(this, value); return value; }
}
