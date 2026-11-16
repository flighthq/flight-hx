package flight._cpp._fn;

extern class Text {
	@:native("flight_explain_text_label_content")
	public static function explainTextLabelContent(source:cpp.Star<cpp.Void>):flight._cpp.TextLabelContentExplanation;
	@:native("flight_create_native_text")
	public static function createNativeText():cpp.Star<cpp.Void>;
	@:native("flight_compute_native_text_local_bounds_rectangle")
	public static function computeNativeTextLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_native_text_measured_height")
	public static function getNativeTextMeasuredHeight(source:flight._cpp.NativeText):Single;
	@:native("flight_get_native_text_measured_width")
	public static function getNativeTextMeasuredWidth(source:flight._cpp.NativeText):Single;
	@:native("flight_get_native_text_string")
	public static function getNativeTextString(source:flight._cpp.NativeText):cpp.ConstCharStar;
	@:native("flight_get_native_text_style")
	public static function getNativeTextStyle(source:flight._cpp.NativeText):cpp.Star<cpp.Void>;
	@:native("flight_patch_native_text_style")
	public static function patchNativeTextStyle(source:cpp.Star<cpp.Void>, patch:flight._cpp.NativeTextStyle):Void;
	@:native("flight_set_native_text_auto_size")
	public static function setNativeTextAutoSize(source:cpp.Star<cpp.Void>, value:flight._cpp.TextAutoSize):Void;
	@:native("flight_set_native_text_height")
	public static function setNativeTextHeight(source:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_set_native_text_string")
	public static function setNativeTextString(source:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_set_native_text_style")
	public static function setNativeTextStyle(source:cpp.Star<cpp.Void>, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_native_text_vertical_align")
	public static function setNativeTextVerticalAlign(source:cpp.Star<cpp.Void>, value:flight._cpp.TextVerticalAlign):Void;
	@:native("flight_set_native_text_width")
	public static function setNativeTextWidth(source:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_append_rich_text_string")
	public static function appendRichTextString(source:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_build_rich_text_layout_params")
	public static function buildRichTextLayoutParams(source:flight._cpp.RichText, measure:flight._cpp.TextMeasureFunction):flight._cpp.TextLayoutParams;
	@:native("flight_clear_rich_text_format_ranges")
	public static function clearRichTextFormatRanges(source:cpp.Star<cpp.Void>):Void;
	@:native("flight_compute_rich_text_local_bounds_rectangle")
	public static function computeRichTextLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_dispatch_rich_text_link_at_point")
	public static function dispatchRichTextLinkAtPoint(source:cpp.Star<cpp.Void>, x:Single, y:Single):cpp.ConstCharStar;
	@:native("flight_dispatch_rich_text_wheel")
	public static function dispatchRichTextWheel(source:cpp.Star<cpp.Void>, deltaLines:Single, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_enable_text_field_signals")
	public static function enableTextFieldSignals(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_rich_text_bottom_scroll_v")
	public static function getRichTextBottomScrollV(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_rich_text_char_index_at_point")
	public static function getRichTextCharIndexAtPoint(source:cpp.Star<cpp.Void>, x:Single, y:Single):Int;
	@:native("flight_get_rich_text_default_text_format")
	public static function getRichTextDefaultTextFormat(source:flight._cpp.RichText):cpp.Star<cpp.Void>;
	@:native("flight_get_rich_text_format_range_at")
	public static function getRichTextFormatRangeAt(out:flight._cpp.TextFormat, source:flight._cpp.RichText, index:Int):Void;
	@:native("flight_get_rich_text_format_range_by_index")
	public static function getRichTextFormatRangeByIndex(out:flight._cpp.TextFormatRange, source:flight._cpp.RichText, i:Int):Bool;
	@:native("flight_get_rich_text_format_range_count")
	public static function getRichTextFormatRangeCount(source:flight._cpp.RichText):Int;
	@:native("flight_get_rich_text_format_ranges_in")
	public static function getRichTextFormatRangesIn(out:cpp.Star<cpp.Void>, source:flight._cpp.RichText, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_get_rich_text_length")
	public static function getRichTextLength(source:flight._cpp.RichText):Int;
	@:native("flight_get_rich_text_line_count")
	public static function getRichTextLineCount(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_rich_text_line_metrics")
	public static function getRichTextLineMetrics(source:cpp.Star<cpp.Void>, lineIndex:Int):flight._cpp.TextLineMetrics;
	@:native("flight_get_rich_text_max_scroll_h")
	public static function getRichTextMaxScrollH(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_rich_text_max_scroll_v")
	public static function getRichTextMaxScrollV(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_rich_text_password_character")
	public static function getRichTextPasswordCharacter(source:flight._cpp.RichText):cpp.ConstCharStar;
	@:native("flight_get_rich_text_string")
	public static function getRichTextString(source:flight._cpp.RichText):cpp.ConstCharStar;
	@:native("flight_get_rich_text_text_height")
	public static function getRichTextTextHeight(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_rich_text_text_width")
	public static function getRichTextTextWidth(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_text_field_signals")
	public static function getTextFieldSignals(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_insert_rich_text_string")
	public static function insertRichTextString(source:cpp.Star<cpp.Void>, index:Int, value:cpp.ConstCharStar):Void;
	@:native("flight_remove_rich_text_format_ranges_in")
	public static function removeRichTextFormatRangesIn(source:cpp.Star<cpp.Void>, begin:Int, end:Int):Void;
	@:native("flight_replace_rich_text_string")
	public static function replaceRichTextString(source:cpp.Star<cpp.Void>, beginIndex:Int, endIndex:Int, value:cpp.ConstCharStar):Void;
	@:native("flight_set_rich_text_background")
	public static function setRichTextBackground(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_rich_text_background_color")
	public static function setRichTextBackgroundColor(source:cpp.Star<cpp.Void>, value:Int):Void;
	@:native("flight_set_rich_text_border")
	public static function setRichTextBorder(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_rich_text_border_color")
	public static function setRichTextBorderColor(source:cpp.Star<cpp.Void>, value:Int):Void;
	@:native("flight_set_rich_text_condense_white")
	public static function setRichTextCondenseWhite(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_rich_text_content")
	public static function setRichTextContent(source:cpp.Star<cpp.Void>, content:flight._cpp.RichTextContent):Void;
	@:native("flight_set_rich_text_default_text_format")
	public static function setRichTextDefaultTextFormat(source:cpp.Star<cpp.Void>, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_rich_text_format_range")
	public static function setRichTextFormatRange(source:cpp.Star<cpp.Void>, format:cpp.Star<cpp.Void>, start:haxe.Int64, end:haxe.Int64):Void;
	@:native("flight_set_rich_text_height")
	public static function setRichTextHeight(source:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_set_rich_text_max_chars")
	public static function setRichTextMaxChars(source:cpp.Star<cpp.Void>, value:Int):Void;
	@:native("flight_set_rich_text_mouse_wheel_enabled")
	public static function setRichTextMouseWheelEnabled(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_rich_text_multiline")
	public static function setRichTextMultiline(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_rich_text_scroll_h")
	public static function setRichTextScrollH(source:cpp.Star<cpp.Void>, value:Single, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_set_rich_text_scroll_v")
	public static function setRichTextScrollV(source:cpp.Star<cpp.Void>, value:Single, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_set_rich_text_selectable")
	public static function setRichTextSelectable(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_rich_text_string")
	public static function setRichTextString(source:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_set_rich_text_text_color")
	public static function setRichTextTextColor(source:cpp.Star<cpp.Void>, value:Int):Void;
	@:native("flight_set_rich_text_vertical_align")
	public static function setRichTextVerticalAlign(source:cpp.Star<cpp.Void>, value:flight._cpp.TextVerticalAlign):Void;
	@:native("flight_set_rich_text_width")
	public static function setRichTextWidth(source:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_set_rich_text_word_wrap")
	public static function setRichTextWordWrap(source:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_compute_text_format_font_string")
	public static function computeTextFormatFontString(format:flight._cpp.TextFormat):cpp.ConstCharStar;
	@:native("flight_append_text_label_string")
	public static function appendTextLabelString(source:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_compute_text_label_local_bounds_rectangle")
	public static function computeTextLabelLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_text_label_format")
	public static function getTextLabelFormat(source:flight._cpp.TextLabel):cpp.Star<cpp.Void>;
	@:native("flight_get_text_label_string")
	public static function getTextLabelString(source:flight._cpp.TextLabel):cpp.ConstCharStar;
	@:native("flight_set_text_label_auto_size")
	public static function setTextLabelAutoSize(source:cpp.Star<cpp.Void>, value:flight._cpp.TextAutoSize):Void;
	@:native("flight_set_text_label_format")
	public static function setTextLabelFormat(source:cpp.Star<cpp.Void>, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_text_label_height")
	public static function setTextLabelHeight(source:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_set_text_label_string")
	public static function setTextLabelString(source:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_set_text_label_vertical_align")
	public static function setTextLabelVerticalAlign(source:cpp.Star<cpp.Void>, value:flight._cpp.TextVerticalAlign):Void;
	@:native("flight_set_text_label_width")
	public static function setTextLabelWidth(source:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_get_text_layout")
	public static function getTextLayout(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_text_layout_metrics")
	public static function getTextLayoutMetrics(out:flight._cpp.TextMetrics, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_free_text_label_content_explanation")
	public static function freeTextLabelContentExplanation(ptr:flight._cpp.TextLabelContentExplanation):Void;
	@:native("flight_free_text_layout_params")
	public static function freeTextLayoutParams(ptr:flight._cpp.TextLayoutParams):Void;
	@:native("flight_free_text_line_metrics")
	public static function freeTextLineMetrics(ptr:flight._cpp.TextLineMetrics):Void;
}
