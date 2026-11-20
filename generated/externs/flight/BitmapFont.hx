package flight;

#if hl

typedef BitmapFont = flight._hl.BitmapFont;

#elseif cpp

typedef BitmapFont = flight._cpp.BitmapFont;

#elseif (js && flight_esm)

typedef BitmapFont = flight._js.BitmapFont;

#elseif js

#error "flight.BitmapFont on js requires flight_esm."

#else

#error "flight.BitmapFont: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createBitmapFont(guardState:BitmapFontGuardStateRef, data:BitmapFontData):Dynamic {
	return flight._js._fn.BitmapFont.createBitmapFont(guardState, data);
}
#else
extern inline function createBitmapFont(guardState:BitmapFontGuardStateRef, data:BitmapFontData):Dynamic {
#if hl
	return flight._hl._fn.BitmapFont.createBitmapFont(guardState, data);
#elseif cpp
	return flight._cpp._fn.BitmapFont.createBitmapFont(guardState, data);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.createBitmapFont(guardState, data);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontGlyph(font:Dynamic, codepoint:Int):Null<Dynamic> {
	return flight._js._fn.BitmapFont.getBitmapFontGlyph(font, codepoint);
}
#else
extern inline function getBitmapFontGlyph(font:Dynamic, codepoint:Int):Dynamic {
#if hl
	return flight._hl._fn.BitmapFont.getBitmapFontGlyph(font, codepoint);
#elseif cpp
	return flight._cpp._fn.BitmapFont.getBitmapFontGlyph(font, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.getBitmapFontGlyph(font, codepoint);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontKerning(font:Dynamic, left:Int, right:Int):Float {
	return flight._js._fn.BitmapFont.getBitmapFontKerning(font, left, right);
}
#else
extern inline function getBitmapFontKerning(font:Dynamic, left:Int, right:Int):Float {
#if hl
	return flight._hl._fn.BitmapFont.getBitmapFontKerning(font, left, right);
#elseif cpp
	return flight._cpp._fn.BitmapFont.getBitmapFontKerning(font, left, right);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.getBitmapFontKerning(font, left, right);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontPage(font:Dynamic, page:Null<Int>):Null<Dynamic> {
	return flight._js._fn.BitmapFont.getBitmapFontPage(font, page);
}
#else
extern inline function getBitmapFontPage(font:Dynamic, page:Int):Dynamic {
#if hl
	return flight._hl._fn.BitmapFont.getBitmapFontPage(font, page);
#elseif cpp
	return flight._cpp._fn.BitmapFont.getBitmapFontPage(font, page);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.getBitmapFontPage(font, page);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasBitmapFontGlyph(font:Dynamic, codepoint:Int):Bool {
	return flight._js._fn.BitmapFont.hasBitmapFontGlyph(font, codepoint);
}
#else
extern inline function hasBitmapFontGlyph(font:Dynamic, codepoint:Int):Bool {
#if hl
	return flight._hl._fn.BitmapFont.hasBitmapFontGlyph(font, codepoint);
#elseif cpp
	return flight._cpp._fn.BitmapFont.hasBitmapFontGlyph(font, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.hasBitmapFontGlyph(font, codepoint);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function packBitmapFontKerningKey(left:Int, right:Int):Float {
	return flight._js._fn.BitmapFont.packBitmapFontKerningKey(left, right);
}
#else
extern inline function packBitmapFontKerningKey(left:Int, right:Int):haxe.Int64 {
#if hl
	return flight._hl._fn.BitmapFont.packBitmapFontKerningKey(left, right);
#elseif cpp
	return flight._cpp._fn.BitmapFont.packBitmapFontKerningKey(left, right);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.packBitmapFontKerningKey(left, right);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unpackBitmapFontKerningKey(out:BitmapFontKerningPair, key:Float):Void {
	flight._js._fn.BitmapFont.unpackBitmapFontKerningKey(out, key);
}
#else
extern inline function unpackBitmapFontKerningKey(out:BitmapFontKerningPair, key:haxe.Int64):Void {
#if hl
	flight._hl._fn.BitmapFont.unpackBitmapFontKerningKey(out, key);
#elseif cpp
	flight._cpp._fn.BitmapFont.unpackBitmapFontKerningKey(out, key);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.unpackBitmapFontKerningKey(out, key);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBitmapFontFromGlyphAtlas(guardState:BitmapFontGuardStateRef, atlas:Dynamic):Dynamic {
	return flight._js._fn.BitmapFont.createBitmapFontFromGlyphAtlas(guardState, atlas);
}
#else
extern inline function createBitmapFontFromGlyphAtlas(guardState:BitmapFontGuardStateRef, atlas:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.BitmapFont.createBitmapFontFromGlyphAtlas(guardState, atlas);
#elseif cpp
	return flight._cpp._fn.BitmapFont.createBitmapFontFromGlyphAtlas(guardState, atlas);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.createBitmapFontFromGlyphAtlas(guardState, atlas);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGlyphSourceFromBitmapFont(font:Dynamic):Dynamic {
	return flight._js._fn.BitmapFont.createGlyphSourceFromBitmapFont(font);
}
#else
extern inline function createGlyphSourceFromBitmapFont(font:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.BitmapFont.createGlyphSourceFromBitmapFont(font);
#elseif cpp
	return flight._cpp._fn.BitmapFont.createGlyphSourceFromBitmapFont(font);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.createGlyphSourceFromBitmapFont(font);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableBitmapFontGuards(guardState:BitmapFontGuardStateRef):Void {
	flight._js._fn.BitmapFont.disableBitmapFontGuards(guardState);
}
#else
extern inline function disableBitmapFontGuards(guardState:BitmapFontGuardStateRef):Void {
#if hl
	flight._hl._fn.BitmapFont.disableBitmapFontGuards(guardState);
#elseif cpp
	flight._cpp._fn.BitmapFont.disableBitmapFontGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.disableBitmapFontGuards(guardState);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableBitmapFontGuards(guardState:BitmapFontGuardStateRef, logState:Dynamic, clock:BitmapFontClock):Void {
	flight._js._fn.BitmapFont.enableBitmapFontGuards(guardState, logState, clock);
}
#else
extern inline function enableBitmapFontGuards(guardState:BitmapFontGuardStateRef, logState:Dynamic, clock:BitmapFontClock):Void {
#if hl
	flight._hl._fn.BitmapFont.enableBitmapFontGuards(guardState, logState, clock);
#elseif cpp
	flight._cpp._fn.BitmapFont.enableBitmapFontGuards(guardState, logState, clock);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.enableBitmapFontGuards(guardState, logState, clock);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainBitmapFontGlyph(font:Dynamic, codepoint:Int):BitmapFontGlyphExplanation {
	return flight._js._fn.BitmapFont.explainBitmapFontGlyph(font, codepoint);
}
#else
extern inline function explainBitmapFontGlyph(font:Dynamic, codepoint:Int):BitmapFontGlyphExplanation {
#if hl
	return flight._hl._fn.BitmapFont.explainBitmapFontGlyph(font, codepoint);
#elseif cpp
	return flight._cpp._fn.BitmapFont.explainBitmapFontGlyph(font, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.explainBitmapFontGlyph(font, codepoint);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function summarizeBitmapFont(font:Dynamic):BitmapFontSummary {
	return flight._js._fn.BitmapFont.summarizeBitmapFont(font);
}
#else
extern inline function summarizeBitmapFont(font:Dynamic):BitmapFontSummary {
#if hl
	return flight._hl._fn.BitmapFont.summarizeBitmapFont(font);
#elseif cpp
	return flight._cpp._fn.BitmapFont.summarizeBitmapFont(font);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapFont.summarizeBitmapFont(font);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontRef(ptr:BitmapFont):Void {
	flight._js._fn.BitmapFont.freeBitmapFontRef(ptr);
}
#else
extern inline function freeBitmapFontRef(ptr:BitmapFont):Void {
#if hl
	flight._hl._fn.BitmapFont.freeBitmapFontRef(ptr);
#elseif cpp
	flight._cpp._fn.BitmapFont.freeBitmapFontRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.freeBitmapFontRef(ptr);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlyphSourceRef(ptr:GlyphSource):Void {
	flight._js._fn.BitmapFont.freeGlyphSourceRef(ptr);
}
#else
extern inline function freeGlyphSourceRef(ptr:GlyphSource):Void {
#if hl
	flight._hl._fn.BitmapFont.freeGlyphSourceRef(ptr);
#elseif cpp
	flight._cpp._fn.BitmapFont.freeGlyphSourceRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.freeGlyphSourceRef(ptr);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontGlyphExplanation(ptr:BitmapFontGlyphExplanation):Void {
	flight._js._fn.BitmapFont.freeBitmapFontGlyphExplanation(ptr);
}
#else
extern inline function freeBitmapFontGlyphExplanation(ptr:BitmapFontGlyphExplanation):Void {
#if hl
	flight._hl._fn.BitmapFont.freeBitmapFontGlyphExplanation(ptr);
#elseif cpp
	flight._cpp._fn.BitmapFont.freeBitmapFontGlyphExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.freeBitmapFontGlyphExplanation(ptr);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontSummary(ptr:BitmapFontSummary):Void {
	flight._js._fn.BitmapFont.freeBitmapFontSummary(ptr);
}
#else
extern inline function freeBitmapFontSummary(ptr:BitmapFontSummary):Void {
#if hl
	flight._hl._fn.BitmapFont.freeBitmapFontSummary(ptr);
#elseif cpp
	flight._cpp._fn.BitmapFont.freeBitmapFontSummary(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapFont.freeBitmapFontSummary(ptr);
#else
	#error "flight.BitmapFont: no backend for this target."
#end
}
#end
