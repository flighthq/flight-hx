package flight;

#if (js && flight_esm)
extern inline function explainTextLabelContent(source:Dynamic):TextLabelContentExplanation {
	return flight._js._fn.Text.explainTextLabelContent(source);
}
#else
extern inline function explainTextLabelContent(source:Dynamic):TextLabelContentExplanation {
#if hl
	return flight._hl._fn.Text.explainTextLabelContent(source);
#elseif cpp
	return flight._cpp._fn.Text.explainTextLabelContent(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.explainTextLabelContent(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNativeText():Dynamic {
	return flight._js._fn.Text.createNativeText();
}
#else
extern inline function createNativeText():Dynamic {
#if hl
	return flight._hl._fn.Text.createNativeText();
#elseif cpp
	return flight._cpp._fn.Text.createNativeText();
#elseif (js && flight_esm)
	return flight._js._fn.Text.createNativeText();
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeNativeTextLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Text.computeNativeTextLocalBoundsRectangle(out, source);
}
#else
extern inline function computeNativeTextLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Text.computeNativeTextLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Text.computeNativeTextLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Text.computeNativeTextLocalBoundsRectangle(out, source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNativeTextMeasuredHeight(source:NativeText):Float {
	return flight._js._fn.Text.getNativeTextMeasuredHeight(source);
}
#else
extern inline function getNativeTextMeasuredHeight(source:NativeText):Float {
#if hl
	return flight._hl._fn.Text.getNativeTextMeasuredHeight(source);
#elseif cpp
	return flight._cpp._fn.Text.getNativeTextMeasuredHeight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getNativeTextMeasuredHeight(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNativeTextMeasuredWidth(source:NativeText):Float {
	return flight._js._fn.Text.getNativeTextMeasuredWidth(source);
}
#else
extern inline function getNativeTextMeasuredWidth(source:NativeText):Float {
#if hl
	return flight._hl._fn.Text.getNativeTextMeasuredWidth(source);
#elseif cpp
	return flight._cpp._fn.Text.getNativeTextMeasuredWidth(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getNativeTextMeasuredWidth(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNativeTextString(source:NativeText):String {
	return flight._js._fn.Text.getNativeTextString(source);
}
#else
extern inline function getNativeTextString(source:NativeText):String {
#if hl
	return cast flight._hl._fn.Text.getNativeTextString(source);
#elseif cpp
	return cast flight._cpp._fn.Text.getNativeTextString(source);
#elseif (js && flight_esm)
	return cast flight._js._fn.Text.getNativeTextString(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNativeTextStyle(source:NativeText):Dynamic {
	return flight._js._fn.Text.getNativeTextStyle(source);
}
#else
extern inline function getNativeTextStyle(source:NativeText):Dynamic {
#if hl
	return flight._hl._fn.Text.getNativeTextStyle(source);
#elseif cpp
	return flight._cpp._fn.Text.getNativeTextStyle(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getNativeTextStyle(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function patchNativeTextStyle(source:Dynamic, patch:NativeTextStyle):Void {
	flight._js._fn.Text.patchNativeTextStyle(source, patch);
}
#else
extern inline function patchNativeTextStyle(source:Dynamic, patch:NativeTextStyle):Void {
#if hl
	flight._hl._fn.Text.patchNativeTextStyle(source, patch);
#elseif cpp
	flight._cpp._fn.Text.patchNativeTextStyle(source, patch);
#elseif (js && flight_esm)
	flight._js._fn.Text.patchNativeTextStyle(source, patch);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNativeTextAutoSize(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setNativeTextAutoSize(source, value);
}
#else
extern inline function setNativeTextAutoSize(source:Dynamic, value:flight.TextAutoSize):Void {
#if hl
	flight._hl._fn.Text.setNativeTextAutoSize(source, value);
#elseif cpp
	flight._cpp._fn.Text.setNativeTextAutoSize(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setNativeTextAutoSize(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNativeTextHeight(source:Dynamic, value:Float):Void {
	flight._js._fn.Text.setNativeTextHeight(source, value);
}
#else
extern inline function setNativeTextHeight(source:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Text.setNativeTextHeight(source, value);
#elseif cpp
	flight._cpp._fn.Text.setNativeTextHeight(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setNativeTextHeight(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNativeTextString(source:Dynamic, value:String):Void {
	flight._js._fn.Text.setNativeTextString(source, value);
}
#else
extern inline function setNativeTextString(source:Dynamic, value:String):Void {
#if hl
	flight._hl._fn.Text.setNativeTextString(source, cast value);
#elseif cpp
	flight._cpp._fn.Text.setNativeTextString(source, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setNativeTextString(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNativeTextStyle(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setNativeTextStyle(source, value);
}
#else
extern inline function setNativeTextStyle(source:Dynamic, value:Dynamic):Void {
#if hl
	flight._hl._fn.Text.setNativeTextStyle(source, value);
#elseif cpp
	flight._cpp._fn.Text.setNativeTextStyle(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setNativeTextStyle(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNativeTextVerticalAlign(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setNativeTextVerticalAlign(source, value);
}
#else
extern inline function setNativeTextVerticalAlign(source:Dynamic, value:flight.TextVerticalAlign):Void {
#if hl
	flight._hl._fn.Text.setNativeTextVerticalAlign(source, value);
#elseif cpp
	flight._cpp._fn.Text.setNativeTextVerticalAlign(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setNativeTextVerticalAlign(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNativeTextWidth(source:Dynamic, value:Float):Void {
	flight._js._fn.Text.setNativeTextWidth(source, value);
}
#else
extern inline function setNativeTextWidth(source:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Text.setNativeTextWidth(source, value);
#elseif cpp
	flight._cpp._fn.Text.setNativeTextWidth(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setNativeTextWidth(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendRichTextString(source:Dynamic, value:String):Void {
	flight._js._fn.Text.appendRichTextString(source, value);
}
#else
extern inline function appendRichTextString(source:Dynamic, value:String):Void {
#if hl
	flight._hl._fn.Text.appendRichTextString(source, cast value);
#elseif cpp
	flight._cpp._fn.Text.appendRichTextString(source, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.appendRichTextString(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildRichTextLayoutParams(source:RichText, measure:TextMeasureFunction):TextLayoutParams {
	return flight._js._fn.Text.buildRichTextLayoutParams(source, measure);
}
#else
extern inline function buildRichTextLayoutParams(source:RichText, measure:TextMeasureFunction):TextLayoutParams {
#if hl
	return flight._hl._fn.Text.buildRichTextLayoutParams(source, measure);
#elseif cpp
	return flight._cpp._fn.Text.buildRichTextLayoutParams(source, measure);
#elseif (js && flight_esm)
	return flight._js._fn.Text.buildRichTextLayoutParams(source, measure);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearRichTextFormatRanges(source:Dynamic):Void {
	flight._js._fn.Text.clearRichTextFormatRanges(source);
}
#else
extern inline function clearRichTextFormatRanges(source:Dynamic):Void {
#if hl
	flight._hl._fn.Text.clearRichTextFormatRanges(source);
#elseif cpp
	flight._cpp._fn.Text.clearRichTextFormatRanges(source);
#elseif (js && flight_esm)
	flight._js._fn.Text.clearRichTextFormatRanges(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeRichTextLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Text.computeRichTextLocalBoundsRectangle(out, source);
}
#else
extern inline function computeRichTextLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Text.computeRichTextLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Text.computeRichTextLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Text.computeRichTextLocalBoundsRectangle(out, source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchRichTextLinkAtPoint(source:Dynamic, x:Float, y:Float):Null<String> {
	return flight._js._fn.Text.dispatchRichTextLinkAtPoint(source, x, y);
}
#else
extern inline function dispatchRichTextLinkAtPoint(source:Dynamic, x:Float, y:Float):String {
#if hl
	return cast flight._hl._fn.Text.dispatchRichTextLinkAtPoint(source, x, y);
#elseif cpp
	return cast flight._cpp._fn.Text.dispatchRichTextLinkAtPoint(source, x, y);
#elseif (js && flight_esm)
	return cast flight._js._fn.Text.dispatchRichTextLinkAtPoint(source, x, y);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchRichTextWheel(source:Dynamic, deltaLines:Float, layout:Null<TextLayoutResult>):Void {
	flight._js._fn.Text.dispatchRichTextWheel(source, deltaLines, layout);
}
#else
extern inline function dispatchRichTextWheel(source:Dynamic, deltaLines:Float, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Text.dispatchRichTextWheel(source, deltaLines, layout);
#elseif cpp
	flight._cpp._fn.Text.dispatchRichTextWheel(source, deltaLines, layout);
#elseif (js && flight_esm)
	flight._js._fn.Text.dispatchRichTextWheel(source, deltaLines, layout);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextFieldSignals(source:Dynamic):Dynamic {
	return flight._js._fn.Text.enableTextFieldSignals(source);
}
#else
extern inline function enableTextFieldSignals(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Text.enableTextFieldSignals(source);
#elseif cpp
	return flight._cpp._fn.Text.enableTextFieldSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.enableTextFieldSignals(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextBottomScrollV(source:Dynamic):Float {
	return flight._js._fn.Text.getRichTextBottomScrollV(source);
}
#else
extern inline function getRichTextBottomScrollV(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Text.getRichTextBottomScrollV(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextBottomScrollV(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextBottomScrollV(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextCharIndexAtPoint(source:Dynamic, x:Float, y:Float):Int {
	return flight._js._fn.Text.getRichTextCharIndexAtPoint(source, x, y);
}
#else
extern inline function getRichTextCharIndexAtPoint(source:Dynamic, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Text.getRichTextCharIndexAtPoint(source, x, y);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextCharIndexAtPoint(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextCharIndexAtPoint(source, x, y);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextDefaultTextFormat(source:RichText):Dynamic {
	return flight._js._fn.Text.getRichTextDefaultTextFormat(source);
}
#else
extern inline function getRichTextDefaultTextFormat(source:RichText):Dynamic {
#if hl
	return flight._hl._fn.Text.getRichTextDefaultTextFormat(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextDefaultTextFormat(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextDefaultTextFormat(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextFormatRangeAt(out:TextFormat, source:RichText, index:Int):Void {
	flight._js._fn.Text.getRichTextFormatRangeAt(out, source, index);
}
#else
extern inline function getRichTextFormatRangeAt(out:TextFormat, source:RichText, index:Int):Void {
#if hl
	flight._hl._fn.Text.getRichTextFormatRangeAt(out, source, index);
#elseif cpp
	flight._cpp._fn.Text.getRichTextFormatRangeAt(out, source, index);
#elseif (js && flight_esm)
	flight._js._fn.Text.getRichTextFormatRangeAt(out, source, index);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextFormatRangeByIndex(out:TextFormatRange, source:RichText, i:Int):Bool {
	return flight._js._fn.Text.getRichTextFormatRangeByIndex(out, source, i);
}
#else
extern inline function getRichTextFormatRangeByIndex(out:TextFormatRange, source:RichText, i:Int):Bool {
#if hl
	return flight._hl._fn.Text.getRichTextFormatRangeByIndex(out, source, i);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextFormatRangeByIndex(out, source, i);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextFormatRangeByIndex(out, source, i);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextFormatRangeCount(source:RichText):Int {
	return flight._js._fn.Text.getRichTextFormatRangeCount(source);
}
#else
extern inline function getRichTextFormatRangeCount(source:RichText):Int {
#if hl
	return flight._hl._fn.Text.getRichTextFormatRangeCount(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextFormatRangeCount(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextFormatRangeCount(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextFormatRangesIn(out:Dynamic, source:RichText, beginIndex:Int, endIndex:Int):Void {
	flight._js._fn.Text.getRichTextFormatRangesIn(out, source, beginIndex, endIndex);
}
#else
extern inline function getRichTextFormatRangesIn(out:Dynamic, source:RichText, beginIndex:Int, endIndex:Int):Void {
#if hl
	flight._hl._fn.Text.getRichTextFormatRangesIn(out, source, beginIndex, endIndex);
#elseif cpp
	flight._cpp._fn.Text.getRichTextFormatRangesIn(out, source, beginIndex, endIndex);
#elseif (js && flight_esm)
	flight._js._fn.Text.getRichTextFormatRangesIn(out, source, beginIndex, endIndex);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLength(source:RichText):Int {
	return flight._js._fn.Text.getRichTextLength(source);
}
#else
extern inline function getRichTextLength(source:RichText):Int {
#if hl
	return flight._hl._fn.Text.getRichTextLength(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextLength(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextLength(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineCount(source:Dynamic):Int {
	return flight._js._fn.Text.getRichTextLineCount(source);
}
#else
extern inline function getRichTextLineCount(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Text.getRichTextLineCount(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextLineCount(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextLineCount(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextLineMetrics(source:Dynamic, lineIndex:Int):Null<TextLineMetrics> {
	return flight._js._fn.Text.getRichTextLineMetrics(source, lineIndex);
}
#else
extern inline function getRichTextLineMetrics(source:Dynamic, lineIndex:Int):TextLineMetrics {
#if hl
	return flight._hl._fn.Text.getRichTextLineMetrics(source, lineIndex);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextLineMetrics(source, lineIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextLineMetrics(source, lineIndex);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextMaxScrollH(source:Dynamic):Float {
	return flight._js._fn.Text.getRichTextMaxScrollH(source);
}
#else
extern inline function getRichTextMaxScrollH(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Text.getRichTextMaxScrollH(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextMaxScrollH(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextMaxScrollH(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextMaxScrollV(source:Dynamic):Float {
	return flight._js._fn.Text.getRichTextMaxScrollV(source);
}
#else
extern inline function getRichTextMaxScrollV(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Text.getRichTextMaxScrollV(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextMaxScrollV(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextMaxScrollV(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextPasswordCharacter(source:RichText):Null<String> {
	return flight._js._fn.Text.getRichTextPasswordCharacter(source);
}
#else
extern inline function getRichTextPasswordCharacter(source:RichText):String {
#if hl
	return cast flight._hl._fn.Text.getRichTextPasswordCharacter(source);
#elseif cpp
	return cast flight._cpp._fn.Text.getRichTextPasswordCharacter(source);
#elseif (js && flight_esm)
	return cast flight._js._fn.Text.getRichTextPasswordCharacter(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextString(source:RichText):String {
	return flight._js._fn.Text.getRichTextString(source);
}
#else
extern inline function getRichTextString(source:RichText):String {
#if hl
	return cast flight._hl._fn.Text.getRichTextString(source);
#elseif cpp
	return cast flight._cpp._fn.Text.getRichTextString(source);
#elseif (js && flight_esm)
	return cast flight._js._fn.Text.getRichTextString(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextTextHeight(source:Dynamic):Float {
	return flight._js._fn.Text.getRichTextTextHeight(source);
}
#else
extern inline function getRichTextTextHeight(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Text.getRichTextTextHeight(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextTextHeight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextTextHeight(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRichTextTextWidth(source:Dynamic):Float {
	return flight._js._fn.Text.getRichTextTextWidth(source);
}
#else
extern inline function getRichTextTextWidth(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Text.getRichTextTextWidth(source);
#elseif cpp
	return flight._cpp._fn.Text.getRichTextTextWidth(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getRichTextTextWidth(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextFieldSignals(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Text.getTextFieldSignals(source);
}
#else
extern inline function getTextFieldSignals(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Text.getTextFieldSignals(source);
#elseif cpp
	return flight._cpp._fn.Text.getTextFieldSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getTextFieldSignals(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function insertRichTextString(source:Dynamic, index:Int, value:String):Void {
	flight._js._fn.Text.insertRichTextString(source, index, value);
}
#else
extern inline function insertRichTextString(source:Dynamic, index:Int, value:String):Void {
#if hl
	flight._hl._fn.Text.insertRichTextString(source, index, cast value);
#elseif cpp
	flight._cpp._fn.Text.insertRichTextString(source, index, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.insertRichTextString(source, index, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeRichTextFormatRangesIn(source:Dynamic, begin:Int, end:Int):Void {
	flight._js._fn.Text.removeRichTextFormatRangesIn(source, begin, end);
}
#else
extern inline function removeRichTextFormatRangesIn(source:Dynamic, begin:Int, end:Int):Void {
#if hl
	flight._hl._fn.Text.removeRichTextFormatRangesIn(source, begin, end);
#elseif cpp
	flight._cpp._fn.Text.removeRichTextFormatRangesIn(source, begin, end);
#elseif (js && flight_esm)
	flight._js._fn.Text.removeRichTextFormatRangesIn(source, begin, end);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function replaceRichTextString(source:Dynamic, beginIndex:Int, endIndex:Int, value:String):Void {
	flight._js._fn.Text.replaceRichTextString(source, beginIndex, endIndex, value);
}
#else
extern inline function replaceRichTextString(source:Dynamic, beginIndex:Int, endIndex:Int, value:String):Void {
#if hl
	flight._hl._fn.Text.replaceRichTextString(source, beginIndex, endIndex, cast value);
#elseif cpp
	flight._cpp._fn.Text.replaceRichTextString(source, beginIndex, endIndex, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.replaceRichTextString(source, beginIndex, endIndex, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextBackground(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextBackground(source, value);
}
#else
extern inline function setRichTextBackground(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextBackground(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextBackground(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextBackground(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextBackgroundColor(source:Dynamic, value:Int):Void {
	flight._js._fn.Text.setRichTextBackgroundColor(source, value);
}
#else
extern inline function setRichTextBackgroundColor(source:Dynamic, value:Int):Void {
#if hl
	flight._hl._fn.Text.setRichTextBackgroundColor(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextBackgroundColor(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextBackgroundColor(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextBorder(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextBorder(source, value);
}
#else
extern inline function setRichTextBorder(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextBorder(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextBorder(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextBorder(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextBorderColor(source:Dynamic, value:Int):Void {
	flight._js._fn.Text.setRichTextBorderColor(source, value);
}
#else
extern inline function setRichTextBorderColor(source:Dynamic, value:Int):Void {
#if hl
	flight._hl._fn.Text.setRichTextBorderColor(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextBorderColor(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextBorderColor(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextCondenseWhite(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextCondenseWhite(source, value);
}
#else
extern inline function setRichTextCondenseWhite(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextCondenseWhite(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextCondenseWhite(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextCondenseWhite(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextContent(source:Dynamic, content:RichTextContent):Void {
	flight._js._fn.Text.setRichTextContent(source, content);
}
#else
extern inline function setRichTextContent(source:Dynamic, content:RichTextContent):Void {
#if hl
	flight._hl._fn.Text.setRichTextContent(source, content);
#elseif cpp
	flight._cpp._fn.Text.setRichTextContent(source, content);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextContent(source, content);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextDefaultTextFormat(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setRichTextDefaultTextFormat(source, value);
}
#else
extern inline function setRichTextDefaultTextFormat(source:Dynamic, value:Dynamic):Void {
#if hl
	flight._hl._fn.Text.setRichTextDefaultTextFormat(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextDefaultTextFormat(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextDefaultTextFormat(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextFormatRange(source:Dynamic, format:Dynamic, start:Null<Int>, end:Null<Int>):Void {
	flight._js._fn.Text.setRichTextFormatRange(source, format, start, end);
}
#else
extern inline function setRichTextFormatRange(source:Dynamic, format:Dynamic, start:haxe.Int64, end:haxe.Int64):Void {
#if hl
	flight._hl._fn.Text.setRichTextFormatRange(source, format, start, end);
#elseif cpp
	flight._cpp._fn.Text.setRichTextFormatRange(source, format, start, end);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextFormatRange(source, format, start, end);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextHeight(source:Dynamic, value:Float):Void {
	flight._js._fn.Text.setRichTextHeight(source, value);
}
#else
extern inline function setRichTextHeight(source:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Text.setRichTextHeight(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextHeight(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextHeight(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextMaxChars(source:Dynamic, value:Int):Void {
	flight._js._fn.Text.setRichTextMaxChars(source, value);
}
#else
extern inline function setRichTextMaxChars(source:Dynamic, value:Int):Void {
#if hl
	flight._hl._fn.Text.setRichTextMaxChars(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextMaxChars(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextMaxChars(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextMouseWheelEnabled(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextMouseWheelEnabled(source, value);
}
#else
extern inline function setRichTextMouseWheelEnabled(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextMouseWheelEnabled(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextMouseWheelEnabled(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextMouseWheelEnabled(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextMultiline(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextMultiline(source, value);
}
#else
extern inline function setRichTextMultiline(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextMultiline(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextMultiline(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextMultiline(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextScrollH(source:Dynamic, value:Float, layout:Null<TextLayoutResult>):Void {
	flight._js._fn.Text.setRichTextScrollH(source, value, layout);
}
#else
extern inline function setRichTextScrollH(source:Dynamic, value:Float, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Text.setRichTextScrollH(source, value, layout);
#elseif cpp
	flight._cpp._fn.Text.setRichTextScrollH(source, value, layout);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextScrollH(source, value, layout);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextScrollV(source:Dynamic, value:Float, layout:Null<TextLayoutResult>):Void {
	flight._js._fn.Text.setRichTextScrollV(source, value, layout);
}
#else
extern inline function setRichTextScrollV(source:Dynamic, value:Float, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Text.setRichTextScrollV(source, value, layout);
#elseif cpp
	flight._cpp._fn.Text.setRichTextScrollV(source, value, layout);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextScrollV(source, value, layout);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextSelectable(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextSelectable(source, value);
}
#else
extern inline function setRichTextSelectable(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextSelectable(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextSelectable(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextSelectable(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextString(source:Dynamic, value:String):Void {
	flight._js._fn.Text.setRichTextString(source, value);
}
#else
extern inline function setRichTextString(source:Dynamic, value:String):Void {
#if hl
	flight._hl._fn.Text.setRichTextString(source, cast value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextString(source, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextString(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextTextColor(source:Dynamic, value:Int):Void {
	flight._js._fn.Text.setRichTextTextColor(source, value);
}
#else
extern inline function setRichTextTextColor(source:Dynamic, value:Int):Void {
#if hl
	flight._hl._fn.Text.setRichTextTextColor(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextTextColor(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextTextColor(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextVerticalAlign(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setRichTextVerticalAlign(source, value);
}
#else
extern inline function setRichTextVerticalAlign(source:Dynamic, value:flight.TextVerticalAlign):Void {
#if hl
	flight._hl._fn.Text.setRichTextVerticalAlign(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextVerticalAlign(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextVerticalAlign(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextWidth(source:Dynamic, value:Float):Void {
	flight._js._fn.Text.setRichTextWidth(source, value);
}
#else
extern inline function setRichTextWidth(source:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Text.setRichTextWidth(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextWidth(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextWidth(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setRichTextWordWrap(source:Dynamic, value:Bool):Void {
	flight._js._fn.Text.setRichTextWordWrap(source, value);
}
#else
extern inline function setRichTextWordWrap(source:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Text.setRichTextWordWrap(source, value);
#elseif cpp
	flight._cpp._fn.Text.setRichTextWordWrap(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setRichTextWordWrap(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextFormatFontString(format:TextFormat):String {
	return flight._js._fn.Text.computeTextFormatFontString(format);
}
#else
extern inline function computeTextFormatFontString(format:TextFormat):String {
#if hl
	return cast flight._hl._fn.Text.computeTextFormatFontString(format);
#elseif cpp
	return cast flight._cpp._fn.Text.computeTextFormatFontString(format);
#elseif (js && flight_esm)
	return cast flight._js._fn.Text.computeTextFormatFontString(format);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendTextLabelString(source:Dynamic, value:String):Void {
	flight._js._fn.Text.appendTextLabelString(source, value);
}
#else
extern inline function appendTextLabelString(source:Dynamic, value:String):Void {
#if hl
	flight._hl._fn.Text.appendTextLabelString(source, cast value);
#elseif cpp
	flight._cpp._fn.Text.appendTextLabelString(source, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.appendTextLabelString(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextLabelLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Text.computeTextLabelLocalBoundsRectangle(out, source);
}
#else
extern inline function computeTextLabelLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Text.computeTextLabelLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Text.computeTextLabelLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Text.computeTextLabelLocalBoundsRectangle(out, source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextLabelFormat(source:TextLabel):Dynamic {
	return flight._js._fn.Text.getTextLabelFormat(source);
}
#else
extern inline function getTextLabelFormat(source:TextLabel):Dynamic {
#if hl
	return flight._hl._fn.Text.getTextLabelFormat(source);
#elseif cpp
	return flight._cpp._fn.Text.getTextLabelFormat(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getTextLabelFormat(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextLabelString(source:TextLabel):String {
	return flight._js._fn.Text.getTextLabelString(source);
}
#else
extern inline function getTextLabelString(source:TextLabel):String {
#if hl
	return cast flight._hl._fn.Text.getTextLabelString(source);
#elseif cpp
	return cast flight._cpp._fn.Text.getTextLabelString(source);
#elseif (js && flight_esm)
	return cast flight._js._fn.Text.getTextLabelString(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextLabelAutoSize(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setTextLabelAutoSize(source, value);
}
#else
extern inline function setTextLabelAutoSize(source:Dynamic, value:flight.TextAutoSize):Void {
#if hl
	flight._hl._fn.Text.setTextLabelAutoSize(source, value);
#elseif cpp
	flight._cpp._fn.Text.setTextLabelAutoSize(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setTextLabelAutoSize(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextLabelFormat(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setTextLabelFormat(source, value);
}
#else
extern inline function setTextLabelFormat(source:Dynamic, value:Dynamic):Void {
#if hl
	flight._hl._fn.Text.setTextLabelFormat(source, value);
#elseif cpp
	flight._cpp._fn.Text.setTextLabelFormat(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setTextLabelFormat(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextLabelHeight(source:Dynamic, value:Float):Void {
	flight._js._fn.Text.setTextLabelHeight(source, value);
}
#else
extern inline function setTextLabelHeight(source:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Text.setTextLabelHeight(source, value);
#elseif cpp
	flight._cpp._fn.Text.setTextLabelHeight(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setTextLabelHeight(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextLabelString(source:Dynamic, value:String):Void {
	flight._js._fn.Text.setTextLabelString(source, value);
}
#else
extern inline function setTextLabelString(source:Dynamic, value:String):Void {
#if hl
	flight._hl._fn.Text.setTextLabelString(source, cast value);
#elseif cpp
	flight._cpp._fn.Text.setTextLabelString(source, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setTextLabelString(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextLabelVerticalAlign(source:Dynamic, value:Dynamic):Void {
	flight._js._fn.Text.setTextLabelVerticalAlign(source, value);
}
#else
extern inline function setTextLabelVerticalAlign(source:Dynamic, value:flight.TextVerticalAlign):Void {
#if hl
	flight._hl._fn.Text.setTextLabelVerticalAlign(source, value);
#elseif cpp
	flight._cpp._fn.Text.setTextLabelVerticalAlign(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setTextLabelVerticalAlign(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextLabelWidth(source:Dynamic, value:Float):Void {
	flight._js._fn.Text.setTextLabelWidth(source, value);
}
#else
extern inline function setTextLabelWidth(source:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Text.setTextLabelWidth(source, value);
#elseif cpp
	flight._cpp._fn.Text.setTextLabelWidth(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Text.setTextLabelWidth(source, value);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextLayout(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Text.getTextLayout(source);
}
#else
extern inline function getTextLayout(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Text.getTextLayout(source);
#elseif cpp
	return flight._cpp._fn.Text.getTextLayout(source);
#elseif (js && flight_esm)
	return flight._js._fn.Text.getTextLayout(source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextLayoutMetrics(out:TextMetrics, source:Dynamic):Void {
	flight._js._fn.Text.getTextLayoutMetrics(out, source);
}
#else
extern inline function getTextLayoutMetrics(out:TextMetrics, source:Dynamic):Void {
#if hl
	flight._hl._fn.Text.getTextLayoutMetrics(out, source);
#elseif cpp
	flight._cpp._fn.Text.getTextLayoutMetrics(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Text.getTextLayoutMetrics(out, source);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLabelContentExplanation(ptr:TextLabelContentExplanation):Void {
	flight._js._fn.Text.freeTextLabelContentExplanation(ptr);
}
#else
extern inline function freeTextLabelContentExplanation(ptr:TextLabelContentExplanation):Void {
#if hl
	flight._hl._fn.Text.freeTextLabelContentExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Text.freeTextLabelContentExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Text.freeTextLabelContentExplanation(ptr);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLayoutParams(ptr:TextLayoutParams):Void {
	flight._js._fn.Text.freeTextLayoutParams(ptr);
}
#else
extern inline function freeTextLayoutParams(ptr:TextLayoutParams):Void {
#if hl
	flight._hl._fn.Text.freeTextLayoutParams(ptr);
#elseif cpp
	flight._cpp._fn.Text.freeTextLayoutParams(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Text.freeTextLayoutParams(ptr);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextLineMetrics(ptr:TextLineMetrics):Void {
	flight._js._fn.Text.freeTextLineMetrics(ptr);
}
#else
extern inline function freeTextLineMetrics(ptr:TextLineMetrics):Void {
#if hl
	flight._hl._fn.Text.freeTextLineMetrics(ptr);
#elseif cpp
	flight._cpp._fn.Text.freeTextLineMetrics(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Text.freeTextLineMetrics(ptr);
#else
	#error "flight.Text: no backend for this target."
#end
}
#end
