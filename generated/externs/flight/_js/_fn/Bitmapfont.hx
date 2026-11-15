package flight._js._fn;

@:jsRequire("flight")
extern class Bitmapfont {
	@:native("flight_create_bitmap_font")
	public static function createBitmapFont(guardState:flight._js.BitmapFontGuardStateRef, data:flight._js.BitmapFontData):Dynamic;
	@:native("flight_create_bitmap_font_guard_state")
	public static function createBitmapFontGuardState():flight._js.BitmapFontGuardStateRef;
	@:native("flight_get_bitmap_font_glyph")
	public static function getBitmapFontGlyph(font:Dynamic, codepoint:Int):Dynamic;
	@:native("flight_get_bitmap_font_kerning")
	public static function getBitmapFontKerning(font:Dynamic, left:Int, right:Int):Float;
	@:native("flight_get_bitmap_font_page")
	public static function getBitmapFontPage(font:Dynamic, page:Int):Dynamic;
	@:native("flight_has_bitmap_font_glyph")
	public static function hasBitmapFontGlyph(font:Dynamic, codepoint:Int):Bool;
	@:native("flight_pack_bitmap_font_kerning_key")
	public static function packBitmapFontKerningKey(left:Int, right:Int):haxe.Int64;
	@:native("flight_unpack_bitmap_font_kerning_key")
	public static function unpackBitmapFontKerningKey(out:flight._js.BitmapFontKerningPair, key:haxe.Int64):Void;
	@:native("flight_create_bitmap_font_from_glyph_atlas")
	public static function createBitmapFontFromGlyphAtlas(guardState:flight._js.BitmapFontGuardStateRef, atlas:Dynamic):Dynamic;
	@:native("flight_create_glyph_source_from_bitmap_font")
	public static function createGlyphSourceFromBitmapFont(font:Dynamic):Dynamic;
	@:native("flight_get_bitmap_font_encoding_string")
	public static function getBitmapFontEncodingString(value:Int):String;
	@:native("flight_get_bitmap_font_glyph_explanation_reason_string")
	public static function getBitmapFontGlyphExplanationReasonString(value:Int):String;
	@:native("flight_get_bitmap_font_guard_log_key_string")
	public static function getBitmapFontGuardLogKeyString(value:Int):String;
	@:native("flight_get_bitmap_font_guard_reason_string")
	public static function getBitmapFontGuardReasonString(value:Int):String;
	@:native("flight_parse_bitmap_font_encoding")
	public static function parseBitmapFontEncoding(value:String):Int;
	@:native("flight_parse_bitmap_font_glyph_explanation_reason")
	public static function parseBitmapFontGlyphExplanationReason(value:String):Int;
	@:native("flight_parse_bitmap_font_guard_log_key")
	public static function parseBitmapFontGuardLogKey(value:String):Dynamic;
	@:native("flight_parse_bitmap_font_guard_reason")
	public static function parseBitmapFontGuardReason(value:String):Dynamic;
	@:native("flight_disable_bitmap_font_guards")
	public static function disableBitmapFontGuards(guardState:flight._js.BitmapFontGuardStateRef):Void;
	@:native("flight_enable_bitmap_font_guards")
	public static function enableBitmapFontGuards(guardState:flight._js.BitmapFontGuardStateRef, logState:Dynamic, clock:flight._js.BitmapFontClock):Void;
	@:native("flight_explain_bitmap_font_glyph")
	public static function explainBitmapFontGlyph(font:Dynamic, codepoint:Int):flight._js.BitmapFontGlyphExplanation;
	@:native("flight_summarize_bitmap_font")
	public static function summarizeBitmapFont(font:Dynamic):flight._js.BitmapFontSummary;
	@:native("flight_free_bitmap_font_guard_state_ref")
	public static function freeBitmapFontGuardStateRef(ptr:flight._js.BitmapFontGuardStateRef):Void;
	@:native("flight_free_bitmap_font_guard_log_key")
	public static function freeBitmapFontGuardLogKey(ptr:flight._js.BitmapFontGuardLogKey):Void;
	@:native("flight_free_bitmap_font_guard_reason")
	public static function freeBitmapFontGuardReason(ptr:flight._js.BitmapFontGuardReason):Void;
	@:native("flight_free_bitmap_font_glyph_explanation")
	public static function freeBitmapFontGlyphExplanation(ptr:flight._js.BitmapFontGlyphExplanation):Void;
	@:native("flight_free_bitmap_font_summary")
	public static function freeBitmapFontSummary(ptr:flight._js.BitmapFontSummary):Void;
}
