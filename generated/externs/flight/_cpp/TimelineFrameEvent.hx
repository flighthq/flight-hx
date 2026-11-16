package flight._cpp;

private extern class TimelineFrameEvent_Ffi {
	@:native("flight_get_timeline_frame_event_frame") static function get_frame(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_frame_event_frame") static function set_frame(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_timeline_frame_event_previous_frame") static function get_previousFrame(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_frame_event_previous_frame") static function set_previousFrame(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TimelineFrameEvent(cpp.Star<cpp.Void>) {
	public var frame(get, set):Int;

	inline function get_frame():Int return TimelineFrameEvent_Ffi.get_frame(this);

	inline function set_frame(value:Int):Int { TimelineFrameEvent_Ffi.set_frame(this, value); return value; }
	public var previousFrame(get, set):Int;

	inline function get_previousFrame():Int return TimelineFrameEvent_Ffi.get_previousFrame(this);

	inline function set_previousFrame(value:Int):Int { TimelineFrameEvent_Ffi.set_previousFrame(this, value); return value; }
}
