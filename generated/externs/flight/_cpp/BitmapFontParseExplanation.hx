package flight._cpp;

private extern class BitmapFontParseExplanation_Ffi {
	@:native("flight_get_bitmap_font_parse_explanation_char_count") static function get_charCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_parse_explanation_char_count") static function set_charCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_parse_explanation_kerning_count") static function get_kerningCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_parse_explanation_kerning_count") static function set_kerningCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_parse_explanation_page_count") static function get_pageCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_parse_explanation_page_count") static function set_pageCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_parse_explanation_success") static function get_success(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_bitmap_font_parse_explanation_success") static function set_success(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract BitmapFontParseExplanation(cpp.Star<cpp.Void>) {
	public var charCount(get, set):Int;

	inline function get_charCount():Int return BitmapFontParseExplanation_Ffi.get_charCount(this);

	inline function set_charCount(value:Int):Int { BitmapFontParseExplanation_Ffi.set_charCount(this, value); return value; }
	public var kerningCount(get, set):Int;

	inline function get_kerningCount():Int return BitmapFontParseExplanation_Ffi.get_kerningCount(this);

	inline function set_kerningCount(value:Int):Int { BitmapFontParseExplanation_Ffi.set_kerningCount(this, value); return value; }
	public var pageCount(get, set):Int;

	inline function get_pageCount():Int return BitmapFontParseExplanation_Ffi.get_pageCount(this);

	inline function set_pageCount(value:Int):Int { BitmapFontParseExplanation_Ffi.set_pageCount(this, value); return value; }
	public var success(get, set):Bool;

	inline function get_success():Bool return BitmapFontParseExplanation_Ffi.get_success(this);

	inline function set_success(value:Bool):Bool { BitmapFontParseExplanation_Ffi.set_success(this, value); return value; }
}
