package flight;

abstract ThresholdOperation(Int) from Int to Int {
	public static inline var LessThan:ThresholdOperation = 0;
	public static inline var LessThanOrEqual:ThresholdOperation = 1;
	public static inline var GreaterThan:ThresholdOperation = 2;
	public static inline var GreaterThanOrEqual:ThresholdOperation = 3;
	public static inline var Equal:ThresholdOperation = 4;
	public static inline var NotEqual:ThresholdOperation = 5;
}
