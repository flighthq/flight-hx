package flight._cpp;

private extern class SfntGlyphBounds_Ffi {
	@:native("flight_get_sfnt_glyph_bounds_x_max") static function get_xMax(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sfnt_glyph_bounds_x_max") static function set_xMax(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_sfnt_glyph_bounds_x_min") static function get_xMin(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sfnt_glyph_bounds_x_min") static function set_xMin(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_sfnt_glyph_bounds_y_max") static function get_yMax(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sfnt_glyph_bounds_y_max") static function set_yMax(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_sfnt_glyph_bounds_y_min") static function get_yMin(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sfnt_glyph_bounds_y_min") static function set_yMin(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SfntGlyphBounds(cpp.Star<cpp.Void>) {
	public var xMax(get, set):Single;

	inline function get_xMax():Single return SfntGlyphBounds_Ffi.get_xMax(this);

	inline function set_xMax(value:Single):Single { SfntGlyphBounds_Ffi.set_xMax(this, value); return value; }
	public var xMin(get, set):Single;

	inline function get_xMin():Single return SfntGlyphBounds_Ffi.get_xMin(this);

	inline function set_xMin(value:Single):Single { SfntGlyphBounds_Ffi.set_xMin(this, value); return value; }
	public var yMax(get, set):Single;

	inline function get_yMax():Single return SfntGlyphBounds_Ffi.get_yMax(this);

	inline function set_yMax(value:Single):Single { SfntGlyphBounds_Ffi.set_yMax(this, value); return value; }
	public var yMin(get, set):Single;

	inline function get_yMin():Single return SfntGlyphBounds_Ffi.get_yMin(this);

	inline function set_yMin(value:Single):Single { SfntGlyphBounds_Ffi.set_yMin(this, value); return value; }
}
