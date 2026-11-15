package flight;

abstract GlyphRasterizerOperation(Int) from Int to Int {
	public static inline var MeasureMetrics:GlyphRasterizerOperation = 0;
	public static inline var Rasterize:GlyphRasterizerOperation = 1;
}
