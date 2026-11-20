package flight._cpp;

private extern class GlyphRasterizeOptions_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_glyph_rasterize_options_font_family") static function get_fontFamily(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_glyph_rasterize_options_font_family") static function set_fontFamily(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_glyph_rasterize_options_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_rasterize_options_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GlyphRasterizeOptions(cpp.Star<cpp.Void>) {
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String { var raw = GlyphRasterizeOptions_Ffi.get_fontFamily(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); GlyphRasterizeOptions_Ffi.freeString(raw); return value; }
	inline function set_fontFamily(value:String):String { var raw:cpp.ConstCharStar = cast value; GlyphRasterizeOptions_Ffi.set_fontFamily(this, raw); return value; }
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return GlyphRasterizeOptions_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Single):Single { GlyphRasterizeOptions_Ffi.set_fontSize(this, value); return value; }
}
