package flight;

abstract CollisionTestStatus(Int) from Int to Int {
	public static inline var DegenerateShape:CollisionTestStatus = 0;
	public static inline var NonConvexPolygon:CollisionTestStatus = 1;
	public static inline var Overlapping:CollisionTestStatus = 2;
	public static inline var Separated:CollisionTestStatus = 3;
	public static inline var UnsupportedShapeKind:CollisionTestStatus = 4;
}
