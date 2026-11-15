package flight;

abstract StatechartComparison(Int) from Int to Int {
	public static inline var Equal:StatechartComparison = 0;
	public static inline var GreaterThan:StatechartComparison = 1;
	public static inline var GreaterThanOrEqual:StatechartComparison = 2;
	public static inline var LessThan:StatechartComparison = 3;
	public static inline var LessThanOrEqual:StatechartComparison = 4;
	public static inline var NotEqual:StatechartComparison = 5;
}
