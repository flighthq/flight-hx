package flight;

abstract TextShaperOperation(Int) from Int to Int {
	public static inline var GetCodePointForGlyph:TextShaperOperation = 0;
	public static inline var GetFontMetrics:TextShaperOperation = 1;
	public static inline var GetGlyphExtents:TextShaperOperation = 2;
	public static inline var GetGlyphIndexForCodePoint:TextShaperOperation = 3;
	public static inline var GetGlyphName:TextShaperOperation = 4;
	public static inline var MeasureText:TextShaperOperation = 5;
	public static inline var ShapeRun:TextShaperOperation = 6;
}
