package flight._cpp;

private extern class ShareResult_Ffi {
	@:native("flight_get_share_result_completed") static function get_completed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_share_result_completed") static function set_completed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_share_result_dismissed") static function get_dismissed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_share_result_dismissed") static function set_dismissed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ShareResult(cpp.Star<cpp.Void>) {
	public var completed(get, set):Bool;

	inline function get_completed():Bool return ShareResult_Ffi.get_completed(this);

	inline function set_completed(value:Bool):Bool { ShareResult_Ffi.set_completed(this, value); return value; }
	public var dismissed(get, set):Bool;

	inline function get_dismissed():Bool return ShareResult_Ffi.get_dismissed(this);

	inline function set_dismissed(value:Bool):Bool { ShareResult_Ffi.set_dismissed(this, value); return value; }
}
