package flight._cpp._fn;

extern class Textshaper {
	@:native("flight_disable_text_shaper_guards")
	public static function disableTextShaperGuards(pool:flight._cpp.ShapedRunPool):Void;
	@:native("flight_explain_text_shaper_operation")
	public static function explainTextShaperOperation(hostTextShaper:flight._cpp.HostTextShaperCapability, operation:Int):flight._cpp.BackendOperationExplanation;
	@:native("flight_has_text_shaper_operation")
	public static function hasTextShaperOperation(hostTextShaper:flight._cpp.HostTextShaperCapability, operation:Int):Bool;
	@:native("flight_measure_text")
	public static function measureText(hostTextShaper:flight._cpp.HostTextShaperCapability, text:cpp.ConstCharStar, format:flight._cpp.TextFormat):Single;
	@:native("flight_create_text_shaper_cache")
	public static function createTextShaperCache():flight._cpp.TextShaperCache;
	@:native("flight_clear_text_shaper_cache")
	public static function clearTextShaperCache(cache:flight._cpp.TextShaperCache):Void;
	@:native("flight_dispose_text_shaper_cache")
	public static function disposeTextShaperCache(cache:flight._cpp.TextShaperCache):Void;
	@:native("flight_shape_text_run_cached")
	public static function shapeTextRunCached(hostTextShaper:flight._cpp.HostTextShaperCapability, cache:flight._cpp.TextShaperCache, text:cpp.ConstCharStar, format:flight._cpp.TextFormat, options:flight._cpp.ShapeRunOptions):cpp.Star<cpp.Void>;
	@:native("flight_get_caret_positions_for_run")
	public static function getCaretPositionsForRun(out:cpp.Star<cpp.Void>, run:flight._cpp.ShapedRun):Void;
	@:native("flight_get_cluster_for_index")
	public static function getClusterForIndex(run:flight._cpp.ShapedRun, stringIndex:Int):Int;
	@:native("flight_get_index_range_for_cluster")
	public static function getIndexRangeForCluster(run:flight._cpp.ShapedRun, cluster:Int, stringLength:Int, out0:cpp.RawPointer<cpp.Int32>, out1:cpp.RawPointer<cpp.Int32>):Bool;
	@:native("flight_itemize_text")
	public static function itemizeText(out:cpp.Star<cpp.Void>, text:cpp.ConstCharStar, format:flight._cpp.TextFormat, options:flight._cpp.TextShaperOptions):Void;
	@:native("flight_create_shaped_run")
	public static function createShapedRun():cpp.Star<cpp.Void>;
	@:native("flight_clear_shaped_run")
	public static function clearShapedRun(run:flight._cpp.ShapedRun):Void;
	@:native("flight_get_code_point_for_glyph")
	public static function getCodePointForGlyph(hostTextShaper:flight._cpp.HostTextShaperCapability, glyphId:Int, format:flight._cpp.TextFormat):Int;
	@:native("flight_get_font_metrics")
	public static function getFontMetrics(hostTextShaper:flight._cpp.HostTextShaperCapability, format:flight._cpp.TextFormat):flight._cpp.FontMetrics;
	@:native("flight_get_font_metrics_into")
	public static function getFontMetricsInto(out:flight._cpp.FontMetrics, hostTextShaper:flight._cpp.HostTextShaperCapability, format:flight._cpp.TextFormat):Bool;
	@:native("flight_get_font_unit_scale")
	public static function getFontUnitScale(hostTextShaper:flight._cpp.HostTextShaperCapability, format:flight._cpp.TextFormat):Single;
	@:native("flight_get_glyph_extents")
	public static function getGlyphExtents(hostTextShaper:flight._cpp.HostTextShaperCapability, glyphId:Int, format:flight._cpp.TextFormat):flight._cpp.GlyphExtents;
	@:native("flight_get_glyph_extents_batch")
	public static function getGlyphExtentsBatch(out:cpp.Star<cpp.Void>, hostTextShaper:flight._cpp.HostTextShaperCapability, glyphIds:cpp.Star<cpp.Void>, glyphIdsLen:Int, format:flight._cpp.TextFormat):Int;
	@:native("flight_get_glyph_extents_into")
	public static function getGlyphExtentsInto(out:flight._cpp.GlyphExtents, hostTextShaper:flight._cpp.HostTextShaperCapability, glyphId:Int, format:flight._cpp.TextFormat):Bool;
	@:native("flight_get_glyph_index_for_code_point")
	public static function getGlyphIndexForCodePoint(hostTextShaper:flight._cpp.HostTextShaperCapability, codePoint:Int, format:flight._cpp.TextFormat):Int;
	@:native("flight_get_glyph_name")
	public static function getGlyphName(hostTextShaper:flight._cpp.HostTextShaperCapability, glyphId:Int, format:flight._cpp.TextFormat):cpp.ConstCharStar;
	@:native("flight_shape_text_run")
	public static function shapeTextRun(hostTextShaper:flight._cpp.HostTextShaperCapability, text:cpp.ConstCharStar, format:flight._cpp.TextFormat, options:flight._cpp.ShapeRunOptions):cpp.Star<cpp.Void>;
	@:native("flight_shape_text_run_into")
	public static function shapeTextRunInto(out:flight._cpp.ShapedRun, hostTextShaper:flight._cpp.HostTextShaperCapability, text:cpp.ConstCharStar, format:flight._cpp.TextFormat, options:flight._cpp.ShapeRunOptions):Bool;
	@:native("flight_free_text_shaper_cache")
	public static function freeTextShaperCache(ptr:flight._cpp.TextShaperCache):Void;
	@:native("flight_free_shaped_run_ref")
	public static function freeShapedRunRef(ptr:flight._cpp.ShapedRun):Void;
	@:native("flight_free_font_metrics")
	public static function freeFontMetrics(ptr:flight._cpp.FontMetrics):Void;
	@:native("flight_free_glyph_extents")
	public static function freeGlyphExtents(ptr:flight._cpp.GlyphExtents):Void;
}
