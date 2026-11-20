package flight._cpp;

private extern class PressureReading_Ffi {
	@:native("flight_get_pressure_reading_altitude") static function get_altitude(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pressure_reading_altitude") static function set_altitude(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pressure_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pressure_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pressure_reading_pressure") static function get_pressure(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pressure_reading_pressure") static function set_pressure(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pressure_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pressure_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract PressureReading(cpp.Star<cpp.Void>) {
	public var altitude(get, set):Float;

	inline function get_altitude():Float return PressureReading_Ffi.get_altitude(this);

	inline function set_altitude(value:Float):Float { PressureReading_Ffi.set_altitude(this, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return PressureReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { PressureReading_Ffi.set_interval(this, value); return value; }
	public var pressure(get, set):Float;

	inline function get_pressure():Float return PressureReading_Ffi.get_pressure(this);

	inline function set_pressure(value:Float):Float { PressureReading_Ffi.set_pressure(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return PressureReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { PressureReading_Ffi.set_timestamp(this, value); return value; }
}
