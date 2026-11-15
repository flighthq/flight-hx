package flight;

abstract Physics2DCollisionStatus(Int) from Int to Int {
	public static inline var MissingContactSupport:Physics2DCollisionStatus = 0;
	public static inline var Ready:Physics2DCollisionStatus = 1;
}
