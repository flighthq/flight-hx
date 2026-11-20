package flight._js._fn;

@:jsRequire("@flighthq/textshaper")
extern class Textshaper {
	@:native("disableTextShaperGuards")
	public static function disableTextShaperGuards(pool:flight._js.ShapedRunPool):Void;
	@:native("enableTextShaperGuards")
	public static function enableTextShaperGuards(pool:flight._js.ShapedRunPool, logState:Dynamic, clock:Dynamic):Void;
	@:native("explainTextShaperOperation")
	public static function explainTextShaperOperation(hostTextShaper:flight._js.HostTextShaperCapability, operation:Dynamic):flight._js.BackendOperationExplanation;
	@:native("hasTextShaperOperation")
	public static function hasTextShaperOperation(hostTextShaper:flight._js.HostTextShaperCapability, operation:Dynamic):Bool;
	@:native("measureText")
	public static function measureText(hostTextShaper:flight._js.HostTextShaperCapability, text:String, format:flight._js.TextFormat):Float;
	@:native("createTextShaperCache")
	public static function createTextShaperCache():flight._js.TextShaperCache;
	@:native("clearTextShaperCache")
	public static function clearTextShaperCache(cache:flight._js.TextShaperCache):Void;
	@:native("disposeTextShaperCache")
	public static function disposeTextShaperCache(cache:flight._js.TextShaperCache):Void;
	@:native("shapeTextRunCached")
	public static function shapeTextRunCached(hostTextShaper:flight._js.HostTextShaperCapability, cache:flight._js.TextShaperCache, text:String, format:flight._js.TextFormat, options:Null<flight._js.ShapeRunOptions>):Null<Dynamic>;
	@:native("getCaretPositionsForRun")
	public static function getCaretPositionsForRun(out:Dynamic, run:flight._js.ShapedRun):Void;
	@:native("getClusterForIndex")
	public static function getClusterForIndex(run:flight._js.ShapedRun, stringIndex:Int):Int;
	@:native("getIndexRangeForCluster")
	public static function getIndexRangeForCluster(run:flight._js.ShapedRun, cluster:Int, stringLength:Null<Int>):Null<Array<Int>>;
	@:native("itemizeText")
	public static function itemizeText(out:Dynamic, text:String, format:flight._js.TextFormat, options:Null<flight._js.TextShaperOptions>):Void;
	@:native("createShapedRun")
	public static function createShapedRun():Dynamic;
	@:native("clearShapedRun")
	public static function clearShapedRun(run:flight._js.ShapedRun):Void;
	@:native("getCodePointForGlyph")
	public static function getCodePointForGlyph(hostTextShaper:flight._js.HostTextShaperCapability, glyphId:Int, format:flight._js.TextFormat):Int;
	@:native("getFontMetrics")
	public static function getFontMetrics(hostTextShaper:flight._js.HostTextShaperCapability, format:flight._js.TextFormat):Null<flight._js.FontMetrics>;
	@:native("getFontMetricsInto")
	public static function getFontMetricsInto(out:flight._js.FontMetrics, hostTextShaper:flight._js.HostTextShaperCapability, format:flight._js.TextFormat):Bool;
	@:native("getFontUnitScale")
	public static function getFontUnitScale(hostTextShaper:flight._js.HostTextShaperCapability, format:flight._js.TextFormat):Float;
	@:native("getGlyphExtents")
	public static function getGlyphExtents(hostTextShaper:flight._js.HostTextShaperCapability, glyphId:Int, format:flight._js.TextFormat):Null<flight._js.GlyphExtents>;
	@:native("getGlyphExtentsBatch")
	public static function getGlyphExtentsBatch(out:Dynamic, hostTextShaper:flight._js.HostTextShaperCapability, glyphIds:Dynamic, format:flight._js.TextFormat):Int;
	@:native("getGlyphExtentsInto")
	public static function getGlyphExtentsInto(out:flight._js.GlyphExtents, hostTextShaper:flight._js.HostTextShaperCapability, glyphId:Int, format:flight._js.TextFormat):Bool;
	@:native("getGlyphIndexForCodePoint")
	public static function getGlyphIndexForCodePoint(hostTextShaper:flight._js.HostTextShaperCapability, codePoint:Int, format:flight._js.TextFormat):Int;
	@:native("getGlyphName")
	public static function getGlyphName(hostTextShaper:flight._js.HostTextShaperCapability, glyphId:Int, format:flight._js.TextFormat):String;
	@:native("shapeTextRun")
	public static function shapeTextRun(hostTextShaper:flight._js.HostTextShaperCapability, text:String, format:flight._js.TextFormat, options:Null<flight._js.ShapeRunOptions>):Null<Dynamic>;
	@:native("shapeTextRunInto")
	public static function shapeTextRunInto(out:flight._js.ShapedRun, hostTextShaper:flight._js.HostTextShaperCapability, text:String, format:flight._js.TextFormat, options:Null<flight._js.ShapeRunOptions>):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextShaperCache(ptr:flight._js.TextShaperCache):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeShapedRunRef(ptr:flight._js.ShapedRun):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFontMetrics(ptr:flight._js.FontMetrics):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGlyphExtents(ptr:flight._js.GlyphExtents):Void {}
}
