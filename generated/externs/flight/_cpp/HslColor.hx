package flight._cpp;

private extern class HslColor_Ffi {
	@:native("flight_get_hsl_color_h") static function get_h(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hsl_color_h") static function set_h(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hsl_color_s") static function get_s(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hsl_color_s") static function set_s(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hsl_color_l") static function get_l(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hsl_color_l") static function set_l(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract HslColor(cpp.Star<cpp.Void>) {
	public var h(get, set):Single;

	inline function get_h():Single return HslColor_Ffi.get_h(this);

	inline function set_h(value:Single):Single return HslColor_Ffi.set_h(this, value);
	public var s(get, set):Single;

	inline function get_s():Single return HslColor_Ffi.get_s(this);

	inline function set_s(value:Single):Single return HslColor_Ffi.set_s(this, value);
	public var l(get, set):Single;

	inline function get_l():Single return HslColor_Ffi.get_l(this);

	inline function set_l(value:Single):Single return HslColor_Ffi.set_l(this, value);
}
