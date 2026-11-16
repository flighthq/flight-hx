package flight._cpp;

private extern class LinearColor_Ffi {
	@:native("flight_get_linear_color_r") static function get_r(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_linear_color_r") static function set_r(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_linear_color_g") static function get_g(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_linear_color_g") static function set_g(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_linear_color_b") static function get_b(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_linear_color_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_linear_color_a") static function get_a(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_linear_color_a") static function set_a(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract LinearColor(cpp.Star<cpp.Void>) {
	public var r(get, set):Single;

	inline function get_r():Single return LinearColor_Ffi.get_r(this);

	inline function set_r(value:Single):Single { LinearColor_Ffi.set_r(this, value); return value; }
	public var g(get, set):Single;

	inline function get_g():Single return LinearColor_Ffi.get_g(this);

	inline function set_g(value:Single):Single { LinearColor_Ffi.set_g(this, value); return value; }
	public var b(get, set):Single;

	inline function get_b():Single return LinearColor_Ffi.get_b(this);

	inline function set_b(value:Single):Single { LinearColor_Ffi.set_b(this, value); return value; }
	public var a(get, set):Single;

	inline function get_a():Single return LinearColor_Ffi.get_a(this);

	inline function set_a(value:Single):Single { LinearColor_Ffi.set_a(this, value); return value; }
}
