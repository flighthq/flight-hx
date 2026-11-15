package flight;

abstract Scene2DDisplayState(Int) from Int to Int {
	public static inline var Fullscreen:Scene2DDisplayState = 0;
	public static inline var FullscreenInteractive:Scene2DDisplayState = 1;
	public static inline var Normal:Scene2DDisplayState = 2;
}
