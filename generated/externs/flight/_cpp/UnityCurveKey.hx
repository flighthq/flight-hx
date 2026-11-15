package flight._cpp;

private extern class UnityCurveKey_Ffi {
	@:native("flight_get_unity_curve_key_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_curve_key_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_curve_key_value") static function get_value(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_curve_key_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnityCurveKey(cpp.Star<cpp.Void>) {
	public var time(get, set):Single;

	inline function get_time():Single return UnityCurveKey_Ffi.get_time(this);

	inline function set_time(value:Single):Single return UnityCurveKey_Ffi.set_time(this, value);
	public var value(get, set):Single;

	inline function get_value():Single return UnityCurveKey_Ffi.get_value(this);

	inline function set_value(value:Single):Single return UnityCurveKey_Ffi.set_value(this, value);
}
