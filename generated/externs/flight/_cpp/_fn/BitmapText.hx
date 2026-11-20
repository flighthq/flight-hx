package flight._cpp._fn;

extern class BitmapText {
	@:native("flight_create_bitmap_text")
	public static function createBitmapText(glyphSource:cpp.Star<cpp.Void>):flight._cpp.FlightNode;
	@:native("flight_compute_bitmap_text_local_bounds_rectangle")
	public static function computeBitmapTextLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_get_bitmap_text_bounds")
	public static function getBitmapTextBounds(source:flight._cpp.FlightNode):flight._cpp.Rectangle;
	@:native("flight_get_bitmap_text_line_count")
	public static function getBitmapTextLineCount(source:flight._cpp.FlightNode):Int;
	@:native("flight_is_bitmap_text_glyph_layout_stale")
	public static function isBitmapTextGlyphLayoutStale(source:flight._cpp.FlightNode):Bool;
	@:native("flight_is_bitmap_text_truncated")
	public static function isBitmapTextTruncated(source:flight._cpp.FlightNode):Bool;
	@:native("flight_reserve_bitmap_text")
	public static function reserveBitmapText(target:flight._cpp.FlightNode, glyphCapacity:Int):Void;
	@:native("flight_set_bitmap_text_align")
	public static function setBitmapTextAlign(target:flight._cpp.FlightNode, align:Int):Void;
	@:native("flight_set_bitmap_text_ellipsis")
	public static function setBitmapTextEllipsis(target:flight._cpp.FlightNode, ellipsis:cpp.ConstCharStar):Void;
	@:native("flight_set_bitmap_text_glyph_source")
	public static function setBitmapTextGlyphSource(target:flight._cpp.FlightNode, glyphSource:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_bitmap_text_letter_spacing")
	public static function setBitmapTextLetterSpacing(target:flight._cpp.FlightNode, letterSpacing:Single):Void;
	@:native("flight_set_bitmap_text_line_height")
	public static function setBitmapTextLineHeight(target:flight._cpp.FlightNode, lineHeight:Single):Void;
	@:native("flight_set_bitmap_text_max_lines")
	public static function setBitmapTextMaxLines(target:flight._cpp.FlightNode, maxLines:haxe.Int64):Void;
	@:native("flight_set_bitmap_text_text")
	public static function setBitmapTextText(target:flight._cpp.FlightNode, text:cpp.ConstCharStar):Void;
	@:native("flight_set_bitmap_text_wrap_width")
	public static function setBitmapTextWrapWidth(target:flight._cpp.FlightNode, wrapWidth:Single):Void;
	@:native("flight_disable_bitmap_text_guards")
	public static function disableBitmapTextGuards(guardState:flight._cpp.BitmapTextGuardState):Void;
	@:native("flight_explain_bitmap_text_missing_glyphs")
	public static function explainBitmapTextMissingGlyphs(glyphSource:cpp.Star<cpp.Void>, text:cpp.ConstCharStar):flight._cpp.BitmapTextMissingGlyphs;
	@:native("flight_refresh_bitmap_text_glyph_layout")
	public static function refreshBitmapTextGlyphLayout(bitmapText:flight._cpp.FlightNode, guardState:flight._cpp.BitmapTextGuardState):Bool;
	@:native("flight_update_bitmap_text")
	public static function updateBitmapText(bitmapText:flight._cpp.FlightNode, guardState:flight._cpp.BitmapTextGuardState):Void;
	@:native("flight_free_bitmap_text_missing_glyphs")
	public static function freeBitmapTextMissingGlyphs(ptr:flight._cpp.BitmapTextMissingGlyphs):Void;
}
