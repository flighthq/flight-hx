package flight._js;

@:jsRequire("flight")
private extern class GlyphRasterizedBitmap_Ffi {
	@:native("flight_get_glyph_rasterized_bitmap_advance") static function get_advance(ptr:Dynamic):Float;
	@:native("flight_set_glyph_rasterized_bitmap_advance") static function set_advance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_glyph_rasterized_bitmap_bearing_x") static function get_bearingX(ptr:Dynamic):Int;
	@:native("flight_set_glyph_rasterized_bitmap_bearing_x") static function set_bearingX(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_glyph_rasterized_bitmap_bearing_y") static function get_bearingY(ptr:Dynamic):Int;
	@:native("flight_set_glyph_rasterized_bitmap_bearing_y") static function set_bearingY(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_glyph_rasterized_bitmap_height") static function get_height(ptr:Dynamic):Int;
	@:native("flight_set_glyph_rasterized_bitmap_height") static function set_height(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_glyph_rasterized_bitmap_width") static function get_width(ptr:Dynamic):Int;
	@:native("flight_set_glyph_rasterized_bitmap_width") static function set_width(ptr:Dynamic, value:Int):Int;
}

abstract GlyphRasterizedBitmap(Dynamic) {
	public var advance(get, set):Float;

	inline function get_advance():Float return GlyphRasterizedBitmap_Ffi.get_advance(this);

	inline function set_advance(value:Float):Float return GlyphRasterizedBitmap_Ffi.set_advance(this, value);
	public var bearingX(get, set):Int;

	inline function get_bearingX():Int return GlyphRasterizedBitmap_Ffi.get_bearingX(this);

	inline function set_bearingX(value:Int):Int return GlyphRasterizedBitmap_Ffi.set_bearingX(this, value);
	public var bearingY(get, set):Int;

	inline function get_bearingY():Int return GlyphRasterizedBitmap_Ffi.get_bearingY(this);

	inline function set_bearingY(value:Int):Int return GlyphRasterizedBitmap_Ffi.set_bearingY(this, value);
	public var height(get, set):Int;

	inline function get_height():Int return GlyphRasterizedBitmap_Ffi.get_height(this);

	inline function set_height(value:Int):Int return GlyphRasterizedBitmap_Ffi.set_height(this, value);
	public var width(get, set):Int;

	inline function get_width():Int return GlyphRasterizedBitmap_Ffi.get_width(this);

	inline function set_width(value:Int):Int return GlyphRasterizedBitmap_Ffi.set_width(this, value);
}
