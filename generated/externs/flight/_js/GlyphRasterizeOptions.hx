package flight._js;

@:jsRequire("flight")
private extern class GlyphRasterizeOptions_Ffi {
	@:native("flight_get_glyph_rasterize_options_font_size") static function get_fontSize(ptr:Dynamic):Float;
	@:native("flight_set_glyph_rasterize_options_font_size") static function set_fontSize(ptr:Dynamic, value:Float):Float;
}

abstract GlyphRasterizeOptions(Dynamic) {
	public var fontSize(get, set):Float;

	inline function get_fontSize():Float return GlyphRasterizeOptions_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Float):Float return GlyphRasterizeOptions_Ffi.set_fontSize(this, value);
}
