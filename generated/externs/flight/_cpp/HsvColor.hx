package flight._cpp;

private extern class HsvColor_Ffi {
	@:native("flight_get_hsv_color_h") static function get_h(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hsv_color_h") static function set_h(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hsv_color_s") static function get_s(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hsv_color_s") static function set_s(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hsv_color_v") static function get_v(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hsv_color_v") static function set_v(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract HsvColor(cpp.Star<cpp.Void>) {
	public var h(get, set):Single;

	inline function get_h():Single return HsvColor_Ffi.get_h(this);

	inline function set_h(value:Single):Single return HsvColor_Ffi.set_h(this, value);
	public var s(get, set):Single;

	inline function get_s():Single return HsvColor_Ffi.get_s(this);

	inline function set_s(value:Single):Single return HsvColor_Ffi.set_s(this, value);
	public var v(get, set):Single;

	inline function get_v():Single return HsvColor_Ffi.get_v(this);

	inline function set_v(value:Single):Single return HsvColor_Ffi.set_v(this, value);
}
