package flight._js;

@:jsRequire("flight")
private extern class SpineRangeValue_Ffi {
	@:native("flight_get_spine_range_value_high") static function get_high(ptr:Dynamic):Float;
	@:native("flight_set_spine_range_value_high") static function set_high(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spine_range_value_low") static function get_low(ptr:Dynamic):Float;
	@:native("flight_set_spine_range_value_low") static function set_low(ptr:Dynamic, value:Float):Float;
}

abstract SpineRangeValue(Dynamic) {
	public var high(get, set):Float;

	inline function get_high():Float return SpineRangeValue_Ffi.get_high(this);

	inline function set_high(value:Float):Float return SpineRangeValue_Ffi.set_high(this, value);
	public var low(get, set):Float;

	inline function get_low():Float return SpineRangeValue_Ffi.get_low(this);

	inline function set_low(value:Float):Float return SpineRangeValue_Ffi.set_low(this, value);
}
