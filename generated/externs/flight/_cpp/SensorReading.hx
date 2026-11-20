package flight._cpp;

private extern class SensorReading_Ffi {
	@:native("flight_get_sensor_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_sensor_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_sensor_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_sensor_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract SensorReading(cpp.Star<cpp.Void>) {
	public var interval(get, set):Float;

	inline function get_interval():Float return SensorReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { SensorReading_Ffi.set_interval(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return SensorReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { SensorReading_Ffi.set_timestamp(this, value); return value; }
}
