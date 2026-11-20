package flight._hl._fn;

extern class GlyphAtlas {
	@:hlNative("flight", "flight_disable_glyph_atlas_guards")
	public static function disableGlyphAtlasGuards(atlas:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_glyph_atlas_guards")
	public static function enableGlyphAtlasGuards(atlas:hl.Bytes, logState:hl.Bytes, clock:flight._hl.GlyphAtlasClock):Void;
	@:hlNative("flight", "flight_explain_glyph_atlas_entry")
	public static function explainGlyphAtlasEntry(atlas:hl.Bytes, codepoint:Int):flight._hl.GlyphAtlasEntryExplanation;
	@:hlNative("flight", "flight_create_glyph_atlas")
	public static function createGlyphAtlas(options:flight._hl.GlyphAtlasOptions):hl.Bytes;
	@:hlNative("flight", "flight_derive_glyph_metrics_from_font_size")
	public static function deriveGlyphMetricsFromFontSize(fontSize:Single):flight._hl.GlyphMetrics;
	@:hlNative("flight", "flight_dispose_glyph_atlas")
	public static function disposeGlyphAtlas(atlas:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_glyph_atlas_bitmap")
	public static function getGlyphAtlasBitmap(atlas:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_glyph_atlas_layout_version")
	public static function getGlyphAtlasLayoutVersion(atlas:hl.Bytes):Int;
	@:hlNative("flight", "flight_clear_glyph_atlas_dirty")
	public static function clearGlyphAtlasDirty(atlas:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_glyph_atlas_dirty_region")
	public static function getGlyphAtlasDirtyRegion(atlas:hl.Bytes):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_glyph_atlas_entry")
	public static function getGlyphAtlasEntry(atlas:hl.Bytes, codepoint:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_glyph_atlas_kerning")
	public static function getGlyphAtlasKerning(atlas:hl.Bytes, left:Int, right:Int):Single;
	@:hlNative("flight", "flight_allocate_stub_glyph_rasterizer_backend")
	public static function allocateStubGlyphRasterizerBackend():flight._hl.HostGlyphRasterizerCapability;
	@:hlNative("flight", "flight_create_glyph_source_from_glyph_atlas")
	public static function createGlyphSourceFromGlyphAtlas(atlas:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_free_glyph_atlas_entry_explanation")
	public static function freeGlyphAtlasEntryExplanation(ptr:flight._hl.GlyphAtlasEntryExplanation):Void;
	@:hlNative("flight", "flight_free_glyph_atlas_ref")
	public static function freeGlyphAtlasRef(ptr:flight._hl.GlyphAtlas):Void;
	@:hlNative("flight", "flight_free_host_glyph_rasterizer_capability")
	public static function freeHostGlyphRasterizerCapability(ptr:flight._hl.HostGlyphRasterizerCapability):Void;
	@:hlNative("flight", "flight_free_glyph_entry_ref")
	public static function freeGlyphEntryRef(ptr:flight._hl.GlyphEntry):Void;
}
