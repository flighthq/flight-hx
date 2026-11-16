package flight._js._fn;

@:jsRequire("flight")
extern class Text {
	@:native("flight_explain_text_label_content")
	public static function explainTextLabelContent(source:Dynamic):flight._js.TextLabelContentExplanation;
	@:native("flight_create_native_text")
	public static function createNativeText():Dynamic;
	@:native("flight_compute_native_text_local_bounds_rectangle")
	public static function computeNativeTextLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_get_native_text_measured_height")
	public static function getNativeTextMeasuredHeight(source:flight._js.NativeText):Float;
	@:native("flight_get_native_text_measured_width")
	public static function getNativeTextMeasuredWidth(source:flight._js.NativeText):Float;
	@:native("flight_get_native_text_string")
	public static function getNativeTextString(source:flight._js.NativeText):String;
	@:native("flight_get_native_text_style")
	public static function getNativeTextStyle(source:flight._js.NativeText):Dynamic;
	@:native("flight_patch_native_text_style")
	public static function patchNativeTextStyle(source:Dynamic, patch:flight._js.NativeTextStyle):Void;
	@:native("flight_set_native_text_auto_size")
	public static function setNativeTextAutoSize(source:Dynamic, value:flight._js.TextAutoSize):Void;
	@:native("flight_set_native_text_height")
	public static function setNativeTextHeight(source:Dynamic, value:Float):Void;
	@:native("flight_set_native_text_string")
	public static function setNativeTextString(source:Dynamic, value:String):Void;
	@:native("flight_set_native_text_style")
	public static function setNativeTextStyle(source:Dynamic, value:Dynamic):Void;
	@:native("flight_set_native_text_vertical_align")
	public static function setNativeTextVerticalAlign(source:Dynamic, value:flight._js.TextVerticalAlign):Void;
	@:native("flight_set_native_text_width")
	public static function setNativeTextWidth(source:Dynamic, value:Float):Void;
	@:native("flight_append_rich_text_string")
	public static function appendRichTextString(source:Dynamic, value:String):Void;
	@:native("flight_build_rich_text_layout_params")
	public static function buildRichTextLayoutParams(source:flight._js.RichText, measure:flight._js.TextMeasureFunction):flight._js.TextLayoutParams;
	@:native("flight_clear_rich_text_format_ranges")
	public static function clearRichTextFormatRanges(source:Dynamic):Void;
	@:native("flight_compute_rich_text_local_bounds_rectangle")
	public static function computeRichTextLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_dispatch_rich_text_link_at_point")
	public static function dispatchRichTextLinkAtPoint(source:Dynamic, x:Float, y:Float):String;
	@:native("flight_dispatch_rich_text_wheel")
	public static function dispatchRichTextWheel(source:Dynamic, deltaLines:Float, layout:flight._js.TextLayoutResult):Void;
	@:native("flight_enable_text_field_signals")
	public static function enableTextFieldSignals(source:Dynamic):Dynamic;
	@:native("flight_get_rich_text_bottom_scroll_v")
	public static function getRichTextBottomScrollV(source:Dynamic):Float;
	@:native("flight_get_rich_text_char_index_at_point")
	public static function getRichTextCharIndexAtPoint(source:Dynamic, x:Float, y:Float):Int;
	@:native("flight_get_rich_text_default_text_format")
	public static function getRichTextDefaultTextFormat(source:flight._js.RichText):Dynamic;
	@:native("flight_get_rich_text_format_range_at")
	public static function getRichTextFormatRangeAt(out:flight._js.TextFormat, source:flight._js.RichText, index:Int):Void;
	@:native("flight_get_rich_text_format_range_by_index")
	public static function getRichTextFormatRangeByIndex(out:flight._js.TextFormatRange, source:flight._js.RichText, i:Int):Bool;
	@:native("flight_get_rich_text_format_range_count")
	public static function getRichTextFormatRangeCount(source:flight._js.RichText):Int;
	@:native("flight_get_rich_text_format_ranges_in")
	public static function getRichTextFormatRangesIn(out:Dynamic, source:flight._js.RichText, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_get_rich_text_length")
	public static function getRichTextLength(source:flight._js.RichText):Int;
	@:native("flight_get_rich_text_line_count")
	public static function getRichTextLineCount(source:Dynamic):Int;
	@:native("flight_get_rich_text_line_metrics")
	public static function getRichTextLineMetrics(source:Dynamic, lineIndex:Int):Dynamic;
	@:native("flight_get_rich_text_max_scroll_h")
	public static function getRichTextMaxScrollH(source:Dynamic):Float;
	@:native("flight_get_rich_text_max_scroll_v")
	public static function getRichTextMaxScrollV(source:Dynamic):Float;
	@:native("flight_get_rich_text_password_character")
	public static function getRichTextPasswordCharacter(source:flight._js.RichText):String;
	@:native("flight_get_rich_text_string")
	public static function getRichTextString(source:flight._js.RichText):String;
	@:native("flight_get_rich_text_text_height")
	public static function getRichTextTextHeight(source:Dynamic):Float;
	@:native("flight_get_rich_text_text_width")
	public static function getRichTextTextWidth(source:Dynamic):Float;
	@:native("flight_get_text_field_signals")
	public static function getTextFieldSignals(source:Dynamic):Dynamic;
	@:native("flight_insert_rich_text_string")
	public static function insertRichTextString(source:Dynamic, index:Int, value:String):Void;
	@:native("flight_remove_rich_text_format_ranges_in")
	public static function removeRichTextFormatRangesIn(source:Dynamic, begin:Int, end:Int):Void;
	@:native("flight_replace_rich_text_string")
	public static function replaceRichTextString(source:Dynamic, beginIndex:Int, endIndex:Int, value:String):Void;
	@:native("flight_set_rich_text_background")
	public static function setRichTextBackground(source:Dynamic, value:Bool):Void;
	@:native("flight_set_rich_text_background_color")
	public static function setRichTextBackgroundColor(source:Dynamic, value:Int):Void;
	@:native("flight_set_rich_text_border")
	public static function setRichTextBorder(source:Dynamic, value:Bool):Void;
	@:native("flight_set_rich_text_border_color")
	public static function setRichTextBorderColor(source:Dynamic, value:Int):Void;
	@:native("flight_set_rich_text_condense_white")
	public static function setRichTextCondenseWhite(source:Dynamic, value:Bool):Void;
	@:native("flight_set_rich_text_content")
	public static function setRichTextContent(source:Dynamic, content:flight._js.RichTextContent):Void;
	@:native("flight_set_rich_text_default_text_format")
	public static function setRichTextDefaultTextFormat(source:Dynamic, value:Dynamic):Void;
	@:native("flight_set_rich_text_format_range")
	public static function setRichTextFormatRange(source:Dynamic, format:Dynamic, start:haxe.Int64, end:haxe.Int64):Void;
	@:native("flight_set_rich_text_height")
	public static function setRichTextHeight(source:Dynamic, value:Float):Void;
	@:native("flight_set_rich_text_max_chars")
	public static function setRichTextMaxChars(source:Dynamic, value:Int):Void;
	@:native("flight_set_rich_text_mouse_wheel_enabled")
	public static function setRichTextMouseWheelEnabled(source:Dynamic, value:Bool):Void;
	@:native("flight_set_rich_text_multiline")
	public static function setRichTextMultiline(source:Dynamic, value:Bool):Void;
	@:native("flight_set_rich_text_scroll_h")
	public static function setRichTextScrollH(source:Dynamic, value:Float, layout:flight._js.TextLayoutResult):Void;
	@:native("flight_set_rich_text_scroll_v")
	public static function setRichTextScrollV(source:Dynamic, value:Float, layout:flight._js.TextLayoutResult):Void;
	@:native("flight_set_rich_text_selectable")
	public static function setRichTextSelectable(source:Dynamic, value:Bool):Void;
	@:native("flight_set_rich_text_string")
	public static function setRichTextString(source:Dynamic, value:String):Void;
	@:native("flight_set_rich_text_text_color")
	public static function setRichTextTextColor(source:Dynamic, value:Int):Void;
	@:native("flight_set_rich_text_vertical_align")
	public static function setRichTextVerticalAlign(source:Dynamic, value:flight._js.TextVerticalAlign):Void;
	@:native("flight_set_rich_text_width")
	public static function setRichTextWidth(source:Dynamic, value:Float):Void;
	@:native("flight_set_rich_text_word_wrap")
	public static function setRichTextWordWrap(source:Dynamic, value:Bool):Void;
	@:native("flight_compute_text_format_font_string")
	public static function computeTextFormatFontString(format:flight._js.TextFormat):String;
	@:native("flight_append_text_label_string")
	public static function appendTextLabelString(source:Dynamic, value:String):Void;
	@:native("flight_compute_text_label_local_bounds_rectangle")
	public static function computeTextLabelLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_get_text_label_format")
	public static function getTextLabelFormat(source:flight._js.TextLabel):Dynamic;
	@:native("flight_get_text_label_string")
	public static function getTextLabelString(source:flight._js.TextLabel):String;
	@:native("flight_set_text_label_auto_size")
	public static function setTextLabelAutoSize(source:Dynamic, value:flight._js.TextAutoSize):Void;
	@:native("flight_set_text_label_format")
	public static function setTextLabelFormat(source:Dynamic, value:Dynamic):Void;
	@:native("flight_set_text_label_height")
	public static function setTextLabelHeight(source:Dynamic, value:Float):Void;
	@:native("flight_set_text_label_string")
	public static function setTextLabelString(source:Dynamic, value:String):Void;
	@:native("flight_set_text_label_vertical_align")
	public static function setTextLabelVerticalAlign(source:Dynamic, value:flight._js.TextVerticalAlign):Void;
	@:native("flight_set_text_label_width")
	public static function setTextLabelWidth(source:Dynamic, value:Float):Void;
	@:native("flight_get_text_layout")
	public static function getTextLayout(source:Dynamic):Dynamic;
	@:native("flight_get_text_layout_metrics")
	public static function getTextLayoutMetrics(out:flight._js.TextMetrics, source:Dynamic):Void;
	@:native("flight_free_text_label_content_explanation")
	public static function freeTextLabelContentExplanation(ptr:flight._js.TextLabelContentExplanation):Void;
	@:native("flight_free_text_layout_params")
	public static function freeTextLayoutParams(ptr:flight._js.TextLayoutParams):Void;
	@:native("flight_free_text_line_metrics")
	public static function freeTextLineMetrics(ptr:flight._js.TextLineMetrics):Void;
}
