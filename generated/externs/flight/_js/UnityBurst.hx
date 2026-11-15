package flight._js;

@:jsRequire("flight")
private extern class UnityBurst_Ffi {
	@:native("flight_get_unity_burst_count") static function get_count(ptr:Dynamic):Float;
	@:native("flight_set_unity_burst_count") static function set_count(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_burst_cycle_count") static function get_cycleCount(ptr:Dynamic):Float;
	@:native("flight_set_unity_burst_cycle_count") static function set_cycleCount(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_burst_repeat_interval") static function get_repeatInterval(ptr:Dynamic):Float;
	@:native("flight_set_unity_burst_repeat_interval") static function set_repeatInterval(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_burst_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_unity_burst_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract UnityBurst(Dynamic) {
	public var count(get, set):Float;

	inline function get_count():Float return UnityBurst_Ffi.get_count(this);

	inline function set_count(value:Float):Float return UnityBurst_Ffi.set_count(this, value);
	public var cycleCount(get, set):Float;

	inline function get_cycleCount():Float return UnityBurst_Ffi.get_cycleCount(this);

	inline function set_cycleCount(value:Float):Float return UnityBurst_Ffi.set_cycleCount(this, value);
	public var repeatInterval(get, set):Float;

	inline function get_repeatInterval():Float return UnityBurst_Ffi.get_repeatInterval(this);

	inline function set_repeatInterval(value:Float):Float return UnityBurst_Ffi.set_repeatInterval(this, value);
	public var time(get, set):Float;

	inline function get_time():Float return UnityBurst_Ffi.get_time(this);

	inline function set_time(value:Float):Float return UnityBurst_Ffi.set_time(this, value);
}
