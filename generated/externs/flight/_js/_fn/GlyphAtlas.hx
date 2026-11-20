package flight._js._fn;

@:jsRequire("@flighthq/glyphatlas")
extern class GlyphAtlas {
	@:native("disableGlyphAtlasGuards")
	public static function disableGlyphAtlasGuards(atlas:Dynamic):Void;
	@:native("enableGlyphAtlasGuards")
	public static function enableGlyphAtlasGuards(atlas:Dynamic, logState:Dynamic, clock:flight._js.GlyphAtlasClock):Void;
	@:native("explainGlyphAtlasEntry")
	public static function explainGlyphAtlasEntry(atlas:Dynamic, codepoint:Int):flight._js.GlyphAtlasEntryExplanation;
	@:native("createGlyphAtlas")
	public static function createGlyphAtlas(options:flight._js.GlyphAtlasOptions):Dynamic;
	@:native("deriveGlyphMetricsFromFontSize")
	public static function deriveGlyphMetricsFromFontSize(fontSize:Float):flight._js.GlyphMetrics;
	@:native("disposeGlyphAtlas")
	public static function disposeGlyphAtlas(atlas:Dynamic):Void;
	@:native("getGlyphAtlasBitmap")
	public static function getGlyphAtlasBitmap(atlas:Dynamic):Dynamic;
	@:native("getGlyphAtlasLayoutVersion")
	public static function getGlyphAtlasLayoutVersion(atlas:Dynamic):Int;
	@:native("clearGlyphAtlasDirty")
	public static function clearGlyphAtlasDirty(atlas:Dynamic):Void;
	@:native("getGlyphAtlasDirtyRegion")
	public static function getGlyphAtlasDirtyRegion(atlas:Dynamic):Null<flight._js.Rectangle>;
	@:native("getGlyphAtlasEntry")
	public static function getGlyphAtlasEntry(atlas:Dynamic, codepoint:Int):Null<Dynamic>;
	@:native("getGlyphAtlasKerning")
	public static function getGlyphAtlasKerning(atlas:Dynamic, left:Int, right:Int):Float;
	@:native("allocateStubGlyphRasterizerBackend")
	public static function allocateStubGlyphRasterizerBackend():flight._js.HostGlyphRasterizerCapability;
	@:native("createGlyphSourceFromGlyphAtlas")
	public static function createGlyphSourceFromGlyphAtlas(atlas:Dynamic):Dynamic;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGlyphAtlasEntryExplanation(ptr:flight._js.GlyphAtlasEntryExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGlyphAtlasRef(ptr:flight._js.GlyphAtlas):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHostGlyphRasterizerCapability(ptr:flight._js.HostGlyphRasterizerCapability):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGlyphEntryRef(ptr:flight._js.GlyphEntry):Void {}
}
