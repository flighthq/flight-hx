package flight._cpp;

private extern class HasAppearance_Ffi {
	@:native("flight_get_has_appearance_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_appearance_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_appearance_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_has_appearance_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract HasAppearance(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return HasAppearance_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single { HasAppearance_Ffi.set_alpha(this, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return HasAppearance_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { HasAppearance_Ffi.set_visible(this, value); return value; }
}
