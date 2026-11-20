package flight;

#if hl

typedef BitmapText = flight._hl.BitmapText;

#elseif cpp

typedef BitmapText = flight._cpp.BitmapText;

#elseif (js && flight_esm)

typedef BitmapText = flight._js.BitmapText;

#elseif js

#error "flight.BitmapText on js requires flight_esm."

#else

#error "flight.BitmapText: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createBitmapText(glyphSource:Null<Dynamic>):Dynamic {
	return flight._js._fn.BitmapText.createBitmapText(glyphSource);
}
#else
extern inline function createBitmapText(glyphSource:Dynamic):flight.FlightNode {
#if hl
	return flight._hl._fn.BitmapText.createBitmapText(glyphSource);
#elseif cpp
	return flight._cpp._fn.BitmapText.createBitmapText(glyphSource);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.createBitmapText(glyphSource);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeBitmapTextLocalBoundsRectangle(out:Rectangle, source:BitmapText):Void {
	flight._js._fn.BitmapText.computeBitmapTextLocalBoundsRectangle(out, source);
}
#else
extern inline function computeBitmapTextLocalBoundsRectangle(out:Rectangle, source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.BitmapText.computeBitmapTextLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.BitmapText.computeBitmapTextLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.computeBitmapTextLocalBoundsRectangle(out, source);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapTextBounds(source:BitmapText):Rectangle {
	return flight._js._fn.BitmapText.getBitmapTextBounds(source);
}
#else
extern inline function getBitmapTextBounds(source:flight.FlightNode):Rectangle {
#if hl
	return flight._hl._fn.BitmapText.getBitmapTextBounds(source);
#elseif cpp
	return flight._cpp._fn.BitmapText.getBitmapTextBounds(source);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.getBitmapTextBounds(source);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapTextLineCount(source:BitmapText):Int {
	return flight._js._fn.BitmapText.getBitmapTextLineCount(source);
}
#else
extern inline function getBitmapTextLineCount(source:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.BitmapText.getBitmapTextLineCount(source);
#elseif cpp
	return flight._cpp._fn.BitmapText.getBitmapTextLineCount(source);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.getBitmapTextLineCount(source);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isBitmapTextGlyphLayoutStale(source:BitmapText):Bool {
	return flight._js._fn.BitmapText.isBitmapTextGlyphLayoutStale(source);
}
#else
extern inline function isBitmapTextGlyphLayoutStale(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.BitmapText.isBitmapTextGlyphLayoutStale(source);
#elseif cpp
	return flight._cpp._fn.BitmapText.isBitmapTextGlyphLayoutStale(source);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.isBitmapTextGlyphLayoutStale(source);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isBitmapTextTruncated(source:BitmapText):Bool {
	return flight._js._fn.BitmapText.isBitmapTextTruncated(source);
}
#else
extern inline function isBitmapTextTruncated(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.BitmapText.isBitmapTextTruncated(source);
#elseif cpp
	return flight._cpp._fn.BitmapText.isBitmapTextTruncated(source);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.isBitmapTextTruncated(source);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function reserveBitmapText(target:BitmapText, glyphCapacity:Int):Void {
	flight._js._fn.BitmapText.reserveBitmapText(target, glyphCapacity);
}
#else
extern inline function reserveBitmapText(target:flight.FlightNode, glyphCapacity:Int):Void {
#if hl
	flight._hl._fn.BitmapText.reserveBitmapText(target, glyphCapacity);
#elseif cpp
	flight._cpp._fn.BitmapText.reserveBitmapText(target, glyphCapacity);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.reserveBitmapText(target, glyphCapacity);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextAlign(target:BitmapText, align:Dynamic):Void {
	flight._js._fn.BitmapText.setBitmapTextAlign(target, align);
}
#else
extern inline function setBitmapTextAlign(target:flight.FlightNode, align:flight.BitmapTextAlign):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextAlign(target, align);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextAlign(target, align);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextAlign(target, align);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextEllipsis(target:BitmapText, ellipsis:String):Void {
	flight._js._fn.BitmapText.setBitmapTextEllipsis(target, ellipsis);
}
#else
extern inline function setBitmapTextEllipsis(target:flight.FlightNode, ellipsis:String):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextEllipsis(target, cast ellipsis);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextEllipsis(target, cast ellipsis);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextEllipsis(target, ellipsis);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextGlyphSource(target:BitmapText, glyphSource:Null<Dynamic>):Void {
	flight._js._fn.BitmapText.setBitmapTextGlyphSource(target, glyphSource);
}
#else
extern inline function setBitmapTextGlyphSource(target:flight.FlightNode, glyphSource:Dynamic):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextGlyphSource(target, glyphSource);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextGlyphSource(target, glyphSource);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextGlyphSource(target, glyphSource);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextLetterSpacing(target:BitmapText, letterSpacing:Float):Void {
	flight._js._fn.BitmapText.setBitmapTextLetterSpacing(target, letterSpacing);
}
#else
extern inline function setBitmapTextLetterSpacing(target:flight.FlightNode, letterSpacing:Float):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextLetterSpacing(target, letterSpacing);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextLetterSpacing(target, letterSpacing);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextLetterSpacing(target, letterSpacing);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextLineHeight(target:BitmapText, lineHeight:Float):Void {
	flight._js._fn.BitmapText.setBitmapTextLineHeight(target, lineHeight);
}
#else
extern inline function setBitmapTextLineHeight(target:flight.FlightNode, lineHeight:Float):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextLineHeight(target, lineHeight);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextLineHeight(target, lineHeight);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextLineHeight(target, lineHeight);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextMaxLines(target:BitmapText, maxLines:Null<Int>):Void {
	flight._js._fn.BitmapText.setBitmapTextMaxLines(target, maxLines);
}
#else
extern inline function setBitmapTextMaxLines(target:flight.FlightNode, maxLines:haxe.Int64):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextMaxLines(target, maxLines);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextMaxLines(target, maxLines);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextMaxLines(target, maxLines);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextText(target:BitmapText, text:String):Void {
	flight._js._fn.BitmapText.setBitmapTextText(target, text);
}
#else
extern inline function setBitmapTextText(target:flight.FlightNode, text:String):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextText(target, cast text);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextText(target, cast text);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextText(target, text);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapTextWrapWidth(target:BitmapText, wrapWidth:Null<Float>):Void {
	flight._js._fn.BitmapText.setBitmapTextWrapWidth(target, wrapWidth);
}
#else
extern inline function setBitmapTextWrapWidth(target:flight.FlightNode, wrapWidth:Float):Void {
#if hl
	flight._hl._fn.BitmapText.setBitmapTextWrapWidth(target, wrapWidth);
#elseif cpp
	flight._cpp._fn.BitmapText.setBitmapTextWrapWidth(target, wrapWidth);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.setBitmapTextWrapWidth(target, wrapWidth);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableBitmapTextGuards(guardState:BitmapTextGuardState):Void {
	flight._js._fn.BitmapText.disableBitmapTextGuards(guardState);
}
#else
extern inline function disableBitmapTextGuards(guardState:BitmapTextGuardState):Void {
#if hl
	flight._hl._fn.BitmapText.disableBitmapTextGuards(guardState);
#elseif cpp
	flight._cpp._fn.BitmapText.disableBitmapTextGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.disableBitmapTextGuards(guardState);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableBitmapTextGuards(guardState:BitmapTextGuardState, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.BitmapText.enableBitmapTextGuards(guardState, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function explainBitmapTextMissingGlyphs(glyphSource:Dynamic, text:String):BitmapTextMissingGlyphs {
	return flight._js._fn.BitmapText.explainBitmapTextMissingGlyphs(glyphSource, text);
}
#else
extern inline function explainBitmapTextMissingGlyphs(glyphSource:Dynamic, text:String):BitmapTextMissingGlyphs {
#if hl
	return flight._hl._fn.BitmapText.explainBitmapTextMissingGlyphs(glyphSource, cast text);
#elseif cpp
	return flight._cpp._fn.BitmapText.explainBitmapTextMissingGlyphs(glyphSource, cast text);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.explainBitmapTextMissingGlyphs(glyphSource, text);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function refreshBitmapTextGlyphLayout(bitmapText:BitmapText, guardState:BitmapTextGuardState):Bool {
	return flight._js._fn.BitmapText.refreshBitmapTextGlyphLayout(bitmapText, guardState);
}
#else
extern inline function refreshBitmapTextGlyphLayout(bitmapText:flight.FlightNode, guardState:BitmapTextGuardState):Bool {
#if hl
	return flight._hl._fn.BitmapText.refreshBitmapTextGlyphLayout(bitmapText, guardState);
#elseif cpp
	return flight._cpp._fn.BitmapText.refreshBitmapTextGlyphLayout(bitmapText, guardState);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapText.refreshBitmapTextGlyphLayout(bitmapText, guardState);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateBitmapText(bitmapText:BitmapText, guardState:BitmapTextGuardState):Void {
	flight._js._fn.BitmapText.updateBitmapText(bitmapText, guardState);
}
#else
extern inline function updateBitmapText(bitmapText:flight.FlightNode, guardState:BitmapTextGuardState):Void {
#if hl
	flight._hl._fn.BitmapText.updateBitmapText(bitmapText, guardState);
#elseif cpp
	flight._cpp._fn.BitmapText.updateBitmapText(bitmapText, guardState);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.updateBitmapText(bitmapText, guardState);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapTextMissingGlyphs(ptr:BitmapTextMissingGlyphs):Void {
	flight._js._fn.BitmapText.freeBitmapTextMissingGlyphs(ptr);
}
#else
extern inline function freeBitmapTextMissingGlyphs(ptr:BitmapTextMissingGlyphs):Void {
#if hl
	flight._hl._fn.BitmapText.freeBitmapTextMissingGlyphs(ptr);
#elseif cpp
	flight._cpp._fn.BitmapText.freeBitmapTextMissingGlyphs(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapText.freeBitmapTextMissingGlyphs(ptr);
#else
	#error "flight.BitmapText: no backend for this target."
#end
}
#end
