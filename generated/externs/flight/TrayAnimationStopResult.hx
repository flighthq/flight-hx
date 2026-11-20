package flight;

abstract TrayAnimationStopResult(Int) from Int to Int {
	public static inline var Stopped:TrayAnimationStopResult = 0;
	public static inline var AlreadyStopped:TrayAnimationStopResult = 1;
}
