package flight._cpp;

private extern class GlyphExtents_Ffi {
	@:native("flight_get_glyph_extents_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_extents_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_extents_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_extents_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_extents_x_bearing") static function get_xBearing(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_extents_x_bearing") static function set_xBearing(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_extents_y_bearing") static function get_yBearing(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_extents_y_bearing") static function set_yBearing(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GlyphExtents(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return GlyphExtents_Ffi.get_height(this);

	inline function set_height(value:Single):Single { GlyphExtents_Ffi.set_height(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return GlyphExtents_Ffi.get_width(this);

	inline function set_width(value:Single):Single { GlyphExtents_Ffi.set_width(this, value); return value; }
	public var xBearing(get, set):Single;

	inline function get_xBearing():Single return GlyphExtents_Ffi.get_xBearing(this);

	inline function set_xBearing(value:Single):Single { GlyphExtents_Ffi.set_xBearing(this, value); return value; }
	public var yBearing(get, set):Single;

	inline function get_yBearing():Single return GlyphExtents_Ffi.get_yBearing(this);

	inline function set_yBearing(value:Single):Single { GlyphExtents_Ffi.set_yBearing(this, value); return value; }
}
