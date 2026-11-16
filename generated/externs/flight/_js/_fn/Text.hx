package flight._js._fn;

@:jsRequire("@flighthq/text")
extern class Text {
	@:native("explainTextLabelContent")
	public static function explainTextLabelContent(source:Dynamic):flight._js.TextLabelContentExplanation;
	@:native("createNativeText")
	public static function createNativeText():Dynamic;
	@:native("computeNativeTextLocalBoundsRectangle")
	public static function computeNativeTextLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("getNativeTextMeasuredHeight")
	public static function getNativeTextMeasuredHeight(source:flight._js.NativeText):Float;
	@:native("getNativeTextMeasuredWidth")
	public static function getNativeTextMeasuredWidth(source:flight._js.NativeText):Float;
	@:native("getNativeTextString")
	public static function getNativeTextString(source:flight._js.NativeText):String;
	@:native("getNativeTextStyle")
	public static function getNativeTextStyle(source:flight._js.NativeText):Dynamic;
	@:native("patchNativeTextStyle")
	public static function patchNativeTextStyle(source:Dynamic, patch:flight._js.NativeTextStyle):Void;
	@:native("setNativeTextAutoSize")
	public static function setNativeTextAutoSize(source:Dynamic, value:flight._js.TextAutoSize):Void;
	@:native("setNativeTextHeight")
	public static function setNativeTextHeight(source:Dynamic, value:Float):Void;
	@:native("setNativeTextString")
	public static function setNativeTextString(source:Dynamic, value:String):Void;
	@:native("setNativeTextStyle")
	public static function setNativeTextStyle(source:Dynamic, value:Dynamic):Void;
	@:native("setNativeTextVerticalAlign")
	public static function setNativeTextVerticalAlign(source:Dynamic, value:flight._js.TextVerticalAlign):Void;
	@:native("setNativeTextWidth")
	public static function setNativeTextWidth(source:Dynamic, value:Float):Void;
	@:native("appendRichTextString")
	public static function appendRichTextString(source:Dynamic, value:String):Void;
	@:native("buildRichTextLayoutParams")
	public static function buildRichTextLayoutParams(source:flight._js.RichText, measure:flight._js.TextMeasureFunction):flight._js.TextLayoutParams;
	@:native("clearRichTextFormatRanges")
	public static function clearRichTextFormatRanges(source:Dynamic):Void;
	@:native("computeRichTextLocalBoundsRectangle")
	public static function computeRichTextLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("dispatchRichTextLinkAtPoint")
	public static function dispatchRichTextLinkAtPoint(source:Dynamic, x:Float, y:Float):Null<String>;
	@:native("dispatchRichTextWheel")
	public static function dispatchRichTextWheel(source:Dynamic, deltaLines:Float, layout:Null<flight._js.TextLayoutResult>):Void;
	@:native("enableTextFieldSignals")
	public static function enableTextFieldSignals(source:Dynamic):Dynamic;
	@:native("getRichTextBottomScrollV")
	public static function getRichTextBottomScrollV(source:Dynamic):Float;
	@:native("getRichTextCharIndexAtPoint")
	public static function getRichTextCharIndexAtPoint(source:Dynamic, x:Float, y:Float):Int;
	@:native("getRichTextDefaultTextFormat")
	public static function getRichTextDefaultTextFormat(source:flight._js.RichText):Dynamic;
	@:native("getRichTextFormatRangeAt")
	public static function getRichTextFormatRangeAt(out:flight._js.TextFormat, source:flight._js.RichText, index:Int):Void;
	@:native("getRichTextFormatRangeByIndex")
	public static function getRichTextFormatRangeByIndex(out:flight._js.TextFormatRange, source:flight._js.RichText, i:Int):Bool;
	@:native("getRichTextFormatRangeCount")
	public static function getRichTextFormatRangeCount(source:flight._js.RichText):Int;
	@:native("getRichTextFormatRangesIn")
	public static function getRichTextFormatRangesIn(out:Dynamic, source:flight._js.RichText, beginIndex:Int, endIndex:Int):Void;
	@:native("getRichTextLength")
	public static function getRichTextLength(source:flight._js.RichText):Int;
	@:native("getRichTextLineCount")
	public static function getRichTextLineCount(source:Dynamic):Int;
	@:native("getRichTextLineMetrics")
	public static function getRichTextLineMetrics(source:Dynamic, lineIndex:Int):Null<flight._js.TextLineMetrics>;
	@:native("getRichTextMaxScrollH")
	public static function getRichTextMaxScrollH(source:Dynamic):Float;
	@:native("getRichTextMaxScrollV")
	public static function getRichTextMaxScrollV(source:Dynamic):Float;
	@:native("getRichTextPasswordCharacter")
	public static function getRichTextPasswordCharacter(source:flight._js.RichText):Null<String>;
	@:native("getRichTextString")
	public static function getRichTextString(source:flight._js.RichText):String;
	@:native("getRichTextTextHeight")
	public static function getRichTextTextHeight(source:Dynamic):Float;
	@:native("getRichTextTextWidth")
	public static function getRichTextTextWidth(source:Dynamic):Float;
	@:native("getTextFieldSignals")
	public static function getTextFieldSignals(source:Dynamic):Null<Dynamic>;
	@:native("insertRichTextString")
	public static function insertRichTextString(source:Dynamic, index:Int, value:String):Void;
	@:native("removeRichTextFormatRangesIn")
	public static function removeRichTextFormatRangesIn(source:Dynamic, begin:Int, end:Int):Void;
	@:native("replaceRichTextString")
	public static function replaceRichTextString(source:Dynamic, beginIndex:Int, endIndex:Int, value:String):Void;
	@:native("setRichTextBackground")
	public static function setRichTextBackground(source:Dynamic, value:Bool):Void;
	@:native("setRichTextBackgroundColor")
	public static function setRichTextBackgroundColor(source:Dynamic, value:Int):Void;
	@:native("setRichTextBorder")
	public static function setRichTextBorder(source:Dynamic, value:Bool):Void;
	@:native("setRichTextBorderColor")
	public static function setRichTextBorderColor(source:Dynamic, value:Int):Void;
	@:native("setRichTextCondenseWhite")
	public static function setRichTextCondenseWhite(source:Dynamic, value:Bool):Void;
	@:native("setRichTextContent")
	public static function setRichTextContent(source:Dynamic, content:flight._js.RichTextContent):Void;
	@:native("setRichTextDefaultTextFormat")
	public static function setRichTextDefaultTextFormat(source:Dynamic, value:Dynamic):Void;
	@:native("setRichTextFormatRange")
	public static function setRichTextFormatRange(source:Dynamic, format:Dynamic, start:Null<Int>, end:Null<Int>):Void;
	@:native("setRichTextHeight")
	public static function setRichTextHeight(source:Dynamic, value:Float):Void;
	@:native("setRichTextMaxChars")
	public static function setRichTextMaxChars(source:Dynamic, value:Int):Void;
	@:native("setRichTextMouseWheelEnabled")
	public static function setRichTextMouseWheelEnabled(source:Dynamic, value:Bool):Void;
	@:native("setRichTextMultiline")
	public static function setRichTextMultiline(source:Dynamic, value:Bool):Void;
	@:native("setRichTextScrollH")
	public static function setRichTextScrollH(source:Dynamic, value:Float, layout:Null<flight._js.TextLayoutResult>):Void;
	@:native("setRichTextScrollV")
	public static function setRichTextScrollV(source:Dynamic, value:Float, layout:Null<flight._js.TextLayoutResult>):Void;
	@:native("setRichTextSelectable")
	public static function setRichTextSelectable(source:Dynamic, value:Bool):Void;
	@:native("setRichTextString")
	public static function setRichTextString(source:Dynamic, value:String):Void;
	@:native("setRichTextTextColor")
	public static function setRichTextTextColor(source:Dynamic, value:Int):Void;
	@:native("setRichTextVerticalAlign")
	public static function setRichTextVerticalAlign(source:Dynamic, value:flight._js.TextVerticalAlign):Void;
	@:native("setRichTextWidth")
	public static function setRichTextWidth(source:Dynamic, value:Float):Void;
	@:native("setRichTextWordWrap")
	public static function setRichTextWordWrap(source:Dynamic, value:Bool):Void;
	@:native("computeTextFormatFontString")
	public static function computeTextFormatFontString(format:flight._js.TextFormat):String;
	@:native("appendTextLabelString")
	public static function appendTextLabelString(source:Dynamic, value:String):Void;
	@:native("computeTextLabelLocalBoundsRectangle")
	public static function computeTextLabelLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("getTextLabelFormat")
	public static function getTextLabelFormat(source:flight._js.TextLabel):Dynamic;
	@:native("getTextLabelString")
	public static function getTextLabelString(source:flight._js.TextLabel):String;
	@:native("setTextLabelAutoSize")
	public static function setTextLabelAutoSize(source:Dynamic, value:flight._js.TextAutoSize):Void;
	@:native("setTextLabelFormat")
	public static function setTextLabelFormat(source:Dynamic, value:Dynamic):Void;
	@:native("setTextLabelHeight")
	public static function setTextLabelHeight(source:Dynamic, value:Float):Void;
	@:native("setTextLabelString")
	public static function setTextLabelString(source:Dynamic, value:String):Void;
	@:native("setTextLabelVerticalAlign")
	public static function setTextLabelVerticalAlign(source:Dynamic, value:flight._js.TextVerticalAlign):Void;
	@:native("setTextLabelWidth")
	public static function setTextLabelWidth(source:Dynamic, value:Float):Void;
	@:native("getTextLayout")
	public static function getTextLayout(source:Dynamic):Null<Dynamic>;
	@:native("getTextLayoutMetrics")
	public static function getTextLayoutMetrics(out:flight._js.TextMetrics, source:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLabelContentExplanation(ptr:flight._js.TextLabelContentExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLayoutParams(ptr:flight._js.TextLayoutParams):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextLineMetrics(ptr:flight._js.TextLineMetrics):Void {}
}
