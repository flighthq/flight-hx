package flight._js;

@:jsRequire("flight")
private extern class FrameTick_Ffi {
	@:native("flight_get_frame_tick_delta_time") static function get_deltaTime(ptr:Dynamic):Float;
	@:native("flight_set_frame_tick_delta_time") static function set_deltaTime(ptr:Dynamic, value:Float):Float;
}

abstract FrameTick(Dynamic) {
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return FrameTick_Ffi.get_deltaTime(this);

	inline function set_deltaTime(value:Float):Float return FrameTick_Ffi.set_deltaTime(this, value);
}
