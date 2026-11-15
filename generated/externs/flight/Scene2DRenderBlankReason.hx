package flight;

abstract Scene2DRenderBlankReason(Int) from Int to Int {
	public static inline var NoRenderer:Scene2DRenderBlankReason = 0;
	public static inline var NotPrepared:Scene2DRenderBlankReason = 1;
	public static inline var NotVisible:Scene2DRenderBlankReason = 2;
	public static inline var ZeroAlpha:Scene2DRenderBlankReason = 3;
	public static inline var Ok:Scene2DRenderBlankReason = 4;
}
