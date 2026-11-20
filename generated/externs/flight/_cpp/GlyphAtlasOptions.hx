package flight._cpp;

private extern class GlyphAtlasOptions_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_glyph_atlas_options_font_family") static function get_fontFamily(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_glyph_atlas_options_font_family") static function set_fontFamily(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_glyph_atlas_options_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_atlas_options_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_glyph_atlas_options_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_options_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_options_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_options_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GlyphAtlasOptions(cpp.Star<cpp.Void>) {
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String { var raw = GlyphAtlasOptions_Ffi.get_fontFamily(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); GlyphAtlasOptions_Ffi.freeString(raw); return value; }
	inline function set_fontFamily(value:String):String { var raw:cpp.ConstCharStar = cast value; GlyphAtlasOptions_Ffi.set_fontFamily(this, raw); return value; }
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return GlyphAtlasOptions_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Single):Single { GlyphAtlasOptions_Ffi.set_fontSize(this, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return GlyphAtlasOptions_Ffi.get_height(this);

	inline function set_height(value:Int):Int { GlyphAtlasOptions_Ffi.set_height(this, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return GlyphAtlasOptions_Ffi.get_width(this);

	inline function set_width(value:Int):Int { GlyphAtlasOptions_Ffi.set_width(this, value); return value; }
}
