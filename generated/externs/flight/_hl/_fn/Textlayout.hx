package flight._hl._fn;

extern class Textlayout {
	@:hlNative("flight", "flight_create_rich_text_content")
	public static function createRichTextContent():flight._hl.RichTextContent;
	@:hlNative("flight", "flight_compute_rich_text_char_index_at_point")
	public static function computeRichTextCharIndexAtPoint(layout:flight._hl.TextLayoutResult, x:Single, y:Single):Int;
	@:hlNative("flight", "flight_compute_rich_text_line_metrics")
	public static function computeRichTextLineMetrics(layout:flight._hl.TextLayoutResult, lineIndex:Int):flight._hl.TextLineMetrics;
	@:hlNative("flight", "flight_get_rich_text_char_boundaries")
	public static function getRichTextCharBoundaries(out:flight._hl.Rectangle, layout:flight._hl.TextLayoutResult, charIndex:Int):Bool;
	@:hlNative("flight", "flight_get_rich_text_first_char_in_paragraph")
	public static function getRichTextFirstCharInParagraph(text:hl.Bytes, charIndex:Int):Int;
	@:hlNative("flight", "flight_get_rich_text_line_index_at_point")
	public static function getRichTextLineIndexAtPoint(layout:flight._hl.TextLayoutResult, y:Single):Int;
	@:hlNative("flight", "flight_get_rich_text_line_index_of_char")
	public static function getRichTextLineIndexOfChar(layout:flight._hl.TextLayoutResult, charIndex:Int):Int;
	@:hlNative("flight", "flight_get_rich_text_line_length")
	public static function getRichTextLineLength(layout:flight._hl.TextLayoutResult, lineIndex:Int):Int;
	@:hlNative("flight", "flight_get_rich_text_line_offset")
	public static function getRichTextLineOffset(layout:flight._hl.TextLayoutResult, lineIndex:Int):Int;
	@:hlNative("flight", "flight_get_rich_text_line_text")
	public static function getRichTextLineText(text:hl.Bytes, layout:flight._hl.TextLayoutResult, lineIndex:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_link_at_point")
	public static function getRichTextLinkAtPoint(layout:flight._hl.TextLayoutResult, x:Single, y:Single):hl.Bytes;
	@:hlNative("flight", "flight_get_rich_text_paragraph_length")
	public static function getRichTextParagraphLength(text:hl.Bytes, charIndex:Int):Int;
	@:hlNative("flight", "flight_get_rich_text_selection_rectangles")
	public static function getRichTextSelectionRectangles(out:hl.Bytes, beginIndex:Int, endIndex:Int, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_compute_text_bounds_height")
	public static function computeTextBoundsHeight(spec:flight._hl.TextBoundsSpec, layout:flight._hl.TextLayoutResult):Single;
	@:hlNative("flight", "flight_compute_text_bounds_offset_x")
	public static function computeTextBoundsOffsetX(spec:flight._hl.TextBoundsSpec, layout:flight._hl.TextLayoutResult):Single;
	@:hlNative("flight", "flight_compute_text_bounds_rectangle")
	public static function computeTextBoundsRectangle(out:flight._hl.Rectangle, spec:flight._hl.TextBoundsSpec, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_compute_text_bounds_width")
	public static function computeTextBoundsWidth(spec:flight._hl.TextBoundsSpec, layout:flight._hl.TextLayoutResult):Single;
	@:hlNative("flight", "flight_create_text_layout_result")
	public static function createTextLayoutResult():flight._hl.TextLayoutResult;
	@:hlNative("flight", "flight_compute_text_layout")
	public static function computeTextLayout(out:flight._hl.TextLayoutResult, params:flight._hl.TextLayoutParams):Void;
	@:hlNative("flight", "flight_is_text_layout_truncated")
	public static function isTextLayoutTruncated(layout:flight._hl.TextLayoutResult, params:flight._hl.TextLayoutParams):Bool;
	@:hlNative("flight", "flight_create_text_layout_group")
	public static function createTextLayoutGroup(format:hl.Bytes):flight._hl.TextLayoutGroup;
	@:hlNative("flight", "flight_get_text_line_break_index")
	public static function getTextLineBreakIndex(lineBreaks:hl.Bytes, lineBreaksLen:Int, startIndex:haxe.Int64):Int;
	@:hlNative("flight", "flight_get_text_line_breaks")
	public static function getTextLineBreaks(out:hl.Bytes, text:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_text_metrics")
	public static function createTextMetrics():flight._hl.TextMetrics;
	@:hlNative("flight", "flight_get_text_metrics")
	public static function getTextMetrics(out:flight._hl.TextMetrics, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_free_rich_text_content")
	public static function freeRichTextContent(ptr:flight._hl.RichTextContent):Void;
	@:hlNative("flight", "flight_free_text_layout_result")
	public static function freeTextLayoutResult(ptr:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_free_text_layout_group")
	public static function freeTextLayoutGroup(ptr:flight._hl.TextLayoutGroup):Void;
	@:hlNative("flight", "flight_free_text_metrics")
	public static function freeTextMetrics(ptr:flight._hl.TextMetrics):Void;
}
