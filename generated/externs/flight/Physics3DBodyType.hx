package flight;

abstract Physics3DBodyType(Int) from Int to Int {
	public static inline var Dynamic:Physics3DBodyType = 0;
	public static inline var Kinematic:Physics3DBodyType = 1;
	public static inline var Static:Physics3DBodyType = 2;
}
