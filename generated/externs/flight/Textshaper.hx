package flight;

#if (js && flight_esm)
extern inline function disableTextShaperGuards(pool:ShapedRunPool):Void {
	flight._js._fn.Textshaper.disableTextShaperGuards(pool);
}
#else
extern inline function disableTextShaperGuards(pool:ShapedRunPool):Void {
#if hl
	flight._hl._fn.Textshaper.disableTextShaperGuards(pool);
#elseif cpp
	flight._cpp._fn.Textshaper.disableTextShaperGuards(pool);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.disableTextShaperGuards(pool);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextShaperGuards(pool:ShapedRunPool, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Textshaper.enableTextShaperGuards(pool, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function explainTextShaperOperation(hostTextShaper:HostTextShaperCapability, operation:Dynamic):BackendOperationExplanation {
	return flight._js._fn.Textshaper.explainTextShaperOperation(hostTextShaper, operation);
}
#else
extern inline function explainTextShaperOperation(hostTextShaper:HostTextShaperCapability, operation:flight.TextShaperOperation):BackendOperationExplanation {
#if hl
	return flight._hl._fn.Textshaper.explainTextShaperOperation(hostTextShaper, operation);
#elseif cpp
	return flight._cpp._fn.Textshaper.explainTextShaperOperation(hostTextShaper, operation);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.explainTextShaperOperation(hostTextShaper, operation);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasTextShaperOperation(hostTextShaper:HostTextShaperCapability, operation:Dynamic):Bool {
	return flight._js._fn.Textshaper.hasTextShaperOperation(hostTextShaper, operation);
}
#else
extern inline function hasTextShaperOperation(hostTextShaper:HostTextShaperCapability, operation:flight.TextShaperOperation):Bool {
#if hl
	return flight._hl._fn.Textshaper.hasTextShaperOperation(hostTextShaper, operation);
#elseif cpp
	return flight._cpp._fn.Textshaper.hasTextShaperOperation(hostTextShaper, operation);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.hasTextShaperOperation(hostTextShaper, operation);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function measureText(hostTextShaper:HostTextShaperCapability, text:String, format:TextFormat):Float {
	return flight._js._fn.Textshaper.measureText(hostTextShaper, text, format);
}
#else
extern inline function measureText(hostTextShaper:HostTextShaperCapability, text:String, format:TextFormat):Float {
#if hl
	return flight._hl._fn.Textshaper.measureText(hostTextShaper, cast text, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.measureText(hostTextShaper, cast text, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.measureText(hostTextShaper, text, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextShaperCache():TextShaperCache {
	return flight._js._fn.Textshaper.createTextShaperCache();
}
#else
extern inline function createTextShaperCache():TextShaperCache {
#if hl
	return flight._hl._fn.Textshaper.createTextShaperCache();
#elseif cpp
	return flight._cpp._fn.Textshaper.createTextShaperCache();
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.createTextShaperCache();
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearTextShaperCache(cache:TextShaperCache):Void {
	flight._js._fn.Textshaper.clearTextShaperCache(cache);
}
#else
extern inline function clearTextShaperCache(cache:TextShaperCache):Void {
#if hl
	flight._hl._fn.Textshaper.clearTextShaperCache(cache);
#elseif cpp
	flight._cpp._fn.Textshaper.clearTextShaperCache(cache);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.clearTextShaperCache(cache);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeTextShaperCache(cache:TextShaperCache):Void {
	flight._js._fn.Textshaper.disposeTextShaperCache(cache);
}
#else
extern inline function disposeTextShaperCache(cache:TextShaperCache):Void {
#if hl
	flight._hl._fn.Textshaper.disposeTextShaperCache(cache);
#elseif cpp
	flight._cpp._fn.Textshaper.disposeTextShaperCache(cache);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.disposeTextShaperCache(cache);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function shapeTextRunCached(hostTextShaper:HostTextShaperCapability, cache:TextShaperCache, text:String, format:TextFormat, options:Null<ShapeRunOptions>):Null<Dynamic> {
	return flight._js._fn.Textshaper.shapeTextRunCached(hostTextShaper, cache, text, format, options);
}
#else
extern inline function shapeTextRunCached(hostTextShaper:HostTextShaperCapability, cache:TextShaperCache, text:String, format:TextFormat, options:ShapeRunOptions):Dynamic {
#if hl
	return flight._hl._fn.Textshaper.shapeTextRunCached(hostTextShaper, cache, cast text, format, options);
#elseif cpp
	return flight._cpp._fn.Textshaper.shapeTextRunCached(hostTextShaper, cache, cast text, format, options);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.shapeTextRunCached(hostTextShaper, cache, text, format, options);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCaretPositionsForRun(out:Dynamic, run:ShapedRun):Void {
	flight._js._fn.Textshaper.getCaretPositionsForRun(out, run);
}
#else
extern inline function getCaretPositionsForRun(out:Dynamic, run:ShapedRun):Void {
#if hl
	flight._hl._fn.Textshaper.getCaretPositionsForRun(out, run);
#elseif cpp
	flight._cpp._fn.Textshaper.getCaretPositionsForRun(out, run);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.getCaretPositionsForRun(out, run);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getClusterForIndex(run:ShapedRun, stringIndex:Int):Int {
	return flight._js._fn.Textshaper.getClusterForIndex(run, stringIndex);
}
#else
extern inline function getClusterForIndex(run:ShapedRun, stringIndex:Int):Int {
#if hl
	return flight._hl._fn.Textshaper.getClusterForIndex(run, stringIndex);
#elseif cpp
	return flight._cpp._fn.Textshaper.getClusterForIndex(run, stringIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getClusterForIndex(run, stringIndex);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getIndexRangeForCluster(run:ShapedRun, cluster:Int, stringLength:Null<Int>):Null<{ _0:Int, _1:Int }> {
	var result = flight._js._fn.Textshaper.getIndexRangeForCluster(run, cluster, stringLength);
	if (result == null) return null;
	return { _0: result[0], _1: result[1] };
}
#else
extern inline function getIndexRangeForCluster(run:ShapedRun, cluster:Int, stringLength:Int):Null<{ _0:Int, _1:Int }> {
#if hl
	var out0:Int = 0;
	var out1:Int = 0;
	if (!flight._hl._fn.Textshaper.getIndexRangeForCluster(run, cluster, stringLength, hl.Ref.make(out0), hl.Ref.make(out1))) return null;
	return { _0: out0, _1: out1 };
#elseif cpp
	var out0:cpp.Int32 = 0;
	var out1:cpp.Int32 = 0;
	if (!flight._cpp._fn.Textshaper.getIndexRangeForCluster(run, cluster, stringLength, cpp.RawPointer.addressOf(out0), cpp.RawPointer.addressOf(out1))) return null;
	return { _0: out0, _1: out1 };
#elseif (js && flight_esm)
	var result = flight._js._fn.Textshaper.getIndexRangeForCluster(run, cluster, stringLength);
	if (result == null) return null;
	return { _0: result[0], _1: result[1] };
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function itemizeText(out:Dynamic, text:String, format:TextFormat, options:Null<TextShaperOptions>):Void {
	flight._js._fn.Textshaper.itemizeText(out, text, format, options);
}
#else
extern inline function itemizeText(out:Dynamic, text:String, format:TextFormat, options:TextShaperOptions):Void {
#if hl
	flight._hl._fn.Textshaper.itemizeText(out, cast text, format, options);
#elseif cpp
	flight._cpp._fn.Textshaper.itemizeText(out, cast text, format, options);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.itemizeText(out, text, format, options);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createShapedRun():Dynamic {
	return flight._js._fn.Textshaper.createShapedRun();
}
#else
extern inline function createShapedRun():Dynamic {
#if hl
	return flight._hl._fn.Textshaper.createShapedRun();
#elseif cpp
	return flight._cpp._fn.Textshaper.createShapedRun();
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.createShapedRun();
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearShapedRun(run:ShapedRun):Void {
	flight._js._fn.Textshaper.clearShapedRun(run);
}
#else
extern inline function clearShapedRun(run:ShapedRun):Void {
#if hl
	flight._hl._fn.Textshaper.clearShapedRun(run);
#elseif cpp
	flight._cpp._fn.Textshaper.clearShapedRun(run);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.clearShapedRun(run);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCodePointForGlyph(hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):Int {
	return flight._js._fn.Textshaper.getCodePointForGlyph(hostTextShaper, glyphId, format);
}
#else
extern inline function getCodePointForGlyph(hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):Int {
#if hl
	return flight._hl._fn.Textshaper.getCodePointForGlyph(hostTextShaper, glyphId, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getCodePointForGlyph(hostTextShaper, glyphId, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getCodePointForGlyph(hostTextShaper, glyphId, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFontMetrics(hostTextShaper:HostTextShaperCapability, format:TextFormat):Null<FontMetrics> {
	return flight._js._fn.Textshaper.getFontMetrics(hostTextShaper, format);
}
#else
extern inline function getFontMetrics(hostTextShaper:HostTextShaperCapability, format:TextFormat):FontMetrics {
#if hl
	return flight._hl._fn.Textshaper.getFontMetrics(hostTextShaper, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getFontMetrics(hostTextShaper, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getFontMetrics(hostTextShaper, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFontMetricsInto(out:FontMetrics, hostTextShaper:HostTextShaperCapability, format:TextFormat):Bool {
	return flight._js._fn.Textshaper.getFontMetricsInto(out, hostTextShaper, format);
}
#else
extern inline function getFontMetricsInto(out:FontMetrics, hostTextShaper:HostTextShaperCapability, format:TextFormat):Bool {
#if hl
	return flight._hl._fn.Textshaper.getFontMetricsInto(out, hostTextShaper, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getFontMetricsInto(out, hostTextShaper, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getFontMetricsInto(out, hostTextShaper, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFontUnitScale(hostTextShaper:HostTextShaperCapability, format:TextFormat):Float {
	return flight._js._fn.Textshaper.getFontUnitScale(hostTextShaper, format);
}
#else
extern inline function getFontUnitScale(hostTextShaper:HostTextShaperCapability, format:TextFormat):Float {
#if hl
	return flight._hl._fn.Textshaper.getFontUnitScale(hostTextShaper, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getFontUnitScale(hostTextShaper, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getFontUnitScale(hostTextShaper, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphExtents(hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):Null<GlyphExtents> {
	return flight._js._fn.Textshaper.getGlyphExtents(hostTextShaper, glyphId, format);
}
#else
extern inline function getGlyphExtents(hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):GlyphExtents {
#if hl
	return flight._hl._fn.Textshaper.getGlyphExtents(hostTextShaper, glyphId, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getGlyphExtents(hostTextShaper, glyphId, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getGlyphExtents(hostTextShaper, glyphId, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphExtentsBatch(out:Dynamic, hostTextShaper:HostTextShaperCapability, glyphIds:Dynamic, format:TextFormat):Int {
	return flight._js._fn.Textshaper.getGlyphExtentsBatch(out, hostTextShaper, glyphIds, format);
}
#else
extern inline function getGlyphExtentsBatch(out:Dynamic, hostTextShaper:HostTextShaperCapability, glyphIds:Dynamic, glyphIdsLen:Int, format:TextFormat):Int {
#if hl
	return flight._hl._fn.Textshaper.getGlyphExtentsBatch(out, hostTextShaper, glyphIds, glyphIdsLen, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getGlyphExtentsBatch(out, hostTextShaper, glyphIds, glyphIdsLen, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getGlyphExtentsBatch(out, hostTextShaper, glyphIds, glyphIdsLen, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphExtentsInto(out:GlyphExtents, hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):Bool {
	return flight._js._fn.Textshaper.getGlyphExtentsInto(out, hostTextShaper, glyphId, format);
}
#else
extern inline function getGlyphExtentsInto(out:GlyphExtents, hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):Bool {
#if hl
	return flight._hl._fn.Textshaper.getGlyphExtentsInto(out, hostTextShaper, glyphId, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getGlyphExtentsInto(out, hostTextShaper, glyphId, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getGlyphExtentsInto(out, hostTextShaper, glyphId, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphIndexForCodePoint(hostTextShaper:HostTextShaperCapability, codePoint:Int, format:TextFormat):Int {
	return flight._js._fn.Textshaper.getGlyphIndexForCodePoint(hostTextShaper, codePoint, format);
}
#else
extern inline function getGlyphIndexForCodePoint(hostTextShaper:HostTextShaperCapability, codePoint:Int, format:TextFormat):Int {
#if hl
	return flight._hl._fn.Textshaper.getGlyphIndexForCodePoint(hostTextShaper, codePoint, format);
#elseif cpp
	return flight._cpp._fn.Textshaper.getGlyphIndexForCodePoint(hostTextShaper, codePoint, format);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.getGlyphIndexForCodePoint(hostTextShaper, codePoint, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlyphName(hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):String {
	return flight._js._fn.Textshaper.getGlyphName(hostTextShaper, glyphId, format);
}
#else
extern inline function getGlyphName(hostTextShaper:HostTextShaperCapability, glyphId:Int, format:TextFormat):String {
#if hl
	return cast flight._hl._fn.Textshaper.getGlyphName(hostTextShaper, glyphId, format);
#elseif cpp
	return cast flight._cpp._fn.Textshaper.getGlyphName(hostTextShaper, glyphId, format);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textshaper.getGlyphName(hostTextShaper, glyphId, format);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function shapeTextRun(hostTextShaper:HostTextShaperCapability, text:String, format:TextFormat, options:Null<ShapeRunOptions>):Null<Dynamic> {
	return flight._js._fn.Textshaper.shapeTextRun(hostTextShaper, text, format, options);
}
#else
extern inline function shapeTextRun(hostTextShaper:HostTextShaperCapability, text:String, format:TextFormat, options:ShapeRunOptions):Dynamic {
#if hl
	return flight._hl._fn.Textshaper.shapeTextRun(hostTextShaper, cast text, format, options);
#elseif cpp
	return flight._cpp._fn.Textshaper.shapeTextRun(hostTextShaper, cast text, format, options);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.shapeTextRun(hostTextShaper, text, format, options);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function shapeTextRunInto(out:ShapedRun, hostTextShaper:HostTextShaperCapability, text:String, format:TextFormat, options:Null<ShapeRunOptions>):Bool {
	return flight._js._fn.Textshaper.shapeTextRunInto(out, hostTextShaper, text, format, options);
}
#else
extern inline function shapeTextRunInto(out:ShapedRun, hostTextShaper:HostTextShaperCapability, text:String, format:TextFormat, options:ShapeRunOptions):Bool {
#if hl
	return flight._hl._fn.Textshaper.shapeTextRunInto(out, hostTextShaper, cast text, format, options);
#elseif cpp
	return flight._cpp._fn.Textshaper.shapeTextRunInto(out, hostTextShaper, cast text, format, options);
#elseif (js && flight_esm)
	return flight._js._fn.Textshaper.shapeTextRunInto(out, hostTextShaper, text, format, options);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextShaperCache(ptr:TextShaperCache):Void {
	flight._js._fn.Textshaper.freeTextShaperCache(ptr);
}
#else
extern inline function freeTextShaperCache(ptr:TextShaperCache):Void {
#if hl
	flight._hl._fn.Textshaper.freeTextShaperCache(ptr);
#elseif cpp
	flight._cpp._fn.Textshaper.freeTextShaperCache(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.freeTextShaperCache(ptr);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeShapedRunRef(ptr:ShapedRun):Void {
	flight._js._fn.Textshaper.freeShapedRunRef(ptr);
}
#else
extern inline function freeShapedRunRef(ptr:ShapedRun):Void {
#if hl
	flight._hl._fn.Textshaper.freeShapedRunRef(ptr);
#elseif cpp
	flight._cpp._fn.Textshaper.freeShapedRunRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.freeShapedRunRef(ptr);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFontMetrics(ptr:FontMetrics):Void {
	flight._js._fn.Textshaper.freeFontMetrics(ptr);
}
#else
extern inline function freeFontMetrics(ptr:FontMetrics):Void {
#if hl
	flight._hl._fn.Textshaper.freeFontMetrics(ptr);
#elseif cpp
	flight._cpp._fn.Textshaper.freeFontMetrics(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.freeFontMetrics(ptr);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlyphExtents(ptr:GlyphExtents):Void {
	flight._js._fn.Textshaper.freeGlyphExtents(ptr);
}
#else
extern inline function freeGlyphExtents(ptr:GlyphExtents):Void {
#if hl
	flight._hl._fn.Textshaper.freeGlyphExtents(ptr);
#elseif cpp
	flight._cpp._fn.Textshaper.freeGlyphExtents(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textshaper.freeGlyphExtents(ptr);
#else
	#error "flight.Textshaper: no backend for this target."
#end
}
#end
