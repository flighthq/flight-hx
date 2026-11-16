package flight._cpp;

private extern class SpineRangeValue_Ffi {
	@:native("flight_get_spine_range_value_high") static function get_high(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_range_value_high") static function set_high(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spine_range_value_low") static function get_low(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_range_value_low") static function set_low(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpineRangeValue(cpp.Star<cpp.Void>) {
	public var high(get, set):Single;

	inline function get_high():Single return SpineRangeValue_Ffi.get_high(this);

	inline function set_high(value:Single):Single { SpineRangeValue_Ffi.set_high(this, value); return value; }
	public var low(get, set):Single;

	inline function get_low():Single return SpineRangeValue_Ffi.get_low(this);

	inline function set_low(value:Single):Single { SpineRangeValue_Ffi.set_low(this, value); return value; }
}
