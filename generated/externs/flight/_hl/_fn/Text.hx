package flight._hl._fn;

extern class Text {
	@:hlNative("flight", "flight_explain_text_label_content")
	public static function explainTextLabelContent(source:flight._hl.FlightNode):flight._hl.TextLabelContentExplanation;
	@:hlNative("flight", "flight_create_native_text")
	public static function createNativeText():flight._hl.FlightNode;
	@:hlNative("flight", "flight_compute_native_text_local_bounds_rectangle")
	public static function computeNativeTextLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_native_text_measured_height")
	public static function getNativeTextMeasuredHeight(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_native_text_measured_width")
	public static function getNativeTextMeasuredWidth(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_native_text_string")
	public static function getNativeTextString(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_native_text_style")
	public static function getNativeTextStyle(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_patch_native_text_style")
	public static function patchNativeTextStyle(source:flight._hl.FlightNode, patch:flight._hl.NativeTextStyle):Void;
	@:hlNative("flight", "flight_set_native_text_auto_size")
	public static function setNativeTextAutoSize(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_native_text_height")
	public static function setNativeTextHeight(source:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_set_native_text_string")
	public static function setNativeTextString(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_native_text_style")
	public static function setNativeTextStyle(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_native_text_vertical_align")
	public static function setNativeTextVerticalAlign(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_native_text_width")
	public static function setNativeTextWidth(source:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_append_rich_text_string")
	public static function appendRichTextString(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_build_rich_text_layout_params")
	public static function buildRichTextLayoutParams(source:flight._hl.FlightNode, measure:flight._hl.TextMeasureFunction):flight._hl.TextLayoutParams;
	@:hlNative("flight", "flight_clear_rich_text_format_ranges")
	public static function clearRichTextFormatRanges(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_compute_rich_text_local_bounds_rectangle")
	public static function computeRichTextLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_dispatch_rich_text_link_at_point")
	public static function dispatchRichTextLinkAtPoint(source:flight._hl.FlightNode, x:Float, y:Float):hl.Bytes;
	@:hlNative("flight", "flight_dispatch_rich_text_wheel")
	public static function dispatchRichTextWheel(source:flight._hl.FlightNode, deltaLines:Float, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_enable_text_field_signals")
	public static function enableTextFieldSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_bottom_scroll_v")
	public static function getRichTextBottomScrollV(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_rich_text_char_index_at_point")
	public static function getRichTextCharIndexAtPoint(source:flight._hl.FlightNode, x:Float, y:Float):Int;
	@:hlNative("flight", "flight_get_rich_text_default_text_format")
	public static function getRichTextDefaultTextFormat(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_format_range_at")
	public static function getRichTextFormatRangeAt(out:flight._hl.TextFormat, source:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_get_rich_text_format_range_by_index")
	public static function getRichTextFormatRangeByIndex(out:flight._hl.TextFormatRange, source:flight._hl.FlightNode, i:Int):Bool;
	@:hlNative("flight", "flight_get_rich_text_format_range_count")
	public static function getRichTextFormatRangeCount(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_rich_text_format_ranges_in")
	public static function getRichTextFormatRangesIn(out:hl.Bytes, source:flight._hl.FlightNode, beginIndex:Int, endIndex:Int):Void;
	@:hlNative("flight", "flight_get_rich_text_length")
	public static function getRichTextLength(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_rich_text_line_count")
	public static function getRichTextLineCount(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_rich_text_line_metrics")
	public static function getRichTextLineMetrics(source:flight._hl.FlightNode, lineIndex:Int):flight._hl.TextLineMetrics;
	@:hlNative("flight", "flight_get_rich_text_max_scroll_h")
	public static function getRichTextMaxScrollH(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_rich_text_max_scroll_v")
	public static function getRichTextMaxScrollV(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_rich_text_password_character")
	public static function getRichTextPasswordCharacter(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_string")
	public static function getRichTextString(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_text_height")
	public static function getRichTextTextHeight(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_rich_text_text_width")
	public static function getRichTextTextWidth(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_text_field_signals")
	public static function getTextFieldSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_insert_rich_text_string")
	public static function insertRichTextString(source:flight._hl.FlightNode, index:Int, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_remove_rich_text_format_ranges_in")
	public static function removeRichTextFormatRangesIn(source:flight._hl.FlightNode, begin:Int, end:Int):Void;
	@:hlNative("flight", "flight_replace_rich_text_string")
	public static function replaceRichTextString(source:flight._hl.FlightNode, beginIndex:Int, endIndex:Int, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_rich_text_background")
	public static function setRichTextBackground(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_background_color")
	public static function setRichTextBackgroundColor(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_border")
	public static function setRichTextBorder(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_border_color")
	public static function setRichTextBorderColor(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_condense_white")
	public static function setRichTextCondenseWhite(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_content")
	public static function setRichTextContent(source:flight._hl.FlightNode, content:flight._hl.RichTextContent):Void;
	@:hlNative("flight", "flight_set_rich_text_default_text_format")
	public static function setRichTextDefaultTextFormat(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_rich_text_format_range")
	public static function setRichTextFormatRange(source:flight._hl.FlightNode, format:hl.Bytes, start:haxe.Int64, end:haxe.Int64):Void;
	@:hlNative("flight", "flight_set_rich_text_height")
	public static function setRichTextHeight(source:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_set_rich_text_max_chars")
	public static function setRichTextMaxChars(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_mouse_wheel_enabled")
	public static function setRichTextMouseWheelEnabled(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_multiline")
	public static function setRichTextMultiline(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_scroll_h")
	public static function setRichTextScrollH(source:flight._hl.FlightNode, value:Float, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_set_rich_text_scroll_v")
	public static function setRichTextScrollV(source:flight._hl.FlightNode, value:Float, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_set_rich_text_selectable")
	public static function setRichTextSelectable(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_set_rich_text_string")
	public static function setRichTextString(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_rich_text_text_color")
	public static function setRichTextTextColor(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_vertical_align")
	public static function setRichTextVerticalAlign(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_rich_text_width")
	public static function setRichTextWidth(source:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_set_rich_text_word_wrap")
	public static function setRichTextWordWrap(source:flight._hl.FlightNode, value:Bool):Void;
	@:hlNative("flight", "flight_compute_text_format_font_string")
	public static function computeTextFormatFontString(format:flight._hl.TextFormat):hl.Bytes;
	@:hlNative("flight", "flight_append_text_label_string")
	public static function appendTextLabelString(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_compute_text_label_local_bounds_rectangle")
	public static function computeTextLabelLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_text_label_format")
	public static function getTextLabelFormat(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_text_label_string")
	public static function getTextLabelString(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_set_text_label_auto_size")
	public static function setTextLabelAutoSize(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_text_label_format")
	public static function setTextLabelFormat(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_text_label_height")
	public static function setTextLabelHeight(source:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_set_text_label_string")
	public static function setTextLabelString(source:flight._hl.FlightNode, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_text_label_vertical_align")
	public static function setTextLabelVerticalAlign(source:flight._hl.FlightNode, value:Int):Void;
	@:hlNative("flight", "flight_set_text_label_width")
	public static function setTextLabelWidth(source:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_get_text_layout")
	public static function getTextLayout(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_text_layout_metrics")
	public static function getTextLayoutMetrics(out:flight._hl.TextMetrics, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_free_text_label_content_explanation")
	public static function freeTextLabelContentExplanation(ptr:flight._hl.TextLabelContentExplanation):Void;
	@:hlNative("flight", "flight_free_native_text_style_ref")
	public static function freeNativeTextStyleRef(ptr:flight._hl.NativeTextStyle):Void;
	@:hlNative("flight", "flight_free_text_field_signals_ref")
	public static function freeTextFieldSignalsRef(ptr:flight._hl.TextFieldSignals):Void;
	@:hlNative("flight", "flight_free_text_format_ref")
	public static function freeTextFormatRef(ptr:flight._hl.TextFormat):Void;
	@:hlNative("flight", "flight_free_text_input_state_ref")
	public static function freeTextInputStateRef(ptr:flight._hl.TextInputState):Void;
}
