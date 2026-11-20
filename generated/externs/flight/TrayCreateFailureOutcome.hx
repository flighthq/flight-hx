package flight;

abstract TrayCreateFailureOutcome(Int) from Int to Int {
	public static inline var Cancelled:TrayCreateFailureOutcome = 0;
	public static inline var RuntimeApiUnavailable:TrayCreateFailureOutcome = 1;
	public static inline var InvalidIcon:TrayCreateFailureOutcome = 2;
	public static inline var TrayCreateFailed:TrayCreateFailureOutcome = 3;
}
