package flight._cpp;

private extern class WindowBounds_Ffi {
	@:native("flight_get_window_bounds_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_window_bounds_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_window_bounds_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_window_bounds_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_window_bounds_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_window_bounds_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_window_bounds_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_window_bounds_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract WindowBounds(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return WindowBounds_Ffi.get_x(this);

	inline function set_x(value:Single):Single { WindowBounds_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return WindowBounds_Ffi.get_y(this);

	inline function set_y(value:Single):Single { WindowBounds_Ffi.set_y(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return WindowBounds_Ffi.get_width(this);

	inline function set_width(value:Single):Single { WindowBounds_Ffi.set_width(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return WindowBounds_Ffi.get_height(this);

	inline function set_height(value:Single):Single { WindowBounds_Ffi.set_height(this, value); return value; }
}
