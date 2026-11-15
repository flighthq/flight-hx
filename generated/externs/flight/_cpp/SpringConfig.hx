package flight._cpp;

private extern class SpringConfig_Ffi {
	@:native("flight_get_spring_config_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spring_config_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spring_config_frequency") static function get_frequency(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spring_config_frequency") static function set_frequency(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpringConfig(cpp.Star<cpp.Void>) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return SpringConfig_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Single):Single return SpringConfig_Ffi.set_dampingRatio(this, value);
	public var frequency(get, set):Single;

	inline function get_frequency():Single return SpringConfig_Ffi.get_frequency(this);

	inline function set_frequency(value:Single):Single return SpringConfig_Ffi.set_frequency(this, value);
}
