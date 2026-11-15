package flight;

abstract BitmapReadbackMode(Int) from Int to Int {
	public static inline var Bitmap:BitmapReadbackMode = 0;
	public static inline var Probe:BitmapReadbackMode = 1;
}
