package flight;

abstract Physics2DBodyType(Int) from Int to Int {
	public static inline var Dynamic:Physics2DBodyType = 0;
	public static inline var Kinematic:Physics2DBodyType = 1;
	public static inline var Static:Physics2DBodyType = 2;
}
