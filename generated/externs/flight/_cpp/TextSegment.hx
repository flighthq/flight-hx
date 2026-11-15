package flight._cpp;

private extern class TextSegment_Ffi {
	@:native("flight_get_text_segment_start") static function get_start(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_segment_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_segment_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_segment_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextSegment(cpp.Star<cpp.Void>) {
	public var start(get, set):Int;

	inline function get_start():Int return TextSegment_Ffi.get_start(this);

	inline function set_start(value:Int):Int return TextSegment_Ffi.set_start(this, value);
	public var end(get, set):Int;

	inline function get_end():Int return TextSegment_Ffi.get_end(this);

	inline function set_end(value:Int):Int return TextSegment_Ffi.set_end(this, value);
}
