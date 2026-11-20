package flight._cpp;

private extern class TimelineLabel_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_timeline_label_frame") static function get_frame(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_label_frame") static function set_frame(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_timeline_label_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_timeline_label_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TimelineLabel(cpp.Star<cpp.Void>) {
	public var frame(get, set):Int;

	inline function get_frame():Int return TimelineLabel_Ffi.get_frame(this);

	inline function set_frame(value:Int):Int { TimelineLabel_Ffi.set_frame(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = TimelineLabel_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TimelineLabel_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; TimelineLabel_Ffi.set_name(this, raw); return value; }
}
