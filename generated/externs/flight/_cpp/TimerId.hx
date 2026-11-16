package flight._cpp;

private extern class TimerId_Ffi {
	@:native("flight_get_timer_id_value") static function get_value(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_timer_id_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract TimerId(cpp.Star<cpp.Void>) {
	public var value(get, set):haxe.Int64;

	inline function get_value():haxe.Int64 return TimerId_Ffi.get_value(this);

	inline function set_value(value:haxe.Int64):haxe.Int64 { TimerId_Ffi.set_value(this, value); return value; }
}
