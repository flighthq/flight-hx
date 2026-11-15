package flight;

abstract StrokeJoin(Int) from Int to Int {
	public static inline var Miter:StrokeJoin = 0;
	public static inline var Bevel:StrokeJoin = 1;
	public static inline var Round:StrokeJoin = 2;
}
