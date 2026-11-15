package flight._cpp;

private extern class BitmapFontGlyphData_Ffi {
	@:native("flight_get_bitmap_font_glyph_data_advance") static function get_advance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_font_glyph_data_advance") static function set_advance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_bitmap_font_glyph_data_bearing_x") static function get_bearingX(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_bearing_x") static function set_bearingX(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_bearing_y") static function get_bearingY(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_bearing_y") static function set_bearingY(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_codepoint") static function get_codepoint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_codepoint") static function set_codepoint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_x") static function get_x(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_y") static function get_y(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_glyph_data_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontGlyphData(cpp.Star<cpp.Void>) {
	public var advance(get, set):Single;

	inline function get_advance():Single return BitmapFontGlyphData_Ffi.get_advance(this);

	inline function set_advance(value:Single):Single return BitmapFontGlyphData_Ffi.set_advance(this, value);
	public var bearingX(get, set):Int;

	inline function get_bearingX():Int return BitmapFontGlyphData_Ffi.get_bearingX(this);

	inline function set_bearingX(value:Int):Int return BitmapFontGlyphData_Ffi.set_bearingX(this, value);
	public var bearingY(get, set):Int;

	inline function get_bearingY():Int return BitmapFontGlyphData_Ffi.get_bearingY(this);

	inline function set_bearingY(value:Int):Int return BitmapFontGlyphData_Ffi.set_bearingY(this, value);
	public var codepoint(get, set):Int;

	inline function get_codepoint():Int return BitmapFontGlyphData_Ffi.get_codepoint(this);

	inline function set_codepoint(value:Int):Int return BitmapFontGlyphData_Ffi.set_codepoint(this, value);
	public var height(get, set):Int;

	inline function get_height():Int return BitmapFontGlyphData_Ffi.get_height(this);

	inline function set_height(value:Int):Int return BitmapFontGlyphData_Ffi.set_height(this, value);
	public var width(get, set):Int;

	inline function get_width():Int return BitmapFontGlyphData_Ffi.get_width(this);

	inline function set_width(value:Int):Int return BitmapFontGlyphData_Ffi.set_width(this, value);
	public var x(get, set):Int;

	inline function get_x():Int return BitmapFontGlyphData_Ffi.get_x(this);

	inline function set_x(value:Int):Int return BitmapFontGlyphData_Ffi.set_x(this, value);
	public var y(get, set):Int;

	inline function get_y():Int return BitmapFontGlyphData_Ffi.get_y(this);

	inline function set_y(value:Int):Int return BitmapFontGlyphData_Ffi.set_y(this, value);
}
