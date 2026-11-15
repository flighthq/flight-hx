package flight._cpp;

private extern class StarlingPexColor_Ffi {
	@:native("flight_get_starling_pex_color_red") static function get_red(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_pex_color_red") static function set_red(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_starling_pex_color_green") static function get_green(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_pex_color_green") static function set_green(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_starling_pex_color_blue") static function get_blue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_pex_color_blue") static function set_blue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_starling_pex_color_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_pex_color_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract StarlingPexColor(cpp.Star<cpp.Void>) {
	public var red(get, set):Single;

	inline function get_red():Single return StarlingPexColor_Ffi.get_red(this);

	inline function set_red(value:Single):Single return StarlingPexColor_Ffi.set_red(this, value);
	public var green(get, set):Single;

	inline function get_green():Single return StarlingPexColor_Ffi.get_green(this);

	inline function set_green(value:Single):Single return StarlingPexColor_Ffi.set_green(this, value);
	public var blue(get, set):Single;

	inline function get_blue():Single return StarlingPexColor_Ffi.get_blue(this);

	inline function set_blue(value:Single):Single return StarlingPexColor_Ffi.set_blue(this, value);
	public var alpha(get, set):Single;

	inline function get_alpha():Single return StarlingPexColor_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single return StarlingPexColor_Ffi.set_alpha(this, value);
}
