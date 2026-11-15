package flight._cpp;

private extern class BitmapFontSummary_Ffi {
	@:native("flight_get_bitmap_font_summary_byte_size") static function get_byteSize(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_summary_byte_size") static function set_byteSize(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_summary_glyph_count") static function get_glyphCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_summary_glyph_count") static function set_glyphCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_summary_kerning_pair_count") static function get_kerningPairCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_summary_kerning_pair_count") static function set_kerningPairCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_summary_max_codepoint") static function get_maxCodepoint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_summary_max_codepoint") static function set_maxCodepoint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_summary_min_codepoint") static function get_minCodepoint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_summary_min_codepoint") static function set_minCodepoint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_summary_page_count") static function get_pageCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_summary_page_count") static function set_pageCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontSummary(cpp.Star<cpp.Void>) {
	public var byteSize(get, set):Int;

	inline function get_byteSize():Int return BitmapFontSummary_Ffi.get_byteSize(this);

	inline function set_byteSize(value:Int):Int return BitmapFontSummary_Ffi.set_byteSize(this, value);
	public var glyphCount(get, set):Int;

	inline function get_glyphCount():Int return BitmapFontSummary_Ffi.get_glyphCount(this);

	inline function set_glyphCount(value:Int):Int return BitmapFontSummary_Ffi.set_glyphCount(this, value);
	public var kerningPairCount(get, set):Int;

	inline function get_kerningPairCount():Int return BitmapFontSummary_Ffi.get_kerningPairCount(this);

	inline function set_kerningPairCount(value:Int):Int return BitmapFontSummary_Ffi.set_kerningPairCount(this, value);
	public var maxCodepoint(get, set):Int;

	inline function get_maxCodepoint():Int return BitmapFontSummary_Ffi.get_maxCodepoint(this);

	inline function set_maxCodepoint(value:Int):Int return BitmapFontSummary_Ffi.set_maxCodepoint(this, value);
	public var minCodepoint(get, set):Int;

	inline function get_minCodepoint():Int return BitmapFontSummary_Ffi.get_minCodepoint(this);

	inline function set_minCodepoint(value:Int):Int return BitmapFontSummary_Ffi.set_minCodepoint(this, value);
	public var pageCount(get, set):Int;

	inline function get_pageCount():Int return BitmapFontSummary_Ffi.get_pageCount(this);

	inline function set_pageCount(value:Int):Int return BitmapFontSummary_Ffi.set_pageCount(this, value);
}
