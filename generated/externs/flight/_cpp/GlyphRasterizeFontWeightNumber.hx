package flight._cpp;

private extern class GlyphRasterizeFontWeightNumber_Ffi {
	@:native("flight_get_glyph_rasterize_font_weight_number_value") static function get_value(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_rasterize_font_weight_number_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GlyphRasterizeFontWeightNumber(cpp.Star<cpp.Void>) {
	public var value(get, set):Single;

	inline function get_value():Single return GlyphRasterizeFontWeightNumber_Ffi.get_value(this);

	inline function set_value(value:Single):Single { GlyphRasterizeFontWeightNumber_Ffi.set_value(this, value); return value; }
}
