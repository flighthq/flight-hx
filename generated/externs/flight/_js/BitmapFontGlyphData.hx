package flight._js;

@:jsRequire("flight")
private extern class BitmapFontGlyphData_Ffi {
	@:native("flight_get_bitmap_font_glyph_data_advance") static function get_advance(ptr:Dynamic):Float;
	@:native("flight_set_bitmap_font_glyph_data_advance") static function set_advance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_bitmap_font_glyph_data_bearing_x") static function get_bearingX(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_bearing_x") static function set_bearingX(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_bearing_y") static function get_bearingY(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_bearing_y") static function set_bearingY(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_codepoint") static function get_codepoint(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_codepoint") static function set_codepoint(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_height") static function get_height(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_height") static function set_height(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_width") static function get_width(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_width") static function set_width(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_x") static function get_x(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_x") static function set_x(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_glyph_data_y") static function get_y(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_glyph_data_y") static function set_y(ptr:Dynamic, value:Int):Int;
}

abstract BitmapFontGlyphData(Dynamic) {
	public var advance(get, set):Float;

	inline function get_advance():Float return BitmapFontGlyphData_Ffi.get_advance(this);

	inline function set_advance(value:Float):Float return BitmapFontGlyphData_Ffi.set_advance(this, value);
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
