package flight._hl;

private extern class TextLayoutResult_Ffi {
	@:hlNative("flight", "flight_get_text_layout_result_num_lines")
	static function get_numLines(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_text_layout_result_num_lines")
	static function set_numLines(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_text_layout_result_text_height")
	static function get_textHeight(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_text_layout_result_text_height")
	static function set_textHeight(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_text_layout_result_text_width")
	static function get_textWidth(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_text_layout_result_text_width")
	static function set_textWidth(ptr:hl.Bytes, value:Single):Single;
}

abstract TextLayoutResult(hl.Bytes) {
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
