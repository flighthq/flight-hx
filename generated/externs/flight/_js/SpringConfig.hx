package flight._js;

@:jsRequire("flight")
private extern class SpringConfig_Ffi {
	@:native("flight_get_spring_config_damping_ratio") static function get_dampingRatio(ptr:Dynamic):Float;
	@:native("flight_set_spring_config_damping_ratio") static function set_dampingRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spring_config_frequency") static function get_frequency(ptr:Dynamic):Float;
	@:native("flight_set_spring_config_frequency") static function set_frequency(ptr:Dynamic, value:Float):Float;
}

abstract SpringConfig(Dynamic) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return SpringConfig_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float return SpringConfig_Ffi.set_dampingRatio(this, value);
	public var frequency(get, set):Float;

	inline function get_frequency():Float return SpringConfig_Ffi.get_frequency(this);

	inline function set_frequency(value:Float):Float return SpringConfig_Ffi.set_frequency(this, value);
}
