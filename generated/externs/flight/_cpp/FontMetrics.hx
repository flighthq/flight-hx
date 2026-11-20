package flight._cpp;

private extern class FontMetrics_Ffi {
	@:native("flight_get_font_metrics_ascent") static function get_ascent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_ascent") static function set_ascent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_cap_height") static function get_capHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_cap_height") static function set_capHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_descent") static function get_descent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_descent") static function set_descent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_line_gap") static function get_lineGap(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_line_gap") static function set_lineGap(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_underline_position") static function get_underlinePosition(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_underline_position") static function set_underlinePosition(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_underline_thickness") static function get_underlineThickness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_underline_thickness") static function set_underlineThickness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_units_per_em") static function get_unitsPerEm(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_units_per_em") static function set_unitsPerEm(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_metrics_x_height") static function get_xHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_metrics_x_height") static function set_xHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract FontMetrics(cpp.Star<cpp.Void>) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return FontMetrics_Ffi.get_ascent(this);

	inline function set_ascent(value:Single):Single { FontMetrics_Ffi.set_ascent(this, value); return value; }
	public var capHeight(get, set):Single;

	inline function get_capHeight():Single return FontMetrics_Ffi.get_capHeight(this);

	inline function set_capHeight(value:Single):Single { FontMetrics_Ffi.set_capHeight(this, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return FontMetrics_Ffi.get_descent(this);

	inline function set_descent(value:Single):Single { FontMetrics_Ffi.set_descent(this, value); return value; }
	public var lineGap(get, set):Single;

	inline function get_lineGap():Single return FontMetrics_Ffi.get_lineGap(this);

	inline function set_lineGap(value:Single):Single { FontMetrics_Ffi.set_lineGap(this, value); return value; }
	public var underlinePosition(get, set):Single;

	inline function get_underlinePosition():Single return FontMetrics_Ffi.get_underlinePosition(this);

	inline function set_underlinePosition(value:Single):Single { FontMetrics_Ffi.set_underlinePosition(this, value); return value; }
	public var underlineThickness(get, set):Single;

	inline function get_underlineThickness():Single return FontMetrics_Ffi.get_underlineThickness(this);

	inline function set_underlineThickness(value:Single):Single { FontMetrics_Ffi.set_underlineThickness(this, value); return value; }
	public var unitsPerEm(get, set):Single;

	inline function get_unitsPerEm():Single return FontMetrics_Ffi.get_unitsPerEm(this);

	inline function set_unitsPerEm(value:Single):Single { FontMetrics_Ffi.set_unitsPerEm(this, value); return value; }
	public var xHeight(get, set):Single;

	inline function get_xHeight():Single return FontMetrics_Ffi.get_xHeight(this);

	inline function set_xHeight(value:Single):Single { FontMetrics_Ffi.set_xHeight(this, value); return value; }
}
