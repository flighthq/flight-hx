package flight._cpp;

private extern class SafeAreaInsets_Ffi {
	@:native("flight_get_safe_area_insets_top") static function get_top(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_safe_area_insets_top") static function set_top(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_safe_area_insets_right") static function get_right(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_safe_area_insets_right") static function set_right(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_safe_area_insets_bottom") static function get_bottom(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_safe_area_insets_bottom") static function set_bottom(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_safe_area_insets_left") static function get_left(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_safe_area_insets_left") static function set_left(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SafeAreaInsets(cpp.Star<cpp.Void>) {
	public var top(get, set):Single;

	inline function get_top():Single return SafeAreaInsets_Ffi.get_top(this);

	inline function set_top(value:Single):Single { SafeAreaInsets_Ffi.set_top(this, value); return value; }
	public var right(get, set):Single;

	inline function get_right():Single return SafeAreaInsets_Ffi.get_right(this);

	inline function set_right(value:Single):Single { SafeAreaInsets_Ffi.set_right(this, value); return value; }
	public var bottom(get, set):Single;

	inline function get_bottom():Single return SafeAreaInsets_Ffi.get_bottom(this);

	inline function set_bottom(value:Single):Single { SafeAreaInsets_Ffi.set_bottom(this, value); return value; }
	public var left(get, set):Single;

	inline function get_left():Single return SafeAreaInsets_Ffi.get_left(this);

	inline function set_left(value:Single):Single { SafeAreaInsets_Ffi.set_left(this, value); return value; }
}
