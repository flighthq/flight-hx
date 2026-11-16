package flight;

abstract BitmapFontParseExplanationReason(Int) from Int to Int {
	public static inline var InvalidData:BitmapFontParseExplanationReason = 0;
	public static inline var MissingChars:BitmapFontParseExplanationReason = 1;
	public static inline var MissingCommon:BitmapFontParseExplanationReason = 2;
	public static inline var Ok:BitmapFontParseExplanationReason = 3;
	public static inline var UnresolvedPage:BitmapFontParseExplanationReason = 4;
}
