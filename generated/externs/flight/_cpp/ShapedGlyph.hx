package flight._cpp;

private extern class ShapedGlyph_Ffi {
	@:native("flight_get_shaped_glyph_cluster") static function get_cluster(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_shaped_glyph_cluster") static function set_cluster(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_shaped_glyph_glyph_id") static function get_glyphId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_shaped_glyph_glyph_id") static function set_glyphId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_shaped_glyph_x_advance") static function get_xAdvance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_shaped_glyph_x_advance") static function set_xAdvance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_shaped_glyph_x_offset") static function get_xOffset(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_shaped_glyph_x_offset") static function set_xOffset(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_shaped_glyph_y_advance") static function get_yAdvance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_shaped_glyph_y_advance") static function set_yAdvance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_shaped_glyph_y_offset") static function get_yOffset(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_shaped_glyph_y_offset") static function set_yOffset(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ShapedGlyph(cpp.Star<cpp.Void>) {
	public var cluster(get, set):Int;

	inline function get_cluster():Int return ShapedGlyph_Ffi.get_cluster(this);

	inline function set_cluster(value:Int):Int { ShapedGlyph_Ffi.set_cluster(this, value); return value; }
	public var glyphId(get, set):Int;

	inline function get_glyphId():Int return ShapedGlyph_Ffi.get_glyphId(this);

	inline function set_glyphId(value:Int):Int { ShapedGlyph_Ffi.set_glyphId(this, value); return value; }
	public var xAdvance(get, set):Single;

	inline function get_xAdvance():Single return ShapedGlyph_Ffi.get_xAdvance(this);

	inline function set_xAdvance(value:Single):Single { ShapedGlyph_Ffi.set_xAdvance(this, value); return value; }
	public var xOffset(get, set):Single;

	inline function get_xOffset():Single return ShapedGlyph_Ffi.get_xOffset(this);

	inline function set_xOffset(value:Single):Single { ShapedGlyph_Ffi.set_xOffset(this, value); return value; }
	public var yAdvance(get, set):Single;

	inline function get_yAdvance():Single return ShapedGlyph_Ffi.get_yAdvance(this);

	inline function set_yAdvance(value:Single):Single { ShapedGlyph_Ffi.set_yAdvance(this, value); return value; }
	public var yOffset(get, set):Single;

	inline function get_yOffset():Single return ShapedGlyph_Ffi.get_yOffset(this);

	inline function set_yOffset(value:Single):Single { ShapedGlyph_Ffi.set_yOffset(this, value); return value; }
}
