package flight._cpp;

private extern class NetProgress_Ffi {
	@:native("flight_get_net_progress_loaded") static function get_loaded(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_net_progress_loaded") static function set_loaded(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_net_progress_total") static function get_total(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_net_progress_total") static function set_total(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract NetProgress(cpp.Star<cpp.Void>) {
	public var loaded(get, set):Int;

	inline function get_loaded():Int return NetProgress_Ffi.get_loaded(this);

	inline function set_loaded(value:Int):Int { NetProgress_Ffi.set_loaded(this, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return NetProgress_Ffi.get_total(this);

	inline function set_total(value:Int):Int { NetProgress_Ffi.set_total(this, value); return value; }
}
