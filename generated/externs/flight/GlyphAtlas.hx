package flight;

#if hl

typedef GlyphAtlas = flight._hl.GlyphAtlas;

#elseif cpp

typedef GlyphAtlas = flight._cpp.GlyphAtlas;

#elseif (js && flight_esm)

typedef GlyphAtlas = flight._js.GlyphAtlas;

#elseif js

#error "flight.GlyphAtlas on js requires flight_esm."

#else

#error "flight.GlyphAtlas: no backend for this target."

#end

#if (js && flight_esm)
extern inline function disableGlyphAtlasGuards(atlas:Dynamic):Void {
	flight._js._fn.GlyphAtlas.disableGlyphAtlasGuards(atlas);
}
#else
extern inline function disableGlyphAtlasGuards(atlas:Dynamic):Void {
#if hl
	flight._hl._fn.GlyphAtlas.disableGlyphAtlasGuards(atlas);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.disableGlyphAtlasGuards(atlas);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.disableGlyphAtlasGuards(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableGlyphAtlasGuards(atlas:Dynamic, logState:Dynamic, clock:GlyphAtlasClock):Void {
	flight._js._fn.GlyphAtlas.enableGlyphAtlasGuards(atlas, logState, clock);
}
#else
extern inline function enableGlyphAtlasGuards(atlas:Dynamic, logState:Dynamic, clock:GlyphAtlasClock):Void {
#if hl
	flight._hl._fn.GlyphAtlas.enableGlyphAtlasGuards(atlas, logState, clock);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.enableGlyphAtlasGuards(atlas, logState, clock);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.enableGlyphAtlasGuards(atlas, logState, clock);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainGlyphAtlasEntry(atlas:Dynamic, codepoint:Int):GlyphAtlasEntryExplanation {
	return flight._js._fn.GlyphAtlas.explainGlyphAtlasEntry(atlas, codepoint);
}
#else
extern inline function explainGlyphAtlasEntry(atlas:Dynamic, codepoint:Int):GlyphAtlasEntryExplanation {
#if hl
	return flight._hl._fn.GlyphAtlas.explainGlyphAtlasEntry(atlas, codepoint);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.explainGlyphAtlasEntry(atlas, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.explainGlyphAtlasEntry(atlas, codepoint);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGlyphAtlas(options:GlyphAtlasOptions):Dynamic {
	return flight._js._fn.GlyphAtlas.createGlyphAtlas(options);
}
#else
extern inline function createGlyphAtlas(options:GlyphAtlasOptions):Dynamic {
#if hl
	return flight._hl._fn.GlyphAtlas.createGlyphAtlas(options);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.createGlyphAtlas(options);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.createGlyphAtlas(options);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function deriveGlyphMetricsFromFontSize(fontSize:Float):GlyphMetrics {
	return flight._js._fn.GlyphAtlas.deriveGlyphMetricsFromFontSize(fontSize);
}
#else
extern inline function deriveGlyphMetricsFromFontSize(fontSize:Float):GlyphMetrics {
#if hl
	return flight._hl._fn.GlyphAtlas.deriveGlyphMetricsFromFontSize(fontSize);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.deriveGlyphMetricsFromFontSize(fontSize);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.deriveGlyphMetricsFromFontSize(fontSize);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeGlyphAtlas(atlas:Dynamic):Void {
	flight._js._fn.GlyphAtlas.disposeGlyphAtlas(atlas);
}
#else
extern inline function disposeGlyphAtlas(atlas:Dynamic):Void {
#if hl
	flight._hl._fn.GlyphAtlas.disposeGlyphAtlas(atlas);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.disposeGlyphAtlas(atlas);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.disposeGlyphAtlas(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphAtlasBitmap(atlas:Dynamic):Dynamic {
	return flight._js._fn.GlyphAtlas.getGlyphAtlasBitmap(atlas);
}
#else
extern inline function getGlyphAtlasBitmap(atlas:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.GlyphAtlas.getGlyphAtlasBitmap(atlas);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.getGlyphAtlasBitmap(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.getGlyphAtlasBitmap(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphAtlasLayoutVersion(atlas:Dynamic):Int {
	return flight._js._fn.GlyphAtlas.getGlyphAtlasLayoutVersion(atlas);
}
#else
extern inline function getGlyphAtlasLayoutVersion(atlas:Dynamic):Int {
#if hl
	return flight._hl._fn.GlyphAtlas.getGlyphAtlasLayoutVersion(atlas);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.getGlyphAtlasLayoutVersion(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.getGlyphAtlasLayoutVersion(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearGlyphAtlasDirty(atlas:Dynamic):Void {
	flight._js._fn.GlyphAtlas.clearGlyphAtlasDirty(atlas);
}
#else
extern inline function clearGlyphAtlasDirty(atlas:Dynamic):Void {
#if hl
	flight._hl._fn.GlyphAtlas.clearGlyphAtlasDirty(atlas);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.clearGlyphAtlasDirty(atlas);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.clearGlyphAtlasDirty(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphAtlasDirtyRegion(atlas:Dynamic):Null<Rectangle> {
	return flight._js._fn.GlyphAtlas.getGlyphAtlasDirtyRegion(atlas);
}
#else
extern inline function getGlyphAtlasDirtyRegion(atlas:Dynamic):Rectangle {
#if hl
	return flight._hl._fn.GlyphAtlas.getGlyphAtlasDirtyRegion(atlas);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.getGlyphAtlasDirtyRegion(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.getGlyphAtlasDirtyRegion(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphAtlasEntry(atlas:Dynamic, codepoint:Int):Null<Dynamic> {
	return flight._js._fn.GlyphAtlas.getGlyphAtlasEntry(atlas, codepoint);
}
#else
extern inline function getGlyphAtlasEntry(atlas:Dynamic, codepoint:Int):Dynamic {
#if hl
	return flight._hl._fn.GlyphAtlas.getGlyphAtlasEntry(atlas, codepoint);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.getGlyphAtlasEntry(atlas, codepoint);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.getGlyphAtlasEntry(atlas, codepoint);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphAtlasKerning(atlas:Dynamic, left:Int, right:Int):Float {
	return flight._js._fn.GlyphAtlas.getGlyphAtlasKerning(atlas, left, right);
}
#else
extern inline function getGlyphAtlasKerning(atlas:Dynamic, left:Int, right:Int):Float {
#if hl
	return flight._hl._fn.GlyphAtlas.getGlyphAtlasKerning(atlas, left, right);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.getGlyphAtlasKerning(atlas, left, right);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.getGlyphAtlasKerning(atlas, left, right);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function allocateStubGlyphRasterizerBackend():HostGlyphRasterizerCapability {
	return flight._js._fn.GlyphAtlas.allocateStubGlyphRasterizerBackend();
}
#else
extern inline function allocateStubGlyphRasterizerBackend():HostGlyphRasterizerCapability {
#if hl
	return flight._hl._fn.GlyphAtlas.allocateStubGlyphRasterizerBackend();
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.allocateStubGlyphRasterizerBackend();
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.allocateStubGlyphRasterizerBackend();
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGlyphSourceFromGlyphAtlas(atlas:Dynamic):Dynamic {
	return flight._js._fn.GlyphAtlas.createGlyphSourceFromGlyphAtlas(atlas);
}
#else
extern inline function createGlyphSourceFromGlyphAtlas(atlas:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.GlyphAtlas.createGlyphSourceFromGlyphAtlas(atlas);
#elseif cpp
	return flight._cpp._fn.GlyphAtlas.createGlyphSourceFromGlyphAtlas(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.GlyphAtlas.createGlyphSourceFromGlyphAtlas(atlas);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlyphAtlasEntryExplanation(ptr:GlyphAtlasEntryExplanation):Void {
	flight._js._fn.GlyphAtlas.freeGlyphAtlasEntryExplanation(ptr);
}
#else
extern inline function freeGlyphAtlasEntryExplanation(ptr:GlyphAtlasEntryExplanation):Void {
#if hl
	flight._hl._fn.GlyphAtlas.freeGlyphAtlasEntryExplanation(ptr);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.freeGlyphAtlasEntryExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.freeGlyphAtlasEntryExplanation(ptr);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlyphAtlasRef(ptr:GlyphAtlas):Void {
	flight._js._fn.GlyphAtlas.freeGlyphAtlasRef(ptr);
}
#else
extern inline function freeGlyphAtlasRef(ptr:GlyphAtlas):Void {
#if hl
	flight._hl._fn.GlyphAtlas.freeGlyphAtlasRef(ptr);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.freeGlyphAtlasRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.freeGlyphAtlasRef(ptr);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeHostGlyphRasterizerCapability(ptr:HostGlyphRasterizerCapability):Void {
	flight._js._fn.GlyphAtlas.freeHostGlyphRasterizerCapability(ptr);
}
#else
extern inline function freeHostGlyphRasterizerCapability(ptr:HostGlyphRasterizerCapability):Void {
#if hl
	flight._hl._fn.GlyphAtlas.freeHostGlyphRasterizerCapability(ptr);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.freeHostGlyphRasterizerCapability(ptr);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.freeHostGlyphRasterizerCapability(ptr);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlyphEntryRef(ptr:GlyphEntry):Void {
	flight._js._fn.GlyphAtlas.freeGlyphEntryRef(ptr);
}
#else
extern inline function freeGlyphEntryRef(ptr:GlyphEntry):Void {
#if hl
	flight._hl._fn.GlyphAtlas.freeGlyphEntryRef(ptr);
#elseif cpp
	flight._cpp._fn.GlyphAtlas.freeGlyphEntryRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.GlyphAtlas.freeGlyphEntryRef(ptr);
#else
	#error "flight.GlyphAtlas: no backend for this target."
#end
}
#end
