package flight;

abstract GradientSpread(Int) from Int to Int {
	public static inline var Pad:GradientSpread = 0;
	public static inline var Repeat:GradientSpread = 1;
	public static inline var Reflect:GradientSpread = 2;
}
