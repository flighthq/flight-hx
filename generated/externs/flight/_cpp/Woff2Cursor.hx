package flight._cpp;

private extern class Woff2Cursor_Ffi {
	@:native("flight_get_woff2_cursor_at") static function get_at(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_cursor_at") static function set_at(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Woff2Cursor(cpp.Star<cpp.Void>) {
	public var at(get, set):Int;

	inline function get_at():Int return Woff2Cursor_Ffi.get_at(this);

	inline function set_at(value:Int):Int { Woff2Cursor_Ffi.set_at(this, value); return value; }
}
