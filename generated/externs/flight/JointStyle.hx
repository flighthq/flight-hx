package flight;

abstract JointStyle(Int) from Int to Int {
	public static inline var Bevel:JointStyle = 0;
	public static inline var Miter:JointStyle = 1;
	public static inline var Round:JointStyle = 2;
}
