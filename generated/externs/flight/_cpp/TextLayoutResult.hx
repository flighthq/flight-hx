package flight._cpp;

private extern class TextLayoutResult_Ffi {
	@:native("flight_get_text_layout_result_num_lines") static function get_numLines(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_layout_result_num_lines") static function set_numLines(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_layout_result_text_height") static function get_textHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_result_text_height") static function set_textHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_result_text_width") static function get_textWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_result_text_width") static function set_textWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextLayoutResult(cpp.Star<cpp.Void>) {
	public var numLines(get, set):Int;

	inline function get_numLines():Int return TextLayoutResult_Ffi.get_numLines(this);

	inline function set_numLines(value:Int):Int { TextLayoutResult_Ffi.set_numLines(this, value); return value; }
	public var textHeight(get, set):Single;

	inline function get_textHeight():Single return TextLayoutResult_Ffi.get_textHeight(this);

	inline function set_textHeight(value:Single):Single { TextLayoutResult_Ffi.set_textHeight(this, value); return value; }
	public var textWidth(get, set):Single;

	inline function get_textWidth():Single return TextLayoutResult_Ffi.get_textWidth(this);

	inline function set_textWidth(value:Single):Single { TextLayoutResult_Ffi.set_textWidth(this, value); return value; }
}
