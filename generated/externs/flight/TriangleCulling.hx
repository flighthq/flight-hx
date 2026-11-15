package flight;

abstract TriangleCulling(Int) from Int to Int {
	public static inline var Negative:TriangleCulling = 0;
	public static inline var None:TriangleCulling = 1;
	public static inline var Positive:TriangleCulling = 2;
}
