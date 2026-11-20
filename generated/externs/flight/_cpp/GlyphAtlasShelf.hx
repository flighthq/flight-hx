package flight._cpp;

private extern class GlyphAtlasShelf_Ffi {
	@:native("flight_get_glyph_atlas_shelf_cursor_x") static function get_cursorX(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_shelf_cursor_x") static function set_cursorX(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_shelf_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_shelf_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_shelf_y") static function get_y(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_shelf_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GlyphAtlasShelf(cpp.Star<cpp.Void>) {
	public var cursorX(get, set):Int;

	inline function get_cursorX():Int return GlyphAtlasShelf_Ffi.get_cursorX(this);

	inline function set_cursorX(value:Int):Int { GlyphAtlasShelf_Ffi.set_cursorX(this, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return GlyphAtlasShelf_Ffi.get_height(this);

	inline function set_height(value:Int):Int { GlyphAtlasShelf_Ffi.set_height(this, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return GlyphAtlasShelf_Ffi.get_y(this);

	inline function set_y(value:Int):Int { GlyphAtlasShelf_Ffi.set_y(this, value); return value; }
}
