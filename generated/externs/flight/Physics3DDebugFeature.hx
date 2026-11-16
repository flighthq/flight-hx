package flight;

abstract Physics3DDebugFeature(Int) from Int to Int {
	public static inline var CenterOfMass:Physics3DDebugFeature = 0;
	public static inline var Collider:Physics3DDebugFeature = 1;
	public static inline var ContactNormal:Physics3DDebugFeature = 2;
	public static inline var Joint:Physics3DDebugFeature = 3;
}
