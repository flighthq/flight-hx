package flight;

abstract CollisionShapeKind2D(Int) from Int to Int {
	public static inline var Circle:CollisionShapeKind2D = 0;
	public static inline var Capsule:CollisionShapeKind2D = 1;
	public static inline var Aabb:CollisionShapeKind2D = 2;
	public static inline var Obb:CollisionShapeKind2D = 3;
	public static inline var Polygon:CollisionShapeKind2D = 4;
	public static inline var Segment:CollisionShapeKind2D = 5;
	public static inline var Point:CollisionShapeKind2D = 6;
}
