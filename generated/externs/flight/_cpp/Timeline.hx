package flight._cpp;

private extern class Timeline_Ffi {
	@:native("flight_get_timeline_current_frame") static function get_currentFrame(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_current_frame") static function set_currentFrame(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_timeline_is_playing") static function get_isPlaying(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_timeline_is_playing") static function set_isPlaying(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_timeline_time_elapsed") static function get_timeElapsed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_timeline_time_elapsed") static function set_timeElapsed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_timeline_last_frame_update") static function get_lastFrameUpdate(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_last_frame_update") static function set_lastFrameUpdate(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Timeline(cpp.Star<cpp.Void>) {
	public var currentFrame(get, set):Int;

	inline function get_currentFrame():Int return Timeline_Ffi.get_currentFrame(this);

	inline function set_currentFrame(value:Int):Int { Timeline_Ffi.set_currentFrame(this, value); return value; }
	public var isPlaying(get, set):Bool;

	inline function get_isPlaying():Bool return Timeline_Ffi.get_isPlaying(this);

	inline function set_isPlaying(value:Bool):Bool { Timeline_Ffi.set_isPlaying(this, value); return value; }
	public var timeElapsed(get, set):Float;

	inline function get_timeElapsed():Float return Timeline_Ffi.get_timeElapsed(this);

	inline function set_timeElapsed(value:Float):Float { Timeline_Ffi.set_timeElapsed(this, value); return value; }
	public var lastFrameUpdate(get, set):Int;

	inline function get_lastFrameUpdate():Int return Timeline_Ffi.get_lastFrameUpdate(this);

	inline function set_lastFrameUpdate(value:Int):Int { Timeline_Ffi.set_lastFrameUpdate(this, value); return value; }
}
