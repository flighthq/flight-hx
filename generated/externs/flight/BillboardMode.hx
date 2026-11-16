package flight;

abstract BillboardMode(Int) from Int to Int {
	public static inline var AxisY:BillboardMode = 0;
	public static inline var Full:BillboardMode = 1;
	public static inline var ScreenAligned:BillboardMode = 2;
}
