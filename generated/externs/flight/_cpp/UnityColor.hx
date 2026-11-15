package flight._cpp;

private extern class UnityColor_Ffi {
	@:native("flight_get_unity_color_a") static function get_a(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_color_a") static function set_a(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_color_b") static function get_b(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_color_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_color_g") static function get_g(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_color_g") static function set_g(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_color_r") static function get_r(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_color_r") static function set_r(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnityColor(cpp.Star<cpp.Void>) {
	public var a(get, set):Single;

	inline function get_a():Single return UnityColor_Ffi.get_a(this);

	inline function set_a(value:Single):Single return UnityColor_Ffi.set_a(this, value);
	public var b(get, set):Single;

	inline function get_b():Single return UnityColor_Ffi.get_b(this);

	inline function set_b(value:Single):Single return UnityColor_Ffi.set_b(this, value);
	public var g(get, set):Single;

	inline function get_g():Single return UnityColor_Ffi.get_g(this);

	inline function set_g(value:Single):Single return UnityColor_Ffi.set_g(this, value);
	public var r(get, set):Single;

	inline function get_r():Single return UnityColor_Ffi.get_r(this);

	inline function set_r(value:Single):Single return UnityColor_Ffi.set_r(this, value);
}
