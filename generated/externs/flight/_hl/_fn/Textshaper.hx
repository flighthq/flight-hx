package flight._hl._fn;

extern class Textshaper {
	@:hlNative("flight", "flight_disable_text_shaper_guards")
	public static function disableTextShaperGuards(pool:flight._hl.ShapedRunPool):Void;
	@:hlNative("flight", "flight_explain_text_shaper_operation")
	public static function explainTextShaperOperation(hostTextShaper:flight._hl.HostTextShaperCapability, operation:Int):flight._hl.BackendOperationExplanation;
	@:hlNative("flight", "flight_has_text_shaper_operation")
	public static function hasTextShaperOperation(hostTextShaper:flight._hl.HostTextShaperCapability, operation:Int):Bool;
	@:hlNative("flight", "flight_measure_text")
	public static function measureText(hostTextShaper:flight._hl.HostTextShaperCapability, text:hl.Bytes, format:flight._hl.TextFormat):Single;
	@:hlNative("flight", "flight_create_text_shaper_cache")
	public static function createTextShaperCache():flight._hl.TextShaperCache;
	@:hlNative("flight", "flight_clear_text_shaper_cache")
	public static function clearTextShaperCache(cache:flight._hl.TextShaperCache):Void;
	@:hlNative("flight", "flight_dispose_text_shaper_cache")
	public static function disposeTextShaperCache(cache:flight._hl.TextShaperCache):Void;
	@:hlNative("flight", "flight_shape_text_run_cached")
	public static function shapeTextRunCached(hostTextShaper:flight._hl.HostTextShaperCapability, cache:flight._hl.TextShaperCache, text:hl.Bytes, format:flight._hl.TextFormat, options:flight._hl.ShapeRunOptions):hl.Bytes;
	@:hlNative("flight", "flight_get_caret_positions_for_run")
	public static function getCaretPositionsForRun(out:hl.Bytes, run:flight._hl.ShapedRun):Void;
	@:hlNative("flight", "flight_get_cluster_for_index")
	public static function getClusterForIndex(run:flight._hl.ShapedRun, stringIndex:Int):Int;
	@:hlNative("flight", "flight_get_index_range_for_cluster")
	public static function getIndexRangeForCluster(run:flight._hl.ShapedRun, cluster:Int, stringLength:Int, out0:hl.Ref<Int>, out1:hl.Ref<Int>):Bool;
	@:hlNative("flight", "flight_itemize_text")
	public static function itemizeText(out:hl.Bytes, text:hl.Bytes, format:flight._hl.TextFormat, options:flight._hl.TextShaperOptions):Void;
	@:hlNative("flight", "flight_create_shaped_run")
	public static function createShapedRun():hl.Bytes;
	@:hlNative("flight", "flight_clear_shaped_run")
	public static function clearShapedRun(run:flight._hl.ShapedRun):Void;
	@:hlNative("flight", "flight_get_code_point_for_glyph")
	public static function getCodePointForGlyph(hostTextShaper:flight._hl.HostTextShaperCapability, glyphId:Int, format:flight._hl.TextFormat):Int;
	@:hlNative("flight", "flight_get_font_metrics")
	public static function getFontMetrics(hostTextShaper:flight._hl.HostTextShaperCapability, format:flight._hl.TextFormat):flight._hl.FontMetrics;
	@:hlNative("flight", "flight_get_font_metrics_into")
	public static function getFontMetricsInto(out:flight._hl.FontMetrics, hostTextShaper:flight._hl.HostTextShaperCapability, format:flight._hl.TextFormat):Bool;
	@:hlNative("flight", "flight_get_font_unit_scale")
	public static function getFontUnitScale(hostTextShaper:flight._hl.HostTextShaperCapability, format:flight._hl.TextFormat):Single;
	@:hlNative("flight", "flight_get_glyph_extents")
	public static function getGlyphExtents(hostTextShaper:flight._hl.HostTextShaperCapability, glyphId:Int, format:flight._hl.TextFormat):flight._hl.GlyphExtents;
	@:hlNative("flight", "flight_get_glyph_extents_batch")
	public static function getGlyphExtentsBatch(out:hl.Bytes, hostTextShaper:flight._hl.HostTextShaperCapability, glyphIds:hl.Bytes, glyphIdsLen:Int, format:flight._hl.TextFormat):Int;
	@:hlNative("flight", "flight_get_glyph_extents_into")
	public static function getGlyphExtentsInto(out:flight._hl.GlyphExtents, hostTextShaper:flight._hl.HostTextShaperCapability, glyphId:Int, format:flight._hl.TextFormat):Bool;
	@:hlNative("flight", "flight_get_glyph_index_for_code_point")
	public static function getGlyphIndexForCodePoint(hostTextShaper:flight._hl.HostTextShaperCapability, codePoint:Int, format:flight._hl.TextFormat):Int;
	@:hlNative("flight", "flight_get_glyph_name")
	public static function getGlyphName(hostTextShaper:flight._hl.HostTextShaperCapability, glyphId:Int, format:flight._hl.TextFormat):hl.Bytes;
	@:hlNative("flight", "flight_shape_text_run")
	public static function shapeTextRun(hostTextShaper:flight._hl.HostTextShaperCapability, text:hl.Bytes, format:flight._hl.TextFormat, options:flight._hl.ShapeRunOptions):hl.Bytes;
	@:hlNative("flight", "flight_shape_text_run_into")
	public static function shapeTextRunInto(out:flight._hl.ShapedRun, hostTextShaper:flight._hl.HostTextShaperCapability, text:hl.Bytes, format:flight._hl.TextFormat, options:flight._hl.ShapeRunOptions):Bool;
	@:hlNative("flight", "flight_free_text_shaper_cache")
	public static function freeTextShaperCache(ptr:flight._hl.TextShaperCache):Void;
	@:hlNative("flight", "flight_free_shaped_run_ref")
	public static function freeShapedRunRef(ptr:flight._hl.ShapedRun):Void;
	@:hlNative("flight", "flight_free_font_metrics")
	public static function freeFontMetrics(ptr:flight._hl.FontMetrics):Void;
	@:hlNative("flight", "flight_free_glyph_extents")
	public static function freeGlyphExtents(ptr:flight._hl.GlyphExtents):Void;
}
