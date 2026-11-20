package flight._cpp;

private extern class AppWindow_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_app_window_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_app_window_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_app_window_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_device_pixel_ratio") static function get_devicePixelRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_app_window_device_pixel_ratio") static function set_devicePixelRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_app_window_minimized") static function get_minimized(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_minimized") static function set_minimized(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_maximized") static function get_maximized(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_maximized") static function set_maximized(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_fullscreen") static function get_fullscreen(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_fullscreen") static function set_fullscreen(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_focused") static function get_focused(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_focused") static function set_focused(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_resizable") static function get_resizable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_resizable") static function set_resizable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_always_on_top") static function get_alwaysOnTop(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_always_on_top") static function set_alwaysOnTop(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_skip_taskbar") static function get_skipTaskbar(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_window_skip_taskbar") static function set_skipTaskbar(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_window_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_app_window_icon") static function get_icon(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_app_window_icon") static function set_icon(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_app_window_min_width") static function get_minWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_min_width") static function set_minWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_min_height") static function get_minHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_min_height") static function set_minHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_max_width") static function get_maxWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_max_width") static function set_maxWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_app_window_max_height") static function get_maxHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_app_window_max_height") static function set_maxHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AppWindow(cpp.Star<cpp.Void>) {
	public var title(get, set):String;
	inline function get_title():String { var raw = AppWindow_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AppWindow_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; AppWindow_Ffi.set_title(this, raw); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return AppWindow_Ffi.get_x(this);

	inline function set_x(value:Single):Single { AppWindow_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return AppWindow_Ffi.get_y(this);

	inline function set_y(value:Single):Single { AppWindow_Ffi.set_y(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return AppWindow_Ffi.get_width(this);

	inline function set_width(value:Single):Single { AppWindow_Ffi.set_width(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return AppWindow_Ffi.get_height(this);

	inline function set_height(value:Single):Single { AppWindow_Ffi.set_height(this, value); return value; }
	public var devicePixelRatio(get, set):Float;

	inline function get_devicePixelRatio():Float return AppWindow_Ffi.get_devicePixelRatio(this);

	inline function set_devicePixelRatio(value:Float):Float { AppWindow_Ffi.set_devicePixelRatio(this, value); return value; }
	public var minimized(get, set):Bool;

	inline function get_minimized():Bool return AppWindow_Ffi.get_minimized(this);

	inline function set_minimized(value:Bool):Bool { AppWindow_Ffi.set_minimized(this, value); return value; }
	public var maximized(get, set):Bool;

	inline function get_maximized():Bool return AppWindow_Ffi.get_maximized(this);

	inline function set_maximized(value:Bool):Bool { AppWindow_Ffi.set_maximized(this, value); return value; }
	public var fullscreen(get, set):Bool;

	inline function get_fullscreen():Bool return AppWindow_Ffi.get_fullscreen(this);

	inline function set_fullscreen(value:Bool):Bool { AppWindow_Ffi.set_fullscreen(this, value); return value; }
	public var focused(get, set):Bool;

	inline function get_focused():Bool return AppWindow_Ffi.get_focused(this);

	inline function set_focused(value:Bool):Bool { AppWindow_Ffi.set_focused(this, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return AppWindow_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { AppWindow_Ffi.set_visible(this, value); return value; }
	public var resizable(get, set):Bool;

	inline function get_resizable():Bool return AppWindow_Ffi.get_resizable(this);

	inline function set_resizable(value:Bool):Bool { AppWindow_Ffi.set_resizable(this, value); return value; }
	public var alwaysOnTop(get, set):Bool;

	inline function get_alwaysOnTop():Bool return AppWindow_Ffi.get_alwaysOnTop(this);

	inline function set_alwaysOnTop(value:Bool):Bool { AppWindow_Ffi.set_alwaysOnTop(this, value); return value; }
	public var skipTaskbar(get, set):Bool;

	inline function get_skipTaskbar():Bool return AppWindow_Ffi.get_skipTaskbar(this);

	inline function set_skipTaskbar(value:Bool):Bool { AppWindow_Ffi.set_skipTaskbar(this, value); return value; }
	public var opacity(get, set):Single;

	inline function get_opacity():Single return AppWindow_Ffi.get_opacity(this);

	inline function set_opacity(value:Single):Single { AppWindow_Ffi.set_opacity(this, value); return value; }
	public var icon(get, set):String;
	inline function get_icon():String { var raw = AppWindow_Ffi.get_icon(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AppWindow_Ffi.freeString(raw); return value; }
	inline function set_icon(value:String):String { var raw:cpp.ConstCharStar = cast value; AppWindow_Ffi.set_icon(this, raw); return value; }
	public var minWidth(get, set):Single;

	inline function get_minWidth():Single return AppWindow_Ffi.get_minWidth(this);

	inline function set_minWidth(value:Single):Single { AppWindow_Ffi.set_minWidth(this, value); return value; }
	public var minHeight(get, set):Single;

	inline function get_minHeight():Single return AppWindow_Ffi.get_minHeight(this);

	inline function set_minHeight(value:Single):Single { AppWindow_Ffi.set_minHeight(this, value); return value; }
	public var maxWidth(get, set):Single;

	inline function get_maxWidth():Single return AppWindow_Ffi.get_maxWidth(this);

	inline function set_maxWidth(value:Single):Single { AppWindow_Ffi.set_maxWidth(this, value); return value; }
	public var maxHeight(get, set):Single;

	inline function get_maxHeight():Single return AppWindow_Ffi.get_maxHeight(this);

	inline function set_maxHeight(value:Single):Single { AppWindow_Ffi.set_maxHeight(this, value); return value; }
}
