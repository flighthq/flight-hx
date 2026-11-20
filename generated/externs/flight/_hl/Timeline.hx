package flight._hl;

private extern class Timeline_Ffi {
	@:hlNative("flight", "flight_get_timeline_current_frame")
	static function get_currentFrame(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_timeline_current_frame")
	static function set_currentFrame(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_timeline_is_playing")
	static function get_isPlaying(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_timeline_is_playing")
	static function set_isPlaying(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_timeline_time_elapsed")
	static function get_timeElapsed(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_timeline_time_elapsed")
	static function set_timeElapsed(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_timeline_last_frame_update")
	static function get_lastFrameUpdate(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_timeline_last_frame_update")
	static function set_lastFrameUpdate(ptr:hl.Bytes, value:Int):Int;
}

abstract Timeline(hl.Bytes) {
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

	inline public function freeRef():Void {
		flight._hl._fn.Timeline.freeTimelineRef(cast this);
	}
}
