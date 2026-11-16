package flight._cpp;

private extern class Awd2PropertySpan_Ffi {
	@:native("flight_get_awd2_property_span_length") static function get_length(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_property_span_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_property_span_offset") static function get_offset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_property_span_offset") static function set_offset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2PropertySpan(cpp.Star<cpp.Void>) {
	public var length(get, set):Int;

	inline function get_length():Int return Awd2PropertySpan_Ffi.get_length(this);

	inline function set_length(value:Int):Int { Awd2PropertySpan_Ffi.set_length(this, value); return value; }
	public var offset(get, set):Int;

	inline function get_offset():Int return Awd2PropertySpan_Ffi.get_offset(this);

	inline function set_offset(value:Int):Int { Awd2PropertySpan_Ffi.set_offset(this, value); return value; }
}
