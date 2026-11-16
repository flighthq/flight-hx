package flight;

abstract Physics3DCollisionStatus(Int) from Int to Int {
	public static inline var MissingSupport:Physics3DCollisionStatus = 0;
	public static inline var Ready:Physics3DCollisionStatus = 1;
}
