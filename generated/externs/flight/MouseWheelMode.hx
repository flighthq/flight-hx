package flight;

abstract MouseWheelMode(Int) from Int to Int {
	public static inline var Lines:MouseWheelMode = 0;
	public static inline var Pages:MouseWheelMode = 1;
	public static inline var Pixels:MouseWheelMode = 2;
	public static inline var Unknown:MouseWheelMode = 3;
}
