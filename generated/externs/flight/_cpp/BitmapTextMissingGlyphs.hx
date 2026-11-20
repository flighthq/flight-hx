package flight._cpp;

private extern class BitmapTextMissingGlyphs_Ffi {
	@:native("flight_get_bitmap_text_missing_glyphs_total_codepoints") static function get_totalCodepoints(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_text_missing_glyphs_total_codepoints") static function set_totalCodepoints(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapTextMissingGlyphs(cpp.Star<cpp.Void>) {
	public var totalCodepoints(get, set):Int;

	inline function get_totalCodepoints():Int return BitmapTextMissingGlyphs_Ffi.get_totalCodepoints(this);

	inline function set_totalCodepoints(value:Int):Int { BitmapTextMissingGlyphs_Ffi.set_totalCodepoints(this, value); return value; }
}
