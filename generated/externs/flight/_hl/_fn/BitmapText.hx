package flight._hl._fn;

extern class BitmapText {
	@:hlNative("flight", "flight_create_bitmap_text")
	public static function createBitmapText(glyphSource:hl.Bytes):flight._hl.FlightNode;
	@:hlNative("flight", "flight_compute_bitmap_text_local_bounds_rectangle")
	public static function computeBitmapTextLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_bitmap_text_bounds")
	public static function getBitmapTextBounds(source:flight._hl.FlightNode):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_bitmap_text_line_count")
	public static function getBitmapTextLineCount(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_is_bitmap_text_glyph_layout_stale")
	public static function isBitmapTextGlyphLayoutStale(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_is_bitmap_text_truncated")
	public static function isBitmapTextTruncated(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_reserve_bitmap_text")
	public static function reserveBitmapText(target:flight._hl.FlightNode, glyphCapacity:Int):Void;
	@:hlNative("flight", "flight_set_bitmap_text_align")
	public static function setBitmapTextAlign(target:flight._hl.FlightNode, align:Int):Void;
	@:hlNative("flight", "flight_set_bitmap_text_ellipsis")
	public static function setBitmapTextEllipsis(target:flight._hl.FlightNode, ellipsis:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_bitmap_text_glyph_source")
	public static function setBitmapTextGlyphSource(target:flight._hl.FlightNode, glyphSource:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_bitmap_text_letter_spacing")
	public static function setBitmapTextLetterSpacing(target:flight._hl.FlightNode, letterSpacing:Single):Void;
	@:hlNative("flight", "flight_set_bitmap_text_line_height")
	public static function setBitmapTextLineHeight(target:flight._hl.FlightNode, lineHeight:Single):Void;
	@:hlNative("flight", "flight_set_bitmap_text_max_lines")
	public static function setBitmapTextMaxLines(target:flight._hl.FlightNode, maxLines:haxe.Int64):Void;
	@:hlNative("flight", "flight_set_bitmap_text_text")
	public static function setBitmapTextText(target:flight._hl.FlightNode, text:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_bitmap_text_wrap_width")
	public static function setBitmapTextWrapWidth(target:flight._hl.FlightNode, wrapWidth:Single):Void;
	@:hlNative("flight", "flight_disable_bitmap_text_guards")
	public static function disableBitmapTextGuards(guardState:flight._hl.BitmapTextGuardState):Void;
	@:hlNative("flight", "flight_explain_bitmap_text_missing_glyphs")
	public static function explainBitmapTextMissingGlyphs(glyphSource:hl.Bytes, text:hl.Bytes):flight._hl.BitmapTextMissingGlyphs;
	@:hlNative("flight", "flight_refresh_bitmap_text_glyph_layout")
	public static function refreshBitmapTextGlyphLayout(bitmapText:flight._hl.FlightNode, guardState:flight._hl.BitmapTextGuardState):Bool;
	@:hlNative("flight", "flight_update_bitmap_text")
	public static function updateBitmapText(bitmapText:flight._hl.FlightNode, guardState:flight._hl.BitmapTextGuardState):Void;
	@:hlNative("flight", "flight_free_bitmap_text_missing_glyphs")
	public static function freeBitmapTextMissingGlyphs(ptr:flight._hl.BitmapTextMissingGlyphs):Void;
}
