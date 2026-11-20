package flight._cpp;

private extern class RegExpMatchRange_Ffi {
	@:native("flight_get_reg_exp_match_range_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_reg_exp_match_range_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_reg_exp_match_range_start") static function get_start(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_reg_exp_match_range_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract RegExpMatchRange(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return RegExpMatchRange_Ffi.get_end(this);

	inline function set_end(value:Int):Int { RegExpMatchRange_Ffi.set_end(this, value); return value; }
	public var start(get, set):Int;

	inline function get_start():Int return RegExpMatchRange_Ffi.get_start(this);

	inline function set_start(value:Int):Int { RegExpMatchRange_Ffi.set_start(this, value); return value; }
}
