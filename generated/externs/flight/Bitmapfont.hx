package flight;

#if (js && flight_esm)
extern inline function createBitmapFont(guardState:BitmapFontGuardStateRef, data:BitmapFontData):Dynamic {
	return flight._js._fn.Bitmapfont.createBitmapFont(guardState, data);
}
#else
extern inline function createBitmapFont(guardState:BitmapFontGuardStateRef, data:BitmapFontData):Dynamic {
#if hl
	return flight._hl._fn.Bitmapfont.createBitmapFont(guardState, data);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.createBitmapFont(guardState, data);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.createBitmapFont(guardState, data);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBitmapFontGuardState():BitmapFontGuardStateRef {
	return flight._js._fn.Bitmapfont.createBitmapFontGuardState();
}
#else
extern inline function createBitmapFontGuardState():BitmapFontGuardStateRef {
#if hl
	return flight._hl._fn.Bitmapfont.createBitmapFontGuardState();
#elseif cpp
	return flight._cpp._fn.Bitmapfont.createBitmapFontGuardState();
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.createBitmapFontGuardState();
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontGlyph(font:Dynamic, codepoint:Int):Null<Dynamic> {
	return flight._js._fn.Bitmapfont.getBitmapFontGlyph(font, codepoint);
}
#else
extern inline function getBitmapFontGlyph(font:Dynamic, codepoint:Int):Dynamic {
#if hl
	return flight._hl._fn.Bitmapfont.getBitmapFontGlyph(font, codepoint);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.getBitmapFontGlyph(font, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.getBitmapFontGlyph(font, codepoint);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontKerning(font:Dynamic, left:Int, right:Int):Float {
	return flight._js._fn.Bitmapfont.getBitmapFontKerning(font, left, right);
}
#else
extern inline function getBitmapFontKerning(font:Dynamic, left:Int, right:Int):Float {
#if hl
	return flight._hl._fn.Bitmapfont.getBitmapFontKerning(font, left, right);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.getBitmapFontKerning(font, left, right);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.getBitmapFontKerning(font, left, right);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontPage(font:Dynamic, page:Null<Int>):Null<Dynamic> {
	return flight._js._fn.Bitmapfont.getBitmapFontPage(font, page);
}
#else
extern inline function getBitmapFontPage(font:Dynamic, page:Int):Dynamic {
#if hl
	return flight._hl._fn.Bitmapfont.getBitmapFontPage(font, page);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.getBitmapFontPage(font, page);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.getBitmapFontPage(font, page);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasBitmapFontGlyph(font:Dynamic, codepoint:Int):Bool {
	return flight._js._fn.Bitmapfont.hasBitmapFontGlyph(font, codepoint);
}
#else
extern inline function hasBitmapFontGlyph(font:Dynamic, codepoint:Int):Bool {
#if hl
	return flight._hl._fn.Bitmapfont.hasBitmapFontGlyph(font, codepoint);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.hasBitmapFontGlyph(font, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.hasBitmapFontGlyph(font, codepoint);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function packBitmapFontKerningKey(left:Int, right:Int):Float {
	return flight._js._fn.Bitmapfont.packBitmapFontKerningKey(left, right);
}
#else
extern inline function packBitmapFontKerningKey(left:Int, right:Int):haxe.Int64 {
#if hl
	return flight._hl._fn.Bitmapfont.packBitmapFontKerningKey(left, right);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.packBitmapFontKerningKey(left, right);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.packBitmapFontKerningKey(left, right);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unpackBitmapFontKerningKey(out:BitmapFontKerningPair, key:Float):Void {
	flight._js._fn.Bitmapfont.unpackBitmapFontKerningKey(out, key);
}
#else
extern inline function unpackBitmapFontKerningKey(out:BitmapFontKerningPair, key:haxe.Int64):Void {
#if hl
	flight._hl._fn.Bitmapfont.unpackBitmapFontKerningKey(out, key);
#elseif cpp
	flight._cpp._fn.Bitmapfont.unpackBitmapFontKerningKey(out, key);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.unpackBitmapFontKerningKey(out, key);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBitmapFontFromGlyphAtlas(guardState:BitmapFontGuardStateRef, atlas:Dynamic):Dynamic {
	return flight._js._fn.Bitmapfont.createBitmapFontFromGlyphAtlas(guardState, atlas);
}
#else
extern inline function createBitmapFontFromGlyphAtlas(guardState:BitmapFontGuardStateRef, atlas:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Bitmapfont.createBitmapFontFromGlyphAtlas(guardState, atlas);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.createBitmapFontFromGlyphAtlas(guardState, atlas);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.createBitmapFontFromGlyphAtlas(guardState, atlas);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGlyphSourceFromBitmapFont(font:Dynamic):Dynamic {
	return flight._js._fn.Bitmapfont.createGlyphSourceFromBitmapFont(font);
}
#else
extern inline function createGlyphSourceFromBitmapFont(font:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Bitmapfont.createGlyphSourceFromBitmapFont(font);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.createGlyphSourceFromBitmapFont(font);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.createGlyphSourceFromBitmapFont(font);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontEncodingString(value:Dynamic):String {
	return flight._js._fn.Bitmapfont.getBitmapFontEncodingString(value);
}
#else
extern inline function getBitmapFontEncodingString(value:flight.BitmapFontEncoding):String {
#if hl
	return cast flight._hl._fn.Bitmapfont.getBitmapFontEncodingString(value);
#elseif cpp
	return cast flight._cpp._fn.Bitmapfont.getBitmapFontEncodingString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Bitmapfont.getBitmapFontEncodingString(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontGlyphExplanationReasonString(value:Dynamic):String {
	return flight._js._fn.Bitmapfont.getBitmapFontGlyphExplanationReasonString(value);
}
#else
extern inline function getBitmapFontGlyphExplanationReasonString(value:flight.BitmapFontGlyphExplanationReason):String {
#if hl
	return cast flight._hl._fn.Bitmapfont.getBitmapFontGlyphExplanationReasonString(value);
#elseif cpp
	return cast flight._cpp._fn.Bitmapfont.getBitmapFontGlyphExplanationReasonString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Bitmapfont.getBitmapFontGlyphExplanationReasonString(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontGuardLogKeyString(value:BitmapFontGuardLogKey):String {
	return flight._js._fn.Bitmapfont.getBitmapFontGuardLogKeyString(value);
}
#else
extern inline function getBitmapFontGuardLogKeyString(value:BitmapFontGuardLogKey):String {
#if hl
	return cast flight._hl._fn.Bitmapfont.getBitmapFontGuardLogKeyString(value);
#elseif cpp
	return cast flight._cpp._fn.Bitmapfont.getBitmapFontGuardLogKeyString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Bitmapfont.getBitmapFontGuardLogKeyString(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapFontGuardReasonString(value:BitmapFontGuardReason):String {
	return flight._js._fn.Bitmapfont.getBitmapFontGuardReasonString(value);
}
#else
extern inline function getBitmapFontGuardReasonString(value:BitmapFontGuardReason):String {
#if hl
	return cast flight._hl._fn.Bitmapfont.getBitmapFontGuardReasonString(value);
#elseif cpp
	return cast flight._cpp._fn.Bitmapfont.getBitmapFontGuardReasonString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Bitmapfont.getBitmapFontGuardReasonString(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBitmapFontEncoding(value:String):Null<Dynamic> {
	return flight._js._fn.Bitmapfont.parseBitmapFontEncoding(value);
}
#else
extern inline function parseBitmapFontEncoding(value:String):Int {
#if hl
	return flight._hl._fn.Bitmapfont.parseBitmapFontEncoding(cast value);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.parseBitmapFontEncoding(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.parseBitmapFontEncoding(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBitmapFontGlyphExplanationReason(value:String):Null<Dynamic> {
	return flight._js._fn.Bitmapfont.parseBitmapFontGlyphExplanationReason(value);
}
#else
extern inline function parseBitmapFontGlyphExplanationReason(value:String):Int {
#if hl
	return flight._hl._fn.Bitmapfont.parseBitmapFontGlyphExplanationReason(cast value);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.parseBitmapFontGlyphExplanationReason(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.parseBitmapFontGlyphExplanationReason(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBitmapFontGuardLogKey(value:String):Null<BitmapFontGuardLogKey> {
	return flight._js._fn.Bitmapfont.parseBitmapFontGuardLogKey(value);
}
#else
extern inline function parseBitmapFontGuardLogKey(value:String):BitmapFontGuardLogKey {
#if hl
	return flight._hl._fn.Bitmapfont.parseBitmapFontGuardLogKey(cast value);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.parseBitmapFontGuardLogKey(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.parseBitmapFontGuardLogKey(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBitmapFontGuardReason(value:String):Null<BitmapFontGuardReason> {
	return flight._js._fn.Bitmapfont.parseBitmapFontGuardReason(value);
}
#else
extern inline function parseBitmapFontGuardReason(value:String):BitmapFontGuardReason {
#if hl
	return flight._hl._fn.Bitmapfont.parseBitmapFontGuardReason(cast value);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.parseBitmapFontGuardReason(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.parseBitmapFontGuardReason(value);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableBitmapFontGuards(guardState:BitmapFontGuardStateRef):Void {
	flight._js._fn.Bitmapfont.disableBitmapFontGuards(guardState);
}
#else
extern inline function disableBitmapFontGuards(guardState:BitmapFontGuardStateRef):Void {
#if hl
	flight._hl._fn.Bitmapfont.disableBitmapFontGuards(guardState);
#elseif cpp
	flight._cpp._fn.Bitmapfont.disableBitmapFontGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.disableBitmapFontGuards(guardState);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableBitmapFontGuards(guardState:BitmapFontGuardStateRef, logState:Dynamic, clock:BitmapFontClock):Void {
	flight._js._fn.Bitmapfont.enableBitmapFontGuards(guardState, logState, clock);
}
#else
extern inline function enableBitmapFontGuards(guardState:BitmapFontGuardStateRef, logState:Dynamic, clock:BitmapFontClock):Void {
#if hl
	flight._hl._fn.Bitmapfont.enableBitmapFontGuards(guardState, logState, clock);
#elseif cpp
	flight._cpp._fn.Bitmapfont.enableBitmapFontGuards(guardState, logState, clock);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.enableBitmapFontGuards(guardState, logState, clock);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainBitmapFontGlyph(font:Dynamic, codepoint:Int):BitmapFontGlyphExplanation {
	return flight._js._fn.Bitmapfont.explainBitmapFontGlyph(font, codepoint);
}
#else
extern inline function explainBitmapFontGlyph(font:Dynamic, codepoint:Int):BitmapFontGlyphExplanation {
#if hl
	return flight._hl._fn.Bitmapfont.explainBitmapFontGlyph(font, codepoint);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.explainBitmapFontGlyph(font, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.explainBitmapFontGlyph(font, codepoint);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function summarizeBitmapFont(font:Dynamic):BitmapFontSummary {
	return flight._js._fn.Bitmapfont.summarizeBitmapFont(font);
}
#else
extern inline function summarizeBitmapFont(font:Dynamic):BitmapFontSummary {
#if hl
	return flight._hl._fn.Bitmapfont.summarizeBitmapFont(font);
#elseif cpp
	return flight._cpp._fn.Bitmapfont.summarizeBitmapFont(font);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmapfont.summarizeBitmapFont(font);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontGuardStateRef(ptr:BitmapFontGuardStateRef):Void {
	flight._js._fn.Bitmapfont.freeBitmapFontGuardStateRef(ptr);
}
#else
extern inline function freeBitmapFontGuardStateRef(ptr:BitmapFontGuardStateRef):Void {
#if hl
	flight._hl._fn.Bitmapfont.freeBitmapFontGuardStateRef(ptr);
#elseif cpp
	flight._cpp._fn.Bitmapfont.freeBitmapFontGuardStateRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.freeBitmapFontGuardStateRef(ptr);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontGuardLogKey(ptr:BitmapFontGuardLogKey):Void {
	flight._js._fn.Bitmapfont.freeBitmapFontGuardLogKey(ptr);
}
#else
extern inline function freeBitmapFontGuardLogKey(ptr:BitmapFontGuardLogKey):Void {
#if hl
	flight._hl._fn.Bitmapfont.freeBitmapFontGuardLogKey(ptr);
#elseif cpp
	flight._cpp._fn.Bitmapfont.freeBitmapFontGuardLogKey(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.freeBitmapFontGuardLogKey(ptr);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontGuardReason(ptr:BitmapFontGuardReason):Void {
	flight._js._fn.Bitmapfont.freeBitmapFontGuardReason(ptr);
}
#else
extern inline function freeBitmapFontGuardReason(ptr:BitmapFontGuardReason):Void {
#if hl
	flight._hl._fn.Bitmapfont.freeBitmapFontGuardReason(ptr);
#elseif cpp
	flight._cpp._fn.Bitmapfont.freeBitmapFontGuardReason(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.freeBitmapFontGuardReason(ptr);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontGlyphExplanation(ptr:BitmapFontGlyphExplanation):Void {
	flight._js._fn.Bitmapfont.freeBitmapFontGlyphExplanation(ptr);
}
#else
extern inline function freeBitmapFontGlyphExplanation(ptr:BitmapFontGlyphExplanation):Void {
#if hl
	flight._hl._fn.Bitmapfont.freeBitmapFontGlyphExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Bitmapfont.freeBitmapFontGlyphExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.freeBitmapFontGlyphExplanation(ptr);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFontSummary(ptr:BitmapFontSummary):Void {
	flight._js._fn.Bitmapfont.freeBitmapFontSummary(ptr);
}
#else
extern inline function freeBitmapFontSummary(ptr:BitmapFontSummary):Void {
#if hl
	flight._hl._fn.Bitmapfont.freeBitmapFontSummary(ptr);
#elseif cpp
	flight._cpp._fn.Bitmapfont.freeBitmapFontSummary(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmapfont.freeBitmapFontSummary(ptr);
#else
	#error "flight.Bitmapfont: no backend for this target."
#end
}
#end
