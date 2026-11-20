package flight._cpp;

private extern class SoftKeyboardInfo_Ffi {
	@:native("flight_get_soft_keyboard_info_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_soft_keyboard_info_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_soft_keyboard_info_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_soft_keyboard_info_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_soft_keyboard_info_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_soft_keyboard_info_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_soft_keyboard_info_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_soft_keyboard_info_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_soft_keyboard_info_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_soft_keyboard_info_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SoftKeyboardInfo(cpp.Star<cpp.Void>) {
	public var visible(get, set):Bool;

	inline function get_visible():Bool return SoftKeyboardInfo_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { SoftKeyboardInfo_Ffi.set_visible(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return SoftKeyboardInfo_Ffi.get_height(this);

	inline function set_height(value:Single):Single { SoftKeyboardInfo_Ffi.set_height(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return SoftKeyboardInfo_Ffi.get_x(this);

	inline function set_x(value:Single):Single { SoftKeyboardInfo_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return SoftKeyboardInfo_Ffi.get_y(this);

	inline function set_y(value:Single):Single { SoftKeyboardInfo_Ffi.set_y(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return SoftKeyboardInfo_Ffi.get_width(this);

	inline function set_width(value:Single):Single { SoftKeyboardInfo_Ffi.set_width(this, value); return value; }
}
