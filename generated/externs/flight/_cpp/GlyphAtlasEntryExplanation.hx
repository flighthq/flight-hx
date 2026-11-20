package flight._cpp;

private extern class GlyphAtlasEntryExplanation_Ffi {
	@:native("flight_get_glyph_atlas_entry_explanation_renderable") static function get_renderable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_glyph_atlas_entry_explanation_renderable") static function set_renderable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_glyph_atlas_entry_explanation_glyph_width") static function get_glyphWidth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_entry_explanation_glyph_width") static function set_glyphWidth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_entry_explanation_glyph_height") static function get_glyphHeight(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_entry_explanation_glyph_height") static function set_glyphHeight(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_entry_explanation_usable_width") static function get_usableWidth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_entry_explanation_usable_width") static function set_usableWidth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_entry_explanation_usable_height") static function get_usableHeight(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_entry_explanation_usable_height") static function set_usableHeight(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GlyphAtlasEntryExplanation(cpp.Star<cpp.Void>) {
	public var renderable(get, set):Bool;

	inline function get_renderable():Bool return GlyphAtlasEntryExplanation_Ffi.get_renderable(this);

	inline function set_renderable(value:Bool):Bool { GlyphAtlasEntryExplanation_Ffi.set_renderable(this, value); return value; }
	public var glyphWidth(get, set):Int;

	inline function get_glyphWidth():Int return GlyphAtlasEntryExplanation_Ffi.get_glyphWidth(this);

	inline function set_glyphWidth(value:Int):Int { GlyphAtlasEntryExplanation_Ffi.set_glyphWidth(this, value); return value; }
	public var glyphHeight(get, set):Int;

	inline function get_glyphHeight():Int return GlyphAtlasEntryExplanation_Ffi.get_glyphHeight(this);

	inline function set_glyphHeight(value:Int):Int { GlyphAtlasEntryExplanation_Ffi.set_glyphHeight(this, value); return value; }
	public var usableWidth(get, set):Int;

	inline function get_usableWidth():Int return GlyphAtlasEntryExplanation_Ffi.get_usableWidth(this);

	inline function set_usableWidth(value:Int):Int { GlyphAtlasEntryExplanation_Ffi.set_usableWidth(this, value); return value; }
	public var usableHeight(get, set):Int;

	inline function get_usableHeight():Int return GlyphAtlasEntryExplanation_Ffi.get_usableHeight(this);

	inline function set_usableHeight(value:Int):Int { GlyphAtlasEntryExplanation_Ffi.set_usableHeight(this, value); return value; }
}
