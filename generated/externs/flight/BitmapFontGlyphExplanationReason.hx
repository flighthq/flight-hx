package flight;

abstract BitmapFontGlyphExplanationReason(Int) from Int to Int {
	public static inline var EmptyGlyph:BitmapFontGlyphExplanationReason = 0;
	public static inline var NoGlyph:BitmapFontGlyphExplanationReason = 1;
	public static inline var NoPages:BitmapFontGlyphExplanationReason = 2;
	public static inline var Ok:BitmapFontGlyphExplanationReason = 3;
}
