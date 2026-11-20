package flight;

abstract GlyphAtlasEntryBlockReason(Int) from Int to Int {
	public static inline var GlyphLargerThanAtlas:GlyphAtlasEntryBlockReason = 0;
	public static inline var Ok:GlyphAtlasEntryBlockReason = 1;
	public static inline var RasterizerReturnedNull:GlyphAtlasEntryBlockReason = 2;
}
