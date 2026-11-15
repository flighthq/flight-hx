package flight;

abstract BitmapEdgeMode(Int) from Int to Int {
	public static inline var Transparent:BitmapEdgeMode = 0;
	public static inline var Clamp:BitmapEdgeMode = 1;
	public static inline var Wrap:BitmapEdgeMode = 2;
	public static inline var Mirror:BitmapEdgeMode = 3;
}
