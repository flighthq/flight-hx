package flight;

abstract UnityMinMaxMode(Int) from Int to Int {
	public static inline var Constant:UnityMinMaxMode = 0;
	public static inline var TwoConstants:UnityMinMaxMode = 1;
	public static inline var Curve:UnityMinMaxMode = 2;
	public static inline var TwoCurves:UnityMinMaxMode = 3;
}
