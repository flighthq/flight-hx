package flight._js;

@:jsRequire("flight")
private extern class Timeline_Ffi {
	@:native("flight_get_timeline_current_frame") static function get_currentFrame(ptr:Dynamic):Int;
	@:native("flight_set_timeline_current_frame") static function set_currentFrame(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_timeline_is_playing") static function get_isPlaying(ptr:Dynamic):Bool;
	@:native("flight_set_timeline_is_playing") static function set_isPlaying(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_timeline_time_elapsed") static function get_timeElapsed(ptr:Dynamic):Float;
	@:native("flight_set_timeline_time_elapsed") static function set_timeElapsed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_timeline_last_frame_update") static function get_lastFrameUpdate(ptr:Dynamic):Int;
	@:native("flight_set_timeline_last_frame_update") static function set_lastFrameUpdate(ptr:Dynamic, value:Int):Int;
}

abstract Timeline(Dynamic) {
	public var currentFrame(get, set):Int;

	inline function get_currentFrame():Int return Timeline_Ffi.get_currentFrame(this);

	inline function set_currentFrame(value:Int):Int return Timeline_Ffi.set_currentFrame(this, value);
	public var isPlaying(get, set):Bool;

	inline function get_isPlaying():Bool return Timeline_Ffi.get_isPlaying(this);

	inline function set_isPlaying(value:Bool):Bool return Timeline_Ffi.set_isPlaying(this, value);
	public var timeElapsed(get, set):Float;

	inline function get_timeElapsed():Float return Timeline_Ffi.get_timeElapsed(this);

	inline function set_timeElapsed(value:Float):Float return Timeline_Ffi.set_timeElapsed(this, value);
	public var lastFrameUpdate(get, set):Int;

	inline function get_lastFrameUpdate():Int return Timeline_Ffi.get_lastFrameUpdate(this);

	inline function set_lastFrameUpdate(value:Int):Int return Timeline_Ffi.set_lastFrameUpdate(this, value);
}
