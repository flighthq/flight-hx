package flight._cpp;

private extern class GlyphRasterizedBitmap_Ffi {
	@:native("flight_get_glyph_rasterized_bitmap_advance") static function get_advance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_rasterized_bitmap_advance") static function set_advance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_rasterized_bitmap_bearing_x") static function get_bearingX(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_rasterized_bitmap_bearing_x") static function set_bearingX(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_rasterized_bitmap_bearing_y") static function get_bearingY(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_rasterized_bitmap_bearing_y") static function set_bearingY(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_rasterized_bitmap_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_rasterized_bitmap_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_rasterized_bitmap_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_rasterized_bitmap_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GlyphRasterizedBitmap(cpp.Star<cpp.Void>) {
	public var advance(get, set):Single;

	inline function get_advance():Single return GlyphRasterizedBitmap_Ffi.get_advance(this);

	inline function set_advance(value:Single):Single { GlyphRasterizedBitmap_Ffi.set_advance(this, value); return value; }
	public var bearingX(get, set):Int;

	inline function get_bearingX():Int return GlyphRasterizedBitmap_Ffi.get_bearingX(this);

	inline function set_bearingX(value:Int):Int { GlyphRasterizedBitmap_Ffi.set_bearingX(this, value); return value; }
	public var bearingY(get, set):Int;

	inline function get_bearingY():Int return GlyphRasterizedBitmap_Ffi.get_bearingY(this);

	inline function set_bearingY(value:Int):Int { GlyphRasterizedBitmap_Ffi.set_bearingY(this, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return GlyphRasterizedBitmap_Ffi.get_height(this);

	inline function set_height(value:Int):Int { GlyphRasterizedBitmap_Ffi.set_height(this, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return GlyphRasterizedBitmap_Ffi.get_width(this);

	inline function set_width(value:Int):Int { GlyphRasterizedBitmap_Ffi.set_width(this, value); return value; }
}
