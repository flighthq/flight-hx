package flight._cpp;

private extern class RotationRateReading_Ffi {
	@:native("flight_get_rotation_rate_reading_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rotation_rate_reading_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rotation_rate_reading_beta") static function get_beta(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rotation_rate_reading_beta") static function set_beta(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rotation_rate_reading_gamma") static function get_gamma(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rotation_rate_reading_gamma") static function set_gamma(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rotation_rate_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rotation_rate_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rotation_rate_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rotation_rate_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract RotationRateReading(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return RotationRateReading_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float { RotationRateReading_Ffi.set_alpha(this, value); return value; }
	public var beta(get, set):Float;

	inline function get_beta():Float return RotationRateReading_Ffi.get_beta(this);

	inline function set_beta(value:Float):Float { RotationRateReading_Ffi.set_beta(this, value); return value; }
	public var gamma(get, set):Float;

	inline function get_gamma():Float return RotationRateReading_Ffi.get_gamma(this);

	inline function set_gamma(value:Float):Float { RotationRateReading_Ffi.set_gamma(this, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return RotationRateReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { RotationRateReading_Ffi.set_interval(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return RotationRateReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { RotationRateReading_Ffi.set_timestamp(this, value); return value; }
}
