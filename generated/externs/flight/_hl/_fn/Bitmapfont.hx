package flight._hl._fn;

extern class Bitmapfont {
	@:hlNative("flight", "flight_create_bitmap_font")
	public static function createBitmapFont(guardState:flight._hl.BitmapFontGuardStateRef, data:flight._hl.BitmapFontData):hl.Bytes;
	@:hlNative("flight", "flight_create_bitmap_font_guard_state")
	public static function createBitmapFontGuardState():flight._hl.BitmapFontGuardStateRef;
	@:hlNative("flight", "flight_get_bitmap_font_glyph")
	public static function getBitmapFontGlyph(font:hl.Bytes, codepoint:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_bitmap_font_kerning")
	public static function getBitmapFontKerning(font:hl.Bytes, left:Int, right:Int):Single;
	@:hlNative("flight", "flight_get_bitmap_font_page")
	public static function getBitmapFontPage(font:hl.Bytes, page:Int):hl.Bytes;
	@:hlNative("flight", "flight_has_bitmap_font_glyph")
	public static function hasBitmapFontGlyph(font:hl.Bytes, codepoint:Int):Bool;
	@:hlNative("flight", "flight_pack_bitmap_font_kerning_key")
	public static function packBitmapFontKerningKey(left:Int, right:Int):haxe.Int64;
	@:hlNative("flight", "flight_unpack_bitmap_font_kerning_key")
	public static function unpackBitmapFontKerningKey(out:flight._hl.BitmapFontKerningPair, key:haxe.Int64):Void;
	@:hlNative("flight", "flight_create_bitmap_font_from_glyph_atlas")
	public static function createBitmapFontFromGlyphAtlas(guardState:flight._hl.BitmapFontGuardStateRef, atlas:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_glyph_source_from_bitmap_font")
	public static function createGlyphSourceFromBitmapFont(font:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_bitmap_font_encoding_string")
	public static function getBitmapFontEncodingString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_bitmap_font_glyph_explanation_reason_string")
	public static function getBitmapFontGlyphExplanationReasonString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_bitmap_font_guard_log_key_string")
	public static function getBitmapFontGuardLogKeyString(value:flight._hl.BitmapFontGuardLogKey):hl.Bytes;
	@:hlNative("flight", "flight_get_bitmap_font_guard_reason_string")
	public static function getBitmapFontGuardReasonString(value:flight._hl.BitmapFontGuardReason):hl.Bytes;
	@:hlNative("flight", "flight_parse_bitmap_font_encoding")
	public static function parseBitmapFontEncoding(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_bitmap_font_glyph_explanation_reason")
	public static function parseBitmapFontGlyphExplanationReason(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_bitmap_font_guard_log_key")
	public static function parseBitmapFontGuardLogKey(value:hl.Bytes):flight._hl.BitmapFontGuardLogKey;
	@:hlNative("flight", "flight_parse_bitmap_font_guard_reason")
	public static function parseBitmapFontGuardReason(value:hl.Bytes):flight._hl.BitmapFontGuardReason;
	@:hlNative("flight", "flight_disable_bitmap_font_guards")
	public static function disableBitmapFontGuards(guardState:flight._hl.BitmapFontGuardStateRef):Void;
	@:hlNative("flight", "flight_enable_bitmap_font_guards")
	public static function enableBitmapFontGuards(guardState:flight._hl.BitmapFontGuardStateRef, logState:hl.Bytes, clock:flight._hl.BitmapFontClock):Void;
	@:hlNative("flight", "flight_explain_bitmap_font_glyph")
	public static function explainBitmapFontGlyph(font:hl.Bytes, codepoint:Int):flight._hl.BitmapFontGlyphExplanation;
	@:hlNative("flight", "flight_summarize_bitmap_font")
	public static function summarizeBitmapFont(font:hl.Bytes):flight._hl.BitmapFontSummary;
	@:hlNative("flight", "flight_free_bitmap_font_guard_state_ref")
	public static function freeBitmapFontGuardStateRef(ptr:flight._hl.BitmapFontGuardStateRef):Void;
	@:hlNative("flight", "flight_free_bitmap_font_guard_log_key")
	public static function freeBitmapFontGuardLogKey(ptr:flight._hl.BitmapFontGuardLogKey):Void;
	@:hlNative("flight", "flight_free_bitmap_font_guard_reason")
	public static function freeBitmapFontGuardReason(ptr:flight._hl.BitmapFontGuardReason):Void;
	@:hlNative("flight", "flight_free_bitmap_font_glyph_explanation")
	public static function freeBitmapFontGlyphExplanation(ptr:flight._hl.BitmapFontGlyphExplanation):Void;
	@:hlNative("flight", "flight_free_bitmap_font_summary")
	public static function freeBitmapFontSummary(ptr:flight._hl.BitmapFontSummary):Void;
}
