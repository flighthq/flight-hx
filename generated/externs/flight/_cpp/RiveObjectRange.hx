package flight._cpp;

private extern class RiveObjectRange_Ffi {
	@:native("flight_get_rive_object_range_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rive_object_range_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_rive_object_range_start") static function get_start(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rive_object_range_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract RiveObjectRange(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return RiveObjectRange_Ffi.get_end(this);

	inline function set_end(value:Int):Int { RiveObjectRange_Ffi.set_end(this, value); return value; }
	public var start(get, set):Int;

	inline function get_start():Int return RiveObjectRange_Ffi.get_start(this);

	inline function set_start(value:Int):Int { RiveObjectRange_Ffi.set_start(this, value); return value; }
}
