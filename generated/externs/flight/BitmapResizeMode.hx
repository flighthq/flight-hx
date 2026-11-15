package flight;

abstract BitmapResizeMode(Int) from Int to Int {
	public static inline var Nearest:BitmapResizeMode = 0;
	public static inline var Bilinear:BitmapResizeMode = 1;
	public static inline var Bicubic:BitmapResizeMode = 2;
}
