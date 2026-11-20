package flight._cpp._fn;

extern class Text {
	@:native("flight_explain_text_label_content")
	public static function explainTextLabelContent(source:flight._cpp.FlightNode):flight._cpp.TextLabelContentExplanation;
	@:native("flight_create_native_text")
	public static function createNativeText():flight._cpp.FlightNode;
	@:native("flight_compute_native_text_local_bounds_rectangle")
	public static function computeNativeTextLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_get_native_text_measured_height")
	public static function getNativeTextMeasuredHeight(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_native_text_measured_width")
	public static function getNativeTextMeasuredWidth(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_native_text_string")
	public static function getNativeTextString(source:flight._cpp.FlightNode):cpp.ConstCharStar;
	@:native("flight_get_native_text_style")
	public static function getNativeTextStyle(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_patch_native_text_style")
	public static function patchNativeTextStyle(source:flight._cpp.FlightNode, patch:flight._cpp.NativeTextStyle):Void;
	@:native("flight_set_native_text_auto_size")
	public static function setNativeTextAutoSize(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_native_text_height")
	public static function setNativeTextHeight(source:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_set_native_text_string")
	public static function setNativeTextString(source:flight._cpp.FlightNode, value:cpp.ConstCharStar):Void;
	@:native("flight_set_native_text_style")
	public static function setNativeTextStyle(source:flight._cpp.FlightNode, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_native_text_vertical_align")
	public static function setNativeTextVerticalAlign(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_native_text_width")
	public static function setNativeTextWidth(source:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_append_rich_text_string")
	public static function appendRichTextString(source:flight._cpp.FlightNode, value:cpp.ConstCharStar):Void;
	@:native("flight_build_rich_text_layout_params")
	public static function buildRichTextLayoutParams(source:flight._cpp.FlightNode, measure:flight._cpp.TextMeasureFunction):flight._cpp.TextLayoutParams;
	@:native("flight_clear_rich_text_format_ranges")
	public static function clearRichTextFormatRanges(source:flight._cpp.FlightNode):Void;
	@:native("flight_compute_rich_text_local_bounds_rectangle")
	public static function computeRichTextLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_dispatch_rich_text_link_at_point")
	public static function dispatchRichTextLinkAtPoint(source:flight._cpp.FlightNode, x:Float, y:Float):cpp.ConstCharStar;
	@:native("flight_dispatch_rich_text_wheel")
	public static function dispatchRichTextWheel(source:flight._cpp.FlightNode, deltaLines:Float, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_enable_text_field_signals")
	public static function enableTextFieldSignals(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_rich_text_bottom_scroll_v")
	public static function getRichTextBottomScrollV(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_rich_text_char_index_at_point")
	public static function getRichTextCharIndexAtPoint(source:flight._cpp.FlightNode, x:Float, y:Float):Int;
	@:native("flight_get_rich_text_default_text_format")
	public static function getRichTextDefaultTextFormat(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_rich_text_format_range_at")
	public static function getRichTextFormatRangeAt(out:flight._cpp.TextFormat, source:flight._cpp.FlightNode, index:Int):Void;
	@:native("flight_get_rich_text_format_range_by_index")
	public static function getRichTextFormatRangeByIndex(out:flight._cpp.TextFormatRange, source:flight._cpp.FlightNode, i:Int):Bool;
	@:native("flight_get_rich_text_format_range_count")
	public static function getRichTextFormatRangeCount(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_rich_text_format_ranges_in")
	public static function getRichTextFormatRangesIn(out:cpp.Star<cpp.Void>, source:flight._cpp.FlightNode, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_get_rich_text_length")
	public static function getRichTextLength(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_rich_text_line_count")
	public static function getRichTextLineCount(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_rich_text_line_metrics")
	public static function getRichTextLineMetrics(source:flight._cpp.FlightNode, lineIndex:Int):flight._cpp.TextLineMetrics;
	@:native("flight_get_rich_text_max_scroll_h")
	public static function getRichTextMaxScrollH(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_rich_text_max_scroll_v")
	public static function getRichTextMaxScrollV(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_rich_text_password_character")
	public static function getRichTextPasswordCharacter(source:flight._cpp.FlightNode):cpp.ConstCharStar;
	@:native("flight_get_rich_text_string")
	public static function getRichTextString(source:flight._cpp.FlightNode):cpp.ConstCharStar;
	@:native("flight_get_rich_text_text_height")
	public static function getRichTextTextHeight(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_rich_text_text_width")
	public static function getRichTextTextWidth(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_text_field_signals")
	public static function getTextFieldSignals(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_insert_rich_text_string")
	public static function insertRichTextString(source:flight._cpp.FlightNode, index:Int, value:cpp.ConstCharStar):Void;
	@:native("flight_remove_rich_text_format_ranges_in")
	public static function removeRichTextFormatRangesIn(source:flight._cpp.FlightNode, begin:Int, end:Int):Void;
	@:native("flight_replace_rich_text_string")
	public static function replaceRichTextString(source:flight._cpp.FlightNode, beginIndex:Int, endIndex:Int, value:cpp.ConstCharStar):Void;
	@:native("flight_set_rich_text_background")
	public static function setRichTextBackground(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_set_rich_text_background_color")
	public static function setRichTextBackgroundColor(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_rich_text_border")
	public static function setRichTextBorder(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_set_rich_text_border_color")
	public static function setRichTextBorderColor(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_rich_text_condense_white")
	public static function setRichTextCondenseWhite(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_set_rich_text_content")
	public static function setRichTextContent(source:flight._cpp.FlightNode, content:flight._cpp.RichTextContent):Void;
	@:native("flight_set_rich_text_default_text_format")
	public static function setRichTextDefaultTextFormat(source:flight._cpp.FlightNode, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_rich_text_format_range")
	public static function setRichTextFormatRange(source:flight._cpp.FlightNode, format:cpp.Star<cpp.Void>, start:haxe.Int64, end:haxe.Int64):Void;
	@:native("flight_set_rich_text_height")
	public static function setRichTextHeight(source:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_set_rich_text_max_chars")
	public static function setRichTextMaxChars(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_rich_text_mouse_wheel_enabled")
	public static function setRichTextMouseWheelEnabled(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_set_rich_text_multiline")
	public static function setRichTextMultiline(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_set_rich_text_scroll_h")
	public static function setRichTextScrollH(source:flight._cpp.FlightNode, value:Float, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_set_rich_text_scroll_v")
	public static function setRichTextScrollV(source:flight._cpp.FlightNode, value:Float, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_set_rich_text_selectable")
	public static function setRichTextSelectable(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_set_rich_text_string")
	public static function setRichTextString(source:flight._cpp.FlightNode, value:cpp.ConstCharStar):Void;
	@:native("flight_set_rich_text_text_color")
	public static function setRichTextTextColor(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_rich_text_vertical_align")
	public static function setRichTextVerticalAlign(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_rich_text_width")
	public static function setRichTextWidth(source:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_set_rich_text_word_wrap")
	public static function setRichTextWordWrap(source:flight._cpp.FlightNode, value:Bool):Void;
	@:native("flight_compute_text_format_font_string")
	public static function computeTextFormatFontString(format:flight._cpp.TextFormat):cpp.ConstCharStar;
	@:native("flight_append_text_label_string")
	public static function appendTextLabelString(source:flight._cpp.FlightNode, value:cpp.ConstCharStar):Void;
	@:native("flight_compute_text_label_local_bounds_rectangle")
	public static function computeTextLabelLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_get_text_label_format")
	public static function getTextLabelFormat(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_text_label_string")
	public static function getTextLabelString(source:flight._cpp.FlightNode):cpp.ConstCharStar;
	@:native("flight_set_text_label_auto_size")
	public static function setTextLabelAutoSize(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_text_label_format")
	public static function setTextLabelFormat(source:flight._cpp.FlightNode, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_text_label_height")
	public static function setTextLabelHeight(source:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_set_text_label_string")
	public static function setTextLabelString(source:flight._cpp.FlightNode, value:cpp.ConstCharStar):Void;
	@:native("flight_set_text_label_vertical_align")
	public static function setTextLabelVerticalAlign(source:flight._cpp.FlightNode, value:Int):Void;
	@:native("flight_set_text_label_width")
	public static function setTextLabelWidth(source:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_get_text_layout")
	public static function getTextLayout(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_text_layout_metrics")
	public static function getTextLayoutMetrics(out:flight._cpp.TextMetrics, source:flight._cpp.FlightNode):Void;
	@:native("flight_free_text_label_content_explanation")
	public static function freeTextLabelContentExplanation(ptr:flight._cpp.TextLabelContentExplanation):Void;
	@:native("flight_free_native_text_style_ref")
	public static function freeNativeTextStyleRef(ptr:flight._cpp.NativeTextStyle):Void;
	@:native("flight_free_text_field_signals_ref")
	public static function freeTextFieldSignalsRef(ptr:flight._cpp.TextFieldSignals):Void;
	@:native("flight_free_text_format_ref")
	public static function freeTextFormatRef(ptr:flight._cpp.TextFormat):Void;
	@:native("flight_free_text_input_state_ref")
	public static function freeTextInputStateRef(ptr:flight._cpp.TextInputState):Void;
}
