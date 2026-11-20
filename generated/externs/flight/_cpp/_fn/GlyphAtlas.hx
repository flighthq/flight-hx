package flight._cpp._fn;

extern class GlyphAtlas {
	@:native("flight_disable_glyph_atlas_guards")
	public static function disableGlyphAtlasGuards(atlas:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_glyph_atlas_guards")
	public static function enableGlyphAtlasGuards(atlas:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>, clock:flight._cpp.GlyphAtlasClock):Void;
	@:native("flight_explain_glyph_atlas_entry")
	public static function explainGlyphAtlasEntry(atlas:cpp.Star<cpp.Void>, codepoint:Int):flight._cpp.GlyphAtlasEntryExplanation;
	@:native("flight_create_glyph_atlas")
	public static function createGlyphAtlas(options:flight._cpp.GlyphAtlasOptions):cpp.Star<cpp.Void>;
	@:native("flight_derive_glyph_metrics_from_font_size")
	public static function deriveGlyphMetricsFromFontSize(fontSize:Single):flight._cpp.GlyphMetrics;
	@:native("flight_dispose_glyph_atlas")
	public static function disposeGlyphAtlas(atlas:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_glyph_atlas_bitmap")
	public static function getGlyphAtlasBitmap(atlas:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_glyph_atlas_layout_version")
	public static function getGlyphAtlasLayoutVersion(atlas:cpp.Star<cpp.Void>):Int;
	@:native("flight_clear_glyph_atlas_dirty")
	public static function clearGlyphAtlasDirty(atlas:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_glyph_atlas_dirty_region")
	public static function getGlyphAtlasDirtyRegion(atlas:cpp.Star<cpp.Void>):flight._cpp.Rectangle;
	@:native("flight_get_glyph_atlas_entry")
	public static function getGlyphAtlasEntry(atlas:cpp.Star<cpp.Void>, codepoint:Int):cpp.Star<cpp.Void>;
	@:native("flight_get_glyph_atlas_kerning")
	public static function getGlyphAtlasKerning(atlas:cpp.Star<cpp.Void>, left:Int, right:Int):Single;
	@:native("flight_allocate_stub_glyph_rasterizer_backend")
	public static function allocateStubGlyphRasterizerBackend():flight._cpp.HostGlyphRasterizerCapability;
	@:native("flight_create_glyph_source_from_glyph_atlas")
	public static function createGlyphSourceFromGlyphAtlas(atlas:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_free_glyph_atlas_entry_explanation")
	public static function freeGlyphAtlasEntryExplanation(ptr:flight._cpp.GlyphAtlasEntryExplanation):Void;
	@:native("flight_free_glyph_atlas_ref")
	public static function freeGlyphAtlasRef(ptr:flight._cpp.GlyphAtlas):Void;
	@:native("flight_free_host_glyph_rasterizer_capability")
	public static function freeHostGlyphRasterizerCapability(ptr:flight._cpp.HostGlyphRasterizerCapability):Void;
	@:native("flight_free_glyph_entry_ref")
	public static function freeGlyphEntryRef(ptr:flight._cpp.GlyphEntry):Void;
}
