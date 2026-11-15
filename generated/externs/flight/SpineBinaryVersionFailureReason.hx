package flight;

abstract SpineBinaryVersionFailureReason(Int) from Int to Int {
	public static inline var NoStrategyMatched:SpineBinaryVersionFailureReason = 0;
	public static inline var StrategiesDisagree:SpineBinaryVersionFailureReason = 1;
	public static inline var TooShort:SpineBinaryVersionFailureReason = 2;
}
