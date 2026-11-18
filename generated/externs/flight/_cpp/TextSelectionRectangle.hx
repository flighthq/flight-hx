package flight._cpp;

private extern class TextSelectionRectangle_Ffi {
	@:native("flight_get_text_selection_rectangle_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_selection_rectangle_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_selection_rectangle_line_index") static function get_lineIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_selection_rectangle_line_index") static function set_lineIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_selection_rectangle_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_selection_rectangle_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_selection_rectangle_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_selection_rectangle_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_selection_rectangle_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_selection_rectangle_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextSelectionRectangle(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return TextSelectionRectangle_Ffi.get_height(this);

	inline function set_height(value:Single):Single { TextSelectionRectangle_Ffi.set_height(this, value); return value; }
	public var lineIndex(get, set):Int;

	inline function get_lineIndex():Int return TextSelectionRectangle_Ffi.get_lineIndex(this);

	inline function set_lineIndex(value:Int):Int { TextSelectionRectangle_Ffi.set_lineIndex(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return TextSelectionRectangle_Ffi.get_width(this);

	inline function set_width(value:Single):Single { TextSelectionRectangle_Ffi.set_width(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return TextSelectionRectangle_Ffi.get_x(this);

	inline function set_x(value:Single):Single { TextSelectionRectangle_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return TextSelectionRectangle_Ffi.get_y(this);

	inline function set_y(value:Single):Single { TextSelectionRectangle_Ffi.set_y(this, value); return value; }
}
