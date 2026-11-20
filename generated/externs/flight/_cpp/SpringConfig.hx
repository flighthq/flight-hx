package flight._cpp;

private extern class SpringConfig_Ffi {
	@:native("flight_get_spring_config_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spring_config_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spring_config_frequency") static function get_frequency(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spring_config_frequency") static function set_frequency(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract SpringConfig(cpp.Star<cpp.Void>) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return SpringConfig_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float { SpringConfig_Ffi.set_dampingRatio(this, value); return value; }
	public var frequency(get, set):Float;

	inline function get_frequency():Float return SpringConfig_Ffi.get_frequency(this);

	inline function set_frequency(value:Float):Float { SpringConfig_Ffi.set_frequency(this, value); return value; }
}
