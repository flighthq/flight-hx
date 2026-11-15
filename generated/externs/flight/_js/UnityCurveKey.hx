package flight._js;

@:jsRequire("flight")
private extern class UnityCurveKey_Ffi {
	@:native("flight_get_unity_curve_key_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_unity_curve_key_time") static function set_time(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_curve_key_value") static function get_value(ptr:Dynamic):Float;
	@:native("flight_set_unity_curve_key_value") static function set_value(ptr:Dynamic, value:Float):Float;
}

abstract UnityCurveKey(Dynamic) {
	public var time(get, set):Float;

	inline function get_time():Float return UnityCurveKey_Ffi.get_time(this);

	inline function set_time(value:Float):Float return UnityCurveKey_Ffi.set_time(this, value);
	public var value(get, set):Float;

	inline function get_value():Float return UnityCurveKey_Ffi.get_value(this);

	inline function set_value(value:Float):Float return UnityCurveKey_Ffi.set_value(this, value);
}
