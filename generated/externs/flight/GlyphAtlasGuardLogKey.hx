package flight;

abstract GlyphAtlasGuardLogKey(Int) from Int to Int {
	public static inline var GlyphLargerThanAtlas:GlyphAtlasGuardLogKey = 0;
	public static inline var RasterizerReturnedNull:GlyphAtlasGuardLogKey = 1;
	public static inline var RepackDropped:GlyphAtlasGuardLogKey = 2;
	public static inline var RepackThrashing:GlyphAtlasGuardLogKey = 3;
}
