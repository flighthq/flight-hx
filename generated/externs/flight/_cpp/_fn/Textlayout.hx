package flight._cpp._fn;

extern class Textlayout {
	@:native("flight_create_rich_text_content")
	public static function createRichTextContent():flight._cpp.RichTextContent;
	@:native("flight_compute_rich_text_char_index_at_point")
	public static function computeRichTextCharIndexAtPoint(layout:flight._cpp.TextLayoutResult, x:Single, y:Single):Int;
	@:native("flight_compute_rich_text_line_metrics")
	public static function computeRichTextLineMetrics(layout:flight._cpp.TextLayoutResult, lineIndex:Int):flight._cpp.TextLineMetrics;
	@:native("flight_get_rich_text_char_boundaries")
	public static function getRichTextCharBoundaries(out:flight._cpp.Rectangle, layout:flight._cpp.TextLayoutResult, charIndex:Int):Bool;
	@:native("flight_get_rich_text_first_char_in_paragraph")
	public static function getRichTextFirstCharInParagraph(text:cpp.ConstCharStar, charIndex:Int):Int;
	@:native("flight_get_rich_text_line_index_at_point")
	public static function getRichTextLineIndexAtPoint(layout:flight._cpp.TextLayoutResult, y:Single):Int;
	@:native("flight_get_rich_text_line_index_of_char")
	public static function getRichTextLineIndexOfChar(layout:flight._cpp.TextLayoutResult, charIndex:Int):Int;
	@:native("flight_get_rich_text_line_length")
	public static function getRichTextLineLength(layout:flight._cpp.TextLayoutResult, lineIndex:Int):Int;
	@:native("flight_get_rich_text_line_offset")
	public static function getRichTextLineOffset(layout:flight._cpp.TextLayoutResult, lineIndex:Int):Int;
	@:native("flight_get_rich_text_line_text")
	public static function getRichTextLineText(text:cpp.ConstCharStar, layout:flight._cpp.TextLayoutResult, lineIndex:Int):cpp.ConstCharStar;
	@:native("flight_get_rich_text_link_at_point")
	public static function getRichTextLinkAtPoint(layout:flight._cpp.TextLayoutResult, x:Single, y:Single):cpp.ConstCharStar;
	@:native("flight_get_rich_text_paragraph_length")
	public static function getRichTextParagraphLength(text:cpp.ConstCharStar, charIndex:Int):Int;
	@:native("flight_get_rich_text_selection_rectangles")
	public static function getRichTextSelectionRectangles(out:cpp.Star<cpp.Void>, beginIndex:Int, endIndex:Int, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_compute_text_bounds_height")
	public static function computeTextBoundsHeight(spec:flight._cpp.TextBoundsSpec, layout:flight._cpp.TextLayoutResult):Single;
	@:native("flight_compute_text_bounds_offset_x")
	public static function computeTextBoundsOffsetX(spec:flight._cpp.TextBoundsSpec, layout:flight._cpp.TextLayoutResult):Single;
	@:native("flight_compute_text_bounds_rectangle")
	public static function computeTextBoundsRectangle(out:flight._cpp.Rectangle, spec:flight._cpp.TextBoundsSpec, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_compute_text_bounds_width")
	public static function computeTextBoundsWidth(spec:flight._cpp.TextBoundsSpec, layout:flight._cpp.TextLayoutResult):Single;
	@:native("flight_create_text_layout_result")
	public static function createTextLayoutResult():flight._cpp.TextLayoutResult;
	@:native("flight_compute_text_layout")
	public static function computeTextLayout(out:flight._cpp.TextLayoutResult, params:flight._cpp.TextLayoutParams):Void;
	@:native("flight_is_text_layout_truncated")
	public static function isTextLayoutTruncated(layout:flight._cpp.TextLayoutResult, params:flight._cpp.TextLayoutParams):Bool;
	@:native("flight_create_text_layout_group")
	public static function createTextLayoutGroup(format:cpp.Star<cpp.Void>):flight._cpp.TextLayoutGroup;
	@:native("flight_get_text_layout_measure_provider")
	public static function getTextLayoutMeasureProvider(state:flight._cpp.TextLayoutMeasureState, hostTextShaper:flight._cpp.HostTextShaperCapability):flight._cpp.TextMeasureFunction;
	@:native("flight_get_text_line_break_index")
	public static function getTextLineBreakIndex(lineBreaks:cpp.Star<cpp.Void>, lineBreaksLen:Int, startIndex:haxe.Int64):Int;
	@:native("flight_get_text_line_breaks")
	public static function getTextLineBreaks(out:cpp.Star<cpp.Void>, text:cpp.ConstCharStar):Void;
	@:native("flight_create_text_metrics")
	public static function createTextMetrics():flight._cpp.TextMetrics;
	@:native("flight_get_text_metrics")
	public static function getTextMetrics(out:flight._cpp.TextMetrics, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_free_rich_text_content")
	public static function freeRichTextContent(ptr:flight._cpp.RichTextContent):Void;
	@:native("flight_free_text_layout_result")
	public static function freeTextLayoutResult(ptr:flight._cpp.TextLayoutResult):Void;
	@:native("flight_free_text_layout_group")
	public static function freeTextLayoutGroup(ptr:flight._cpp.TextLayoutGroup):Void;
	@:native("flight_free_text_measure_function")
	public static function freeTextMeasureFunction(ptr:flight._cpp.TextMeasureFunction):Void;
	@:native("flight_free_text_metrics")
	public static function freeTextMetrics(ptr:flight._cpp.TextMetrics):Void;
	@:native("flight_free_text_layout_params")
	public static function freeTextLayoutParams(ptr:flight._cpp.TextLayoutParams):Void;
	@:native("flight_free_text_layout_result_ref")
	public static function freeTextLayoutResultRef(ptr:flight._cpp.TextLayoutResult):Void;
	@:native("flight_free_text_line_metrics")
	public static function freeTextLineMetrics(ptr:flight._cpp.TextLineMetrics):Void;
}
