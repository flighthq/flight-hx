package flight._cpp._fn;

extern class Bitmapfont {
	@:native("flight_create_bitmap_font")
	public static function createBitmapFont(guardState:flight._cpp.BitmapFontGuardStateRef, data:flight._cpp.BitmapFontData):cpp.Star<cpp.Void>;
	@:native("flight_create_bitmap_font_guard_state")
	public static function createBitmapFontGuardState():flight._cpp.BitmapFontGuardStateRef;
	@:native("flight_get_bitmap_font_glyph")
	public static function getBitmapFontGlyph(font:cpp.Star<cpp.Void>, codepoint:Int):cpp.Star<cpp.Void>;
	@:native("flight_get_bitmap_font_kerning")
	public static function getBitmapFontKerning(font:cpp.Star<cpp.Void>, left:Int, right:Int):Single;
	@:native("flight_get_bitmap_font_page")
	public static function getBitmapFontPage(font:cpp.Star<cpp.Void>, page:Int):cpp.Star<cpp.Void>;
	@:native("flight_has_bitmap_font_glyph")
	public static function hasBitmapFontGlyph(font:cpp.Star<cpp.Void>, codepoint:Int):Bool;
	@:native("flight_pack_bitmap_font_kerning_key")
	public static function packBitmapFontKerningKey(left:Int, right:Int):haxe.Int64;
	@:native("flight_unpack_bitmap_font_kerning_key")
	public static function unpackBitmapFontKerningKey(out:flight._cpp.BitmapFontKerningPair, key:haxe.Int64):Void;
	@:native("flight_create_bitmap_font_from_glyph_atlas")
	public static function createBitmapFontFromGlyphAtlas(guardState:flight._cpp.BitmapFontGuardStateRef, atlas:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_glyph_source_from_bitmap_font")
	public static function createGlyphSourceFromBitmapFont(font:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_bitmap_font_encoding_string")
	public static function getBitmapFontEncodingString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_bitmap_font_glyph_explanation_reason_string")
	public static function getBitmapFontGlyphExplanationReasonString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_bitmap_font_guard_log_key_string")
	public static function getBitmapFontGuardLogKeyString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_bitmap_font_guard_reason_string")
	public static function getBitmapFontGuardReasonString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_bitmap_font_encoding")
	public static function parseBitmapFontEncoding(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_bitmap_font_glyph_explanation_reason")
	public static function parseBitmapFontGlyphExplanationReason(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_bitmap_font_guard_log_key")
	public static function parseBitmapFontGuardLogKey(value:cpp.ConstCharStar):flight._cpp.BitmapFontGuardLogKey;
	@:native("flight_parse_bitmap_font_guard_reason")
	public static function parseBitmapFontGuardReason(value:cpp.ConstCharStar):flight._cpp.BitmapFontGuardReason;
	@:native("flight_disable_bitmap_font_guards")
	public static function disableBitmapFontGuards(guardState:flight._cpp.BitmapFontGuardStateRef):Void;
	@:native("flight_enable_bitmap_font_guards")
	public static function enableBitmapFontGuards(guardState:flight._cpp.BitmapFontGuardStateRef, logState:cpp.Star<cpp.Void>, clock:flight._cpp.BitmapFontClock):Void;
	@:native("flight_explain_bitmap_font_glyph")
	public static function explainBitmapFontGlyph(font:cpp.Star<cpp.Void>, codepoint:Int):flight._cpp.BitmapFontGlyphExplanation;
	@:native("flight_summarize_bitmap_font")
	public static function summarizeBitmapFont(font:cpp.Star<cpp.Void>):flight._cpp.BitmapFontSummary;
	@:native("flight_free_bitmap_font_guard_state_ref")
	public static function freeBitmapFontGuardStateRef(ptr:flight._cpp.BitmapFontGuardStateRef):Void;
	@:native("flight_free_bitmap_font_guard_log_key")
	public static function freeBitmapFontGuardLogKey(ptr:flight._cpp.BitmapFontGuardLogKey):Void;
	@:native("flight_free_bitmap_font_guard_reason")
	public static function freeBitmapFontGuardReason(ptr:flight._cpp.BitmapFontGuardReason):Void;
	@:native("flight_free_bitmap_font_glyph_explanation")
	public static function freeBitmapFontGlyphExplanation(ptr:flight._cpp.BitmapFontGlyphExplanation):Void;
	@:native("flight_free_bitmap_font_summary")
	public static function freeBitmapFontSummary(ptr:flight._cpp.BitmapFontSummary):Void;
}
