package flight._js;

@:jsRequire("flight")
private extern class GlyphOutlineMetrics_Ffi {
	@:native("flight_get_glyph_outline_metrics_ascent") static function get_ascent(ptr:Dynamic):Float;
	@:native("flight_set_glyph_outline_metrics_ascent") static function set_ascent(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_glyph_outline_metrics_descent") static function get_descent(ptr:Dynamic):Float;
	@:native("flight_set_glyph_outline_metrics_descent") static function set_descent(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_glyph_outline_metrics_line_gap") static function get_lineGap(ptr:Dynamic):Float;
	@:native("flight_set_glyph_outline_metrics_line_gap") static function set_lineGap(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_glyph_outline_metrics_units_per_em") static function get_unitsPerEm(ptr:Dynamic):Float;
	@:native("flight_set_glyph_outline_metrics_units_per_em") static function set_unitsPerEm(ptr:Dynamic, value:Float):Float;
}

abstract GlyphOutlineMetrics(Dynamic) {
	public var ascent(get, set):Float;

	inline function get_ascent():Float return GlyphOutlineMetrics_Ffi.get_ascent(this);

	inline function set_ascent(value:Float):Float return GlyphOutlineMetrics_Ffi.set_ascent(this, value);
	public var descent(get, set):Float;

	inline function get_descent():Float return GlyphOutlineMetrics_Ffi.get_descent(this);

	inline function set_descent(value:Float):Float return GlyphOutlineMetrics_Ffi.set_descent(this, value);
	public var lineGap(get, set):Float;

	inline function get_lineGap():Float return GlyphOutlineMetrics_Ffi.get_lineGap(this);

	inline function set_lineGap(value:Float):Float return GlyphOutlineMetrics_Ffi.set_lineGap(this, value);
	public var unitsPerEm(get, set):Float;

	inline function get_unitsPerEm():Float return GlyphOutlineMetrics_Ffi.get_unitsPerEm(this);

	inline function set_unitsPerEm(value:Float):Float return GlyphOutlineMetrics_Ffi.set_unitsPerEm(this, value);
}
