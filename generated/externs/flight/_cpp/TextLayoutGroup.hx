package flight._cpp;

private extern class TextLayoutGroup_Ffi {
	@:native("flight_get_text_layout_group_ascent") static function get_ascent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_ascent") static function set_ascent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_group_descent") static function get_descent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_descent") static function set_descent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_group_end_index") static function get_endIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_layout_group_end_index") static function set_endIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_layout_group_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_group_leading") static function get_leading(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_leading") static function set_leading(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_group_line_index") static function get_lineIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_layout_group_line_index") static function set_lineIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_layout_group_offset_x") static function get_offsetX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_offset_x") static function set_offsetX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_group_offset_y") static function get_offsetY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_offset_y") static function set_offsetY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_layout_group_start_index") static function get_startIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_layout_group_start_index") static function set_startIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_layout_group_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_group_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextLayoutGroup(cpp.Star<cpp.Void>) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return TextLayoutGroup_Ffi.get_ascent(this);

	inline function set_ascent(value:Single):Single { TextLayoutGroup_Ffi.set_ascent(this, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return TextLayoutGroup_Ffi.get_descent(this);

	inline function set_descent(value:Single):Single { TextLayoutGroup_Ffi.set_descent(this, value); return value; }
	public var endIndex(get, set):Int;

	inline function get_endIndex():Int return TextLayoutGroup_Ffi.get_endIndex(this);

	inline function set_endIndex(value:Int):Int { TextLayoutGroup_Ffi.set_endIndex(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return TextLayoutGroup_Ffi.get_height(this);

	inline function set_height(value:Single):Single { TextLayoutGroup_Ffi.set_height(this, value); return value; }
	public var leading(get, set):Single;

	inline function get_leading():Single return TextLayoutGroup_Ffi.get_leading(this);

	inline function set_leading(value:Single):Single { TextLayoutGroup_Ffi.set_leading(this, value); return value; }
	public var lineIndex(get, set):Int;

	inline function get_lineIndex():Int return TextLayoutGroup_Ffi.get_lineIndex(this);

	inline function set_lineIndex(value:Int):Int { TextLayoutGroup_Ffi.set_lineIndex(this, value); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return TextLayoutGroup_Ffi.get_offsetX(this);

	inline function set_offsetX(value:Single):Single { TextLayoutGroup_Ffi.set_offsetX(this, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return TextLayoutGroup_Ffi.get_offsetY(this);

	inline function set_offsetY(value:Single):Single { TextLayoutGroup_Ffi.set_offsetY(this, value); return value; }
	public var startIndex(get, set):Int;

	inline function get_startIndex():Int return TextLayoutGroup_Ffi.get_startIndex(this);

	inline function set_startIndex(value:Int):Int { TextLayoutGroup_Ffi.set_startIndex(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return TextLayoutGroup_Ffi.get_width(this);

	inline function set_width(value:Single):Single { TextLayoutGroup_Ffi.set_width(this, value); return value; }
}
