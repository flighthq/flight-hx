package flight._cpp;

private extern class GlyphRasterizeOptions_Ffi {
	@:native("flight_get_glyph_rasterize_options_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_rasterize_options_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GlyphRasterizeOptions(cpp.Star<cpp.Void>) {
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return GlyphRasterizeOptions_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Single):Single { GlyphRasterizeOptions_Ffi.set_fontSize(this, value); return value; }
}
