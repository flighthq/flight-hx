package flight._cpp;

private extern class GlyphOutlineMetrics_Ffi {
	@:native("flight_get_glyph_outline_metrics_ascent") static function get_ascent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_outline_metrics_ascent") static function set_ascent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_outline_metrics_descent") static function get_descent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_outline_metrics_descent") static function set_descent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_outline_metrics_line_gap") static function get_lineGap(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_outline_metrics_line_gap") static function set_lineGap(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_outline_metrics_units_per_em") static function get_unitsPerEm(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_outline_metrics_units_per_em") static function set_unitsPerEm(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GlyphOutlineMetrics(cpp.Star<cpp.Void>) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return GlyphOutlineMetrics_Ffi.get_ascent(this);

	inline function set_ascent(value:Single):Single return GlyphOutlineMetrics_Ffi.set_ascent(this, value);
	public var descent(get, set):Single;

	inline function get_descent():Single return GlyphOutlineMetrics_Ffi.get_descent(this);

	inline function set_descent(value:Single):Single return GlyphOutlineMetrics_Ffi.set_descent(this, value);
	public var lineGap(get, set):Single;

	inline function get_lineGap():Single return GlyphOutlineMetrics_Ffi.get_lineGap(this);

	inline function set_lineGap(value:Single):Single return GlyphOutlineMetrics_Ffi.set_lineGap(this, value);
	public var unitsPerEm(get, set):Single;

	inline function get_unitsPerEm():Single return GlyphOutlineMetrics_Ffi.get_unitsPerEm(this);

	inline function set_unitsPerEm(value:Single):Single return GlyphOutlineMetrics_Ffi.set_unitsPerEm(this, value);
}
