package flight;

abstract Physics2DDebugFeature(Int) from Int to Int {
	public static inline var CenterOfMass:Physics2DDebugFeature = 0;
	public static inline var Collider:Physics2DDebugFeature = 1;
	public static inline var ContactNormal:Physics2DDebugFeature = 2;
	public static inline var Joint:Physics2DDebugFeature = 3;
}
