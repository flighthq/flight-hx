package flight;

abstract BitmapBevelType(Int) from Int to Int {
	public static inline var Inner:BitmapBevelType = 0;
	public static inline var Outer:BitmapBevelType = 1;
	public static inline var Both:BitmapBevelType = 2;
}
