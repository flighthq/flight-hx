package flight._cpp;

private extern class SfntTableRange_Ffi {
	@:native("flight_get_sfnt_table_range_length") static function get_length(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_sfnt_table_range_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_sfnt_table_range_offset") static function get_offset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_sfnt_table_range_offset") static function set_offset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SfntTableRange(cpp.Star<cpp.Void>) {
	public var length(get, set):Int;

	inline function get_length():Int return SfntTableRange_Ffi.get_length(this);

	inline function set_length(value:Int):Int { SfntTableRange_Ffi.set_length(this, value); return value; }
	public var offset(get, set):Int;

	inline function get_offset():Int return SfntTableRange_Ffi.get_offset(this);

	inline function set_offset(value:Int):Int { SfntTableRange_Ffi.set_offset(this, value); return value; }
}
