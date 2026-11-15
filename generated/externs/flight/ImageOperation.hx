package flight;

abstract ImageOperation(Int) from Int to Int {
	public static inline var CreateImageFromBitmap:ImageOperation = 0;
	public static inline var CreateImageFromSurface:ImageOperation = 1;
	public static inline var LoadImageFromUrl:ImageOperation = 2;
}
