package flight._cpp;

private extern class TimelineSource_Ffi {
	@:native("flight_get_timeline_source_total_frames") static function get_totalFrames(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_source_total_frames") static function set_totalFrames(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TimelineSource(cpp.Star<cpp.Void>) {
	public var totalFrames(get, set):Int;

	inline function get_totalFrames():Int return TimelineSource_Ffi.get_totalFrames(this);

	inline function set_totalFrames(value:Int):Int return TimelineSource_Ffi.set_totalFrames(this, value);
}
