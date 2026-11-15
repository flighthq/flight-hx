package flight._hl._fn;

extern class Text {
	@:hlNative("flight", "flight_explain_text_label_content")
	public static function explainTextLabelContent(source:Dynamic):flight._hl.TextLabelContentExplanation;
	@:hlNative("flight", "flight_create_native_text")
	public static function createNativeText():Dynamic;
	@:hlNative("flight", "flight_compute_native_text_local_bounds_rectangle")
	public static function computeNativeTextLocalBoundsRectangle(out:flight._hl.Rectangle, source:Dynamic):Void;
	@:hlNative("flight", "flight_get_native_text_measured_height")
	public static function getNativeTextMeasuredHeight(source:flight._hl.NativeText):Single;
	@:hlNative("flight", "flight_get_native_text_measured_width")
	public static function getNativeTextMeasuredWidth(source:flight._hl.NativeText):Single;
	@:hlNative("flight", "flight_get_native_text_string")
	public static function getNativeTextString(source:flight._hl.NativeText):hl.Bytes;
	@:hlNative("flight", "flight_get_native_text_style")
	public static function getNativeTextStyle(source:flight._hl.NativeText):Dynamic;
	@:hlNative("flight", "flight_patch_native_text_style")
	public static function patchNativeTextStyle(source:Dynamic, patch:flight._hl.NativeTextStyle):Void;
	@:hlNative("flight", "flight_set_native_text_auto_size")
	public static function setNativeTextAutoSize(source:Dynamic, value:flight._hl.TextAutoSize):Void;
	@:hlNative("flight", "flight_set_native_text_height")
	public static function setNativeTextHeight(source:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_set_native_text_string")
	public static function setNativeTextString(source:Dynamic, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_native_text_style")
	public static function setNativeTextStyle(source:Dynamic, value:Dynamic):Void;
	@:hlNative("flight", "flight_set_native_text_vertical_align")
	public static function setNativeTextVerticalAlign(source:Dynamic, value:flight._hl.TextVerticalAlign):Void;
	@:hlNative("flight", "flight_set_native_text_width")
	public static function setNativeTextWidth(source:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_append_rich_text_string")
	public static function appendRichTextString(source:Dynamic, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_build_rich_text_layout_params")
	public static function buildRichTextLayoutParams(source:flight._hl.RichText, measure:flight._hl.TextMeasureFunction):flight._hl.TextLayoutParams;
	@:hlNative("flight", "flight_clear_rich_text_format_ranges")
	public static function clearRichTextFormatRanges(source:Dynamic):Void;
	@:hlNative("flight", "flight_compute_rich_text_local_bounds_rectangle")
	public static function computeRichTextLocalBoundsRectangle(out:flight._hl.Rectangle, source:Dynamic):Void;
	@:hlNative("flight", "flight_dispatch_rich_text_link_at_point")
	public static function dispatchRichTextLinkAtPoint(source:Dynamic, x:Single, y:Single):hl.Bytes;
	@:hlNative("flight", "flight_dispatch_rich_text_wheel")
	public static function dispatchRichTextWheel(source:Dynamic, deltaLines:Single, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_enable_text_field_signals")
	public static function enableTextFieldSignals(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_rich_text_bottom_scroll_v")
	public static function getRichTextBottomScrollV(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_rich_text_char_index_at_point")
	public static function getRichTextCharIndexAtPoint(source:Dynamic, x:Single, y:Single):Int;
	@:hlNative("flight", "flight_get_rich_text_default_text_format")
	public static function getRichTextDefaultTextFormat(source:flight._hl.RichText):Dynamic;
	@:hlNative("flight", "flight_get_rich_text_format_range_at")
	public static function getRichTextFormatRangeAt(out:flight._hl.TextFormat, source:flight._hl.RichText, index:Int):Void;
	@:hlNative("flight", "flight_get_rich_text_format_range_by_index")
	public static function getRichTextFormatRangeByIndex(out:flight._hl.TextFormatRange, source:flight._hl.RichText, i:Int):Bool;
	@:hlNative("flight", "flight_get_rich_text_format_range_count")
	public static function getRichTextFormatRangeCount(source:flight._hl.RichText):Int;
	@:hlNative("flight", "flight_get_rich_text_format_ranges_in")
	public static function getRichTextFormatRangesIn(out:Dynamic, source:flight._hl.RichText, beginIndex:Int, endIndex:Int):Void;
	@:hlNative("flight", "flight_get_rich_text_length")
	public static function getRichTextLength(source:flight._hl.RichText):Int;
	@:hlNative("flight", "flight_get_rich_text_line_count")
	public static function getRichTextLineCount(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_rich_text_line_metrics")
	public static function getRichTextLineMetrics(source:Dynamic, lineIndex:Int):Dynamic;
	@:hlNative("flight", "flight_get_rich_text_max_scroll_h")
	public static function getRichTextMaxScrollH(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_rich_text_max_scroll_v")
	public static function getRichTextMaxScrollV(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_rich_text_password_character")
	public static function getRichTextPasswordCharacter(source:flight._hl.RichText):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_string")
	public static function getRichTextString(source:flight._hl.RichText):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_text_height")
	public static function getRichTextTextHeight(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_rich_text_text_width")
	public static function getRichTextTextWidth(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_text_field_signals")
	public static function getTextFieldSignals(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_insert_rich_text_string")
	public static function insertRichTextString(source:Dynamic, index:Int, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_remove_rich_text_format_ranges_in")
	public static function removeRichTextFormatRangesIn(source:Dynamic, begin:Int, end:Int):Void;
	@:hlNative("flight", "flight_replace_rich_text_string")
	public static function replaceRichTextString(source:Dynamic, beginIndex:Int, endIndex:Int, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_rich_text_background")
	public static function setRichTextBackground(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_background_color")
	public static function setRichTextBackgroundColor(source:Dynamic, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_border")
	public static function setRichTextBorder(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_border_color")
	public static function setRichTextBorderColor(source:Dynamic, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_condense_white")
	public static function setRichTextCondenseWhite(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_content")
	public static function setRichTextContent(source:Dynamic, content:flight._hl.RichTextContent):Void;
	@:hlNative("flight", "flight_set_rich_text_default_text_format")
	public static function setRichTextDefaultTextFormat(source:Dynamic, value:Dynamic):Void;
	@:hlNative("flight", "flight_set_rich_text_format_range")
	public static function setRichTextFormatRange(source:Dynamic, format:Dynamic, start:Int, end:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_height")
	public static function setRichTextHeight(source:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_set_rich_text_max_chars")
	public static function setRichTextMaxChars(source:Dynamic, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_mouse_wheel_enabled")
	public static function setRichTextMouseWheelEnabled(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_multiline")
	public static function setRichTextMultiline(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_scroll_h")
	public static function setRichTextScrollH(source:Dynamic, value:Single, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_set_rich_text_scroll_v")
	public static function setRichTextScrollV(source:Dynamic, value:Single, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_set_rich_text_selectable")
	public static function setRichTextSelectable(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_string")
	public static function setRichTextString(source:Dynamic, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_rich_text_text_color")
	public static function setRichTextTextColor(source:Dynamic, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_vertical_align")
	public static function setRichTextVerticalAlign(source:Dynamic, value:flight._hl.TextVerticalAlign):Void;
	@:hlNative("flight", "flight_set_rich_text_width")
	public static function setRichTextWidth(source:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_set_rich_text_word_wrap")
	public static function setRichTextWordWrap(source:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_compute_text_format_font_string")
	public static function computeTextFormatFontString(format:flight._hl.TextFormat):hl.Bytes;
	@:hlNative("flight", "flight_append_text_label_string")
	public static function appendTextLabelString(source:Dynamic, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_compute_text_label_local_bounds_rectangle")
	public static function computeTextLabelLocalBoundsRectangle(out:flight._hl.Rectangle, source:Dynamic):Void;
	@:hlNative("flight", "flight_get_text_label_format")
	public static function getTextLabelFormat(source:flight._hl.TextLabel):Dynamic;
	@:hlNative("flight", "flight_get_text_label_string")
	public static function getTextLabelString(source:flight._hl.TextLabel):hl.Bytes;
	@:hlNative("flight", "flight_set_text_label_auto_size")
	public static function setTextLabelAutoSize(source:Dynamic, value:flight._hl.TextAutoSize):Void;
	@:hlNative("flight", "flight_set_text_label_format")
	public static function setTextLabelFormat(source:Dynamic, value:Dynamic):Void;
	@:hlNative("flight", "flight_set_text_label_height")
	public static function setTextLabelHeight(source:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_set_text_label_string")
	public static function setTextLabelString(source:Dynamic, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_text_label_vertical_align")
	public static function setTextLabelVerticalAlign(source:Dynamic, value:flight._hl.TextVerticalAlign):Void;
	@:hlNative("flight", "flight_set_text_label_width")
	public static function setTextLabelWidth(source:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_get_text_layout")
	public static function getTextLayout(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_text_layout_metrics")
	public static function getTextLayoutMetrics(out:flight._hl.TextMetrics, source:Dynamic):Void;
	@:hlNative("flight", "flight_free_text_label_content_explanation")
	public static function freeTextLabelContentExplanation(ptr:flight._hl.TextLabelContentExplanation):Void;
	@:hlNative("flight", "flight_free_text_layout_params")
	public static function freeTextLayoutParams(ptr:flight._hl.TextLayoutParams):Void;
	@:hlNative("flight", "flight_free_text_line_metrics")
	public static function freeTextLineMetrics(ptr:flight._hl.TextLineMetrics):Void;
}
