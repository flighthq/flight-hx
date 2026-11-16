package flight._cpp;

private extern class BitmapFontGlyphExplanation_Ffi {
	@:native("flight_get_bitmap_font_glyph_explanation_glyph_height") static function get_glyphHeight(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_explanation_glyph_height") static function set_glyphHeight(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_explanation_glyph_width") static function get_glyphWidth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_explanation_glyph_width") static function set_glyphWidth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_explanation_page") static function get_page(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_explanation_page") static function set_page(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_explanation_page_count") static function get_pageCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_explanation_page_count") static function set_pageCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_explanation_renderable") static function get_renderable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_bitmap_font_glyph_explanation_renderable") static function set_renderable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract BitmapFontGlyphExplanation(cpp.Star<cpp.Void>) {
	public var glyphHeight(get, set):Int;

	inline function get_glyphHeight():Int return BitmapFontGlyphExplanation_Ffi.get_glyphHeight(this);

	inline function set_glyphHeight(value:Int):Int { BitmapFontGlyphExplanation_Ffi.set_glyphHeight(this, value); return value; }
	public var glyphWidth(get, set):Int;

	inline function get_glyphWidth():Int return BitmapFontGlyphExplanation_Ffi.get_glyphWidth(this);

	inline function set_glyphWidth(value:Int):Int { BitmapFontGlyphExplanation_Ffi.set_glyphWidth(this, value); return value; }
	public var page(get, set):Int;

	inline function get_page():Int return BitmapFontGlyphExplanation_Ffi.get_page(this);

	inline function set_page(value:Int):Int { BitmapFontGlyphExplanation_Ffi.set_page(this, value); return value; }
	public var pageCount(get, set):Int;

	inline function get_pageCount():Int return BitmapFontGlyphExplanation_Ffi.get_pageCount(this);

	inline function set_pageCount(value:Int):Int { BitmapFontGlyphExplanation_Ffi.set_pageCount(this, value); return value; }
	public var renderable(get, set):Bool;

	inline function get_renderable():Bool return BitmapFontGlyphExplanation_Ffi.get_renderable(this);

	inline function set_renderable(value:Bool):Bool { BitmapFontGlyphExplanation_Ffi.set_renderable(this, value); return value; }
}
