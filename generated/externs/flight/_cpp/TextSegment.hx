package flight._cpp;

private extern class TextSegment_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_text_segment_start") static function get_start(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_segment_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_segment_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_segment_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_text_segment_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_segment_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TextSegment(cpp.Star<cpp.Void>) {
	public var start(get, set):Int;

	inline function get_start():Int return TextSegment_Ffi.get_start(this);

	inline function set_start(value:Int):Int { TextSegment_Ffi.set_start(this, value); return value; }
	public var end(get, set):Int;

	inline function get_end():Int return TextSegment_Ffi.get_end(this);

	inline function set_end(value:Int):Int { TextSegment_Ffi.set_end(this, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = TextSegment_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextSegment_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; TextSegment_Ffi.set_text(this, raw); return value; }
}
