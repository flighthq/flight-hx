package flight._cpp;

private extern class ScreenMode_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_screen_mode_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_mode_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_mode_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_mode_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_mode_refresh_rate") static function get_refreshRate(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_mode_refresh_rate") static function set_refreshRate(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_mode_color_depth") static function get_colorDepth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_mode_color_depth") static function set_colorDepth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_screen_mode_pixel_format") static function get_pixelFormat(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_screen_mode_pixel_format") static function set_pixelFormat(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ScreenMode(cpp.Star<cpp.Void>) {
	public var width(get, set):Float;

	inline function get_width():Float return ScreenMode_Ffi.get_width(this);

	inline function set_width(value:Float):Float { ScreenMode_Ffi.set_width(this, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return ScreenMode_Ffi.get_height(this);

	inline function set_height(value:Float):Float { ScreenMode_Ffi.set_height(this, value); return value; }
	public var refreshRate(get, set):Float;

	inline function get_refreshRate():Float return ScreenMode_Ffi.get_refreshRate(this);

	inline function set_refreshRate(value:Float):Float { ScreenMode_Ffi.set_refreshRate(this, value); return value; }
	public var colorDepth(get, set):Float;

	inline function get_colorDepth():Float return ScreenMode_Ffi.get_colorDepth(this);

	inline function set_colorDepth(value:Float):Float { ScreenMode_Ffi.set_colorDepth(this, value); return value; }
	public var pixelFormat(get, set):String;
	inline function get_pixelFormat():String { var raw = ScreenMode_Ffi.get_pixelFormat(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ScreenMode_Ffi.freeString(raw); return value; }
	inline function set_pixelFormat(value:String):String { var raw:cpp.ConstCharStar = cast value; ScreenMode_Ffi.set_pixelFormat(this, raw); return value; }
}
