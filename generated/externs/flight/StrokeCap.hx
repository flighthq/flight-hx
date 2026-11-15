package flight;

abstract StrokeCap(Int) from Int to Int {
	public static inline var Butt:StrokeCap = 0;
	public static inline var Round:StrokeCap = 1;
	public static inline var Square:StrokeCap = 2;
}
