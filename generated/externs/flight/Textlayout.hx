package flight;

#if (js && flight_esm)
extern inline function createRichTextContent():RichTextContent {
	return flight._js._fn.Textlayout.createRichTextContent();
}
#else
extern inline function createRichTextContent():RichTextContent {
#if hl
	return flight._hl._fn.Textlayout.createRichTextContent();
#elseif cpp
	return flight._cpp._fn.Textlayout.createRichTextContent();
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.createRichTextContent();
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeRichTextCharIndexAtPoint(layout:TextLayoutResult, x:Float, y:Float):Int {
	return flight._js._fn.Textlayout.computeRichTextCharIndexAtPoint(layout, x, y);
}
#else
extern inline function computeRichTextCharIndexAtPoint(layout:TextLayoutResult, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Textlayout.computeRichTextCharIndexAtPoint(layout, x, y);
#elseif cpp
	return flight._cpp._fn.Textlayout.computeRichTextCharIndexAtPoint(layout, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.computeRichTextCharIndexAtPoint(layout, x, y);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeRichTextLineMetrics(layout:TextLayoutResult, lineIndex:Int):Null<TextLineMetrics> {
	return flight._js._fn.Textlayout.computeRichTextLineMetrics(layout, lineIndex);
}
#else
extern inline function computeRichTextLineMetrics(layout:TextLayoutResult, lineIndex:Int):TextLineMetrics {
#if hl
	return flight._hl._fn.Textlayout.computeRichTextLineMetrics(layout, lineIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.computeRichTextLineMetrics(layout, lineIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.computeRichTextLineMetrics(layout, lineIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextCharBoundaries(out:Rectangle, layout:TextLayoutResult, charIndex:Int):Bool {
	return flight._js._fn.Textlayout.getRichTextCharBoundaries(out, layout, charIndex);
}
#else
extern inline function getRichTextCharBoundaries(out:Rectangle, layout:TextLayoutResult, charIndex:Int):Bool {
#if hl
	return flight._hl._fn.Textlayout.getRichTextCharBoundaries(out, layout, charIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextCharBoundaries(out, layout, charIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextCharBoundaries(out, layout, charIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextFirstCharInParagraph(text:String, charIndex:Int):Int {
	return flight._js._fn.Textlayout.getRichTextFirstCharInParagraph(text, charIndex);
}
#else
extern inline function getRichTextFirstCharInParagraph(text:String, charIndex:Int):Int {
#if hl
	return flight._hl._fn.Textlayout.getRichTextFirstCharInParagraph(cast text, charIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextFirstCharInParagraph(cast text, charIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextFirstCharInParagraph(text, charIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineIndexAtPoint(layout:TextLayoutResult, y:Float):Int {
	return flight._js._fn.Textlayout.getRichTextLineIndexAtPoint(layout, y);
}
#else
extern inline function getRichTextLineIndexAtPoint(layout:TextLayoutResult, y:Float):Int {
#if hl
	return flight._hl._fn.Textlayout.getRichTextLineIndexAtPoint(layout, y);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextLineIndexAtPoint(layout, y);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextLineIndexAtPoint(layout, y);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineIndexOfChar(layout:TextLayoutResult, charIndex:Int):Int {
	return flight._js._fn.Textlayout.getRichTextLineIndexOfChar(layout, charIndex);
}
#else
extern inline function getRichTextLineIndexOfChar(layout:TextLayoutResult, charIndex:Int):Int {
#if hl
	return flight._hl._fn.Textlayout.getRichTextLineIndexOfChar(layout, charIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextLineIndexOfChar(layout, charIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextLineIndexOfChar(layout, charIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineLength(layout:TextLayoutResult, lineIndex:Int):Int {
	return flight._js._fn.Textlayout.getRichTextLineLength(layout, lineIndex);
}
#else
extern inline function getRichTextLineLength(layout:TextLayoutResult, lineIndex:Int):Int {
#if hl
	return flight._hl._fn.Textlayout.getRichTextLineLength(layout, lineIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextLineLength(layout, lineIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextLineLength(layout, lineIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineOffset(layout:TextLayoutResult, lineIndex:Int):Int {
	return flight._js._fn.Textlayout.getRichTextLineOffset(layout, lineIndex);
}
#else
extern inline function getRichTextLineOffset(layout:TextLayoutResult, lineIndex:Int):Int {
#if hl
	return flight._hl._fn.Textlayout.getRichTextLineOffset(layout, lineIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextLineOffset(layout, lineIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextLineOffset(layout, lineIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineText(text:String, layout:TextLayoutResult, lineIndex:Int):String {
	return flight._js._fn.Textlayout.getRichTextLineText(text, layout, lineIndex);
}
#else
extern inline function getRichTextLineText(text:String, layout:TextLayoutResult, lineIndex:Int):String {
#if hl
	return cast flight._hl._fn.Textlayout.getRichTextLineText(cast text, layout, lineIndex);
#elseif cpp
	return cast flight._cpp._fn.Textlayout.getRichTextLineText(cast text, layout, lineIndex);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textlayout.getRichTextLineText(text, layout, lineIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLinkAtPoint(layout:TextLayoutResult, x:Float, y:Float):Null<String> {
	return flight._js._fn.Textlayout.getRichTextLinkAtPoint(layout, x, y);
}
#else
extern inline function getRichTextLinkAtPoint(layout:TextLayoutResult, x:Float, y:Float):String {
#if hl
	return cast flight._hl._fn.Textlayout.getRichTextLinkAtPoint(layout, x, y);
#elseif cpp
	return cast flight._cpp._fn.Textlayout.getRichTextLinkAtPoint(layout, x, y);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textlayout.getRichTextLinkAtPoint(layout, x, y);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextParagraphLength(text:String, charIndex:Int):Int {
	return flight._js._fn.Textlayout.getRichTextParagraphLength(text, charIndex);
}
#else
extern inline function getRichTextParagraphLength(text:String, charIndex:Int):Int {
#if hl
	return flight._hl._fn.Textlayout.getRichTextParagraphLength(cast text, charIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getRichTextParagraphLength(cast text, charIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getRichTextParagraphLength(text, charIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextSelectionRectangles(out:Dynamic, beginIndex:Int, endIndex:Int, layout:TextLayoutResult):Void {
	flight._js._fn.Textlayout.getRichTextSelectionRectangles(out, beginIndex, endIndex, layout);
}
#else
extern inline function getRichTextSelectionRectangles(out:Dynamic, beginIndex:Int, endIndex:Int, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Textlayout.getRichTextSelectionRectangles(out, beginIndex, endIndex, layout);
#elseif cpp
	flight._cpp._fn.Textlayout.getRichTextSelectionRectangles(out, beginIndex, endIndex, layout);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.getRichTextSelectionRectangles(out, beginIndex, endIndex, layout);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextBoundsHeight(spec:TextBoundsSpec, layout:TextLayoutResult):Float {
	return flight._js._fn.Textlayout.computeTextBoundsHeight(spec, layout);
}
#else
extern inline function computeTextBoundsHeight(spec:TextBoundsSpec, layout:TextLayoutResult):Float {
#if hl
	return flight._hl._fn.Textlayout.computeTextBoundsHeight(spec, layout);
#elseif cpp
	return flight._cpp._fn.Textlayout.computeTextBoundsHeight(spec, layout);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.computeTextBoundsHeight(spec, layout);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextBoundsOffsetX(spec:TextBoundsSpec, layout:TextLayoutResult):Float {
	return flight._js._fn.Textlayout.computeTextBoundsOffsetX(spec, layout);
}
#else
extern inline function computeTextBoundsOffsetX(spec:TextBoundsSpec, layout:TextLayoutResult):Float {
#if hl
	return flight._hl._fn.Textlayout.computeTextBoundsOffsetX(spec, layout);
#elseif cpp
	return flight._cpp._fn.Textlayout.computeTextBoundsOffsetX(spec, layout);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.computeTextBoundsOffsetX(spec, layout);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextBoundsRectangle(out:Rectangle, spec:TextBoundsSpec, layout:TextLayoutResult):Void {
	flight._js._fn.Textlayout.computeTextBoundsRectangle(out, spec, layout);
}
#else
extern inline function computeTextBoundsRectangle(out:Rectangle, spec:TextBoundsSpec, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Textlayout.computeTextBoundsRectangle(out, spec, layout);
#elseif cpp
	flight._cpp._fn.Textlayout.computeTextBoundsRectangle(out, spec, layout);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.computeTextBoundsRectangle(out, spec, layout);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextBoundsWidth(spec:TextBoundsSpec, layout:TextLayoutResult):Float {
	return flight._js._fn.Textlayout.computeTextBoundsWidth(spec, layout);
}
#else
extern inline function computeTextBoundsWidth(spec:TextBoundsSpec, layout:TextLayoutResult):Float {
#if hl
	return flight._hl._fn.Textlayout.computeTextBoundsWidth(spec, layout);
#elseif cpp
	return flight._cpp._fn.Textlayout.computeTextBoundsWidth(spec, layout);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.computeTextBoundsWidth(spec, layout);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextLayoutResult():TextLayoutResult {
	return flight._js._fn.Textlayout.createTextLayoutResult();
}
#else
extern inline function createTextLayoutResult():TextLayoutResult {
#if hl
	return flight._hl._fn.Textlayout.createTextLayoutResult();
#elseif cpp
	return flight._cpp._fn.Textlayout.createTextLayoutResult();
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.createTextLayoutResult();
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextLayout(out:TextLayoutResult, params:TextLayoutParams):Void {
	flight._js._fn.Textlayout.computeTextLayout(out, params);
}
#else
extern inline function computeTextLayout(out:TextLayoutResult, params:TextLayoutParams):Void {
#if hl
	flight._hl._fn.Textlayout.computeTextLayout(out, params);
#elseif cpp
	flight._cpp._fn.Textlayout.computeTextLayout(out, params);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.computeTextLayout(out, params);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isTextLayoutTruncated(layout:TextLayoutResult, params:TextLayoutParams):Bool {
	return flight._js._fn.Textlayout.isTextLayoutTruncated(layout, params);
}
#else
extern inline function isTextLayoutTruncated(layout:TextLayoutResult, params:TextLayoutParams):Bool {
#if hl
	return flight._hl._fn.Textlayout.isTextLayoutTruncated(layout, params);
#elseif cpp
	return flight._cpp._fn.Textlayout.isTextLayoutTruncated(layout, params);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.isTextLayoutTruncated(layout, params);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextLayoutGroup(format:Dynamic):TextLayoutGroup {
	return flight._js._fn.Textlayout.createTextLayoutGroup(format);
}
#else
extern inline function createTextLayoutGroup(format:Dynamic):TextLayoutGroup {
#if hl
	return flight._hl._fn.Textlayout.createTextLayoutGroup(format);
#elseif cpp
	return flight._cpp._fn.Textlayout.createTextLayoutGroup(format);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.createTextLayoutGroup(format);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextLineBreakIndex(lineBreaks:Dynamic, startIndex:Null<Int>):Int {
	return flight._js._fn.Textlayout.getTextLineBreakIndex(lineBreaks, startIndex);
}
#else
extern inline function getTextLineBreakIndex(lineBreaks:Dynamic, lineBreaksLen:Int, startIndex:haxe.Int64):Int {
#if hl
	return flight._hl._fn.Textlayout.getTextLineBreakIndex(lineBreaks, lineBreaksLen, startIndex);
#elseif cpp
	return flight._cpp._fn.Textlayout.getTextLineBreakIndex(lineBreaks, lineBreaksLen, startIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.getTextLineBreakIndex(lineBreaks, lineBreaksLen, startIndex);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextLineBreaks(out:Dynamic, text:String):Void {
	flight._js._fn.Textlayout.getTextLineBreaks(out, text);
}
#else
extern inline function getTextLineBreaks(out:Dynamic, text:String):Void {
#if hl
	flight._hl._fn.Textlayout.getTextLineBreaks(out, cast text);
#elseif cpp
	flight._cpp._fn.Textlayout.getTextLineBreaks(out, cast text);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.getTextLineBreaks(out, text);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextMetrics():TextMetrics {
	return flight._js._fn.Textlayout.createTextMetrics();
}
#else
extern inline function createTextMetrics():TextMetrics {
#if hl
	return flight._hl._fn.Textlayout.createTextMetrics();
#elseif cpp
	return flight._cpp._fn.Textlayout.createTextMetrics();
#elseif (js && flight_esm)
	return flight._js._fn.Textlayout.createTextMetrics();
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextMetrics(out:TextMetrics, layout:TextLayoutResult):Void {
	flight._js._fn.Textlayout.getTextMetrics(out, layout);
}
#else
extern inline function getTextMetrics(out:TextMetrics, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Textlayout.getTextMetrics(out, layout);
#elseif cpp
	flight._cpp._fn.Textlayout.getTextMetrics(out, layout);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.getTextMetrics(out, layout);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRichTextContent(ptr:RichTextContent):Void {
	flight._js._fn.Textlayout.freeRichTextContent(ptr);
}
#else
extern inline function freeRichTextContent(ptr:RichTextContent):Void {
#if hl
	flight._hl._fn.Textlayout.freeRichTextContent(ptr);
#elseif cpp
	flight._cpp._fn.Textlayout.freeRichTextContent(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.freeRichTextContent(ptr);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLayoutResult(ptr:TextLayoutResult):Void {
	flight._js._fn.Textlayout.freeTextLayoutResult(ptr);
}
#else
extern inline function freeTextLayoutResult(ptr:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Textlayout.freeTextLayoutResult(ptr);
#elseif cpp
	flight._cpp._fn.Textlayout.freeTextLayoutResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.freeTextLayoutResult(ptr);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLayoutGroup(ptr:TextLayoutGroup):Void {
	flight._js._fn.Textlayout.freeTextLayoutGroup(ptr);
}
#else
extern inline function freeTextLayoutGroup(ptr:TextLayoutGroup):Void {
#if hl
	flight._hl._fn.Textlayout.freeTextLayoutGroup(ptr);
#elseif cpp
	flight._cpp._fn.Textlayout.freeTextLayoutGroup(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.freeTextLayoutGroup(ptr);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextMetrics(ptr:TextMetrics):Void {
	flight._js._fn.Textlayout.freeTextMetrics(ptr);
}
#else
extern inline function freeTextMetrics(ptr:TextMetrics):Void {
#if hl
	flight._hl._fn.Textlayout.freeTextMetrics(ptr);
#elseif cpp
	flight._cpp._fn.Textlayout.freeTextMetrics(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.freeTextMetrics(ptr);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLayoutParams(ptr:TextLayoutParams):Void {
	flight._js._fn.Textlayout.freeTextLayoutParams(ptr);
}
#else
extern inline function freeTextLayoutParams(ptr:TextLayoutParams):Void {
#if hl
	flight._hl._fn.Textlayout.freeTextLayoutParams(ptr);
#elseif cpp
	flight._cpp._fn.Textlayout.freeTextLayoutParams(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.freeTextLayoutParams(ptr);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLineMetrics(ptr:TextLineMetrics):Void {
	flight._js._fn.Textlayout.freeTextLineMetrics(ptr);
}
#else
extern inline function freeTextLineMetrics(ptr:TextLineMetrics):Void {
#if hl
	flight._hl._fn.Textlayout.freeTextLineMetrics(ptr);
#elseif cpp
	flight._cpp._fn.Textlayout.freeTextLineMetrics(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textlayout.freeTextLineMetrics(ptr);
#else
	#error "flight.Textlayout: no backend for this target."
#end
}
#end
