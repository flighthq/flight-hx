package flight._js._fn;

@:jsRequire("@flighthq/textlayout")
extern class Textlayout {
	@:native("createRichTextContent")
	public static function createRichTextContent():flight._js.RichTextContent;
	@:native("computeRichTextCharIndexAtPoint")
	public static function computeRichTextCharIndexAtPoint(layout:flight._js.TextLayoutResult, x:Float, y:Float):Int;
	@:native("computeRichTextLineMetrics")
	public static function computeRichTextLineMetrics(layout:flight._js.TextLayoutResult, lineIndex:Int):Null<flight._js.TextLineMetrics>;
	@:native("getRichTextCharBoundaries")
	public static function getRichTextCharBoundaries(out:flight._js.Rectangle, layout:flight._js.TextLayoutResult, charIndex:Int):Bool;
	@:native("getRichTextFirstCharInParagraph")
	public static function getRichTextFirstCharInParagraph(text:String, charIndex:Int):Int;
	@:native("getRichTextLineIndexAtPoint")
	public static function getRichTextLineIndexAtPoint(layout:flight._js.TextLayoutResult, y:Float):Int;
	@:native("getRichTextLineIndexOfChar")
	public static function getRichTextLineIndexOfChar(layout:flight._js.TextLayoutResult, charIndex:Int):Int;
	@:native("getRichTextLineLength")
	public static function getRichTextLineLength(layout:flight._js.TextLayoutResult, lineIndex:Int):Int;
	@:native("getRichTextLineOffset")
	public static function getRichTextLineOffset(layout:flight._js.TextLayoutResult, lineIndex:Int):Int;
	@:native("getRichTextLineText")
	public static function getRichTextLineText(text:String, layout:flight._js.TextLayoutResult, lineIndex:Int):String;
	@:native("getRichTextLinkAtPoint")
	public static function getRichTextLinkAtPoint(layout:flight._js.TextLayoutResult, x:Float, y:Float):Null<String>;
	@:native("getRichTextParagraphLength")
	public static function getRichTextParagraphLength(text:String, charIndex:Int):Int;
	@:native("getRichTextSelectionRectangles")
	public static function getRichTextSelectionRectangles(out:Dynamic, beginIndex:Int, endIndex:Int, layout:flight._js.TextLayoutResult):Void;
	@:native("computeTextBoundsHeight")
	public static function computeTextBoundsHeight(spec:flight._js.TextBoundsSpec, layout:flight._js.TextLayoutResult):Float;
	@:native("computeTextBoundsOffsetX")
	public static function computeTextBoundsOffsetX(spec:flight._js.TextBoundsSpec, layout:flight._js.TextLayoutResult):Float;
	@:native("computeTextBoundsRectangle")
	public static function computeTextBoundsRectangle(out:flight._js.Rectangle, spec:flight._js.TextBoundsSpec, layout:flight._js.TextLayoutResult):Void;
	@:native("computeTextBoundsWidth")
	public static function computeTextBoundsWidth(spec:flight._js.TextBoundsSpec, layout:flight._js.TextLayoutResult):Float;
	@:native("createTextLayoutResult")
	public static function createTextLayoutResult():flight._js.TextLayoutResult;
	@:native("computeTextLayout")
	public static function computeTextLayout(out:flight._js.TextLayoutResult, params:flight._js.TextLayoutParams):Void;
	@:native("isTextLayoutTruncated")
	public static function isTextLayoutTruncated(layout:flight._js.TextLayoutResult, params:flight._js.TextLayoutParams):Bool;
	@:native("createTextLayoutGroup")
	public static function createTextLayoutGroup(format:Dynamic):flight._js.TextLayoutGroup;
	@:native("getTextLineBreakIndex")
	public static function getTextLineBreakIndex(lineBreaks:Dynamic, startIndex:Null<Int>):Int;
	@:native("getTextLineBreaks")
	public static function getTextLineBreaks(out:Dynamic, text:String):Void;
	@:native("createTextMetrics")
	public static function createTextMetrics():flight._js.TextMetrics;
	@:native("getTextMetrics")
	public static function getTextMetrics(out:flight._js.TextMetrics, layout:flight._js.TextLayoutResult):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRichTextContent(ptr:flight._js.RichTextContent):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLayoutResult(ptr:flight._js.TextLayoutResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLayoutGroup(ptr:flight._js.TextLayoutGroup):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextMetrics(ptr:flight._js.TextMetrics):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLayoutParams(ptr:flight._js.TextLayoutParams):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLineMetrics(ptr:flight._js.TextLineMetrics):Void {}
}
