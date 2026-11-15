package flight;

abstract PathBooleanFillRule(Int) from Int to Int {
	public static inline var EvenOdd:PathBooleanFillRule = 0;
	public static inline var NonZero:PathBooleanFillRule = 1;
	public static inline var Positive:PathBooleanFillRule = 2;
	public static inline var Negative:PathBooleanFillRule = 3;
}
