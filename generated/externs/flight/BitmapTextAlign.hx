package flight;

abstract BitmapTextAlign(Int) from Int to Int {
	public static inline var Center:BitmapTextAlign = 0;
	public static inline var Justify:BitmapTextAlign = 1;
	public static inline var Left:BitmapTextAlign = 2;
	public static inline var Right:BitmapTextAlign = 3;
}
