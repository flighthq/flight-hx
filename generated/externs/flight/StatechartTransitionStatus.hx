package flight;

abstract StatechartTransitionStatus(Int) from Int to Int {
	public static inline var ConditionsUnmet:StatechartTransitionStatus = 0;
	public static inline var ExitTimePending:StatechartTransitionStatus = 1;
	public static inline var InvalidRegion:StatechartTransitionStatus = 2;
	public static inline var MissingRegionDuration:StatechartTransitionStatus = 3;
	public static inline var NoTransitions:StatechartTransitionStatus = 4;
	public static inline var Ready:StatechartTransitionStatus = 5;
	public static inline var Transitioning:StatechartTransitionStatus = 6;
}
