package flight._js;

@:jsRequire("flight")
private extern class GlyphRasterizeFontWeightNumber_Ffi {
	@:native("flight_get_glyph_rasterize_font_weight_number_value") static function get_value(ptr:Dynamic):Float;
	@:native("flight_set_glyph_rasterize_font_weight_number_value") static function set_value(ptr:Dynamic, value:Float):Float;
}

abstract GlyphRasterizeFontWeightNumber(Dynamic) {
	public var value(get, set):Float;

	inline function get_value():Float return GlyphRasterizeFontWeightNumber_Ffi.get_value(this);

	inline function set_value(value:Float):Float return GlyphRasterizeFontWeightNumber_Ffi.set_value(this, value);
}
