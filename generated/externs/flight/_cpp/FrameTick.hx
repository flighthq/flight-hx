package flight._cpp;

private extern class FrameTick_Ffi {
	@:native("flight_get_frame_tick_delta_time") static function get_deltaTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_frame_tick_delta_time") static function set_deltaTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract FrameTick(cpp.Star<cpp.Void>) {
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return FrameTick_Ffi.get_deltaTime(this);

	inline function set_deltaTime(value:Float):Float return FrameTick_Ffi.set_deltaTime(this, value);
}
