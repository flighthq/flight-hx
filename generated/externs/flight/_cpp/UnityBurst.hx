package flight._cpp;

private extern class UnityBurst_Ffi {
	@:native("flight_get_unity_burst_count") static function get_count(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_burst_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_burst_cycle_count") static function get_cycleCount(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_burst_cycle_count") static function set_cycleCount(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_burst_repeat_interval") static function get_repeatInterval(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_burst_repeat_interval") static function set_repeatInterval(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_burst_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_burst_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnityBurst(cpp.Star<cpp.Void>) {
	public var count(get, set):Single;

	inline function get_count():Single return UnityBurst_Ffi.get_count(this);

	inline function set_count(value:Single):Single return UnityBurst_Ffi.set_count(this, value);
	public var cycleCount(get, set):Single;

	inline function get_cycleCount():Single return UnityBurst_Ffi.get_cycleCount(this);

	inline function set_cycleCount(value:Single):Single return UnityBurst_Ffi.set_cycleCount(this, value);
	public var repeatInterval(get, set):Single;

	inline function get_repeatInterval():Single return UnityBurst_Ffi.get_repeatInterval(this);

	inline function set_repeatInterval(value:Single):Single return UnityBurst_Ffi.set_repeatInterval(this, value);
	public var time(get, set):Single;

	inline function get_time():Single return UnityBurst_Ffi.get_time(this);

	inline function set_time(value:Single):Single return UnityBurst_Ffi.set_time(this, value);
}
