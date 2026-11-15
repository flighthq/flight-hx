package flight;

abstract CollisionShapeKind3D(Int) from Int to Int {
	public static inline var Sphere:CollisionShapeKind3D = 0;
	public static inline var Aabb:CollisionShapeKind3D = 1;
	public static inline var Box:CollisionShapeKind3D = 2;
	public static inline var Capsule:CollisionShapeKind3D = 3;
	public static inline var Cylinder:CollisionShapeKind3D = 4;
	public static inline var Cone:CollisionShapeKind3D = 5;
	public static inline var Convex:CollisionShapeKind3D = 6;
	public static inline var TriangleMesh:CollisionShapeKind3D = 7;
	public static inline var Heightfield:CollisionShapeKind3D = 8;
}
