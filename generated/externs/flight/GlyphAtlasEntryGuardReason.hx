package flight;

abstract GlyphAtlasEntryGuardReason(Int) from Int to Int {
	public static inline var GlyphLargerThanAtlas:GlyphAtlasEntryGuardReason = 0;
	public static inline var RasterizerReturnedNull:GlyphAtlasEntryGuardReason = 1;
	public static inline var Repack:GlyphAtlasEntryGuardReason = 2;
	public static inline var RepackDropped:GlyphAtlasEntryGuardReason = 3;
}
