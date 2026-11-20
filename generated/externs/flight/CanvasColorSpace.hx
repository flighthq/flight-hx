package flight;

abstract CanvasColorSpace(Int) from Int to Int {
	public static inline var Srgb:CanvasColorSpace = 0;
	public static inline var DisplayP3:CanvasColorSpace = 1;
}
