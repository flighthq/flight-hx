package flight._cpp;

private extern class TimelineLabel_Ffi {
	@:native("flight_get_timeline_label_frame") static function get_frame(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_label_frame") static function set_frame(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TimelineLabel(cpp.Star<cpp.Void>) {
	public var frame(get, set):Int;

	inline function get_frame():Int return TimelineLabel_Ffi.get_frame(this);

	inline function set_frame(value:Int):Int return TimelineLabel_Ffi.set_frame(this, value);
}
