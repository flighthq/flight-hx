package flight._cpp;

private extern class AmbientLightReading_Ffi {
	@:native("flight_get_ambient_light_reading_illuminance") static function get_illuminance(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_ambient_light_reading_illuminance") static function set_illuminance(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_ambient_light_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_ambient_light_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_ambient_light_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_ambient_light_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract AmbientLightReading(cpp.Star<cpp.Void>) {
	public var illuminance(get, set):Float;

	inline function get_illuminance():Float return AmbientLightReading_Ffi.get_illuminance(this);

	inline function set_illuminance(value:Float):Float { AmbientLightReading_Ffi.set_illuminance(this, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return AmbientLightReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { AmbientLightReading_Ffi.set_interval(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return AmbientLightReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { AmbientLightReading_Ffi.set_timestamp(this, value); return value; }
}
