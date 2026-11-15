package flight;

abstract ContourOrientation(Int) from Int to Int {
	public static inline var Ccw:ContourOrientation = 0;
	public static inline var Cw:ContourOrientation = 1;
	public static inline var Degenerate:ContourOrientation = 2;
}
