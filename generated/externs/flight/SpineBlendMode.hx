package flight;

abstract SpineBlendMode(Int) from Int to Int {
	public static inline var Normal:SpineBlendMode = 0;
	public static inline var Additive:SpineBlendMode = 1;
	public static inline var Multiply:SpineBlendMode = 2;
	public static inline var Screen:SpineBlendMode = 3;
}
